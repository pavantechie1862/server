-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lims
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` varchar(20) NOT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B1','Vizag',NULL),('B2','Guntur',NULL),('B3','LB nagar',NULL),('B4','Punjagutta',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(20) NOT NULL,
  `reporting_name` varchar(100) NOT NULL,
  `reporting_address` text,
  `billing_name` varchar(100) NOT NULL,
  `billing_address` text,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `gst_number` varchar(20) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `work_order` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3,'CUST003','LMN Ltd.','789 Oak Road, Villagetown, USA','LMN Ltd.','789 Oak Road, Villagetown, USA','lmn@example.com','+1-567-890-1234','GST7890123','PANLMN789','WO23456'),(4,'CUST004','PQR Enterprises','101 Pine Street, Hamletville, USA','PQR Enterprises','101 Pine Street, Hamletville, USA','pqr@example.com','+1-234-567-8901','GST4567890','PANPQR012','WO78901'),(5,'CUST005','EFG Inc.','222 Cedar Lane, Countryside, USA','EFG Inc.','222 Cedar Lane, Countryside, USA','efg@example.com','+1-345-678-9012','GST2345678','PANEFG345','WO56789'),(6,'CUST006','JKL Solutions','333 Birch Street, Mountainview, USA','JKL Solutions','333 Birch Street, Mountainview, USA','jkl@example.com','+1-456-789-0123','GST8901234','PANJKL678','WO67890'),(7,'CUST007','RST Group','444 Maple Avenue, Lakeside, USA','RST Group','444 Maple Avenue, Lakeside, USA','rst@example.com','+1-567-890-1234','GST3456789','PANRST901','WO12345'),(8,'CUST008','UVW Enterprises','555 Oak Street, Riverdale, USA','UVW Enterprises','555 Oak Street, Riverdale, USA','uvw@example.com','+1-678-901-2345','GST9012345','PANUVW234','WO23456'),(9,'CUST009','MNO Ltd.','666 Elm Road, Hillside, USA','MNO Ltd.','666 Elm Road, Hillside, USA','mno@example.com','+1-789-012-3456','GST0123456','PANMNO567','WO56789'),(10,'CUST010','GHI Inc.','777 Pine Lane, Seaville, USA','GHI Inc.','777 Pine Lane, Seaville, USA','ghi@example.com','+1-890-123-4567','GST1238901','PANGHI890','WO78901'),(11,'CUST011','ABC Company','123 Main Street, Cityville, USA','ABC Company','123 Main Street, Cityville, USA','abc@example.com','+1-123-456-7890','GST1234567','PANABCP123','WO12345'),(12,'CUST012','XYZ Corporation','456 Elm Avenue, Townburg, USA','XYZ Corporation','456 Elm Avenue, Townburg, USA','xyz@example.com','+1-987-654-3210','GST9876543','PANXYZ456','WO67890'),(13,'CUST013','LMN Ltd.','789 Oak Road, Villagetown, USA','LMN Ltd.','789 Oak Road, Villagetown, USA','lmn@example.com','+1-567-890-1234','GST7890123','PANLMN789','WO23456'),(14,'CUST014','PQR Enterprises','101 Pine Street, Hamletville, USA','PQR Enterprises','101 Pine Street, Hamletville, USA','pqr@example.com','+1-234-567-8901','GST4567890','PANPQR012','WO78901'),(15,'CUST015','EFG Inc.','222 Cedar Lane, Countryside, USA','EFG Inc.','222 Cedar Lane, Countryside, USA','efg@example.com','+1-345-678-9012','GST2345678','PANEFG345','WO56789'),(16,'CUST016','JKL Solutions','333 Birch Street, Mountainview, USA','JKL Solutions','333 Birch Street, Mountainview, USA','jkl@example.com','+1-456-789-0123','GST8901234','PANJKL678','WO67890'),(17,'CUST017','RST Group','444 Maple Avenue, Lakeside, USA','RST Group','444 Maple Avenue, Lakeside, USA','rst@example.com','+1-567-890-1234','GST3456789','PANRST901','WO12345'),(18,'CUST018','UVW Enterprises','555 Oak Street, Riverdale, USA','UVW Enterprises','555 Oak Street, Riverdale, USA','uvw@example.com','+1-678-901-2345','GST9012345','PANUVW234','WO23456'),(19,'CUST019','MNO Ltd.','666 Elm Road, Hillside, USA','MNO Ltd.','666 Elm Road, Hillside, USA','mno@example.com','+1-789-012-3456','GST0123456','PANMNO567','WO56789'),(20,'CUST020','GHI Inc.','777 Pine Lane, Seaville, USA','GHI Inc.','777 Pine Lane, Seaville, USA','ghi@example.com','+1-890-123-4567','GST1238901','PANGHI890','WO78901'),(25,'','','','','','','','','','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` varchar(50) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `additional_info` text,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('BUSSINESS_DEVELOPEMENT','Business Development',NULL),('DPR','DPR',NULL),('FINANCE_ACCOUNTS','Finance & Accounts',NULL),('GEO_TECHNICAL','Geo-technical',NULL),('HIGHWAYS','Highways',NULL),('HR_ADMINISTRATION','H.R & Administration',NULL),('LABORATORY_CHEMICAL','Laboratory – Chemical',NULL),('LABORATORY_MECHANICAL','Laboratory – Mechanical',NULL),('LAND_AQUASITION','Land Acquisition',NULL),('PAVEMENT_TRAFFIC','Pavement & Traffic',NULL),('SHM_A','SHM & A',NULL),('SOFTWARE','Software',NULL),('STRUCTURES','Structures',NULL),('SURVEY','Survey',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `personnel_mail` varchar(100) DEFAULT NULL,
  `address` text,
  `additional_info` text,
  `appointed_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `supervisor` varchar(50) DEFAULT NULL,
  `ssc_certificate` varchar(255) DEFAULT NULL,
  `intermediate_certificate` varchar(255) DEFAULT NULL,
  `degree_certificate` varchar(255) DEFAULT NULL,
  `adhar` varchar(255) DEFAULT NULL,
  `pan` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `appointment_letter` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `hashed_password` text,
  `department` varchar(50) DEFAULT NULL,
  `role` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `department` (`department`),
  KEY `role` (`role`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('KDM001','Srinivasulu','Kunchala','8179769162','srinivasulu.kunchala@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B4','EMP001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM001/profile_image_KDM001.jpg','2023-10-26','KunchalaKDM001','$2b$10$dMQQ4kssopcKc90d9bsc7Ozkqs5pY7oRk94ADyoaOMDI7yw/WnbPK','GEO_TECHNICAL',106),('KDM002','Subhashini','Kunchala','8179769162','subhashini.kunchala@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-19',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM002/profile_image_KDM002.jpeg','2023-10-28','KunchalaKDM002','$2b$10$Ue72A9/6Fsj254vN/WwMtu7mUlCVhjg.1et/uPVx8MKKqWJSS/WRm','FINANCE_ACCOUNTS',107),('KDM003','Chandra Sekhar','Sunkara','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-18',0.00,'B3','KDM054',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM003/profile_image_KDM003.jpg','2023-10-27','SunkaraKDM003','$2b$10$cmglkPcBY8.w5equ2OcZpOrrx4nI69gqHrcpIhBHVSSiiGv/lWGPy','LABORATORY_CHEMICAL',108),('KDM015','Raju','Katta','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM015/profile_image_KDM015.jpg','2023-10-20','KattaKDM015','$2b$10$Jm58NqT2pi4xGIwkwiyaa.kuuNg6Ayt7wawyohCvMQRshdikigvMu','LABORATORY_MECHANICAL',114),('KDM017','Srinivas','B','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM017/profile_image_KDM017.jpg','2023-10-20','BKDM017','$2b$10$WvQVhVsBpyIfvq6pQnqau.3kiZCrFMlzjsTUYUcMuRC8RAHV5yjdm','LABORATORY_MECHANICAL',109),('KDM054','Srinivasarao','Bhuvanagiri','8179769162','drbsrao@kdmengineers.com','KDM Engineers (India) Private Limited, \r\nGuntur, D.No.62/7B,Block \r\nNo.9,R.Agraharam,, Etkur Road,Guntur \r\nDistrict, Guntur-522003, Andhra Pradesh','','2023-10-26',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM054/profile_image_KDM054.jpg','2023-10-27','BhuvanagiriKDM054','$2b$10$f9WrP7cKrmoh6i.FPR6Lvun0HRYWDvrZmkHUJSly2qIgtC0YZ7G0q','LABORATORY_CHEMICAL',117),('KDM063','Sai kumar','B','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-26',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM063/profile_image_KDM063.jpg','2023-10-28','BKDM063','$2b$10$o4ZrekziMEkj5nNGbASl6uqDFc/I1RLhA/Nn1k/vvW2PdrVAA37fu','LABORATORY_MECHANICAL',118),('KDM086','Srinivas','Gunti','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM086/profile_image_KDM086.jpg','2023-10-27','GuntiKDM086','$2b$10$I8iC/vNvFnupL7YJlfNHROvB9sY0z55V4L4k0e8QEPGTgDQqF.VOK','LABORATORY_MECHANICAL',109),('KDM093','Chandra Sekhar Gupta ','Illuri','8179769162','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-11-01',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM093/profile_image_KDM093.jpg','2023-10-26','IlluriKDM093','$2b$10$3pqI/X6txNcpqqT.BjOPfevg9IQ0o2PBzJ1SAoXjlFIzYW0uaz1oi','BUSSINESS_DEVELOPEMENT',119),('KDM129','Ramesh','Lingoju','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-26',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM129/profile_image_KDM129.jpg','2023-10-27','LingojuKDM129','$2b$10$BtgzF/b896XqdCx3Ug1F5u.PEimRdTwRn6bJYfdnbCHNXPdfzncKa','LABORATORY_MECHANICAL',129),('KDM225','Srikanth','S','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-19',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM225/profile_image_KDM225.jpg','2023-10-28','SKDM225','$2b$10$s5SnLkYHh97JT/xCompTXe2cxJzl330J85Jp.gsNWGDWT1lS9H7Ly','LABORATORY_MECHANICAL',124),('KDM268','Venkateshwar Reddy','J','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-26',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM268/profile_image_KDM268.jpg','2023-10-27','JKDM268','$2b$10$G0lSt3CVuglRNSCvZSDW/eSBjFvzAhj62TDBxd31N4eZp7xVexuti','LABORATORY_MECHANICAL',123),('KDM269','Mahesh','B','9398187618','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM269/profile_image_KDM269.jpg','2023-10-27','BKDM269','$2b$10$4i2Roxp3SZWGHTg2amsrmeNV4gKZd9gyND69wIyqnPmVjIzIRrHC.','LABORATORY_MECHANICAL',123),('KDM276','Srikanth','B','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-26',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM276/profile_image_KDM276.jpg','2023-10-21','BKDM276','$2b$10$zwy0pm9XLZd.61hc6h/bHOH6sjbDfqjKXe5xTySCLba1MR199sbA2','LABORATORY_MECHANICAL',124),('KDM311','Srikanth','Dharala','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-11',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM311/profile_image_KDM311.jpg','2023-10-26','DharalaKDM311','$2b$10$kQZK7M6arJom0Sgge708F.vP15qG/v2lkSJveAm8DIMopaoapVNJa','LABORATORY_MECHANICAL',114),('KDM338','Suresh','Rambala','8179769162','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-27',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM338/profile_image_KDM338.jpg','2023-10-26','RambalaKDM338','$2b$10$TL1/y8j2v0KMsQqYNhvvbeiPoVOS8iek4uhz2aqwxxFrUDSsTPA3a','LABORATORY_MECHANICAL',132),('KDM361','Mahesh','Limgoju','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-24',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM361/profile_image_KDM361.jpg','2023-10-27','LimgojuKDM361','$2b$10$TrMJWgniEvq5fWJY5y3Yq.1nGcROM4rU81.opq46D.4NpKhqjBMyG','LABORATORY_MECHANICAL',136),('KDM382','Ashok','Dasari','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM382/profile_image_KDM382.jpg','2023-10-28','DasariKDM382','$2b$10$TmvtMr5BzCgzhilJWOxRJuPQvavrAOJ/eLVE8c1OdJ0LthPNBAZ6a','LABORATORY_MECHANICAL',139),('KDM384','Sateesh','Chinaboina','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-18',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM384/profile_image_KDM384.jpg','2023-10-21','ChinaboinaKDM384','$2b$10$3UHjhTd4Ac2/pGtayRMCp..93kTwJ/i/dznpYT13DsyDuSGT..xAu','LABORATORY_MECHANICAL',139),('KDM389','Karthik Reddy','Pabbathireddy','7382309959','hr@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-18',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM389/profile_image_KDM389.jpg','2023-10-20','PabbathireddyKDM389','$2b$10$2rmw6.cvYEi/seX3mqkJBeLOWqLxi27S21gg84GIwi6r0KMtAObK6','HR_ADMINISTRATION',141),('KDM393','Venkata vishweshwara pavanedra','Sarasa','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM/profile_image_KDM.jpg','2023-10-20','SarasaKDM','$2b$10$obu9CvMGB1VRHmOyLgKcI.soNAYNE6lnDEMkP1MTTfLm16zARjOBO','LABORATORY_MECHANICAL',145),('KDM396','Ravi kumar singh','','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-26',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM396/profile_image_KDM396.jpg','2023-10-21','KDM396','$2b$10$tJFmaERJxGNobq7dFeX9Uu5A2wyoVYLoZp9xKlxq8aj9Kq4h.14bC','LABORATORY_MECHANICAL',145),('KDM410','Feroz','Sheik','7382309959','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-19',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM410/profile_image_KDM410.jpg','2023-10-20','SheikKDM410','$2b$10$CxoxImNoW4jo.tiQLC3LPOIYFyhjZh/9DDOZVQI0MM/LDRyv8w9Bm','LABORATORY_MECHANICAL',123),('KDM411','Dattu reddy','Mugdhampur','9398187618','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-25',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM411/profile_image_KDM411.jpg','2023-10-20','MugdhampurKDM411','$2b$10$sooOITt5ZobtngjTtr6J4e7rDTPlhOjnaPXbgSg0SWjcyjetwxxNy','LABORATORY_MECHANICAL',148),('KDM414','Dinesh Kumar','Bathula','8179769162','dineshbathula333@gmail.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-19',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM414/profile_image_KDM414.jpg','2023-10-19','BathulaKDM414','$2b$10$87uMjInkCwY8IGLBZ2ThN.uHsvJC1LkiQ2g8.5VFWbHaDG6mG9aUK','SOFTWARE',149),('KDM416','Shekhar','Chennaboina','8179769162','employee@kdmengineers.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-18',0.00,'B3','KDM338',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM416/profile_image_KDM416.jpg','2023-10-20','ChennaboinaKDM416','$2b$10$NAtFIDDn4KNYKQMEy4dO3uLmsvlzVoS99vHIH8tb556WSptdMOnoy','LABORATORY_MECHANICAL',123),('KDM419','Saleem','Shaik','8179769162','saleems716@gmail.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-10-26',0.00,'B3','KDM054',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM419/profile_image_KDM419.jpeg','2023-10-26','ShaikKDM419','$2b$10$QYDRGEs/Z9/YoPqiLSO5seVqKcA.KWOZrpoCm2J6krymqvjx5VdkC','LABORATORY_CHEMICAL',116),('KDM426','Venkata Satya Sai Uday Kiran','Eaty','9398187618','uday.evss@gmail.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-06-28',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM426/profile_image_KDM426.jpg','2023-11-03','EatyKDM426','$2b$10$pvJM1XCBV35vShfCTCML..szH72JTV6W1blEp1f0/GIXKTma9lPUa','SOFTWARE',153),('KDM427','Pavan','Marapalli','8179769162','pavanmarapalli171862@gmail.com','KDM ENGINEERS (INDIA) PVT. LTD. Regd. & Corporate Office:- Plot No. 401, Sri Ramana Colony, Karmanghat, Saroornagar (M), Hyderabad 500079.','','2023-07-01',0.00,'B3','KDM001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'/public/employee/KDM427/profile_image_KDM427.jpg','2023-07-20','MarapalliKDM427','$2b$10$ZDW7yuFt5y2Us.fWFnZI7..oDPm08G./88J1kdxBpMh2XXhlg1/uW','SOFTWARE',153);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_groups`
--

DROP TABLE IF EXISTS `material_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_groups` (
  `id` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `additional_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_groups`
--

LOCK TABLES `material_groups` WRITE;
/*!40000 ALTER TABLE `material_groups` DISABLE KEYS */;
INSERT INTO `material_groups` VALUES ('GROUP-001','Building Materials','Suppliers of various construction materials.'),('GROUP-002','Solid Fuels','Suppliers of coal, wood, and other solid fuels.'),('GROUP-003','Water','Providers of clean drinking water services.'),('GROUP-004','Building materials - Reinforced structures','Suppliers of materials for reinforced concrete structures.'),('GROUP-005','Ores and Minerals','Miners and suppliers of ores and minerals.'),('GROUP-006','Soil and Rock','Providers of soil and rock excavation services.');
/*!40000 ALTER TABLE `material_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_material_groups` BEFORE INSERT ON `material_groups` FOR EACH ROW BEGIN
  DECLARE next_serial INT;
  SET next_serial = (SELECT IFNULL(MAX(CAST(SUBSTRING(id, 7) AS SIGNED)), 0) + 1 FROM material_groups);
  SET NEW.id = CONCAT('GROUP-', LPAD(next_serial, 3, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `material_test`
--

DROP TABLE IF EXISTS `material_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sample_id` varchar(70) DEFAULT NULL,
  `test_id` int DEFAULT NULL,
  `assign_to` varchar(30) DEFAULT NULL,
  `status` varchar(60) DEFAULT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `test_result` decimal(8,2) DEFAULT NULL,
  `test_details` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_id` (`sample_id`),
  CONSTRAINT `material_test_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `order_material` (`sample_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_test`
--

LOCK TABLES `material_test` WRITE;
/*!40000 ALTER TABLE `material_test` DISABLE KEYS */;
INSERT INTO `material_test` VALUES (18,'41ff434d-9118-416a-9f9e-f8d225de41cc',1,NULL,'IN_PROGRESS',NULL,NULL,NULL),(19,'41ff434d-9118-416a-9f9e-f8d225de41cc',3,NULL,'IN_PROGRESS',NULL,NULL,NULL),(20,'fd1a31b7-8a5c-4321-b8fe-08032a8ece6d',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(21,'fd1a31b7-8a5c-4321-b8fe-08032a8ece6d',34,NULL,'IN_PROGRESS',NULL,NULL,NULL),(22,'fd1a31b7-8a5c-4321-b8fe-08032a8ece6d',8,NULL,'IN_PROGRESS',NULL,NULL,NULL),(23,'fd1a31b7-8a5c-4321-b8fe-08032a8ece6d',12,NULL,'IN_PROGRESS',NULL,NULL,NULL),(24,'a54655b3-188d-4644-8fd2-f7ca2c26e18b',6,NULL,'IN_PROGRESS',NULL,NULL,NULL),(25,'a54655b3-188d-4644-8fd2-f7ca2c26e18b',7,NULL,'IN_PROGRESS',NULL,NULL,NULL),(26,'7054c495-d406-4f2b-8bc1-94e3b342a7f8',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(27,'7054c495-d406-4f2b-8bc1-94e3b342a7f8',34,NULL,'IN_PROGRESS',NULL,NULL,NULL),(28,'7054c495-d406-4f2b-8bc1-94e3b342a7f8',8,NULL,'IN_PROGRESS',NULL,NULL,NULL),(29,'7054c495-d406-4f2b-8bc1-94e3b342a7f8',11,NULL,'IN_PROGRESS',NULL,NULL,NULL),(30,'acc7cc88-1aba-458a-9860-a4463c7cb9fe',1,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(31,'acc7cc88-1aba-458a-9860-a4463c7cb9fe',2,'KDM003','IN_PROGRESS',NULL,NULL,NULL),(32,'acc7cc88-1aba-458a-9860-a4463c7cb9fe',3,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(33,'acc7cc88-1aba-458a-9860-a4463c7cb9fe',4,'KDM003','IN_PROGRESS',NULL,NULL,NULL),(34,'acc7cc88-1aba-458a-9860-a4463c7cb9fe',5,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(35,'15f4f5c9-d254-407e-8953-3469e9de93a9',28,'KDM268','IN_PROGRESS',NULL,NULL,NULL),(36,'15f4f5c9-d254-407e-8953-3469e9de93a9',29,'KDM384','IN_PROGRESS',NULL,NULL,NULL),(37,'15f4f5c9-d254-407e-8953-3469e9de93a9',34,'KDM384','IN_PROGRESS',NULL,NULL,NULL),(38,'15f4f5c9-d254-407e-8953-3469e9de93a9',8,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(39,'15f4f5c9-d254-407e-8953-3469e9de93a9',10,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(40,'156903e5-2d32-46c6-9d42-32ef165934f7',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(41,'156903e5-2d32-46c6-9d42-32ef165934f7',30,NULL,'IN_PROGRESS',NULL,NULL,NULL),(42,'156903e5-2d32-46c6-9d42-32ef165934f7',32,NULL,'IN_PROGRESS',NULL,NULL,NULL),(43,'156903e5-2d32-46c6-9d42-32ef165934f7',9,NULL,'IN_PROGRESS',NULL,NULL,NULL),(44,'156903e5-2d32-46c6-9d42-32ef165934f7',11,NULL,'IN_PROGRESS',NULL,NULL,NULL),(45,'0ff0e537-7efb-4691-b406-b0502a77a557',1,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(46,'0ff0e537-7efb-4691-b406-b0502a77a557',3,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(47,'59255c52-69a1-4682-823b-ec4e1abfbb18',28,'KDM382','IN_PROGRESS',NULL,NULL,NULL),(48,'59255c52-69a1-4682-823b-ec4e1abfbb18',29,'KDM382','IN_PROGRESS',NULL,NULL,NULL),(49,'59255c52-69a1-4682-823b-ec4e1abfbb18',8,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(50,'59255c52-69a1-4682-823b-ec4e1abfbb18',9,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(56,'6426ee18-89f4-4cc4-a961-b1fa505742fb',28,'KDM410','IN_PROGRESS',NULL,NULL,NULL),(57,'6426ee18-89f4-4cc4-a961-b1fa505742fb',29,'KDM393','IN_PROGRESS',NULL,NULL,NULL),(58,'6426ee18-89f4-4cc4-a961-b1fa505742fb',34,'KDM393','IN_PROGRESS',NULL,NULL,NULL),(59,'6426ee18-89f4-4cc4-a961-b1fa505742fb',8,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(60,'6426ee18-89f4-4cc4-a961-b1fa505742fb',11,'KDM003','IN_PROGRESS',NULL,NULL,NULL),(61,'527387cb-cc93-4dbf-bc06-7fab2aad0486',6,NULL,'IN_PROGRESS',NULL,NULL,NULL),(62,'527387cb-cc93-4dbf-bc06-7fab2aad0486',7,NULL,'IN_PROGRESS',NULL,NULL,NULL),(63,'9eb61f32-be24-489b-a9b0-98c709706341',1,NULL,'IN_PROGRESS',NULL,NULL,NULL),(64,'9eb61f32-be24-489b-a9b0-98c709706341',3,NULL,'IN_PROGRESS',NULL,NULL,NULL),(65,'9eb61f32-be24-489b-a9b0-98c709706341',5,NULL,'IN_PROGRESS',NULL,NULL,NULL),(66,'69875f47-74ad-44a2-9ab2-501bb4be47fc',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(67,'69875f47-74ad-44a2-9ab2-501bb4be47fc',31,NULL,'IN_PROGRESS',NULL,NULL,NULL),(68,'69875f47-74ad-44a2-9ab2-501bb4be47fc',34,NULL,'IN_PROGRESS',NULL,NULL,NULL),(69,'69875f47-74ad-44a2-9ab2-501bb4be47fc',8,NULL,'IN_PROGRESS',NULL,NULL,NULL),(70,'69875f47-74ad-44a2-9ab2-501bb4be47fc',10,NULL,'IN_PROGRESS',NULL,NULL,NULL),(71,'cf9611b5-882b-4068-a022-2b2f22807a5e',1,NULL,'IN_PROGRESS',NULL,NULL,NULL),(72,'cf9611b5-882b-4068-a022-2b2f22807a5e',2,NULL,'IN_PROGRESS',NULL,NULL,NULL),(73,'cf9611b5-882b-4068-a022-2b2f22807a5e',3,NULL,'IN_PROGRESS',NULL,NULL,NULL),(74,'cf9611b5-882b-4068-a022-2b2f22807a5e',4,NULL,'IN_PROGRESS',NULL,NULL,NULL),(75,'cf9611b5-882b-4068-a022-2b2f22807a5e',5,NULL,'IN_PROGRESS',NULL,NULL,NULL),(76,'32d13a31-1b14-4a4e-a112-a04641c531ac',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(77,'32d13a31-1b14-4a4e-a112-a04641c531ac',31,NULL,'IN_PROGRESS',NULL,NULL,NULL),(78,'32d13a31-1b14-4a4e-a112-a04641c531ac',34,NULL,'IN_PROGRESS',NULL,NULL,NULL),(79,'32d13a31-1b14-4a4e-a112-a04641c531ac',9,NULL,'IN_PROGRESS',NULL,NULL,NULL),(80,'32d13a31-1b14-4a4e-a112-a04641c531ac',11,NULL,'IN_PROGRESS',NULL,NULL,NULL),(81,'32d13a31-1b14-4a4e-a112-a04641c531ac',12,NULL,'IN_PROGRESS',NULL,NULL,NULL),(82,'0f4e19fd-5c9f-4c29-a82f-7bdec5dbcdcd',2,NULL,'IN_PROGRESS',NULL,NULL,NULL),(83,'0f4e19fd-5c9f-4c29-a82f-7bdec5dbcdcd',4,NULL,'IN_PROGRESS',NULL,NULL,NULL),(84,'0f4e19fd-5c9f-4c29-a82f-7bdec5dbcdcd',5,NULL,'IN_PROGRESS',NULL,NULL,NULL),(85,'1ee08192-9533-4745-a48e-36eef1908967',6,NULL,'IN_PROGRESS',NULL,NULL,NULL),(86,'1ee08192-9533-4745-a48e-36eef1908967',7,NULL,'IN_PROGRESS',NULL,NULL,NULL),(87,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',28,'KDM269','IN_PROGRESS',NULL,NULL,NULL),(88,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',29,'KDM361','IN_PROGRESS',NULL,NULL,NULL),(89,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',30,'KDM311','IN_PROGRESS',NULL,NULL,NULL),(90,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',31,'KDM276','IN_PROGRESS',NULL,NULL,NULL),(91,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',32,'KDM384','IN_PROGRESS',NULL,NULL,NULL),(92,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',33,'KDM384','IN_PROGRESS',NULL,NULL,NULL),(93,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',34,'KDM393','IN_PROGRESS',NULL,NULL,NULL),(94,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',8,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(95,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',9,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(96,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',10,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(97,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',11,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(98,'c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',12,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(99,'c797b7ac-8b34-4df0-b37a-95ded2702f5c',1,'KDM003','IN_PROGRESS',NULL,NULL,NULL),(100,'c797b7ac-8b34-4df0-b37a-95ded2702f5c',2,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(101,'c797b7ac-8b34-4df0-b37a-95ded2702f5c',3,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(102,'c797b7ac-8b34-4df0-b37a-95ded2702f5c',4,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(103,'c797b7ac-8b34-4df0-b37a-95ded2702f5c',5,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(104,'b98dde78-4fb2-4f79-9d0c-548f4c5e1b80',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(105,'b98dde78-4fb2-4f79-9d0c-548f4c5e1b80',31,NULL,'IN_PROGRESS',NULL,NULL,NULL),(106,'b98dde78-4fb2-4f79-9d0c-548f4c5e1b80',34,NULL,'IN_PROGRESS',NULL,NULL,NULL),(107,'b98dde78-4fb2-4f79-9d0c-548f4c5e1b80',8,NULL,'IN_PROGRESS',NULL,NULL,NULL),(108,'b98dde78-4fb2-4f79-9d0c-548f4c5e1b80',10,NULL,'IN_PROGRESS',NULL,NULL,NULL),(109,'d9256f68-9402-4f6e-b824-f4d4715fa6d0',28,NULL,'IN_PROGRESS',NULL,NULL,NULL),(110,'d9256f68-9402-4f6e-b824-f4d4715fa6d0',29,NULL,'IN_PROGRESS',NULL,NULL,NULL),(111,'d9256f68-9402-4f6e-b824-f4d4715fa6d0',8,NULL,'IN_PROGRESS',NULL,NULL,NULL),(112,'d9256f68-9402-4f6e-b824-f4d4715fa6d0',9,NULL,'IN_PROGRESS',NULL,NULL,NULL),(113,'10386d93-95a0-4ac3-b475-21e898e64814',28,'KDM393','IN_PROGRESS',NULL,NULL,NULL),(114,'10386d93-95a0-4ac3-b475-21e898e64814',29,'KDM410','IN_PROGRESS',NULL,NULL,NULL),(115,'10386d93-95a0-4ac3-b475-21e898e64814',8,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(116,'10386d93-95a0-4ac3-b475-21e898e64814',9,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(123,'61fab1fc-9f5d-4a26-873c-4332367e283b',1,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(124,'61fab1fc-9f5d-4a26-873c-4332367e283b',2,'KDM419','IN_PROGRESS',NULL,NULL,NULL),(125,'61fab1fc-9f5d-4a26-873c-4332367e283b',3,'KDM419','FINISHED','2023-11-03 15:33:43',8.00,'{\"w1\": 12.34, \"w2\": 12345, \"w3\": 999}'),(126,'61fab1fc-9f5d-4a26-873c-4332367e283b',4,'KDM419','FINISHED','2023-11-03 15:39:57',14.00,'{\"ph\": 14}'),(127,'61fab1fc-9f5d-4a26-873c-4332367e283b',5,'KDM003','IN_PROGRESS',NULL,NULL,NULL),(128,'cb5af552-57c6-4fea-a7e7-25557b2c2493',1,'KDM419','FINISHED','2023-11-03 16:02:11',101.62,'{\"w1\": 1321, \"w2\": 22, \"w3\": 1}'),(129,'cb5af552-57c6-4fea-a7e7-25557b2c2493',2,'KDM054','IN_PROGRESS',NULL,NULL,NULL),(130,'cb5af552-57c6-4fea-a7e7-25557b2c2493',3,'KDM003','FINISHED','2023-11-03 16:12:44',100.00,'{\"w1\": 2143, \"w2\": 234, \"w3\": 234}'),(131,'cb5af552-57c6-4fea-a7e7-25557b2c2493',4,'KDM419','FINISHED','2023-11-03 15:36:28',12.00,'{\"ph\": 12}'),(132,'cb5af552-57c6-4fea-a7e7-25557b2c2493',5,'KDM419','FINISHED','2023-11-03 15:41:06',123.00,'{\"relativeDensity\": 123}'),(133,'4cd50466-63a8-4cf9-803f-9a76dd178763',1,'KDM003','FINISHED','2023-11-03 16:10:52',100.02,'{\"w1\": 1242234, \"w2\": 234, \"w3\": 24}'),(134,'4cd50466-63a8-4cf9-803f-9a76dd178763',2,'KDM003','IN_PROGRESS',NULL,NULL,NULL),(135,'4cd50466-63a8-4cf9-803f-9a76dd178763',3,'KDM003','FINISHED','2023-11-03 16:09:27',6.23,'{\"w1\": 13123, \"w2\": 123, \"w3\": 12313.00123}'),(136,'4cd50466-63a8-4cf9-803f-9a76dd178763',4,'KDM003','FINISHED','2023-11-03 16:06:56',12.00,'{\"ph\": 12}'),(137,'4cd50466-63a8-4cf9-803f-9a76dd178763',5,'KDM003','FINISHED','2023-11-03 16:06:49',10.00,'{\"relativeDensity\": 10}');
/*!40000 ALTER TABLE `material_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_material`
--

DROP TABLE IF EXISTS `order_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_material` (
  `order_id` varchar(70) NOT NULL,
  `sample_id` varchar(70) NOT NULL,
  `subgroup` int DEFAULT NULL,
  `source` text,
  `quantity` int DEFAULT NULL,
  `units` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`sample_id`),
  KEY `sample_id_index` (`sample_id`),
  CONSTRAINT `order_material_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_material`
--

LOCK TABLES `order_material` WRITE;
/*!40000 ALTER TABLE `order_material` DISABLE KEYS */;
INSERT INTO `order_material` VALUES ('00dd6468-ea70-42b7-872f-875d8c93eac0','cb5af552-57c6-4fea-a7e7-25557b2c2493',1,'some source',234,NULL),('0200a692-eb80-4bc5-8b37-5b359c221850','acc7cc88-1aba-458a-9860-a4463c7cb9fe',1,NULL,NULL,NULL),('0d319d53-e4b2-4c5f-8e1a-0f4f78c4902c','c797b7ac-8b34-4df0-b37a-95ded2702f5c',1,'source 2',123,NULL),('0d319d53-e4b2-4c5f-8e1a-0f4f78c4902c','c7f3af77-edc7-4dc3-be30-f4d0b6fc769f',5,'some source',12,NULL),('1000301c-32b7-46c6-8055-3ed2d733530d','8c635981-51bc-4da2-8c00-bbf464eed403',5,NULL,NULL,NULL),('13c41157-0588-4ac9-90ba-7ffea9358397','15f4f5c9-d254-407e-8953-3469e9de93a9',5,NULL,NULL,NULL),('24453887-5d18-4eff-a354-301750735b39','6426ee18-89f4-4cc4-a961-b1fa505742fb',5,NULL,NULL,NULL),('2d2d54a4-0154-4bab-8e2f-af6f0621706b','4cd50466-63a8-4cf9-803f-9a76dd178763',1,'some source',13,NULL),('5ce0c6dc-330e-49a2-adfe-ad9570ff214e','10386d93-95a0-4ac3-b475-21e898e64814',5,'34567890',3445,NULL),('75e6d1d4-8c82-45e4-bfe1-3f50d72ea421','8bd037a8-0348-4b72-a64e-5724432e20d2',5,'hello world',12,NULL),('7eaa476c-1cb8-42b5-ba66-50dea3ae62ac','d9256f68-9402-4f6e-b824-f4d4715fa6d0',5,'some source gos here',1232,NULL),('8adfe65f-feb9-4940-93b7-30c77087c114','b98dde78-4fb2-4f79-9d0c-548f4c5e1b80',5,'some source',4567,NULL),('ab56f99c-8058-4a70-9611-19f3626be5d1','0f4e19fd-5c9f-4c29-a82f-7bdec5dbcdcd',1,NULL,NULL,NULL),('ab56f99c-8058-4a70-9611-19f3626be5d1','1ee08192-9533-4745-a48e-36eef1908967',2,NULL,NULL,NULL),('ab56f99c-8058-4a70-9611-19f3626be5d1','32d13a31-1b14-4a4e-a112-a04641c531ac',5,NULL,NULL,NULL),('c88ea9a3-edd9-4b22-b74b-844bdd3f21f5','41ff434d-9118-416a-9f9e-f8d225de41cc',1,NULL,NULL,NULL),('c88ea9a3-edd9-4b22-b74b-844bdd3f21f5','a54655b3-188d-4644-8fd2-f7ca2c26e18b',2,NULL,NULL,NULL),('c88ea9a3-edd9-4b22-b74b-844bdd3f21f5','fd1a31b7-8a5c-4321-b8fe-08032a8ece6d',5,NULL,NULL,NULL),('cf150561-240f-47b7-9a2e-ddb99bbec935','527387cb-cc93-4dbf-bc06-7fab2aad0486',2,NULL,NULL,NULL),('d827eff5-fa23-4ebd-b3ef-7123eeb04b8a','61fab1fc-9f5d-4a26-873c-4332367e283b',1,'some siurce goes here',12,NULL),('dab3a280-8191-4263-901e-b1314e9b61b6','7054c495-d406-4f2b-8bc1-94e3b342a7f8',5,NULL,NULL,NULL),('e4c0fafc-e501-4f3c-8615-673d0dfe86c5','69875f47-74ad-44a2-9ab2-501bb4be47fc',5,NULL,NULL,NULL),('e4c0fafc-e501-4f3c-8615-673d0dfe86c5','9eb61f32-be24-489b-a9b0-98c709706341',1,NULL,NULL,NULL),('e4c0fafc-e501-4f3c-8615-673d0dfe86c5','cf9611b5-882b-4068-a022-2b2f22807a5e',1,NULL,NULL,NULL),('eaf5f66e-9544-44f4-9138-e85636dee203','156903e5-2d32-46c6-9d42-32ef165934f7',5,NULL,NULL,NULL),('ecde54c0-52fc-4c13-a2a8-03ca1b19020b','0ff0e537-7efb-4691-b406-b0502a77a557',1,NULL,NULL,NULL),('ecde54c0-52fc-4c13-a2a8-03ca1b19020b','59255c52-69a1-4682-823b-ec4e1abfbb18',5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `order_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(50) NOT NULL,
  `project_name` varchar(400) DEFAULT NULL,
  `subject` varchar(400) DEFAULT NULL,
  `letter` varchar(600) DEFAULT NULL,
  `additional_info` text,
  `discount` decimal(10,2) DEFAULT NULL,
  `transport_fee` decimal(10,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `assigned_on` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('00dd6468-ea70-42b7-872f-875d8c93eac0','wertyuioertyui','ertyuio','00dd6468-ea70-42b7-872f-875d8c93eac0\\00dd6468-ea70-42b7-872f-875d8c93eac0_letter.png','kasydufsaf',12.00,1222.00,'2023-11-25','2023-11-02',16,'ASSIGNED','2023-11-02'),('0200a692-eb80-4bc5-8b37-5b359c221850','order testing 3','testing 3 subjesct  goes here','0200a692-eb80-4bc5-8b37-5b359c221850\\0200a692-eb80-4bc5-8b37-5b359c221850_letter.pdf','additional  info',13.00,3444.00,'2023-10-27','2023-10-16',12,'ASSIGNED','2023-11-01'),('0d319d53-e4b2-4c5f-8e1a-0f4f78c4902c','last nmodified','some subject goes here','0d319d53-e4b2-4c5f-8e1a-0f4f78c4902c\\0d319d53-e4b2-4c5f-8e1a-0f4f78c4902c_letter.pdf','edrtfgyuijok',12.00,133.00,'2023-10-20','2023-10-18',4,'ASSIGNED','2023-11-01'),('1000301c-32b7-46c6-8055-3ed2d733530d','praveens\'s order','some subject goes here','1000301c-32b7-46c6-8055-3ed2d733530d\\1000301c-32b7-46c6-8055-3ed2d733530d_letter.pdf','esrdtfgyuij',13.00,12.00,'2023-10-20','2023-10-17',4,'ASSIGNED','2023-10-31'),('13c41157-0588-4ac9-90ba-7ffea9358397','testing order 4','some subject goes here','13c41157-0588-4ac9-90ba-7ffea9358397\\13c41157-0588-4ac9-90ba-7ffea9358397_letter.pdf','some additional info goes here',1200.00,13.00,'2023-10-28','2023-10-16',18,'ASSIGNED','2023-11-03'),('24453887-5d18-4eff-a354-301750735b39','Another order','some subject goes here','24453887-5d18-4eff-a354-301750735b39\\24453887-5d18-4eff-a354-301750735b39_letter.pdf','edgtfbhjnk',120.00,12.00,'2023-10-21','2023-10-17',13,'ASSIGNED','2023-11-01'),('2d2d54a4-0154-4bab-8e2f-af6f0621706b','only admixtutre','some subjectb goes here','2d2d54a4-0154-4bab-8e2f-af6f0621706b\\2d2d54a4-0154-4bab-8e2f-af6f0621706b_letter.png','kzdjfhsz',12.00,12.00,'2023-11-17','2023-11-03',10,'ASSIGNED','2023-11-03'),('5ce0c6dc-330e-49a2-adfe-ad9570ff214e','cable bridge','aslkasdf','5ce0c6dc-330e-49a2-adfe-ad9570ff214e\\5ce0c6dc-330e-49a2-adfe-ad9570ff214e_letter.pdf','a,sfkj',24.00,23.00,'2023-10-28','2023-10-27',3,'ASSIGNED','2023-11-01'),('75e6d1d4-8c82-45e4-bfe1-3f50d72ea421','on phone talk','some subject goes here','75e6d1d4-8c82-45e4-bfe1-3f50d72ea421\\75e6d1d4-8c82-45e4-bfe1-3f50d72ea421_letter.png','dfcgvbhjn',12.00,12.00,'2023-10-26','2023-10-31',4,'ASSIGNED',NULL),('7eaa476c-1cb8-42b5-ba66-50dea3ae62ac','checking order latest','adcfgbhjnm,','7eaa476c-1cb8-42b5-ba66-50dea3ae62ac\\7eaa476c-1cb8-42b5-ba66-50dea3ae62ac_letter.pdf','fghbjnkl',132.00,1324.00,'2023-10-28','2023-10-27',12,'PENDING_FOR_REVIEW',NULL),('8adfe65f-feb9-4940-93b7-30c77087c114','checking the latest','some random project','8adfe65f-feb9-4940-93b7-30c77087c114\\8adfe65f-feb9-4940-93b7-30c77087c114_letter.pdf','dfcgbhjkml,',12.00,23456.00,'2023-10-28','2023-10-27',11,'PENDING_FOR_REVIEW',NULL),('ab56f99c-8058-4a70-9611-19f3626be5d1','trying to retreive order details','some subject goes here','ab56f99c-8058-4a70-9611-19f3626be5d1\\ab56f99c-8058-4a70-9611-19f3626be5d1_letter.pdf','frtgyhjul',23.00,12.00,'2023-10-28','2023-10-18',13,'PENDING_FOR_REVIEW',NULL),('c88ea9a3-edd9-4b22-b74b-844bdd3f21f5','1024 kms road','some subject goes here','c88ea9a3-edd9-4b22-b74b-844bdd3f21f5\\c88ea9a3-edd9-4b22-b74b-844bdd3f21f5_letter.pdf','esgtfhbjkm',10.00,122.00,'2023-10-28','2023-10-15',4,'PENDING_FOR_REVIEW',NULL),('cf150561-240f-47b7-9a2e-ddb99bbec935','uday\'s order','some subject','cf150561-240f-47b7-9a2e-ddb99bbec935\\cf150561-240f-47b7-9a2e-ddb99bbec935_letter.pdf','some info',12.00,12.00,'2023-10-19','2023-10-17',15,'PENDING_FOR_REVIEW',NULL),('d827eff5-fa23-4ebd-b3ef-7123eeb04b8a','checking with chemist','some subject goes here','d827eff5-fa23-4ebd-b3ef-7123eeb04b8a\\d827eff5-fa23-4ebd-b3ef-7123eeb04b8a_letter.png','sdrgtfbhjkl',12.00,123.00,'2023-11-24','2023-11-02',13,'ASSIGNED','2023-11-02'),('dab3a280-8191-4263-901e-b1314e9b61b6','testing order 2','some subject goes here','dab3a280-8191-4263-901e-b1314e9b61b6\\dab3a280-8191-4263-901e-b1314e9b61b6_letter.xlsx','some additional info goes here',12222.00,13.00,'2023-10-27','2023-10-16',11,'PENDING_FOR_REVIEW',NULL),('e4c0fafc-e501-4f3c-8615-673d0dfe86c5','project 1234','some subject goes here','e4c0fafc-e501-4f3c-8615-673d0dfe86c5\\e4c0fafc-e501-4f3c-8615-673d0dfe86c5_letter.pdf','erdtfhjuk',12.00,12.00,'2023-10-20','2023-10-17',8,'PENDING_FOR_REVIEW',NULL),('eaf5f66e-9544-44f4-9138-e85636dee203','testing [pending for review','some random sunject goes hereq','eaf5f66e-9544-44f4-9138-e85636dee203\\eaf5f66e-9544-44f4-9138-e85636dee203_letter.pdf','some additional info goes here',1200.00,100.00,'2023-10-21','2023-10-16',16,'PENDING_FOR_REVIEW',NULL),('ecde54c0-52fc-4c13-a2a8-03ca1b19020b','latest','ertyui','ecde54c0-52fc-4c13-a2a8-03ca1b19020b\\ecde54c0-52fc-4c13-a2a8-03ca1b19020b_letter.pdf','drtfgyhuijk',123.00,13.00,'2023-10-14','2023-10-16',11,'ASSIGNED','2023-11-03');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `responsibilities` text,
  `min_salary` int DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `department` (`department`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (106,'Managing Director',NULL,0,'GEO_TECHNICAL'),(107,'Director - Finance',NULL,0,'FINANCE_ACCOUNTS'),(108,'Assistant Manager - Chemical',NULL,0,'LABORATORY_CHEMICAL'),(109,'Senior Technician',NULL,0,'LABORATORY_MECHANICAL'),(110,'Senior Technician',NULL,0,'GEO_TECHNICAL'),(111,'Assistant Manager',NULL,0,'LABORATORY_MECHANICAL'),(112,'Director - Technical',NULL,0,'LABORATORY_MECHANICAL'),(113,'Senior Quality Engineer',NULL,0,'LABORATORY_MECHANICAL'),(114,'Driver',NULL,0,'LABORATORY_MECHANICAL'),(115,'Junior Engineer',NULL,0,'GEO_TECHNICAL'),(116,'Senior Chemist',NULL,0,'LABORATORY_CHEMICAL'),(117,'Head - Chemical',NULL,0,'LABORATORY_CHEMICAL'),(118,'Senior Engineer',NULL,0,'LABORATORY_MECHANICAL'),(119,'Director',NULL,0,'BUSSINESS_DEVELOPEMENT'),(120,'Accountant',NULL,0,'FINANCE_ACCOUNTS'),(121,'Office Boy',NULL,0,'HR_ADMINISTRATION'),(122,'Sweeper',NULL,0,'HR_ADMINISTRATION'),(123,'Lab Technician',NULL,0,'LABORATORY_MECHANICAL'),(124,'Engineer',NULL,0,'LABORATORY_MECHANICAL'),(125,'Manager - Technical',NULL,0,'GEO_TECHNICAL'),(126,'Manager (Geo - Technical)',NULL,0,'GEO_TECHNICAL'),(127,'Driver',NULL,0,'BUSSINESS_DEVELOPEMENT'),(128,'Accounts Executive',NULL,0,'FINANCE_ACCOUNTS'),(129,'Manager (Customer Relations)',NULL,0,'LABORATORY_MECHANICAL'),(130,'Driver',NULL,0,'HR_ADMINISTRATION'),(131,'Manager - Instrumentation',NULL,0,'SHM_A'),(132,'Manager (Quality Control)',NULL,0,'LABORATORY_MECHANICAL'),(133,'Structural Engineer – Trainee',NULL,0,'SHM_A'),(134,'Manager (SHAM&R)',NULL,0,'SHM_A'),(135,'Finance Account Manager',NULL,0,'FINANCE_ACCOUNTS'),(136,'Commercial Executive',NULL,0,'LABORATORY_MECHANICAL'),(137,'Engineer – Trainee',NULL,0,'GEO_TECHNICAL'),(138,'Geotechnical Engineer - Trainee',NULL,0,'GEO_TECHNICAL'),(139,'Lab Assistant',NULL,0,'LABORATORY_MECHANICAL'),(140,'Structural Engineer',NULL,0,'SHM_A'),(141,'Manager HR',NULL,0,'HR_ADMINISTRATION'),(142,'Sales Coordiantor',NULL,0,'LABORATORY_MECHANICAL'),(143,'Trainee Engineer',NULL,0,'LABORATORY_MECHANICAL'),(144,'Instrumentation Engineer',NULL,0,'SHM_A'),(145,'Jr Engineer',NULL,0,'LABORATORY_MECHANICAL'),(146,'GM-Technical',NULL,0,'LABORATORY_MECHANICAL'),(147,'Trainee Engineer',NULL,0,'GEO_TECHNICAL'),(148,'Sr.Technician',NULL,0,'LABORATORY_MECHANICAL'),(149,'Trainee IT Engineer',NULL,0,'SOFTWARE'),(150,'Lab Technician',NULL,0,'LABORATORY_MECHANICAL'),(151,'Instrumentation Engineer Trainee',NULL,0,'SHM_A'),(152,'Sr Chemist',NULL,0,'LABORATORY_CHEMICAL'),(153,'Jr Full Stack Developer',NULL,0,'SOFTWARE'),(154,'Receptionist',NULL,0,'LABORATORY_MECHANICAL'),(155,'Manager Technical',NULL,0,'LABORATORY_MECHANICAL'),(156,'Head - SHM&AI',NULL,0,'SHM_A'),(157,'Engineer - Geo Technical',NULL,0,'GEO_TECHNICAL'),(158,'Head - R&D',NULL,0,'SHM_A'),(159,'Managing Director',NULL,0,'BUSSINESS_DEVELOPEMENT'),(160,'Senior Manager (Contracts & QS)',NULL,0,'DPR'),(161,'Traffic & Road Safety Engineer',NULL,0,'LAND_AQUASITION'),(162,'Quantity SURVEYor',NULL,0,'DPR'),(163,'Deputy General Manager - Bussiness Development',NULL,0,'BUSSINESS_DEVELOPEMENT'),(164,'Director (Technical)',NULL,0,'STRUCTURES'),(165,'Engineer',NULL,0,'STRUCTURES'),(166,'Director',NULL,0,'HIGHWAYS'),(167,'Manager (Finance & Accounts)',NULL,0,'FINANCE_ACCOUNTS'),(168,'Design Engineer -Highway',NULL,0,'HIGHWAYS'),(169,'Driver',NULL,0,'PAVEMENT_TRAFFIC'),(170,'Senior Engineer',NULL,0,'STRUCTURES'),(172,'CAD Engineer',NULL,0,'HIGHWAYS'),(173,'Senior CAD Engineer',NULL,0,'STRUCTURES'),(174,'Engineer',NULL,0,'PAVEMENT_TRAFFIC'),(175,'Bridge Design Engineer',NULL,0,'STRUCTURES'),(176,'Sweeper',NULL,0,'HR_ADMINISTRATION'),(177,'Senior CAD Engineer – Highways',NULL,0,'HIGHWAYS'),(178,'Senior CAD Engineer – Structures',NULL,0,'STRUCTURES'),(179,'Engineer',NULL,0,'HIGHWAYS'),(180,'Drone Pilot',NULL,0,'SURVEY'),(181,'SURVEYor',NULL,0,'SURVEY'),(182,'Draftman',NULL,0,'STRUCTURES'),(183,'Sr.Manager Land Aquasition &Social',NULL,0,'LAND_AQUASITION'),(184,'Sr.Engineer-CAD',NULL,0,'STRUCTURES'),(185,'Sr.Quantity Surveyor',NULL,0,'HIGHWAYS'),(186,'VP-structures',NULL,0,'STRUCTURES'),(187,'Jr.Engineer',NULL,0,'STRUCTURES'),(188,'Office boy',NULL,0,'HR_ADMINISTRATION'),(189,'Engineer',NULL,0,'BUSSINESS_DEVELOPEMENT'),(190,'Sr Design Engineer',NULL,0,'STRUCTURES'),(191,'Manager-Bussiness Development',NULL,0,'BUSSINESS_DEVELOPEMENT'),(192,'Assistant Manager',NULL,0,'DPR'),(193,'Design Engineer',NULL,0,'STRUCTURES'),(194,'Sr CAD Draftsman',NULL,0,'LAND_AQUASITION'),(195,'Draftman',NULL,0,'LAND_AQUASITION'),(196,'Sr GM',NULL,0,'DPR'),(197,'Sr VP - bussiness development',NULL,0,'BUSSINESS_DEVELOPEMENT'),(198,'Sr CAD Engineer',NULL,0,'STRUCTURES'),(199,'Draftsman',NULL,0,'LAND_AQUASITION'),(200,'Trainee Sureyour',NULL,0,'SURVEY'),(201,'Jr Sureyour',NULL,0,'SURVEY'),(202,'SURVEY',NULL,0,'SURVEY'),(203,'Sr.CAD Engineer',NULL,0,'STRUCTURES'),(204,'Draftsman Trainee',NULL,0,'HIGHWAYS'),(205,'Trainee Engineer',NULL,0,'PAVEMENT_TRAFFIC'),(206,'Manager Structures',NULL,0,'STRUCTURES'),(207,'Sr Engineer',NULL,0,'PAVEMENT_TRAFFIC'),(208,'Head - Transformation and Strategy',NULL,0,'HR_ADMINISTRATION'),(209,'Manager Admin& Procurment',NULL,0,'HR_ADMINISTRATION'),(210,'AGM',NULL,0,'HIGHWAYS');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgroup`
--

DROP TABLE IF EXISTS `subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `prefix` varchar(100) DEFAULT NULL,
  `additional_info` text,
  `group_id` varchar(100) NOT NULL,
  `units` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `subgroup_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `material_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgroup`
--

LOCK TABLES `subgroup` WRITE;
/*!40000 ALTER TABLE `subgroup` DISABLE KEYS */;
INSERT INTO `subgroup` VALUES (1,'Admixtures','ADMX','','GROUP-001','kgs'),(2,'Cement OPC','OPC','','GROUP-001','ltr'),(5,'Cement (OPC,PPC,PSC,SRPC)','','','GROUP-001','ltr'),(6,'Cement (OCP,PSC)','','','GROUP-001','ltr'),(7,'Cement (OPC,SRPC)','','','GROUP-001','ltr'),(8,'Cement (OPC,PPC,PSP,SRPC)','','','GROUP-001','ltr'),(9,'Cement (PSC)','','','GROUP-001','ltr'),(10,'cOARSE aGGREGATES','','','GROUP-001','ltr'),(11,'Fine Aggregates','','','GROUP-001','ltr'),(12,'Ground Granulated Blast Furnance Slag','','','GROUP-001','ltr'),(13,'Gypsum (Mineral and Chemical )','','','GROUP-001','ltr'),(14,'Gypsum Plaster','','','GROUP-001','ltr'),(15,'Hardened Mortar and Concrete','','','GROUP-001','ltr'),(16,'Hardened Concrete','','','GROUP-001','ltr'),(17,'Pozzolanic Material (Fly ash/ Silica Fume)','','','GROUP-001','ltr'),(18,'Pozzolanic Material (Fly ash)','','','GROUP-001','ltr'),(19,'Limestone','','','GROUP-001','ltr'),(21,'Coal','','','GROUP-002','ltr'),(22,'Construction Water','','','GROUP-003','ltr'),(23,'Drinking Water','','','GROUP-003','ltr'),(24,'Bitumen','','','GROUP-001','ltr'),(25,'Bitumen/Bituminous Emulsion','','','GROUP-001','ltr'),(26,'Brunt clay Building bricks','','','GROUP-001','ltr'),(27,'Brunt clay Fly ash Building Bricks','','','GROUP-001','ltr'),(28,'Ceramic Tiles','','','GROUP-001','ltr'),(29,'Concrete Paving Blocks','','','GROUP-001','ltr');
/*!40000 ALTER TABLE `subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(250) NOT NULL,
  `requirements` text,
  `price` int DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `discipline` varchar(20) DEFAULT NULL,
  `nabl_status` tinyint(1) DEFAULT NULL,
  `additional_info` text,
  `sub_group` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_group` (`sub_group`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`sub_group`) REFERENCES `subgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Ash Content','',4000,'IS 9103','CHEMICAL',1,'',1),(2,'Chloride ion content','',0,'','CHEMICAL',1,'',1),(3,'Dry material content','',5000,'','CHEMICAL',1,'',1),(4,'pH','',70100,'','CHEMICAL',1,'',1),(5,'Relative Density','',762,'','CHEMICAL',1,'',1),(6,'Alkalis as Na20','',0,'','CHEMICAL',1,'',2),(7,'Chlorides as cl','',5552,'','CHEMICAL',1,'',2),(8,'Calcium Oxide as CaO','',7518,'','CHEMICAL',1,'',5),(9,'Insoluable Residue','',7894,'','CHEMICAL',1,'',5),(10,'Loss on ignision','',781,'','CHEMICAL',1,'',5),(11,'Manganese Oxiude as MnO','',45678,'','CHEMICAL',1,'',5),(12,'Sulfuric Anhydride as SO3','',7453,'','CHEMICAL',0,'',5),(13,'Manganese Oxide as MnO','',34567,'','CHEMICAL',1,'',6),(14,'Alumina as AI203','',544551,'','CHEMICAL',1,'',7),(15,'Ferric Oxide as Fe203','',4752,'','CHEMICAL',1,'',7),(16,'Silica content as SiO2','',3456,'','CHEMICAL',0,'',8),(17,'Sulphide Sulphur','',4567,'','CHEMICAL',0,'',9),(18,'Alkali Aggregate Reactivity Reduction in alkalinity of 1.0 N NaOH RC','',3456,'','CHEMICAL',1,'',10),(19,'clorides as cl','',5678,'','CHEMICAL',1,'',10),(20,'Silica Dissolved SC','',4567,'','CHEMICAL',0,'',10),(21,'Sulphate content as SO3','',23456,'','CHEMICAL',0,'',10),(22,'Alkalinity Aggregate Reactivity Reduction in alkality of 1.0 N NaOH RC','',4567,'','CHEMICAL',1,'',11),(23,'Chlorides as cl','',34567,'','CHEMICAL',1,'',11),(24,'Silica Dissolved SC','',23456,'','CHEMICAL',0,'',11),(25,'Sulphate content as SO3','',3456,'','CHEMICAL',0,'',11),(26,'Alumina as Al2O3','',456,'','CHEMICAL',1,'',11),(27,'Sulphide Sulphur as S','',4567,'','CHEMICAL',0,'',12),(28,'Compressive Strength','',7853,'','PHYSICAL',1,'',5),(29,'Density','',34567,'','PHYSICAL',1,'',5),(30,'Fitness by Blaine Air Permiability method','',345678,'','PHYSICAL',1,'',5),(31,'initial setting time','',4567,'','PHYSICAL',1,'',5),(32,'setting time final','',56789,'','PHYSICAL',0,'',5),(33,'Soundness (by le chatelier method)','',4567,'','PHYSICAL',0,'',5),(34,'standard consistency ','',34567,'','PHYSICAL',0,'',5);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 15:26:27
