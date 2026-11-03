-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pure_milk
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chilling_center`
--

DROP TABLE IF EXISTS `chilling_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chilling_center` (
  `Center_id` varchar(15) NOT NULL,
  `Location` varchar(30) NOT NULL,
  `Capacity` int DEFAULT NULL,
  `Storage_temperature` varchar(5) DEFAULT NULL,
  `Operation_Starts` varchar(8) DEFAULT NULL,
  `Factory_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Center_id`),
  KEY `Factory_id` (`Factory_id`),
  CONSTRAINT `chilling_center_ibfk_1` FOREIGN KEY (`Factory_id`) REFERENCES `factory` (`Factory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chilling_center`
--

LOCK TABLES `chilling_center` WRITE;
/*!40000 ALTER TABLE `chilling_center` DISABLE KEYS */;
INSERT INTO `chilling_center` VALUES ('C001','Gampaha',100000,'4','06:00 AM','F0001'),('C002','Badulla',75000,'4','06:30 AM','F0002'),('C003','Kandy',85000,'4','07:00 AM','F0003'),('C004','Jaffna',95000,'4','05:30PM','F0004');
/*!40000 ALTER TABLE `chilling_center` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-03  9:09:53
