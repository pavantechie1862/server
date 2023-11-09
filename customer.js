const express = require("express");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const { createPool } = require("mysql");
const router = express.Router();
const verifyToken = require("./verifyToken");

const pool = createPool({
  user: "root",
  host: "localhost",
  password: "keka@3061",
  connectionLimit: 10,
  database: "lims",
});

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

router.get("", (req, res) => {
  pool.query(`select * from customer`, (err, results) => {
    if (err) {
      res.status(500).json({ error: "Error fetching data" });
    } else {
      res.status(200).json(results);
    }
  });
});

router.get("/get/:id", (req, res) => {
  const { id } = req.params;
  const getEmployeeByIdQuery = `
    SELECT * FROM customer WHERE customer_id = '${id}'
  `;

  pool.query(getEmployeeByIdQuery, (err, result) => {
    if (err) {
      res.status(500).json({ error: "Error fetching employee data" });
    } else {
      if (result.length > 0) {
        res.status(200).json(result[0]);
      } else {
        res.status(404).json({ error: "Employee not found" });
      }
    }
  });
});

function saveOrUpdateCustomer(req, res, id) {
  const customerData = {
    customer_id: req.body.customer_id,
    reporting_name: req.body.reporting_name,
    reporting_address: req.body.reporting_address,
    billing_name: req.body.billing_name,
    billing_address: req.body.billing_address,
    email: req.body.email,
    contact: req.body.contact,
    gst_number: req.body.gst_number,
    pan_number: req.body.pan_number,
    work_order: req.body.work_order,
  };

  let sqlQuery;
  let queryValues;

  if (id === undefined) {
    sqlQuery = `
      INSERT INTO Customer (
        customer_id,
        reporting_name,
        reporting_address,
        billing_name,
        billing_address,
        email,
        contact,
        gst_number,
        pan_number,
        work_order
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    queryValues = [
      customerData.customer_id,
      customerData.reporting_name,
      customerData.reporting_address,
      customerData.billing_name,
      customerData.billing_address,
      customerData.email,
      customerData.contact,
      customerData.gst_number,
      customerData.pan_number,
      customerData.work_order,
    ];
  } else {
    sqlQuery = `
      UPDATE customer
      SET
        reporting_name = ?,
        reporting_address = ?,
        billing_name = ?,
        billing_address = ?,
        email = ?,
        contact = ?,
        gst_number = ?,
        pan_number = ?,
        work_order = ?
      WHERE customer_id = ?`;
    queryValues = [
      customerData.reporting_name,
      customerData.reporting_address,
      customerData.billing_name,
      customerData.billing_address,
      customerData.email,
      customerData.contact,
      customerData.gst_number,
      customerData.pan_number,
      customerData.work_order,
      id,
    ];
  }

  pool.query(sqlQuery, queryValues, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error_msg: "Internal server error" });
    } else {
      if (id) {
        res.status(200).json({ message: "Customer data updated successfully" });
      } else {
        res.status(200).json({ message: "Customer data saved successfully" });
      }
    }
  });
}

router.post("/add", upload.none(), (req, res) => {
  saveOrUpdateCustomer(req, res);
});

router.put("/update/:id", upload.none(), (req, res) => {
  const id = req.params.id;
  saveOrUpdateCustomer(req, res, id);
});

router.delete("/delete/:customer_id", (req, res) => {
  const customer_id = req.params.customer_id;
  const deleteCustomerQuery = "DELETE FROM Customer WHERE customer_id = ?";

  pool.query(deleteCustomerQuery, [customer_id], (err, result) => {
    if (err) {
      res.status(500).json({ error_msg: "Internal server error" });
    } else {
      if (result.affectedRows > 0) {
        res
          .status(200)
          .json({ message: "Customer record deleted successfully" });
      } else {
        res.status(404).json({ error_msg: "Customer not found" });
      }
    }
  });
});

module.exports = router;
