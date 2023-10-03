const express = require("express");
const multer = require("multer");
const path = require("path");
const cors = require("cors");
const app = express();
app.use(express.json());
app.use("/public", express.static(path.join(__dirname, "public")));
app.use(cors());

const employeeRoutes = require("./employee");

app.use("/employee", employeeRoutes);

app.listen(8081, () => {
  console.log("Server started on port 8081");
});
