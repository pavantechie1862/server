const express = require("express");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const { createPool } = require("mysql");
const util = require("util");

const { PENDING_FOR_REVIEW } = require("./constants");
const verifyToken = require("./verifyToken");

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

router.post("/assign/:orderId", upload.none(), async (request, response) => {
  const orderId = request.params.orderId;
  const data = request.body;
  const payload = JSON.parse(data.payload);

  const connection = await util.promisify(pool.getConnection).call(pool);
  try {
    await util.promisify(connection.beginTransaction).call(connection);
    const sqlQuery = `update orders set status = ?,assigned_on=? where order_id = ?`;
    await util
      .promisify(connection.query)
      .call(connection, sqlQuery, ["ASSIGNED", new Date(), orderId]);

    for (const obj of payload) {
      const { sample, test, employee } = obj;
      const sql = `UPDATE material_test SET assign_to = ?,status = ? WHERE sample_id = ? AND test_id = ?`;
      const values = [employee, "IN_PROGRESS", sample, test];

      await new Promise((resolve, reject) => {
        connection.query(sql, values, (err, results) => {
          if (err) reject(err);
          resolve(results);
        });
      });
    }

    await util.promisify(connection.commit).call(connection);
    connection.release();
    response.status(200).json({ message: "Jobs created successfully" });
  } catch (error) {
    await util.promisify(connection.rollback).call(connection);
    connection.release();
    res.status(500).json({ error_msg: "Internal server error" });
  }
});

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
    const { sampleId, subgroupId, materialSource, quantity, units } = material;
    const sqlQuery =
      "INSERT INTO order_material (order_id, sample_id, subgroup,source,quantity,units) VALUES (?,?,?,?,?,?)";
    const queryValues = [
      orderId,
      sampleId,
      subgroupId,
      materialSource,
      quantity,
      units,
    ];

    const result = await util
      .promisify(connection.query)
      .call(connection, sqlQuery, queryValues);
    materialResults.push(result);
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
    SELECT * FROM orders order by due_date asc
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

    res.status(200).json(formattedOrders);
  });
});

const query = util.promisify(pool.query).bind(pool);

// Route to get order by ID with material and test details
router.get("/:orderId", async (req, res) => {
  const orderId = req.params.orderId;

  try {
    const orderQuery = await query("SELECT * FROM orders WHERE order_id = ?", [
      orderId,
    ]);

    if (orderQuery.length === 0) {
      res.status(404).json({ error: "Order not found" });
      return;
    }

    const order = orderQuery[0];

    const customerDetails = await query(`select * from customer where id = ?`, [
      order.customer_id,
    ]);

    const sampleMaterials = await query(
      `SELECT  om.sample_id,sg.name as sampleName
      FROM order_material om
      JOIN subgroup sg ON sg.id = om.subgroup
      WHERE om.order_id = ?`,
      [order.order_id]
    );

    const staffData = await query(
      `select CONCAT(emp.first_name, ' ', emp.last_name) AS name,emp.emp_id,dept.dept_id,profile_image as profile from department dept join employee emp on emp.department = dept.dept_id where dept_id in (?,?)`,
      ["LABORATORY_CHEMICAL", "LABORATORY_MECHANICAL"]
    );

    const finalResult = await Promise.all(
      sampleMaterials.map(async (eachSample) => {
        const beforeAssign =
          "select  mt.test_id,mt.status,mt.assign_to as assignedTo ,t.test_name as testName,t.discipline from material_test mt join test t on t.id = mt.test_id where mt.sample_id = ?";
        const afterAssign =
          "select mt.test_id,mt.status,mt.assign_to as assignedTo ,t.test_name as testName,t.discipline,e.profile_image as empImage from material_test mt join test t on t.id = mt.test_id join employee e on e.emp_id = mt.assign_to   where mt.sample_id = ?";
        const tests = await query(
          order.status === "ASSIGNED" ? afterAssign : beforeAssign,
          [eachSample.sample_id]
        );

        return {
          ...eachSample,
          jobs: tests,
        };
      })
    );

    res.status(200).json({
      samples: finalResult,
      staffData: staffData,
      orderDetails: order,
      customerDetails: customerDetails[0],
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
