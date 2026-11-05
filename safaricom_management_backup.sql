-- MySQL dump 10.13  Distrib 26.7.0, for Win64 (x86_64)
--
-- Host: localhost    Database: safaricom_management
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'b7b02646-c8cd-11f1-8796-3ca82a862710:1-54';

--
-- Current Database: `safaricom_management`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `safaricom_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `safaricom_management`;

--
-- Table structure for table `cust_empl`
--

DROP TABLE IF EXISTS `cust_empl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_empl` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `PersonalNo` varchar(6) NOT NULL,
  `CustomerID` varchar(8) NOT NULL,
  `ServiceDate` date NOT NULL,
  `ServiceTime` time NOT NULL,
  `IssueDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `PersonalNo` (`PersonalNo`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `cust_empl_ibfk_1` FOREIGN KEY (`PersonalNo`) REFERENCES `employee` (`PersonalNo`),
  CONSTRAINT `cust_empl_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_empl`
--

LOCK TABLES `cust_empl` WRITE;
/*!40000 ALTER TABLE `cust_empl` DISABLE KEYS */;
INSERT INTO `cust_empl` VALUES (1,'330101','SC100001','2026-10-01','09:15:00','Data bundle activation'),(2,'330102','SC100002','2026-10-01','10:30:00','Network connectivity issue'),(3,'330103','SC100003','2026-10-02','11:00:00','SIM card replacement'),(4,'330104','SC100004','2026-10-02','12:45:00','Home internet installation'),(5,'330105','SC100005','2026-10-03','14:20:00','Voice bundle enquiry'),(6,'330101','SC100002','2026-10-04','09:40:00','Data usage enquiry'),(7,'330102','SC100003','2026-10-05','10:15:00','Mobile network complaint'),(8,'330103','SC100006','2026-10-06','13:30:00','SMS bundle activation'),(9,'330105','SC100001','2026-10-07','15:00:00','Subscription enquiry');
/*!40000 ALTER TABLE `cust_empl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_phone`
--

DROP TABLE IF EXISTS `cust_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_phone` (
  `CustomerID` varchar(8) NOT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  PRIMARY KEY (`CustomerID`,`PhoneNo`),
  CONSTRAINT `cust_phone_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_phone`
--

LOCK TABLES `cust_phone` WRITE;
/*!40000 ALTER TABLE `cust_phone` DISABLE KEYS */;
INSERT INTO `cust_phone` VALUES ('SC100001','0712000001'),('SC100002','0712000002'),('SC100003','0712000003'),('SC100004','0712000004'),('SC100005','0712000005'),('SC100006','0712000006');
/*!40000 ALTER TABLE `cust_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` varchar(8) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `OtherNames` varchar(30) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('SC100001','Kamau','Alice Wanjiku','2022-03-15'),('SC100002','Omondi','David Otieno','2022-07-20'),('SC100003','Njeri','Faith Wambui','2023-01-10'),('SC100004','Hassan','Amina Ali','2023-05-25'),('SC100005','Musyoki','James Kaloki','2024-02-12'),('SC100006','Kiptoo','Samuel Kibet','2024-09-08');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empl_phone`
--

DROP TABLE IF EXISTS `empl_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empl_phone` (
  `PersonalNo` varchar(6) NOT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  PRIMARY KEY (`PersonalNo`,`PhoneNo`),
  CONSTRAINT `empl_phone_ibfk_1` FOREIGN KEY (`PersonalNo`) REFERENCES `employee` (`PersonalNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empl_phone`
--

LOCK TABLES `empl_phone` WRITE;
/*!40000 ALTER TABLE `empl_phone` DISABLE KEYS */;
INSERT INTO `empl_phone` VALUES ('330101','0701000001'),('330102','0701000002'),('330103','0701000003'),('330104','0701000004'),('330105','0701000005');
/*!40000 ALTER TABLE `empl_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `PersonalNo` varchar(6) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `OtherNames` varchar(30) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `CentreCode` char(4) DEFAULT NULL,
  `JobGroup` char(1) DEFAULT NULL,
  PRIMARY KEY (`PersonalNo`),
  KEY `CentreCode` (`CentreCode`),
  KEY `JobGroup` (`JobGroup`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`CentreCode`) REFERENCES `service_centre` (`CentreCode`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`JobGroup`) REFERENCES `job_description` (`JobGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('330101','Wanjiru','Mary Anne','F','1990-04-12','0001','B'),('330102','Otieno','Brian Ochieng','M','1988-09-18','0001','C'),('330103','Achieng','Grace Atieno','F','1992-02-05','0002','D'),('330104','Mwangi','Peter Kamau','M','1985-11-30','0003','A'),('330105','Kiptoo','Samuel Kibet','M','1994-06-21','0002','C');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_description`
--

DROP TABLE IF EXISTS `job_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_description` (
  `JobGroup` char(1) NOT NULL,
  `JobTitle` varchar(30) NOT NULL,
  `Salary` int NOT NULL,
  PRIMARY KEY (`JobGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_description`
--

LOCK TABLES `job_description` WRITE;
/*!40000 ALTER TABLE `job_description` DISABLE KEYS */;
INSERT INTO `job_description` VALUES ('A','Regional Manager',220000),('B','Service Manager',150000),('C','Customer Advisor',85000),('D','Technical Support',70000);
/*!40000 ALTER TABLE `job_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_centre`
--

DROP TABLE IF EXISTS `service_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_centre` (
  `CentreCode` char(4) NOT NULL,
  `CentreName` varchar(40) NOT NULL,
  `Town` varchar(30) NOT NULL,
  `Address` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`CentreCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_centre`
--

LOCK TABLES `service_centre` WRITE;
/*!40000 ALTER TABLE `service_centre` DISABLE KEYS */;
INSERT INTO `service_centre` VALUES ('0001','Nairobi CBD Centre','Nairobi','Kenyatta Avenue'),('0002','Westlands Centre','Nairobi','Westlands Road'),('0003','Mombasa Centre','Mombasa','Nkrumah Road');
/*!40000 ALTER TABLE `service_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_plan`
--

DROP TABLE IF EXISTS `service_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_plan` (
  `PlanCode` varchar(6) NOT NULL,
  `PlanName` varchar(30) NOT NULL,
  `ServiceType` varchar(15) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PlanCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_plan`
--

LOCK TABLES `service_plan` WRITE;
/*!40000 ALTER TABLE `service_plan` DISABLE KEYS */;
INSERT INTO `service_plan` VALUES ('PL0001','Daily Data Bundle','Data',50.00),('PL0002','Weekly Data Bundle','Data',250.00),('PL0003','Monthly Voice Plan','Voice',500.00),('PL0004','SMS Bundle','SMS',100.00),('PL0005','Home Internet','Internet',2500.00);
/*!40000 ALTER TABLE `service_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `SubscriptionID` varchar(8) NOT NULL,
  `CustomerID` varchar(8) NOT NULL,
  `PlanCode` varchar(6) NOT NULL,
  `StartDate` date NOT NULL,
  `Status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`SubscriptionID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `PlanCode` (`PlanCode`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`PlanCode`) REFERENCES `service_plan` (`PlanCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES ('SU000001','SC100001','PL0001','2026-01-05','Active'),('SU000002','SC100001','PL0003','2026-02-10','Active'),('SU000003','SC100002','PL0002','2026-03-01','Active'),('SU000004','SC100002','PL0004','2026-03-15','Expired'),('SU000005','SC100003','PL0003','2026-04-02','Active'),('SU000006','SC100003','PL0001','2026-04-12','Active'),('SU000007','SC100004','PL0005','2026-05-01','Active'),('SU000008','SC100005','PL0002','2026-06-10','Active'),('SU000009','SC100006','PL0004','2026-07-05','Expired'),('SU000010','SC100006','PL0003','2026-08-20','Active');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-23  3:39:03
