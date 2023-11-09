const express = require("express");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { createPool } = require("mysql");
const router = express.Router();
const { KDM_ACCESS_TOKEN } = require("./constants");

const pool = createPool({
  user: "root",
  host: "localhost",
  password: "keka@3061",
  connectionLimit: 10,
  database: "lims",
});

const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

function checkRequiredFiles(request, res) {
  const requiredFiles = [
    "profile_image",
    "adhar",
    "pan",
    "bank_account",
    "appointment_letter",
    "ssc_certificate",
    "intermediate_certificate",
    "degree_certificate",
  ];

  for (const file of requiredFiles) {
    if (!request.files || !request.files[file]) {
      return false;
    }
  }

  return true;
}

const employeeDocuments = upload.fields([
  { name: "profile_image", maxCount: 1 },
  { name: "adhar", maxCount: 1 },
  { name: "pan", maxCount: 1 },
  { name: "bank_account", maxCount: 1 },
  { name: "appointment_letter", maxCount: 1 },
  { name: "ssc_certificate", maxCount: 1 },
  { name: "intermediate_certificate", maxCount: 1 },
  { name: "degree_certificate", maxCount: 1 },
]);

router.post("/add", employeeDocuments, async (request, res) => {
  // if (!checkRequiredFiles(request, res)) {
  //   return res.status(400).json({ error_msg: "One or more files are missing" });
  // }

  const profile_image = request.files["profile_image"][0];
  // const adhar = request.files["adhar"][0];
  // const pan = request.files["pan"][0];
  // const bank_account = request.files["bank_account"][0];
  // const appointment_letter = request.files["appointment_letter"][0];
  // const ssc_certificate = request.files["ssc_certificate"][0];
  // const intermediate_certificate = request.files["intermediate_certificate"][0];
  // const degree_certificate = request.files["degree_certificate"][0];

  const emp_id = request.body.emp_id;
  const first_name = request.body.first_name;
  const last_name = request.body.last_name;
  const dob = request.body.dob;
  const mobile = request.body.mobile;
  const personnel_mail = request.body.personnel_mail;
  const address = request.body.address;
  const additional_info = request.body.additional_info;
  const department = request.body.department;
  const role = request.body.role;
  const appointed_date = request.body.appointed_date;
  const salary = request.body.salary ? request.body.salary : 0;
  const branch = request.body.branch;
  const supervisor = request.body.supervisor || null;
  const password = last_name + emp_id;
  const hashedPassword = await bcrypt.hash(password, 10);

  const uploadDestination = path.join(__dirname, "public", "employee", emp_id);
  if (!fs.existsSync(uploadDestination)) {
    fs.mkdirSync(uploadDestination, { recursive: true });
  }

  const saveFileAndReturnRelativePath = (file, fieldName, emp_id) => {
    if (!file) {
      return null;
    }
    const baseDirectory = "public/employee";

    const originalname = file.originalname;
    const newFileName = `${fieldName}_${emp_id}${path.extname(originalname)}`;
    const relativePath = `/${baseDirectory}/${emp_id}/${newFileName}`;

    const empDirectory = path.join(__dirname, baseDirectory, emp_id);
    const absolutePath = path.join(empDirectory, newFileName);

    if (!fs.existsSync(empDirectory)) {
      fs.mkdirSync(empDirectory, { recursive: true });
    }

    fs.writeFile(absolutePath, file.buffer, (err) => {
      if (err) {
        console.error(`Error saving ${fieldName} File:`, err);
      }
    });

    return relativePath;
  };

  // Usage for each file
  const profileImagePath = saveFileAndReturnRelativePath(
    profile_image,
    "profile_image",
    emp_id
  );

  // const adharFilePath = saveFileAndReturnRelativePath(adhar, "adhar", emp_id);

  // const panFilePath = saveFileAndReturnRelativePath(pan, "pan", emp_id);

  // const bankAccountFilePath = saveFileAndReturnRelativePath(
  //   bank_account,
  //   "bank_account",
  //   emp_id
  // );

  // const appointmentFilePath = saveFileAndReturnRelativePath(
  //   appointment_letter,
  //   "appointment_letter",
  //   emp_id
  // );

  // const sscFilePath = saveFileAndReturnRelativePath(
  //   ssc_certificate,
  //   "ssc_certificate",
  //   emp_id
  // );

  // const intermediateFilePath = saveFileAndReturnRelativePath(
  //   intermediate_certificate,
  //   "intermediate_certificate",
  //   emp_id
  // );

  // const degreeFilePath = saveFileAndReturnRelativePath(
  //   degree_certificate,
  //   "degree_certificate",
  //   emp_id
  // );

  const insertDocumentsQuery = `
  INSERT INTO Employee (
    emp_id,
    profile_image,
    adhar,
    pan,
    bank_account,
    appointment_letter,
    ssc_certificate,
    intermediate_certificate,
    degree_certificate,
    first_name,
    last_name,
    dob,
    mobile,
    personnel_mail,
    address,
    additional_info,
    department,
    role,
    appointed_date,
    salary,
    branch,
    supervisor,
    hashed_password,
    username
  ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)`;

  pool.query(
    insertDocumentsQuery,
    [
      emp_id,
      profileImagePath,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      // adharFilePath,
      // panFilePath,
      // bankAccountFilePath,
      // appointmentFilePath,
      // sscFilePath,
      // intermediateFilePath,
      // degreeFilePath,
      first_name,
      last_name,
      dob,
      mobile,
      personnel_mail,
      address,
      additional_info,
      department,
      role,
      appointed_date,
      salary,
      branch,
      supervisor,
      hashedPassword,
      last_name + emp_id,
    ],

    (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).json({ error_msg: "Internal server error", err });
      } else {
        const payload = {
          username: last_name + emp_id,
        };
        const jwtToken = jwt.sign(payload, KDM_ACCESS_TOKEN);
        res.status(200).json({
          message: "Employee and documents added successfully",
          jwtToken,
        });
      }
    }
  );
});

