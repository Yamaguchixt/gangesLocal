-- MySQL dump 10.15  Distrib 10.0.17-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: gangestest
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
-- Table structure for table `black_list_table`
--

DROP TABLE IF EXISTS `black_list_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `black_list_table` (
  `user_id` varchar(255) NOT NULL,
  `data` text,
  `date` datetime NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `black_list_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `black_list_table`
--

LOCK TABLES `black_list_table` WRITE;
/*!40000 ALTER TABLE `black_list_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `black_list_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `kategory_id` varchar(255) NOT NULL,
  `vategory_name` varchar(255) DEFAULT NULL,
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
-- Table structure for table `delivery_destination`
--

DROP TABLE IF EXISTS `delivery_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_destination` (
  `order_id` varchar(255) NOT NULL,
  `derivery_yubinbango` varchar(255) DEFAULT NULL,
  `derivery_todohuken` varchar(255) DEFAULT NULL,
  `derivery_sikutyoson` varchar(255) DEFAULT NULL,
  `derivery_bantitatemono` varchar(255) DEFAULT NULL,
  `derivery_tell` varchar(11) DEFAULT NULL,
  `derivery_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `delivery_destination_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `goods_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_destination`
--

LOCK TABLES `delivery_destination` WRITE;
/*!40000 ALTER TABLE `delivery_destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gooda_imagedata`
--

DROP TABLE IF EXISTS `gooda_imagedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gooda_imagedata` (
  `goods_image_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_image_date` datetime DEFAULT NULL,
  `image_pass` varchar(255) DEFAULT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  `image_order` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_image_id`),
  UNIQUE KEY `goods_id` (`goods_id`),
  CONSTRAINT `gooda_imagedata_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gooda_imagedata`
--

LOCK TABLES `gooda_imagedata` WRITE;
/*!40000 ALTER TABLE `gooda_imagedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `gooda_imagedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` varchar(255) NOT NULL,
  `kategory_id` varchar(255) NOT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` int(11) DEFAULT NULL,
  `goods_info` text,
  `goods_Registrationdate` datetime DEFAULT NULL,
  `goods_stock` int(11) DEFAULT NULL,
  `goods_live_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_id` (`goods_id`),
  KEY `kategory_id` (`kategory_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`kategory_id`) REFERENCES `category` (`kategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_order`
--

DROP TABLE IF EXISTS `goods_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_order` (
  `order_id` varchar(255) NOT NULL,
  `payment_name` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `bayuser_id` varchar(255) NOT NULL,
  `purehuri_shop_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `purehuri_shop_id` (`purehuri_shop_id`),
  KEY `bayuser_id` (`bayuser_id`),
  CONSTRAINT `goods_order_ibfk_1` FOREIGN KEY (`purehuri_shop_id`) REFERENCES `purehuri_shop` (`purehuri_shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `goods_order_ibfk_2` FOREIGN KEY (`bayuser_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_order`
--

LOCK TABLES `goods_order` WRITE;
/*!40000 ALTER TABLE `goods_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry` (
  `inquiry_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `inquiry_data` text,
  `inquiry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`inquiry_id`),
  UNIQUE KEY `goods_id` (`goods_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inquiry_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
-- Table structure for table `item_image`
--

DROP TABLE IF EXISTS `item_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_image` (
  `item_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `item_image_pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `goods_id` (`goods_id`),
  CONSTRAINT `item_image_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_image`
--

LOCK TABLES `item_image` WRITE;
/*!40000 ALTER TABLE `item_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_box`
--

DROP TABLE IF EXISTS `mail_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_box` (
  `mail_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `from_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mail_body` text,
  `mail_date` datetime NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `from_id` (`from_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mail_box_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mail_box_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_box`
--

LOCK TABLES `mail_box` WRITE;
/*!40000 ALTER TABLE `mail_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `map_id` varchar(255) NOT NULL,
  `map_X` int(11) DEFAULT NULL,
  `map_Y` int(11) DEFAULT NULL,
  `map_image_pass` varchar(255) DEFAULT NULL,
  `drawing_pass` varchar(255) DEFAULT NULL,
  `object_pass` varchar(255) DEFAULT NULL,
  `collision` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `order_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `goods_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`goods_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `goods_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purehuri_shop`
--

DROP TABLE IF EXISTS `purehuri_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purehuri_shop` (
  `purehuri_shop_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `shop_make_date` datetime DEFAULT NULL,
  `shop_image` varchar(255) DEFAULT NULL,
  `map_id` varchar(255) NOT NULL,
  `mapp_shop_X` int(11) DEFAULT NULL,
  `map_shop_Y` int(11) DEFAULT NULL,
  `shop_live_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`purehuri_shop_id`),
  KEY `map_id` (`map_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `purehuri_shop_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purehuri_shop_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purehuri_shop`
--

LOCK TABLES `purehuri_shop` WRITE;
/*!40000 ALTER TABLE `purehuri_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `purehuri_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method_info`
--

DROP TABLE IF EXISTS `shipping_method_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method_info` (
  `shipping_method_id` varchar(255) NOT NULL,
  `shipping_method_name` varchar(255) NOT NULL,
  PRIMARY KEY (`shipping_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method_info`
--

LOCK TABLES `shipping_method_info` WRITE;
/*!40000 ALTER TABLE `shipping_method_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_method_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_goods`
--

DROP TABLE IF EXISTS `shop_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_goods` (
  `purehuri_shop_id` varchar(255) NOT NULL,
  `goods_id` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`purehuri_shop_id`,`goods_id`),
  UNIQUE KEY `goods_id` (`goods_id`),
  CONSTRAINT `shop_goods_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shop_goods_ibfk_2` FOREIGN KEY (`purehuri_shop_id`) REFERENCES `purehuri_shop` (`purehuri_shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_goods`
--

LOCK TABLES `shop_goods` WRITE;
/*!40000 ALTER TABLE `shop_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_interior`
--

DROP TABLE IF EXISTS `shop_interior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_interior` (
  `shop_interior_id` varchar(255) NOT NULL,
  `shop_interior_image_pass` varchar(255) DEFAULT NULL,
  `shop_interior_drowing_pass` varchar(255) DEFAULT NULL,
  `shop_interior_object_pass` varchar(255) DEFAULT NULL,
  `shop_interior_collision_pass` varchar(255) DEFAULT NULL,
  `purehuri_shop_id` varchar(255) NOT NULL,
  PRIMARY KEY (`shop_interior_id`),
  KEY `purehuri_shop_id` (`purehuri_shop_id`),
  CONSTRAINT `shop_interior_ibfk_1` FOREIGN KEY (`purehuri_shop_id`) REFERENCES `purehuri_shop` (`purehuri_shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_interior`
--

LOCK TABLES `shop_interior` WRITE;
/*!40000 ALTER TABLE `shop_interior` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_interior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipping`
--

DROP TABLE IF EXISTS `sipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sipping` (
  `shipping_method_id` varchar(255) NOT NULL,
  `purehuri_shop_id` varchar(255) NOT NULL,
  PRIMARY KEY (`shipping_method_id`,`purehuri_shop_id`),
  KEY `purehuri_shop_id` (`purehuri_shop_id`),
  CONSTRAINT `sipping_ibfk_1` FOREIGN KEY (`purehuri_shop_id`) REFERENCES `purehuri_shop` (`purehuri_shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sipping_ibfk_2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method_info` (`shipping_method_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipping`
--

LOCK TABLES `sipping` WRITE;
/*!40000 ALTER TABLE `sipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `sipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `user_account_name` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `yubinbango` varchar(255) DEFAULT NULL,
  `todouhuken` varchar(255) DEFAULT NULL,
  `sikutyouson` varchar(255) DEFAULT NULL,
  `bantitatemono` varchar(255) DEFAULT NULL,
  `user_tell` varchar(255) DEFAULT NULL,
  `user_category` int(11) DEFAULT NULL,
  `user_live` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0e9bac2e60be48fb811dad0715910f80',NULL,'uei','164-0011','東京都','中野区中央','１－３５－１１ミルミル','0120-444444',NULL,NULL,'sasuga'),('1',NULL,'1','1','1','1','1','1',NULL,NULL,'1'),('351db7bf926e4b7ba31ac6ceaf098cb2',NULL,'sa',NULL,NULL,'sasa','dada','2123321111',NULL,NULL,'sa');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_avatar_table`
--

DROP TABLE IF EXISTS `user_avatar_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_avatar_table` (
  `avatar_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `avatar_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`avatar_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_avatar_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_avatar_table`
--

LOCK TABLES `user_avatar_table` WRITE;
/*!40000 ALTER TABLE `user_avatar_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_avatar_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-31  1:31:16
