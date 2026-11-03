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
-- Table structure for table `milk_transaction`
--

DROP TABLE IF EXISTS `milk_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milk_transaction` (
  `Milk_Transaction_id` varchar(20) NOT NULL,
  `Rate_Per_Unit` decimal(10,2) DEFAULT NULL,
  `Payment_Status` tinyint(1) NOT NULL,
  `Temp_Collection` varchar(5) DEFAULT NULL,
  `Collection_time` varchar(8) DEFAULT NULL,
  `Fat_Content` varchar(15) DEFAULT NULL,
  `Center_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Milk_Transaction_id`),
  KEY `Center_id` (`Center_id`),
  CONSTRAINT `milk_transaction_ibfk_1` FOREIGN KEY (`Center_id`) REFERENCES `chilling_center` (`Center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milk_transaction`
--

LOCK TABLES `milk_transaction` WRITE;
/*!40000 ALTER TABLE `milk_transaction` DISABLE KEYS */;
INSERT INTO `milk_transaction` VALUES ('MT001',150.00,1,'4 C','06:00 AM','3.5','C001'),('MT002',145.00,0,'3.8 C','06:15 AM','3.8','C002'),('MT003',148.00,1,'4.2 C','07:00 AM','4.0','C003'),('MT004',152.00,1,'4 C','05.45 AM','3.6','C004');
/*!40000 ALTER TABLE `milk_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-03  9:09:54
