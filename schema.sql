-- PureMILK dairy supply chain database: table definitions (structure only, no data)
-- MySQL 8.0 · Run this file first, then the queries in /queries

CREATE DATABASE IF NOT EXISTS pure_milk;
USE pure_milk;

DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory` (
  `Factory_id` varchar(20) NOT NULL,
  `Factory_Name` varchar(35) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Capacity` int DEFAULT NULL,
  `Establishment_date` date DEFAULT NULL,
  PRIMARY KEY (`Factory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `chilling_center`;
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

DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer` (
  `Farmer_id` varchar(20) NOT NULL,
  `Farmer_Name` varchar(40) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Payment_details` varchar(10) DEFAULT NULL,
  `Contact_details` varchar(11) DEFAULT NULL,
  `Register_date` date DEFAULT NULL,
  `Center_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Farmer_id`),
  KEY `Center_id` (`Center_id`),
  CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`Center_id`) REFERENCES `chilling_center` (`Center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `milk_transaction`;
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

DROP TABLE IF EXISTS `dealer`;
CREATE TABLE `dealer` (
  `Dealer_id` varchar(20) NOT NULL,
  `Dealer_Name` varchar(40) NOT NULL,
  `Location` varchar(40) NOT NULL,
  `Credit_Limit` decimal(10,2) DEFAULT NULL,
  `Contact_info` varchar(11) DEFAULT NULL,
  `Dealer_Status` tinyint(1) DEFAULT NULL,
  `Freeze_Capacity` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Dealer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `Product_id` varchar(25) NOT NULL,
  `Product_Name` varchar(30) DEFAULT NULL,
  `Category` varchar(40) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Expire_date` date NOT NULL,
  PRIMARY KEY (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order_table`;
CREATE TABLE `order_table` (
  `order_id` varchar(25) NOT NULL,
  `Order_date` date DEFAULT NULL,
  `Quantity` varchar(20) DEFAULT NULL,
  `Payment_Method` varchar(10) DEFAULT NULL,
  `Total_Price` decimal(10,2) DEFAULT NULL,
  `Dealer_id` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `Dealer_id` (`Dealer_id`),
  CONSTRAINT `order_table_ibfk_1` FOREIGN KEY (`Dealer_id`) REFERENCES `dealer` (`Dealer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` varchar(25) NOT NULL,
  `Product_id` varchar(25) NOT NULL,
  `Quantity` int DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`Product_id`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
