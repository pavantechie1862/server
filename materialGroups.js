const express = require("express");

const { createPool } = require("mysql");
const router = express.Router();

const pool = createPool({
  user: "root",
  host: "localhost",
  password: "keka@3061",
  connectionLimit: 10,
  database: "lims",
});

router.get("", (req, res) => {
  pool.query("SELECT * FROM material_groups", (err, results) => {
    if (err) {
      console.error("Error executing SQL query:", err);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.status(200).json(results);
    }
  });
});

router.post("/add", (req, res) => {
  const { name, additional_info } = req.body;

  pool.query(
    "INSERT INTO material_groups (name, additional_info) VALUES (?, ?)",
    [name, additional_info],
    (err, result) => {
      if (err) {
        console.error("Error inserting material group:", err);
        return res.status(500).json({ error: "Internal server error" });
      }
      res.status(201).json({ message: "Material group added successfully" });
    }
  );
});

router.put("/update/:id", (req, res) => {
  const groupId = req.params.id;
  const { name, additional_info } = req.body;

  pool.query(
    "UPDATE material_groups SET name = ?, additional_info = ? WHERE id = ?",
    [name, additional_info, groupId],
    (err, result) => {
      if (err) {
        console.error("Error updating material group:", err);
        return res.status(500).json({ error: "Internal server error" });
      }
      res.status(200).json({ message: "Material group updated successfully" });
    }
  );
});

module.exports = router;
