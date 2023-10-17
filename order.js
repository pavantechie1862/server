const express = require("express");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const { createPool } = require("mysql");
const util = require("util");

const { PENDING_FOR_REVIEW } = require("./constants");

const router = express.Router();
const pool = createPool({
  user: "root",
  host: "localhost",
  password: "keka@3061",
  connectionLimit: 10,
  database: "lims",
});

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const writeFileAsync = util.promisify(fs.writeFile);

function createOrderDirectory(orderId) {
  const uploadDestination = path.join("public", "orders", orderId);
  if (!fs.existsSync(uploadDestination)) {
    fs.mkdirSync(uploadDestination);
  }
  return uploadDestination;
}

async function saveOrUpdateOrder(req, res, id) {
  const connection = await util.promisify(pool.getConnection).call(pool);

  try {
    await util.promisify(connection.beginTransaction).call(connection);

    await insertOrUpdateOrder(connection, req.body, req.file, id);

    await insertOrUpdateMaterials(connection, req.body, req.body.order_id);

    await insertOrUpdateTests(connection, req.body);

    await util.promisify(connection.commit).call(connection);

    connection.release();

    if (id) {
      res.status(200).json({ message: "Order data updated successfully" });
    } else {
      res.status(200).json({ message: "Order data saved successfully" });
    }
  } catch (error) {
    console.log(error);
    await util.promisify(connection.rollback).call(connection);
    connection.release();
    res.status(500).json({ error_msg: "Internal server error" });
  }
}

async function insertOrUpdateOrder(connection, orderData, file, id) {
  const {
    order_id,
    project_name,
    subject,
    additional_info,
    discount,
    transport_fee,
    due_date,
    customer_id,
    PENDING_FOR_REVIEW,
  } = orderData;

  let letterPath = null;
  if (file) {
    const orderDirectory = createOrderDirectory(order_id);
    const originalFileName = file.originalname;
    const fileExtension = path.extname(originalFileName);
    const newFileName = `${order_id}_letter${fileExtension}`;
    const uploadedFilePath = path.join(orderDirectory, newFileName);

    try {
      await writeFileAsync(uploadedFilePath, file.buffer);
      letterPath = path.relative(
        path.join(__dirname, "public", "orders"),
        uploadedFilePath
      );
    } catch (err) {
      return res.status(500).json({ error_msg: "File upload error" });
    }
  }

  const sqlQuery = id
    ? `UPDATE orders
      SET
        project_name = ?,
        subject = ?,
        letter = ?,
        discount = ?,
        transport_fee = ?,
        due_date = ?,
        additional_info = ?,
        customer_id = ?
      WHERE order_id = ?`
    : `INSERT INTO orders (
      order_id,
      project_name,
      subject,
      letter,
      additional_info,
      discount,
      transport_fee,
      due_date,
      registration_date,
      customer_id,
      status
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)`;

  const queryValues = id
    ? [
        order_id,
        project_name,
        subject,
        letterPath,
        additional_info,
        discount,
        transport_fee,
        due_date,
        new Date(),
        customer_id,
        PENDING_FOR_REVIEW,
      ]
    : [
        order_id,
        project_name,
        subject,
        letterPath,
        additional_info,
        discount,
        transport_fee,
        due_date,
        new Date(),
        customer_id,
        "PENDING_FOR_REVIEW",
      ];

  return await util
    .promisify(connection.query)
    .call(connection, sqlQuery, queryValues);
}

async function insertOrUpdateMaterials(connection, orderData, orderId) {
  const materials = JSON.parse(orderData.testData);

  const materialResults = [];
  for (const material of materials) {
    const sqlQuery =
      "INSERT INTO order_material (order_id, sample_id, subgroup) VALUES (?, ?, ?)";
    const queryValues = [orderId, material.sampleId, material.subgroupId];

    const result = await util
      .promisify(connection.query)
      .call(connection, sqlQuery, queryValues);
    materialResults.push(result); // Append the result to the array
  }

  return materialResults;
}

async function insertOrUpdateTests(connection, orderData) {
  const materials = JSON.parse(orderData.testData);

  for (let i = 0; i < materials.length; i++) {
    const tests = materials[i].selectedTests;
    for (const test of tests) {
      const sqlQuery =
        "INSERT INTO material_test (sample_id, test_id) VALUES (?, ?)";
      const queryValues = [materials[i].sampleId, test.testId];

      await util
        .promisify(connection.query)
        .call(connection, sqlQuery, queryValues);
    }
  }
}

router.post("/add", upload.single("letter"), (req, res) => {
  saveOrUpdateOrder(req, res);
});

router.put("/update/:id", upload.single("letter"), (req, res) => {
  const id = req.params.id;
  saveOrUpdateOrder(req, res, id);
});

router.get("", (req, res) => {
  const sqlQuery = `
    SELECT * FROM orders
  `;
  pool.query(sqlQuery, (err, results) => {
    if (err) {
      return res.status(500).json({ error: "Database error" });
    }

    const formattedOrders = results.map((each) => {
      return {
        order_id: each.order_id,
        project_name: each.project_name,
        due_date: each.due_date.toISOString().split("T")[0],
        customer_id: each.customer_id,
        status: each.status,
      };
    });

    console.log(formattedOrders);
    res.status(200).json(formattedOrders);
  });
});

router.get("/:order_id", (req, res) => {
  const order_id = req.params.order_id;
  const orderDetails = {};

  const sqlQuery = `
    SELECT o.*, om.*, s.*, mt.*, t.*
    FROM orders o
    LEFT JOIN order_material om ON o.order_id = om.order_id
    LEFT JOIN subgroup s ON om.subgroup = s.id
    LEFT JOIN material_test mt ON om.sample_id = mt.sample_id
    LEFT JOIN test t ON mt.test_id = t.id
    WHERE o.order_id = ?
  `;

  pool.getConnection((err, connection) => {
    if (err) {
      return res.status(500).json({ error: "Database error" });
    }

    connection.beginTransaction((err) => {
      if (err) {
        connection.release();
        return res.status(500).json({ error: "Database error" });
      }

      connection.query(sqlQuery, [order_id], (err, results) => {
        if (err) {
          console.error("Database query error:", err);
          connection.rollback(() => {
            connection.release();
            return res
              .status(500)
              .json({ error: "Database error", details: err });
          });
        }

        console.log("before");
        console.log(results);
        console.log("after");

        results.forEach((row) => {
          const order = {
            order_id: row.order_id,
            project_name: row.project_name,
          };

          const material = {
            sample_id: row.sample_id,
            subgroup: row.subgroup,
          };

          const test = {
            test_id: row.test_id,
          };

          if (orderDetails[order.order_id]) {
            orderDetails[order.order_id].materials.push(material);
            orderDetails[order.order_id].materials.forEach((m) => {
              if (m.sample_id === material.sample_id) {
                m.tests.push(test);
              }
            });
          } else {
            orderDetails[order.order_id] = {
              ...order,
              materials: [material],
            };
            material.tests = [test];
          }
        });

        const response = Object.values(orderDetails);

        connection.commit((err) => {
          if (err) {
            connection.rollback(() => {
              connection.release();
              return res.status(500).json({ error: "Database error" });
            });
          }
          connection.release();
          res.json(response);
        });
      });
    });
  });
});

module.exports = router;
