-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzadb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `add_id` int NOT NULL,
  `delivery_address1` varchar(200) NOT NULL,
  `delivery_address2` varchar(200) DEFAULT NULL,
  `delivery_city` varchar(50) NOT NULL,
  `delivery_zipcode` varchar(20) NOT NULL,
  PRIMARY KEY (`add_id`),
  CONSTRAINT `fk_address_add_id` FOREIGN KEY (`add_id`) REFERENCES `orders` (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'72 Chessam Avenue','','London','SW17'),(2,'04 Farley Road','','London','N87QB'),(3,'55 Prince Street','','London','F76J');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cust_id` int NOT NULL,
  `cust_firstname` varchar(50) NOT NULL,
  `cust_lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`cust_id`),
  CONSTRAINT `fk_customers_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `orders` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Mick ','Jank'),(2,'John','Smith'),(3,'Katie','Wells');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ing_id` varchar(10) NOT NULL,
  `ing_name` varchar(200) NOT NULL,
  `ing_weight` int NOT NULL,
  `ing_meas` varchar(20) NOT NULL,
  `ing_price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ing_id`),
  KEY `idx_ing_id` (`ing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES ('ING001','Pizza dough ball',2000,'grams',4.22),('ING002','Tomato sauce',4500,'grams',3.89),('ING003','Mazzarella cheese',2500,'grams',14.45),('ING004','Dried oregano',500,'grams',5.99),('ING005','Salami',3500,'grams',25.11),('ING006','Parmesan Cheese',2500,'grams',18.75),('ING007','Pepperoni',2500,'grams',20.81),('ING008','Garlic bread',500,'grams',8.50),('ING009','Bread sticks',500,'grams',7.50),('ING010','Vanilla ice cream',4500,'Millilitres',15.45),('ING011','Banoffee pie',1200,'grams',5.45);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inv_id` int NOT NULL,
  `item_id` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `fk_inventory_item_id` (`item_id`),
  CONSTRAINT `fk_inventory_item_id` FOREIGN KEY (`item_id`) REFERENCES `recipe` (`ing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'ING001',200),(2,'ING002',100),(3,'ING003',200),(4,'ING004',100),(5,'ING005',200),(6,'ING006',100),(7,'ING007',200),(8,'ING008',100),(9,'ING009',200),(10,'ING010',100),(11,'ING011',200);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` varchar(10) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_cat` varchar(100) NOT NULL,
  `item_size` varchar(10) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `idx_sku` (`sku`),
  CONSTRAINT `fk_item_item_id` FOREIGN KEY (`item_id`) REFERENCES `orders` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('it001','PIZZ-MARG-R','Margherita','Pizza','Regular',12.00),('it002','PIZZ-MARG-L','Margherita','Pizza','Large',14.00),('it003','PIZZ-DIAV-R','Diovala','Pizza','Regular',16.00),('it004','PIZZ-DIAV-L','Diovala','Pizza','Large',19.00),('it005','PIZZ-PARM-R','Parmigiana','Pizza','Regular',15.00),('it006','PIZZ-PARM-L','Parmigiana','Pizza','Large',18.00),('it007','PIZZ-PEPP-R','Pepperoni','Pizza','Regular',15.00),('it008','PIZZ-PEPP-L','Pepperoni\r\n','Pizza','Large',17.00),('it009','SIDE-GARL-R','Garlic Bread','Side','Regular',6.00),('it010','SIDE-BREA-R','Breadsticks','Side','Regular',5.00),('it011','DESS-ICE-VANI','Vanilla Ice Cream','Dessert','Regular',6.00),('it012','DESS-BANO-PIE','Banoffee Pie','Dessert','Regular',7.00),('it013','BEVE-COCA-COLA','Coca Cola','Beverage','33cl',3.00),('it014','BEVE-COCA-COLA','Coca Cola','Beverage','1.5l',6.00);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `row_id` int NOT NULL,
  `order_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  `cust_id` int NOT NULL,
  `add_id` int NOT NULL,
  `delivery` tinyint(1) NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_cust_id` (`cust_id`),
  KEY `idx_add_id` (`add_id`),
  KEY `date` (`date`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`date`) REFERENCES `rota` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'1','2024-02-14','it001',1,1,1,1),(2,'1','2024-02-14','it004',1,1,1,1),(3,'1','2024-02-14','it014',2,1,1,1),(4,'2','2024-02-16','it007',1,2,2,0),(5,'2','2024-02-16','it009',1,2,2,0),(6,'3','2024-02-17','it006',1,3,3,1),(7,'3','2024-02-17','it010',1,3,3,1),(8,'3','2024-02-17','it011',2,3,3,1),(9,'3','2024-02-17','it013',1,3,3,1),(10,'4','2024-02-17','it002',2,4,4,0),(11,'4','2024-02-17','it003',2,4,4,0),(12,'5','2024-02-17','it005',1,2,2,1),(13,'5','2024-02-17','it008',1,2,2,1),(14,'6','2024-02-17','it012',2,5,5,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `row_id` int NOT NULL,
  `recipe_id` varchar(20) NOT NULL,
  `ing_id` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_ing_id2` (`ing_id`),
  KEY `fk_recipe_recipe_id` (`recipe_id`),
  CONSTRAINT `fk_recipe_ing_id` FOREIGN KEY (`ing_id`) REFERENCES `ingredient` (`ing_id`),
  CONSTRAINT `fk_recipe_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `item` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'PIZZ-MARG-R','ING001',250),(2,'PIZZ-MARG-R','ING002',80),(3,'PIZZ-MARG-R','ING003',170),(4,'PIZZ-MARG-R','ING004',5),(5,'PIZZ-MARG-L','ING001',300),(6,'PIZZ-MARG-L','ING002',100),(7,'PIZZ-MARG-L','ING003',200),(8,'PIZZ-MARG-L','ING004',8),(9,'PIZZ-DIAV-R','ING001',250),(10,'PIZZ-DIAV-R','ING002',80),(11,'PIZZ-DIAV-R','ING003',170),(12,'PIZZ-DIAV-R','ING005',50),(13,'PIZZ-DIAV-L','ING001',300),(14,'PIZZ-DIAV-L','ING002',100),(15,'PIZZ-DIAV-L','ING003',200),(16,'PIZZ-DIAV-L','ING005',70),(17,'PIZZ-PARM-R','ING001',250),(18,'PIZZ-PARM-R','ING002',80),(19,'PIZZ-PARM-R','ING003',170),(20,'PIZZ-PARM-R','ING006',120),(21,'PIZZ-PARM-L','ING001',300),(22,'PIZZ-PARM-L','ING002',100),(23,'PIZZ-PARM-L','ING003',200),(24,'PIZZ-PARM-L','ING006',150),(25,'PIZZ-PEPP-R','ING001',50),(26,'PIZZ-PEPP-R','ING002',80),(27,'PIZZ-PEPP-R','ING003',120),(28,'PIZZ-PEPP-R','ING007',200),(29,'PIZZ-PEPP-L','ING001',70),(30,'PIZZ-PEPP-L','ING002',100),(31,'PIZZ-PEPP-L','ING003',220),(32,'PIZZ-PEPP-L','ING007',120),(33,'SIDE-GARL-R','ING008',20),(34,'SIDE-BREA-R','ING009',15),(35,'DESS-ICE-VANI','ING010',40),(36,'DESS-BANO-PIE','ING011',30);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rota`
--

DROP TABLE IF EXISTS `rota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rota` (
  `row_id` int NOT NULL,
  `rota_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `shift_id` varchar(20) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  PRIMARY KEY (`row_id`),
  KEY `idx_staff_id` (`staff_id`),
  KEY `fk_rota_date` (`date`),
  KEY `fk_rota_shift_id` (`shift_id`),
  KEY `rota_staff_id_IDX` (`staff_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rota`
--

LOCK TABLES `rota` WRITE;
/*!40000 ALTER TABLE `rota` DISABLE KEYS */;
INSERT INTO `rota` VALUES (1,'rot001','2024-02-14','sh0001','st0001'),(2,'rot001','2024-02-14','sh0001','st0002'),(3,'rot001','2024-02-14','sh0001','st0007'),(4,'rot001','2024-02-14','sh0001','st0008'),(5,'rot001','2024-02-14','sh0002','st0003'),(6,'rot001','2024-02-14','sh0002','st0004'),(7,'rot001','2024-02-14','sh0002','st0005'),(8,'rot001','2024-02-14','sh0002','st0006'),(9,'rot002','2024-02-15','sh0003','st0001'),(10,'rot002','2024-02-15','sh0003','st0002'),(11,'rot002','2024-02-15','sh0003','st0007'),(12,'rot002','2024-02-15','sh0003','st0008'),(13,'rot002','2024-02-15','sh0004','st0003'),(14,'rot002','2024-02-15','sh0004','st0004'),(15,'rot002','2024-02-15','sh0004','st0005'),(16,'rot002','2024-02-15','sh0004','st0006'),(17,'rot003','2024-02-16','sh0005','st0001'),(18,'rot003','2024-02-16','sh0005','st0002'),(19,'rot003','2024-02-16','sh0005','st0007'),(20,'rot003','2024-02-16','sh0005','st0008'),(21,'rot003','2024-02-16','sh0006','st0003'),(22,'rot003','2024-02-16','sh0006','st0002'),(23,'rot003','2024-02-16','sh0006','st0005'),(24,'rot003','2024-02-16','sh0006','st0006'),(25,'rot004','2024-02-17','sh0007','st0001'),(26,'rot004','2024-02-17','sh0007','st0002'),(27,'rot004','2024-02-17','sh0007','st0007'),(28,'rot004','2024-02-17','sh0007','st0008'),(29,'rot004','2024-02-17','sh0008','st0003'),(30,'rot004','2024-02-17','sh0008','st0004'),(31,'rot004','2024-02-17','sh0008','st0007'),(32,'rot005','2024-02-18','sh0008','st0008'),(33,'rot005','2024-02-18','sh0009','st0001'),(34,'rot005','2024-02-18','sh0009','st0002'),(35,'rot005','2024-02-18','sh0009','st0007'),(36,'rot005','2024-02-18','sh0009','st0008'),(37,'rot005','2024-02-18','sh0010','st0003'),(38,'rot005','2024-02-18','sh0010','st0004'),(39,'rot005','2024-02-18','sh0010','st0005'),(40,'rot005','2024-02-18','sh0010','st0006'),(41,'rot006','2024-02-19','sh0011','st0001'),(42,'rot006','2024-02-19','sh0011','st0002'),(43,'rot006','2024-02-19','sh0011','st0007'),(44,'rot006','2024-02-19','sh0011','st0008'),(45,'rot006','2024-02-19','sh0012','st0001'),(46,'rot006','2024-02-19','sh0012','st0002'),(47,'rot006','2024-02-19','sh0012','st0005'),(48,'rot006','2024-02-19','sh0012','st0006'),(49,'rot007','2024-02-20','sh0013','st0001'),(50,'rot007','2024-02-20','sh0013','st0002'),(51,'rot007','2024-02-20','sh0013','st0007'),(52,'rot007','2024-02-20','sh0013','st0008'),(53,'rot007','2024-02-20','sh0014','st0003'),(54,'rot007','2024-02-20','sh0014','st0004'),(55,'rot007','2024-02-20','sh0014','st0005'),(56,'rot007','2024-02-20','sh0014','st0006');
/*!40000 ALTER TABLE `rota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `shift_id` varchar(20) NOT NULL,
  `day_of_week` varchar(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`shift_id`),
  KEY `idx_shift_id` (`shift_id`),
  CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`shift_id`) REFERENCES `rota` (`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES ('sh0001','Monday','10:30:00','14:00:00'),('sh0002','Monday','18:30:00','23:00:00'),('sh0003','Tuesday','10:30:00','14:00:00'),('sh0004','Tuesday','18:30:00','23:00:00'),('sh0005','Wednesday','10:30:00','14:00:00'),('sh0006','Wednesday','18:30:00','23:00:00'),('sh0007','Thursday','10:30:00','14:00:00'),('sh0008','Thursday','18:30:00','23:00:00'),('sh0009','Friday','10:30:00','14:00:00'),('sh0010','Friday','18:30:00','23:00:00'),('sh0011','Saturday','10:30:00','14:00:00'),('sh0012','Saturday','18:30:00','23:00:00'),('sh0013','Sunday','10:30:00','14:00:00'),('sh0014','Sunday','18:30:00','23:00:00');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hourly_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `fk_staff_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `rota` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('st0001','Mindy','Sloan','Chef',17.25),('st0002','Luqman','Cantu','Head Chef',21.25),('st0003','Seren','Lindsey','Chef',17.25),('st0004','Arran','Hodgson','Head Chef',21.25),('st0005','Talha','Portillo','Delivery driver',14.50),('st0006','Sana','Black','Delivery driver',14.50),('st0007','Zachery','Robins','Delivery driver',14.50),('st0008','Faraz','Peck','Delivery driver',14.50);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pizzadb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 15:07:33
