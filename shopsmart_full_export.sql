-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: mysql-litla8-shopsmart.k.aivencloud.com    Database: shopsmart
-- ------------------------------------------------------
-- Server version	8.0.45

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'fd07f0e7-4afb-11f1-ba29-ae4d7de0e62e:1-45';

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `signup_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Amit Sharma','amit.sharma@gmail.com','Delhi','2025-01-10'),(2,'Priya Verma','priya.verma@gmail.com','Mumbai','2025-01-18'),(3,'Rahul Mehta','rahul.mehta@gmail.com','Bengaluru','2025-02-02'),(4,'Neha Singh','neha.singh@gmail.com','Jaipur','2025-02-14'),(5,'Arjun Kapoor','arjun.kapoor@gmail.com','Pune','2025-03-01'),(6,'Sneha Iyer','sneha.iyer@gmail.com','Chennai','2025-03-11'),(7,'Vikram Gupta','vikram.gupta@gmail.com','Delhi','2025-03-25'),(8,'Pooja Nair','pooja.nair@gmail.com','Kochi','2025-04-06'),(9,'Karan Malhotra','karan.malhotra@gmail.com','Chandigarh','2025-04-16'),(10,'Ananya Das','ananya.das@gmail.com','Kolkata','2025-05-01'),(11,'Rohan Batra','rohan.batra@gmail.com','Noida','2025-05-15'),(12,'Meera Joshi','meera.joshi@gmail.com','Ahmedabad','2025-06-02'),(13,'Suresh Patel','suresh.patel@gmail.com','Surat','2025-06-21'),(14,'Kavya Reddy','kavya.reddy@gmail.com','Hyderabad','2025-07-04'),(15,'Nitin Arora','nitin.arora@gmail.com','Lucknow','2025-07-19'),(16,'Ishita Roy','ishita.roy@gmail.com','Bhopal','2025-08-03'),(17,'Manish Yadav','manish.yadav@gmail.com','Patna','2025-08-17');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1001,1,1,55000.00),(2,1001,3,1,2500.00),(3,1002,6,2,3200.00),(4,1002,7,1,1800.00),(5,1003,2,1,30000.00),(6,1003,13,1,8500.00),(7,1004,5,2,1500.00),(8,1004,12,3,450.00),(9,1005,10,1,12500.00),(10,1005,11,1,2200.00),(11,1006,8,1,4200.00),(12,1006,9,2,600.00),(13,1007,4,1,7000.00),(14,1007,5,1,1500.00),(15,1008,15,3,900.00),(16,1008,7,1,1800.00),(17,1009,2,1,30000.00),(18,1009,10,1,12500.00),(19,1010,12,5,450.00),(20,1010,9,4,600.00),(21,1011,3,2,2500.00),(22,1011,11,1,2200.00),(23,1012,14,1,3800.00),(24,1012,8,1,4200.00),(25,1013,6,1,3200.00),(26,1013,15,2,900.00),(27,1014,13,1,8500.00),(28,1014,3,1,2500.00),(29,1015,2,1,30000.00),(30,1015,11,1,2200.00),(31,1015,9,2,600.00),(32,1016,4,1,7000.00),(33,1016,5,2,1500.00),(34,1017,1,1,55000.00),(35,1017,10,1,12500.00),(36,1018,8,1,4200.00),(37,1018,14,1,3800.00),(38,1018,9,1,600.00),(39,1019,7,2,1800.00),(40,1019,15,2,900.00),(41,1020,2,1,30000.00),(42,1020,13,1,8500.00),(43,1020,3,1,2500.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1001,1,'2025-10-12','Delivered',57500.00),(1002,2,'2025-10-20','Delivered',8200.00),(1003,3,'2025-11-03','Delivered',38500.00),(1004,1,'2025-11-15','Delivered',4350.00),(1005,5,'2025-12-02','Delivered',14700.00),(1006,6,'2025-12-08','Delivered',5400.00),(1007,7,'2025-12-18','Delivered',8500.00),(1008,8,'2025-12-29','Delivered',4500.00),(1009,9,'2026-01-05','Delivered',42500.00),(1010,10,'2026-01-11','Delivered',4650.00),(1011,11,'2026-01-19','Delivered',7200.00),(1012,12,'2026-01-28','Delivered',8000.00),(1013,13,'2026-02-03','Delivered',5000.00),(1014,14,'2026-02-10','Shipped',11000.00),(1015,1,'2026-02-14','Delivered',33400.00),(1016,2,'2026-02-22','Delivered',10000.00),(1017,3,'2026-03-01','Processing',67500.00),(1018,5,'2026-03-05','Delivered',8600.00),(1019,7,'2026-03-10','Delivered',5400.00),(1020,10,'2026-03-14','Delivered',41000.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_qty` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop','Electronics',55000.00,25),(2,'Smartphone','Electronics',30000.00,40),(3,'Headphones','Accessories',2500.00,100),(4,'Office Chair','Furniture',7000.00,20),(5,'Desk Lamp','Home Decor',1500.00,60),(6,'Running Shoes','Fashion',3200.00,50),(7,'Backpack','Fashion',1800.00,70),(8,'Coffee Maker','Appliances',4200.00,30),(9,'Water Bottle','Accessories',600.00,120),(10,'Monitor','Electronics',12500.00,35),(11,'Keyboard','Electronics',2200.00,80),(12,'Notebook Set','Stationery',450.00,200),(13,'Smartwatch','Electronics',8500.00,45),(14,'Mixer Grinder','Appliances',3800.00,28),(15,'T-Shirt','Fashion',900.00,150);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `return_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`return_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,1004,5,'2025-11-20','Damaged item'),(2,1004,12,'2025-11-22','Not as described'),(3,1006,8,'2025-12-15','Defective'),(4,1007,5,'2025-12-24','Quality issue'),(5,1008,15,'2026-01-03','Size issue'),(6,1009,10,'2026-01-10','Screen issue'),(7,1011,3,'2026-01-25','Audio issue'),(8,1012,14,'2026-02-02','Motor issue'),(9,1013,6,'2026-02-07','Wrong size'),(10,1014,13,'2026-02-16','Battery issue'),(11,1016,5,'2026-02-28','Damaged on delivery'),(12,1018,14,'2026-03-09','Performance issue'),(13,1019,15,'2026-03-15','Wrong color'),(14,1020,13,'2026-03-18','Band defect'),(15,1002,6,'2025-10-28','Size issue');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
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

-- Dump completed on 2026-05-08 22:43:53
