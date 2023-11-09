const express = require("express");
const { createPool } = require("mysql");
const util = require("util");
const router = express.Router();
const verifyToken = require("./verifyToken");
const multer = require("multer");
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const pool = createPool({
  user: "root",
  host: "localhost",
  password: "keka@3061",
  connectionLimit: 10,
  database: "lims",
});

router.post("/submit/:jobId", upload.none(), (request, response) => {
  const jobId = request.params.jobId;
  const data = request.body;
  const { value, result } = data;

  const sqlQuery =
    "update material_test set status='FINISHED',submitted_on=?, test_result = ?, test_details = ? where id = ?";
  const queryValues = [new Date(), value, result, jobId];
  pool.query(sqlQuery, queryValues, (err, result) => {
    if (err) {
      console.log(err);
      response.status(500).send({ err_message: "Internal server error" });
    } else {
      response.status(200).send({ message: "jobs submitted successfully" });
    }
  });
});

//redundant route
router.get("/myJobs/:sId/:tId", verifyToken, async (request, response) => {
  const username = request.user.username;
  const { sId, tId } = request.params;

  try {
    const connection = await util.promisify(pool.getConnection).call(pool);

    await util.promisify(connection.beginTransaction).call(connection);

    const empIdQuery = "SELECT emp_id FROM employee WHERE username = ?";
    const rows = await util
      .promisify(connection.query)
      .call(connection, empIdQuery, [username]);

    const empId = rows[0].emp_id;

    const jobsQuery = `select o.due_date,mt.sample_id,om.subgroup as subgroup_id,o.project_name,o.assigned_on,mt.test_id,mt.id as job_id,mt.status,s.name,t.test_name from material_test mt join order_material om on om.sample_id = mt.sample_id join orders o on o.order_id = om.order_id join test t on mt.test_id = t.id join subgroup s on s.id = om.subgroup  where assign_to = ? and mt.sample_id = ? and mt.test_id = ?`;

    const jobs = await util
      .promisify(connection.query)
      .call(connection, jobsQuery, [empId, sId, tId]);
    response.status(200).json(jobs[0]);
  } catch (err) {
    console.log(err);
    response.status(500).json({ err_message: "Internal server error" });
  }
});

router.get("/myJobs", verifyToken, async (request, response) => {
  const username = request.user.username;

  try {
    const connection = await util.promisify(pool.getConnection).call(pool);
    await util.promisify(connection.beginTransaction).call(connection);

    const empIdQuery = "SELECT emp_id FROM employee WHERE username = ?";
    const rows = await util
      .promisify(connection.query)
      .call(connection, empIdQuery, [username]);

    const empId = rows[0].emp_id;

    const jobsQuery = `select o.due_date,mt.sample_id,mt.test_id,mt.status,s.name,t.test_name from material_test mt join order_material om on om.sample_id = mt.sample_id join orders o on o.order_id = om.order_id join test t on mt.test_id = t.id join subgroup s on s.id = om.subgroup  where assign_to = ? order by o.assigned_on asc, mt.status desc`;

    const jobs = await util
      .promisify(connection.query)
      .call(connection, jobsQuery, [empId]);

    response.status(200).json(jobs);
  } catch (err) {
    response.status(500).json({ err_message: "Internal server error" });
  }
});

module.exports = router;