router.put("/update/:id", upload.none(), (request, res) => {
  const emp_id = request.params.id;
  // if (!checkRequiredFiles(request, res)) {
  //   return res.status(400).json({ error_msg: "One or more files are missing" });
  // }

  // const empIdFolderPath = path.join(__dirname, "public", "employee", emp_id);
  // fsExtra.remove(empIdFolderPath, (err) => {
  //   if (err) {
  //     return res
  //       .status(500)
  //       .json({ error_msg: `Failed to remove the existing data of ${emp_id}` });
  //   }
  // });

  // const profile_image = request.files["profile_image"][0];
  // const adhar = request.files["adhar"][0];
  // const pan = request.files["pan"][0];
  // const bank_account = request.files["bank_account"][0];
  // const appointment_letter = request.files["appointment_letter"][0];
  // const ssc_certificate = request.files["ssc_certificate"][0];
  // const intermediate_certificate = request.files["intermediate_certificate"][0];
  // const degree_certificate = request.files["degree_certificate"][0];

  const {
    first_name,
    last_name,
    mobile,
    personnel_mail,
    address,
    additional_info,
    department,
    role,
    salary,
    branch,
    supervisor,
  } = request.body;

  // const uploadDestination = path.join(__dirname, "public", "employee", emp_id);
  // if (!fs.existsSync(uploadDestination)) {
  //   fs.mkdirSync(uploadDestination, { recursive: true });
  // }

  // const renameAndSaveFile = (file, fieldName, emp_id) => {
  //   const originalname = file.originalname;
  //   const newFileName = `${fieldName}-${emp_id}${path.extname(originalname)}`;
  //   const filePath = path.join(uploadDestination, newFileName);

  //   fs.writeFile(filePath, file.buffer, (err) => {
  //     if (err) {
  //       console.error(`Error saving ${fieldName} File:`, err);
  //       return res
  //         .status(500)
  //         .json({ error_msg: `Error saving ${fieldName} File` });
  //     }
  //   });

  //   return filePath;
  // };

  // const profileImagePath = renameAndSaveFile(
  //   profile_image,
  //   "profile_image",
  //   emp_id
  // );
  // const adharFilePath = renameAndSaveFile(adhar, "adhar", emp_id);
  // const panFilePath = renameAndSaveFile(pan, "pan", emp_id);
  // const bankAccountFilePath = renameAndSaveFile(
  //   bank_account,
  //   "bank_account",
  //   emp_id
  // );
  // const appointmentFilePath = renameAndSaveFile(
  //   appointment_letter,
  //   "appointment_letter",
  //   emp_id
  // );
  // const sscFilePath = renameAndSaveFile(
  //   ssc_certificate,
  //   "ssc_certificate",
  //   emp_id
  // );
  // const intermediateFilePath = renameAndSaveFile(
  //   intermediate_certificate,
  //   "intermediate_certificate",
  //   emp_id
  // );
  // const degreeFilePath = renameAndSaveFile(
  //   degree_certificate,
  //   "degree_certificate",
  //   emp_id
  // );

  const updateEmployeeQuery = `
    UPDATE Employee
    SET
      first_name = '${first_name}',
      last_name = '${last_name}',
      mobile = '${mobile}',
      personnel_mail = '${personnel_mail}',
      address = '${address}',
      additional_info = '${additional_info}',
      department = '${department}',
      role = '${role}',
      salary = '${salary}',
      branch = '${branch}',
      supervisor = '${supervisor}'
    WHERE emp_id = '${emp_id}'`;

  pool.query(updateEmployeeQuery, (err, result) => {
    if (err) {
      res.status(500).json({
        error_msg: `Failed to update ${first_name + " " + last_name}'s Record`,
      });
    } else {
      res.status(200).json({
        message: `${
          first_name + " " + last_name
        }'s Details Updated Successfully`,
      });
    }
  });
});

