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

router.post("/add", employeeDocuments, (request, res) => {
  if (!checkRequiredFiles(request, res)) {
    return res.status(400).json({ error_msg: "One or more files are missing" });
  }
  const profile_image = request.files["profile_image"][0];
  const adhar = request.files["adhar"][0];
  const pan = request.files["pan"][0];
  const bank_account = request.files["bank_account"][0];
  const appointment_letter = request.files["appointment_letter"][0];
  const ssc_certificate = request.files["ssc_certificate"][0];
  const intermediate_certificate = request.files["intermediate_certificate"][0];
  const degree_certificate = request.files["degree_certificate"][0];

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
  const salary = request.body.salary;
  const branch = request.body.branch;
  const supervisor = request.body.supervisor;

  const uploadDestination = path.join(__dirname, "public", "employee", emp_id);
  if (!fs.existsSync(uploadDestination)) {
    fs.mkdirSync(uploadDestination, { recursive: true });
  }
  const saveFileAndReturnRelativePath = (file, fieldName, emp_id) => {
    if (!file) {
      return null;
    }

    const originalname = file.originalname;
    const newFileName = `${fieldName}-${emp_id}${path.extname(originalname)}`;
    const relativePath = `/public/employee/${emp_id}/${newFileName}`;

    const baseDirectory = "C:/Users/HP/Desktop/server/public/employee";
    const empDirectory = path.join(baseDirectory, emp_id);
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

  const adharFilePath = saveFileAndReturnRelativePath(adhar, "adhar", emp_id);

  const panFilePath = saveFileAndReturnRelativePath(pan, "pan", emp_id);

  const bankAccountFilePath = saveFileAndReturnRelativePath(
    bank_account,
    "bank_account",
    emp_id
  );

  const appointmentFilePath = saveFileAndReturnRelativePath(
    appointment_letter,
    "appointment_letter",
    emp_id
  );

  const sscFilePath = saveFileAndReturnRelativePath(
    ssc_certificate,
    "ssc_certificate",
    emp_id
  );

  const intermediateFilePath = saveFileAndReturnRelativePath(
    intermediate_certificate,
    "intermediate_certificate",
    emp_id
  );

  const degreeFilePath = saveFileAndReturnRelativePath(
    degree_certificate,
    "degree_certificate",
    emp_id
  );

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
    supervisor
  ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

  pool.query(
    insertDocumentsQuery,
    [
      emp_id,
      profileImagePath,
      adharFilePath,
      panFilePath,
      bankAccountFilePath,
      appointmentFilePath,
      sscFilePath,
      intermediateFilePath,
      degreeFilePath,
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
    ],
    (err, result) => {
      if (err) {
        res.status(500).json({ error_msg: "Internal server error" });
      } else {
        res
          .status(200)
          .json({ message: "Employee and documents added successfully" });
      }
    }
  );
});

router.put("/update/:id", employeeDocuments, (request, res) => {
  const emp_id = request.params.id;
  if (!checkRequiredFiles(request, res)) {
    return res.status(400).json({ error_msg: "One or more files are missing" });
  }

  const empIdFolderPath = path.join(__dirname, "public", "employee", emp_id);
  fsExtra.remove(empIdFolderPath, (err) => {
    if (err) {
      return res
        .status(500)
        .json({ error_msg: `Failed to remove the existing data of ${emp_id}` });
    }
  });

  const profile_image = request.files["profile_image"][0];
  const adhar = request.files["adhar"][0];
  const pan = request.files["pan"][0];
  const bank_account = request.files["bank_account"][0];
  const appointment_letter = request.files["appointment_letter"][0];
  const ssc_certificate = request.files["ssc_certificate"][0];
  const intermediate_certificate = request.files["intermediate_certificate"][0];
  const degree_certificate = request.files["degree_certificate"][0];

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
  const salary = request.body.salary;
  const branch = request.body.branch;
  const supervisor = request.body.supervisor;

  const uploadDestination = path.join(__dirname, "public", "employee", emp_id);
  if (!fs.existsSync(uploadDestination)) {
    fs.mkdirSync(uploadDestination, { recursive: true });
  }

  const renameAndSaveFile = (file, fieldName, emp_id) => {
    const originalname = file.originalname;
    const newFileName = `${fieldName}-${emp_id}${path.extname(originalname)}`;
    const filePath = path.join(uploadDestination, newFileName);

    fs.writeFile(filePath, file.buffer, (err) => {
      if (err) {
        console.error(`Error saving ${fieldName} File:`, err);
        return res
          .status(500)
          .json({ error_msg: `Error saving ${fieldName} File` });
      }
    });

    return filePath;
  };

  const profileImagePath = renameAndSaveFile(
    profile_image,
    "profile_image",
    emp_id
  );
  const adharFilePath = renameAndSaveFile(adhar, "adhar", emp_id);
  const panFilePath = renameAndSaveFile(pan, "pan", emp_id);
  const bankAccountFilePath = renameAndSaveFile(
    bank_account,
    "bank_account",
    emp_id
  );
  const appointmentFilePath = renameAndSaveFile(
    appointment_letter,
    "appointment_letter",
    emp_id
  );
  const sscFilePath = renameAndSaveFile(
    ssc_certificate,
    "ssc_certificate",
    emp_id
  );
  const intermediateFilePath = renameAndSaveFile(
    intermediate_certificate,
    "intermediate_certificate",
    emp_id
  );
  const degreeFilePath = renameAndSaveFile(
    degree_certificate,
    "degree_certificate",
    emp_id
  );

  const updateEmployeeQuery = `
    UPDATE Employee
    SET
      profile_image = '${profileImagePath}',
      adhar = '${adharFilePath}',
      pan = '${panFilePath}',
      bank_account = '${bankAccountFilePath}',
      appointment_letter = '${appointmentFilePath}',
      ssc_certificate = '${sscFilePath}',
      intermediate_certificate = '${intermediateFilePath}',
      degree_certificate = '${degreeFilePath}',
      first_name = '${first_name}',
      last_name = '${last_name}',
      dob = '${dob}',
      mobile = '${mobile}',
      personnel_mail = '${personnel_mail}',
      address = '${address}',
      additional_info = '${additional_info}',
      department = '${department}',
      role = '${role}',
      appointed_date = '${appointed_date}',
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
  pool.query(`select * from employee`, (err, results) => {
    if (err) {
      console.error("Error fetching data: " + err.message);
      res.status(500).json({ error: "Error fetching data" });
    } else {
      res.json(results);
    }
  });
});

//to add an  employee
// router.post("/add", (request, response) => {
//   console.log("api is triggered");
//   const newEmployee = request.body;
//   console.log(newEmployee);
//   try {
//     const createEmployeeQuery = `
//           INSERT INTO Employee (
//             emp_id,
//             first_name,
//             last_name,
//             dob,
//             mobile,
//             personnel_mail,
//             address,
//             additional_info,
//             department,
//             role,
//             appointed_date,
//             salary,
//             branch,
//             supervisor
//           ) VALUES (
//             '${newEmployee.emp_id}',
//             '${newEmployee.first_name}',
//             '${newEmployee.last_name}',
//             '${newEmployee.dob}',
//             '${newEmployee.mobile}',
//             '${newEmployee.personnel_mail}',
//             '${newEmployee.address}',
//             '${newEmployee.additional_info}',
//             '${newEmployee.department}',
//             '${newEmployee.role}',
//             '${newEmployee.appointed_date}',
//             '${newEmployee.salary}',
//             '${newEmployee.branch}',
//             '${newEmployee.supervisor}'
//           )`;

//     pool.query(createEmployeeQuery, (err, result) => {
//       if (err) {
//         console.error("Error adding employee:", err);
//         response.status(500).send({ error_msg: "Internal server error" });
//       } else {
//         response.status(200).send({ message: "Employee added successfully" });
//       }
//     });
//   } catch (error) {
//     console.error("Error adding employee:", error);
//     response.status(500).send({ error_msg: "Internal server error" });
//   }
// });

//get single employee record
router.get("/get/:id", (req, res) => {
  const { id } = req.params;
  const getEmployeeByIdQuery = `
    SELECT * FROM Employee WHERE emp_id = '${id}'
  `;

  pool.query(getEmployeeByIdQuery, (err, result) => {
    console.log("get single record triggered");
    if (err) {
      console.error("Error fetching employee data:", err);
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

// Update an existing employee
router.put("/update/:id", (req, res) => {
  console.log("update single record triggered");
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

module.exports = router;
