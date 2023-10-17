const express = require("express");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const { createPool } = require("mysql");
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

router.get("", (req, res) => {
  pool.query("SELECT * FROM subgroup", (err, results) => {
    if (err) {
      console.error("Error executing SQL query:", err);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.status(200).json(results);
    }
  });
});

router.get("/get/:id", (req, res) => {
  const id = req.params.id;

  pool.query(`SELECT * FROM subgroup where id = ${id}`, (err, results) => {
    if (err) {
      console.error("Error executing SQL query:", err);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.status(200).json(results);
    }
  });
});

router.post("/add", upload.none(), (req, res) => {
  const { name, prefix, additional_info, group_id } = req.body;

  pool.query(
    "INSERT INTO subgroup (name, prefix,additional_info,group_id) VALUES (?, ?,?,?)",
    [name, prefix, additional_info, group_id],
    (err, result) => {
      if (err) {
        console.error("Error inserting materials :", err);
        return res.status(500).json({ error: "Internal server error" });
      }
      res.status(201).json({ message: "Material group added successfully" });
    }
  );
});

module.exports = router;
