-- MySQL dump 10.15  Distrib 10.0.17-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: ganges
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `user_id` varchar(255) NOT NULL,
  `summary` text,
  `register_date` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `kategory_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `delivery_method_id` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  PRIMARY KEY (`delivery_method_id`,`shop_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`delivery_method_id`) REFERENCES `deliverymethod` (`delivery_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverydestination`
--

DROP TABLE IF EXISTS `deliverydestination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliverydestination` (
  `order_id` varchar(255) NOT NULL,
  `postnumber` varchar(255) DEFAULT NULL,
  `prefectures` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `address_building` varchar(255) DEFAULT NULL,
  `tell` varchar(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `deliverydestination_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `itemorder` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverydestination`
--

LOCK TABLES `deliverydestination` WRITE;
/*!40000 ALTER TABLE `deliverydestination` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverydestination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverymethod`
--

DROP TABLE IF EXISTS `deliverymethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliverymethod` (
  `delivery_method_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`delivery_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverymethod`
--

LOCK TABLES `deliverymethod` WRITE;
/*!40000 ALTER TABLE `deliverymethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverymethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry` (
  `QA_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `inquiry_data` text,
  `inquiry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`QA_id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inquiry_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inquiry_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` varchar(255) NOT NULL,
  `kategory_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `info` text,
  `register_date` datetime DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `is_alive` int(11) DEFAULT NULL,
  `exterior_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id` (`item_id`),
  KEY `kategory_id` (`kategory_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`kategory_id`) REFERENCES `category` (`kategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemimage`
--

DROP TABLE IF EXISTS `itemimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemimage` (
  `item_image_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_image_id`),
  UNIQUE KEY `item_id` (`item_id`),
  CONSTRAINT `itemimage_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemimage`
--

LOCK TABLES `itemimage` WRITE;
/*!40000 ALTER TABLE `itemimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemorder`
--

DROP TABLE IF EXISTS `itemorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemorder` (
  `order_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `delivery_method` varchar(255) DEFAULT NULL,
  `delivery_price` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_user_id` varchar(255) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `shop_id` (`shop_id`),
  KEY `order_user_id` (`order_user_id`),
  CONSTRAINT `itemorder_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `itemorder_ibfk_2` FOREIGN KEY (`order_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemorder`
--

LOCK TABLES `itemorder` WRITE;
/*!40000 ALTER TABLE `itemorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox`
--

DROP TABLE IF EXISTS `mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailbox` (
  `mail_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `from_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `send_date` datetime DEFAULT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `from_id` (`from_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mailbox_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mailbox_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox`
--

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `map_id` varchar(255) NOT NULL,
  `point_x` int(11) DEFAULT NULL,
  `point_y` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `drawing_data` text,
  `object_data` text,
  `collision_data` text,
  `shop_puttable_data` text,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES ('16597452a0904dafaa0f3869053671f6',2,3,'s','x','n','m','n'),('419a073ea01041448df5cb9c99ffa762',2,3,'public/images/map1.png','([\r\n    [39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39],\r\n    [39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39],\r\n    [39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39],\r\n    [39,39,39,39,6,56,56,56,56,7,39,39,39,39,39,39,39,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,55,56,56,56,56,56,56,7,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,4,23,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,6,57,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,107,107,107,107,107,107,38,39,39,39],\r\n    [39,39,39,39,40,107,107,107,107,107,21,22,22,22,22,22,5,39,39,39],\r\n    [39,39,39,39,4,22,22,22,22,22,5,39,39,39,39,39,39,39,39,39],\r\n    [39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39,39]\r\n]','[\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,12,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,12,12,-1,-1,-1,-1,336,337,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,353,354,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,12,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,12,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],\r\n    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]\r\n]','[\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\r\n]','[\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,1,1,0,0,1,1,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\r\n    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\r\n]'),('b74ed65b2f424accb7fa33e3e8aae605',9,9,'m','k','m','[[0]]','m');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `order_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `itemorder` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postage`
--

DROP TABLE IF EXISTS `postage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postage` (
  `company` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `from_prefectures` varchar(255) NOT NULL,
  `to_prefectures` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`company`,`method`,`size`,`from_prefectures`,`to_prefectures`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postage`
--

LOCK TABLES `postage` WRITE;
/*!40000 ALTER TABLE `postage` DISABLE KEYS */;
/*!40000 ALTER TABLE `postage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `shop_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `made_date` datetime DEFAULT NULL,
  `exterior_image_path` varchar(255) DEFAULT NULL,
  `map_id` varchar(255) NOT NULL,
  `point_x` int(11) DEFAULT NULL,
  `point_y` int(11) DEFAULT NULL,
  `is_alive` int(11) DEFAULT NULL,
  `interior_image_path` varchar(255) DEFAULT NULL,
  `interior_draw_data` text,
  `interior_object_data` text,
  `interior_collision_data` text,
  PRIMARY KEY (`shop_id`),
  KEY `map_id` (`map_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_item`
--

DROP TABLE IF EXISTS `shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_item` (
  `shop_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  PRIMARY KEY (`shop_id`,`item_id`),
  UNIQUE KEY `item_id` (`item_id`),
  CONSTRAINT `shop_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shop_item_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_item`
--

LOCK TABLES `shop_item` WRITE;
/*!40000 ALTER TABLE `shop_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `postnumber` varchar(7) DEFAULT NULL,
  `prefectures` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `address_building` varchar(255) DEFAULT NULL,
  `tell` varchar(15) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `is_alive` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useravatar`
--

DROP TABLE IF EXISTS `useravatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useravatar` (
  `user_avatar_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_avatar_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `useravatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useravatar`
--

LOCK TABLES `useravatar` WRITE;
/*!40000 ALTER TABLE `useravatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `useravatar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-09 10:49:41