//get Employee's list
router.get("", (req, res) => {
  const employeeQuery = `select * from employee e join role r on e.role = r.role_id join department d on d.dept_id = e.department`;
  pool.query(employeeQuery, (err, results) => {
    if (err) {
      console.error("Error fetching data: " + err.message);
      res.status(500).json({ error: "Error fetching data" });
    } else {
      const formattedResult = results.map((eachEmployee) => {
        return {
          emp_id: eachEmployee.emp_id,
          name: eachEmployee.first_name + " " + eachEmployee.last_name,
          department_designation:
            eachEmployee.department + " - " + eachEmployee.role,
          contact: eachEmployee.mobile,
          email: eachEmployee.personnel_mail,
          profile_url: eachEmployee.profile_image,
        };
      });
      res.json(formattedResult);
    }
  });
});

//get single employee record
// router.get("/get/:id", (req, res) => {
//   const { id } = req.params;
//   const getEmployeeByIdQuery = `
//     SELECT * FROM Employee WHERE emp_id = '${id}'
//   `;

//   pool.query(getEmployeeByIdQuery, (err, result) => {
//     if (err) {
//       res.status(500).json({ error: "Error fetching employee data" });
//     } else {
//       if (result.length > 0) {
//         res.status(200).json(result[0]);
//       } else {
//         res.status(404).json({ error: "Employee not found" });
//       }
//     }
//   });
// });

router.get("/get/:id", (req, res) => {
  const { id } = req.params;

  const getEmployeeQuery = `SELECT
      CONCAT(e.first_name, ' ', e.last_name) AS emp_name,e.emp_id,e.mobile,e.personnel_mail AS email, e.address, e.additional_info,
        e.appointed_date,
        e.dob,
        e.salary,
        b.branch,
        CONCAT(s.first_name, ' ', s.last_name) AS supervisor,
        s.emp_id as supervisor_id,
        e.profile_image as profile_pic,
        s.profile_image as supervisor_pic,
        d.department as dept,
        r.role as role
      FROM
        employee e
      JOIN
        role r ON e.role = r.role_id
      JOIN
        department d ON d.dept_id = e.department
      JOIN
        branch b ON b.branch_id = e.branch
      LEFT JOIN
        employee s ON s.emp_id = e.supervisor
      WHERE
        e.emp_id = '${id}';`;

  pool.query(getEmployeeQuery, (err, result) => {
    if (err) {
      console.log(err);
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

router.put("/update/:id", (req, res) => {
  const { id } = req.params;
  const updatedEmployee = req.body;

  const updateEmployeeQuery = `
    UPDATE Employee
    SET
      first_name = '${updatedEmployee.first_name}',
      last_name = '${updatedEmployee.last_name}',
      dob = '${updatedEmployee.dob}',
      mobile = '${updatedEmployee.mobile}',
      personnel_mail = '${updatedEmployee.personnel_mail}',
      address = '${updatedEmployee.address}',
      additional_info = '${updatedEmployee.additional_info}',
      department = '${updatedEmployee.department}',
      role = '${updatedEmployee.role}',
      appointed_date = '${updatedEmployee.appointed_date}',
      salary = '${updatedEmployee.salary}',
      branch = '${updatedEmployee.branch}',
      supervisor = '${updatedEmployee.supervisor}'
    WHERE emp_id = '${id}'
  `;

  pool.query(updateEmployeeQuery, (err, result) => {
    if (err) {
      console.error("Error updating employee:", err);
      res.status(500).json({ error_msg: "Internal server error" });
    } else {
      if (result.affectedRows === 1) {
        res.status(200).json({ message: "Employee updated successfully" });
      } else {
        res.status(404).json({ error: "Employee not found" });
      }
    }
  });
});

router.delete("/delete/:id", (req, res) => {
  const { id } = req.params;

  const deleteEmployeeQuery = `
    DELETE FROM Employee
    WHERE emp_id = '${id}'
  `;

  pool.query(deleteEmployeeQuery, (err, result) => {
    if (err) {
      console.error("Error deleting employee:", err);
      res.status(500).json({ error_msg: "Internal server error" });
    } else {
      if (result.affectedRows === 1) {
        res.status(200).json({ message: "Employee deleted successfully" });
      } else {
        res.status(404).json({ error: "Employee not found" });
      }
    }
  });
});

router.get("/staff-dept-role", async (request, response) => {
  try {
    const staffQuery =
      "SELECT emp_id, department, first_name , last_name,role FROM employee";
    const departmentQuery = "SELECT dept_id,department FROM department";
    const roleQuery = "SELECT role_id,role,department FROM role";
    const branchQuery = "select branch_id,branch from branch";

    const staffData = await executeQuery(staffQuery);
    const departmentData = await executeQuery(departmentQuery);
    const roleData = await executeQuery(roleQuery);
    const branchData = await executeQuery(branchQuery);

    const responseData = {
      staff: staffData,
      departments: departmentData,
      roles: roleData,
      branches: branchData,
    };
    response.status(200).json(responseData);
  } catch (error) {
    response.status(500).json("Failed to fetch data");
  }
});

function executeQuery(query) {
  return new Promise((resolve, reject) => {
    pool.query(query, (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve(result);
      }
    });
  });
}

module.exports = router;
