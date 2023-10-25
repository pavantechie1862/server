const express = require("express");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const { createPool } = require("mysql");
const router = express.Router();
const multer = require("multer");
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const { KDM_ACCESS_TOKEN } = require("./constants");

const pool = createPool({
  user: "root",
  host: "localhost",
  password: "keka@3061",
  connectionLimit: 10,
  database: "lims",
});

router.post("/verify", upload.none(), (req, res) => {
  const { username, password } = req.body;

  const query = "SELECT * FROM employee WHERE username = ?";
  pool.query(query, [username], (err, results) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Failed to initialise Database error" });
    }

    if (results.length === 0) {
      return res.status(401).json({ error: "Invalid Username" });
    }

    const user = results[0];

    bcrypt.compare(password, user.hashed_password, (compareErr, isMatch) => {
      if (compareErr) {
        return res
          .status(500)
          .json({ error: "Error comparing passwords please try again" });
      }

      if (isMatch) {
        const secretKey = "KDM_ACCESS_TOKEN";
        const token = jwt.sign({ username }, secretKey);
        res.status(200).json({ jwt_token: token, user: user });
      } else {
        res.status(401).json({ error: "Invalid Password" });
      }
    });
  });
});

module.exports = router;
