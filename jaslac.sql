-- MySQL dump 10.13  Distrib 8.0.30, for macos11.6 (x86_64)
--
-- Host: localhost    Database: jaslac
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_key` varchar(130) NOT NULL,
  `user` int NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
INSERT INTO `access_keys` VALUES (150,'2f04e24a6844b746e54efcda3ed1b37f',59,'2022-10-04'),(151,'1063238a57fbd54dc6bb72e844e47ba1',60,'2022-10-05'),(152,'6c7d3bfd2d3b9a174ba0dc31e08aa75f',61,'2022-10-05'),(153,'74f37f1a3a27c5626c8c8fbffa03da0d',62,'2022-10-05'),(154,'82be70165c40da4815a53187151fe809',62,'2022-10-05'),(155,'47d228833ee2a5f8167e97e6a3ee54ed',62,'2022-10-05'),(156,'bb26b40efc9259de2d6b1c0767c0c35e',62,'2022-10-05'),(157,'0c74f0ed55132a6d7e5a6210f5b896c3',62,'2022-10-05'),(158,'b24747d9fd17134985da64674baf4bfd',62,'2022-10-05'),(159,'8a547c37b285a051d54b9cef580db7d4',62,'2022-10-05'),(160,'a935aded047248488d896d1f9c804561',62,'2022-10-05'),(161,'579850c70c48e35162f0386d338755ed',62,'2022-10-05'),(162,'eee8f18180db3ab320394905bf241c4e',62,'2022-10-05'),(163,'f49b3888f10251a1a589893bbc84f35b',59,'2022-10-05'),(164,'d554e03d59ed34f37e87ee0bbd11f905',63,'2022-10-08'),(165,'7ccdb9d5c5f0db8cee60e90b969bf180',64,'2022-10-08'),(166,'d96e740de47f3611c8667d8e0ae6c203',65,'2022-10-08'),(167,'41fa2033174ac4e8697c57fc275ceb27',63,'2022-10-09'),(168,'97048604e9896968a0f55c0c220f583f',62,'2022-10-10'),(169,'8cf53f634b7bcc585df88d5ad2a82fce',65,'2022-11-06'),(170,'984243e69abc43d5f902cc89d20d2a4b',65,'2022-11-06'),(171,'be84a66515d53dfc24ab290e6b9c7a27',65,'2022-11-06'),(172,'950aae7ebead36a2aff0932b28bb6403',65,'2022-11-06'),(173,'cf08ae7d778624542122e3902f9eeef3',63,'2022-11-06'),(174,'67a180b6633a1455f361880db802655f',66,'2022-11-08'),(175,'c9e2511bb550506f26c47fb13ed33b5a',63,'2022-11-08'),(176,'ca58e989bccdc3fc1397a330b322e3b8',63,'2022-11-08'),(177,'22b3bcb3995792d048da3977318afda5',63,'2022-11-08'),(178,'af3d69262d88a5fed539430d69cd534d',63,'2022-11-08'),(179,'b181f9f8819f4af5500b3833ae04da58',67,'2023-03-20'),(180,'a525af9ee6050a630bde8559be4ebd71',67,'2023-03-20'),(181,'2651d96a3f50715a0a9af08033c9aa8a',67,'2023-03-20'),(182,'d5013fb8938d4411d5ac348d9182c002',67,'2023-03-20');
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `district` mediumint DEFAULT NULL,
  `village` varchar(100) DEFAULT NULL,
  `country` mediumint DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `box_no` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `temporary_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (29,59,9,'Kampala, Central Region, Uganda',1,'+256759800742','','Boosted Technologies LTD','developer@boostedtechs.com','Buziga - kampala U',NULL),(30,62,26,'Kampala',1,'0705098174','','Boosted technologies LTD','boosted_api@boostedtechs.com','Buziga - Kampala Uganda',NULL),(31,63,57,'Kampala',1,'+256784565201','kasubi-namungoona','Boosted technologies Uganda','ashrikan@gmail.com','kasubi-namungoona',NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_commissions`
--

DROP TABLE IF EXISTS `affiliate_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliate_commissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commission` varchar(5) DEFAULT NULL COMMENT 'comission in percentage',
  `date_added` date NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_commissions`
--

LOCK TABLES `affiliate_commissions` WRITE;
/*!40000 ALTER TABLE `affiliate_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_transactions`
--

DROP TABLE IF EXISTS `affiliate_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliate_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `affiliate` int NOT NULL,
  `discount` int NOT NULL,
  `temporary_id` int DEFAULT NULL,
  `date_added` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='affiliate_transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_transactions`
--

LOCK TABLES `affiliate_transactions` WRITE;
/*!40000 ALTER TABLE `affiliate_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliate_withdraws`
--

DROP TABLE IF EXISTS `affiliate_withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliate_withdraws` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `amount` int NOT NULL,
  `date_of_request` datetime NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint NOT NULL DEFAULT '0' COMMENT '0 is pending, 1 is approved, 3 is paid',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliate_withdraws`
--

LOCK TABLES `affiliate_withdraws` WRITE;
/*!40000 ALTER TABLE `affiliate_withdraws` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliate_withdraws` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL DEFAULT '0',
  `date_added` date NOT NULL,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
INSERT INTO `app_version` VALUES (1,0,'2022-10-05',59),(2,0,'2022-10-05',59),(3,50,'2022-10-05',59),(4,51,'2022-10-06',59),(5,52,'2022-10-08',59),(6,53,'2022-10-08',59);
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_info`
--

DROP TABLE IF EXISTS `basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basic_info` (
  `names` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `country` char(50) DEFAULT NULL,
  `dob` date NOT NULL,
  `theme` tinyint(1) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `continent` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `timezone` char(100) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 is admin, 0 is client',
  `mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is when welcome mail is not sent. 1 is sent welcome mail',
  `boo_cash` tinyint(1) NOT NULL DEFAULT '0',
  `affiliate_discount` tinyint NOT NULL DEFAULT '0',
  `supplier` tinyint(1) NOT NULL DEFAULT '0',
  `user` int NOT NULL AUTO_INCREMENT,
  `password` char(128) NOT NULL,
  `verified` char(120) DEFAULT NULL,
  `_timstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_info`
--

LOCK TABLES `basic_info` WRITE;
/*!40000 ALTER TABLE `basic_info` DISABLE KEYS */;
INSERT INTO `basic_info` VALUES ('Ashiraff Tumusiime','blank.png','0','1995-09-09',1,1,'0','0','jaslac@jaslac.com',NULL,'ashiraff-tumusiime',1,0,0,0,0,59,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2022-10-05 10:59:08'),('Jacenta K','blank.png','0','1995-09-09',1,2,'0','0','jacentah@jaslac.com',NULL,'jacenta-k',1,0,0,0,0,62,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2022-10-05 10:59:08'),('Ashiraff','blank.png','0','1995-09-09',1,1,'0','0','ashan@boostedtechs.com',NULL,'ashiraff',0,0,0,0,0,63,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2022-10-08 10:05:42'),('Ashiraff','blank.png','0','1995-09-09',1,1,'0','0','office@boostedtechs.com',NULL,NULL,0,0,0,0,0,64,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2022-10-08 10:08:38'),('developer@boostedtechs.com','blank.png','0','1995-09-09',1,1,'0','0','developer@boostedtechs.com',NULL,'developer-boostedtechs.com',0,0,0,0,0,65,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2022-10-08 10:13:58'),('as','blank.png','0','1998-09-09',1,1,'0','0','ashrikan@gmail.com',NULL,NULL,0,0,0,0,0,66,'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,'2022-11-08 05:16:52'),('Luther Kings','blank.png','0','2023-09-09',1,1,'0','0','king@gmail.com',NULL,'luther-kings',1,0,0,0,0,67,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',NULL,'2023-03-20 14:34:29');
/*!40000 ALTER TABLE `basic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Uganda',1),(2,'Kenya',0),(3,'Rwanda',0),(4,'South Sudan',0),(5,'Tanzania',0),(6,'Democratic Republic of Congo',0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` int NOT NULL DEFAULT '1',
  `district` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `region` tinyint NOT NULL DEFAULT '4',
  `delivery_amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'Buikwe',0,1,0),(2,1,'Bukomansimbi	',0,1,0),(3,1,'Butambala',0,1,0),(4,1,'Buvuma',0,1,0),(5,1,'Gomba',0,1,0),(6,1,'Kalangala',0,1,0),(7,1,'Kalungu',0,1,0),(8,1,'Kampala',1,1,0),(9,1,'Kampala',0,1,0),(10,1,'Kiboga',0,1,0),(11,1,'Kyankwanzi',0,1,0),(12,1,'Luweero',0,1,0),(13,1,'Lwengo',0,1,0),(14,1,'Lyantonde',0,1,0),(15,1,'Masaka',0,1,0),(16,1,'Mityana',0,1,0),(17,1,'Mpigi',0,1,0),(18,1,'Mubende',0,1,0),(19,1,'Mukono',0,1,0),(20,1,'Nakaseke',0,1,0),(21,1,'Nakasongola',0,1,0),(22,1,'Rakai',0,1,0),(23,1,'Sembabule',0,1,0),(24,1,'Wakiso',0,1,0),(25,1,'Amuria',0,2,0),(26,1,'Budaka',0,2,0),(27,1,'Bududa',0,2,0),(28,1,'Bugiri',0,2,0),(29,1,'Bukedea',0,2,0),(30,1,'Bukwa',0,2,0),(31,1,'Bulambuli',0,2,0),(32,1,'Busia',0,2,0),(33,1,'Butaleja',0,2,0),(34,1,'Buyende',0,2,0),(35,1,'Iganga',0,2,0),(36,1,'Jinja',0,2,0),(37,1,'Kaberamaido',0,2,0),(38,1,'Kaliro',0,2,0),(39,1,'Kamuli',0,2,0),(40,1,'Kapchorwa',0,2,0),(41,1,'Katakwi',0,2,0),(42,1,'Kibuku',0,2,0),(43,1,'Kumi',0,2,0),(44,1,'Kween',0,2,0),(45,1,'Luuka',0,2,0),(46,1,'Manafwa',0,2,0),(47,1,'Mayuge',0,2,0),(48,1,'Mbale',0,2,0),(49,1,'Namayingo',0,2,0),(50,1,'Namutumba',0,2,0),(51,1,'Ngora',0,2,0),(52,1,'Pallisa',0,2,0),(53,1,'Serere',0,2,0),(54,1,'Sironko',0,2,0),(55,1,'Soroti',0,2,0),(56,1,'Tororo',0,2,0),(57,1,'Abim',0,3,0),(58,1,'Adjumani',0,3,0),(59,1,'Agago',0,3,0),(60,1,'Alebtong',0,3,0),(61,1,'Amolatar',0,3,0),(62,1,'Amudat',0,3,0),(63,1,'Amuru',0,3,0),(64,1,'Apac',0,3,0),(65,1,'Arua',0,3,0),(66,1,'Dokolo',0,3,0),(67,1,'Gulu',0,3,0),(68,1,'Kaabong',0,3,0),(69,1,'Kitgum',0,3,0),(70,1,'Koboko',0,3,0),(71,1,'Kole',0,3,0),(72,1,'Kotido',0,3,0),(73,1,'Lamwo',0,3,0),(74,1,'Lira',0,3,0),(75,1,'Maracha',0,3,0),(76,1,'Moroto',0,3,0),(77,1,'Moyo',0,3,0),(78,1,'Nakapiripirit',0,3,0),(79,1,'Napak',0,3,0),(80,1,'Nebbi',0,3,0),(81,1,'Nwoya',0,3,0),(82,1,'Otuke',0,3,0),(83,1,'Oyam',0,3,0),(84,1,'Pader',0,3,0),(85,1,'Yumbe',0,3,0),(86,1,'Zombo',0,3,0),(87,1,'Buhweju',0,4,0),(88,1,'Buliisa',0,4,0),(89,1,'Bundibugyo',0,4,0),(90,1,'Bushenyi',0,4,0),(91,1,'Hoima',0,4,0),(92,1,'Ibanda',0,4,0),(93,1,'Isingiro',0,4,0),(94,1,'Kabale',0,4,0),(95,1,'Kabarole',0,4,0),(96,1,'Kamwenge',0,4,0),(97,1,'Kanungu',0,4,0),(98,1,'Kasese',0,4,0),(99,1,'Kibaale',0,4,0),(100,1,'Kiruhura',0,4,0),(101,1,'Kiryandongo',0,4,0),(102,1,'Kisoro',0,4,0),(103,1,'Kyegegwa',0,4,0),(104,1,'Kyenjojo',0,4,0),(105,1,'Masindi',0,4,0),(106,1,'Mbarara',0,4,0),(107,1,'Mitooma',0,4,0),(108,1,'Ntoroko',0,4,0),(109,1,'Ntungamo',0,4,0),(110,1,'Rubirizi',0,4,0),(111,1,'Rukungiri',0,4,0),(112,1,'Sheema',0,4,0);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fcm_tokens`
--

DROP TABLE IF EXISTS `fcm_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcm_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` text NOT NULL,
  `date_added` date NOT NULL,
  `device` text,
  `user` int DEFAULT NULL,
  `auth_token` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fcm_tokens`
--

LOCK TABLES `fcm_tokens` WRITE;
/*!40000 ALTER TABLE `fcm_tokens` DISABLE KEYS */;
INSERT INTO `fcm_tokens` VALUES (8,'1234445','2022-11-17','1.3.4',1234,'5555');
/*!40000 ALTER TABLE `fcm_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgot_password`
--

DROP TABLE IF EXISTS `forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forgot_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `password` char(64) NOT NULL,
  `_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgot_password`
--

LOCK TABLES `forgot_password` WRITE;
/*!40000 ALTER TABLE `forgot_password` DISABLE KEYS */;
INSERT INTO `forgot_password` VALUES (4,63,'0577f907763c7387bdd2824743d2d0a7af2251c26c4493bcf472c72f23c6c91f','2022-10-24 13:49:30',0),(5,65,'759a96a7c6db7cfa99a4af52302ce91674feb2246a6e14d71c876fefc95380bd','2022-11-06 14:27:42',1),(6,65,'66b2f04cbaaa43081dd029076a97ed0d12b3c61fc86b27d664e19fd4559b4630','2023-03-20 14:23:12',0);
/*!40000 ALTER TABLE `forgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_subscription`
--

DROP TABLE IF EXISTS `mail_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_subscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` char(100) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_subscription`
--

LOCK TABLES `mail_subscription` WRITE;
/*!40000 ALTER TABLE `mail_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_keys`
--

DROP TABLE IF EXISTS `order_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `order_ref` varchar(100) NOT NULL,
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `response_data` text,
  `temporary_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_keys`
--

LOCK TABLES `order_keys` WRITE;
/*!40000 ALTER TABLE `order_keys` DISABLE KEYS */;
INSERT INTO `order_keys` VALUES (20,32,'dff71c433b246e8b051c5663a6073beb_ref_32_59_',59,'2022-10-08',NULL,0),(21,33,'fbcb8c53ce9dbac4e9c4bb1db1f46310_ref_33_62_',62,'2022-10-10',NULL,0),(22,34,'f8d20a40364a64fd6c5a6022f27b24da_ref_34_62_',62,'2022-10-11',NULL,0),(23,35,'947db1c5cc5f2c83fc0e1f17da70f15d_ref_35_62_',62,'2022-10-11',NULL,0),(24,36,'a41a389801b221f6a02efcfed6232bcb_ref_36_62_',62,'2022-10-11',NULL,0),(25,36,'e2f02249ecab3712a2a6c25653468282_ref_36_62',62,'2022-10-11',NULL,NULL),(26,36,'aff4610990f80b9a1a82fbc9e5162a35_ref_36_62',62,'2022-10-11',' {\"request\":\"MobileMoney\",\n    \"status\":\"Successful\",\n    \"tx_ref\":\"aff4610990f80b9a1a82fbc9e5162a35_ref_36_62\",\n    \"amount\":\"515\",\n    \"currency\":\"UGX\",\n    \"_timestamp\":\"2022-02-01 20:07:03\",\n    \"message\":\"Thank you for choosing Boosted Payment Solutions for your collections needs.\"}',NULL),(27,37,'5935e1dc93d245bd0b1f91899534b288_ref_37_62_',62,'2022-10-13',NULL,0),(28,37,'37a461107d00bd898c4a1eae95a0d101_ref_37_62',62,'2022-10-18',NULL,NULL),(29,38,'ceb862d6021e4d083643b08377e7e69e-ref-38-63-',63,'2022-11-15',NULL,0);
/*!40000 ALTER TABLE `order_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `product` int NOT NULL,
  `qty` int NOT NULL,
  `amount` int NOT NULL,
  `color` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_items`
--

LOCK TABLES `ordered_items` WRITE;
/*!40000 ALTER TABLE `ordered_items` DISABLE KEYS */;
INSERT INTO `ordered_items` VALUES (34,27,168,1,200000,17,27),(35,28,168,1,200000,17,27),(36,29,168,1,200000,17,27),(37,30,168,1,200000,17,27),(38,31,168,1,200000,17,27),(39,32,168,1,200000,17,27),(40,33,168,1,200000,17,27),(41,34,168,1,200000,17,27),(42,35,169,1,500,17,27),(43,36,169,1,500,17,27),(44,37,169,1,500,17,27),(45,38,168,1,200000,17,27);
/*!40000 ALTER TABLE `ordered_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `order_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 is pending, 1 is submited, 2 pending_delivery, 3 is delivered, 4 is returned',
  `amount` int NOT NULL,
  `date_created` datetime NOT NULL,
  `payment_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mail` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_district` smallint DEFAULT NULL,
  `temporary_id` int DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (27,59,0,206000,'2022-10-08 09:30:06',0,'2022-10-08 09:30:06',0,9,0,''),(28,59,0,206000,'2022-10-08 09:37:43',0,'2022-10-08 09:37:43',0,9,0,'Ne worder'),(29,59,0,206000,'2022-10-08 09:37:44',0,'2022-10-08 09:37:44',0,9,0,'Ne worder'),(30,59,0,206000,'2022-10-08 09:39:25',0,'2022-10-08 09:39:25',0,9,0,'kkk'),(31,59,0,206000,'2022-10-08 09:42:03',0,'2022-10-08 09:42:03',0,9,0,'kkk'),(32,59,0,206000,'2022-10-08 09:45:04',0,'2022-10-08 09:45:04',0,9,0,'Roooow'),(33,62,0,212000,'2022-10-10 12:28:10',0,'2022-10-10 12:28:10',0,26,0,'New order'),(34,62,0,212000,'2022-10-11 08:00:41',0,'2022-10-11 08:00:41',0,26,0,'More of this is needed.'),(35,62,0,12500,'2022-10-11 09:02:42',0,'2022-10-11 09:02:42',0,26,0,'New order'),(36,62,1,500,'2022-10-11 10:04:53',1,'2022-10-11 14:31:28',0,26,0,'ggg'),(37,62,0,500,'2022-10-13 12:23:06',0,'2022-10-13 12:23:06',0,26,0,''),(38,63,0,200000,'2022-11-15 13:15:29',0,'2022-11-15 13:15:29',0,57,0,'');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_keys`
--

DROP TABLE IF EXISTS `payment_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `production` varchar(100) NOT NULL,
  `testing` varchar(100) NOT NULL,
  `secret_key` varchar(100) NOT NULL,
  `testing_key` varchar(100) NOT NULL,
  `encryption` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_keys`
--

LOCK TABLES `payment_keys` WRITE;
/*!40000 ALTER TABLE `payment_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uak` char(128) DEFAULT NULL,
  `psid` char(128) DEFAULT NULL,
  `code` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'b659c2e0dcd39d4042cf4c9aa51d7a4508049611229760e14bc3c35c9085e0c9','552151c96e0ece5b36fecc40b99269b3bef18d37cdeb1811910b0e126a991153',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(64) NOT NULL,
  `default_amount` int NOT NULL DEFAULT '6000',
  `image` char(100) NOT NULL DEFAULT 'blank.png',
  `image_origin` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (28,'Phones',1,59,'2023-02-19','2023-03-19 09:39:54','phone',0,'elec-4.png',1),(29,'Computers',1,59,'2023-02-19','2023-03-19 09:41:29','computers',0,'elec-5.png',1),(30,'Accessories',1,59,'2023-02-19','2023-03-19 09:42:10','Accessories',0,'elec-6.png',1),(31,'Laptops',1,59,'2023-02-19','2023-03-19 09:42:55','laptops',0,'elec-7.png',1),(32,'Pc gaming',1,59,'2023-02-19','2023-03-19 09:43:41','gaming',0,'elec-8.png',1);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (17,'None','2022-10-05','2022-10-05 08:56:13',59,1);
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_currency`
--

DROP TABLE IF EXISTS `product_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_currency`
--

LOCK TABLES `product_currency` WRITE;
/*!40000 ALTER TABLE `product_currency` DISABLE KEYS */;
INSERT INTO `product_currency` VALUES (10,'UGX',1,59,'2022-10-05','2022-10-05 08:53:13','ugx');
/*!40000 ALTER TABLE `product_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_general_sizes`
--

DROP TABLE IF EXISTS `product_general_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_general_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(50) NOT NULL,
  `date_created` date NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_general_sizes`
--

LOCK TABLES `product_general_sizes` WRITE;
/*!40000 ALTER TABLE `product_general_sizes` DISABLE KEYS */;
INSERT INTO `product_general_sizes` VALUES (27,'None','2022-10-05',1,59);
/*!40000 ALTER TABLE `product_general_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` varchar(150) NOT NULL,
  `product` int NOT NULL,
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `feature_photo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (221,'7a6e1611d251cc219de294afaf14701a_boo_store.png',168,59,'2022-10-07',0,0),(222,'a182d806bc8c78328cd69cdee760733d_boo_store.jpeg',169,62,'2022-10-11',1,1),(223,'13e852d83dff2bb8b2a12386a6e6e34f_boo_store.jpeg',168,62,'2022-10-11',1,1),(224,'e02de0afa99fea3630f61c6935c3fed6_boo_store.jpg',170,67,'2023-03-20',1,0),(225,'d9a9a01130ccfe7f4e16d016af5b3254_boo_store.jpg',170,67,'2023-03-20',1,1),(226,'d6e403606aadf5e7638a56a3e91fc12f_boo_store.jpg',170,67,'2023-03-20',1,0),(227,'024d672186feee25cab1a3ea983debca_boo_store.jpg',170,67,'2023-03-20',1,0),(228,'5a747b0b6d58bc1109c45f85b15ad4b7_boo_store.jpg',171,67,'2023-03-20',1,1),(229,'60cba480a5066b13477419acc051bedb_boo_store.jpg',171,67,'2023-03-20',1,0),(230,'5fc3b5ee1c2a283bed120334e4e84b52_boo_store.jpg',171,67,'2023-03-20',1,0),(231,'46e6b9f10ddef14e6c6bde66e7e8f708_boo_store.jpg',171,67,'2023-03-20',1,0),(232,'bc28a28ff9420a6e19c292ae03467366_boo_store.jpg',172,67,'2023-03-20',1,1),(233,'1c628e9a606af3306e560ba3330555a4_boo_store.jpg',172,67,'2023-03-20',1,0),(234,'0c7aa5714e278f48d35e378397a0610d_boo_store.jpg',172,67,'2023-03-20',1,0),(235,'0a6d928005f60d3f357a1238645e69af_boo_store.jpg',173,67,'2023-03-20',1,1),(236,'d56b179a8aaedd2b3e4012df7c45dd30_boo_store.jpg',173,67,'2023-03-20',1,0),(237,'7f998ff5620ad1ac82281fdd37896e95_boo_store.jpg',173,67,'2023-03-20',1,0),(238,'9eda4dc794c89805ee9ab5ad866aeab3_boo_store.jpg',173,67,'2023-03-20',1,0),(239,'3733d24d3967d9f5398e8a027e7e59ed_boo_store.jpg',174,67,'2023-03-20',1,0),(240,'c405bfde797681dbac784b18ea85059a_boo_store.jpg',174,67,'2023-03-20',1,1),(241,'24d4272b81c81b316839e1e64be2adaf_boo_store.jpg',175,67,'2023-03-20',1,0),(242,'f4df6555d795185065359857fc7c3d14_boo_store.jpg',175,67,'2023-03-20',1,0),(243,'bf56b57ece0aedcf104c8d0df613c1c0_boo_store.jpg',175,67,'2023-03-20',1,1),(244,'b04cc928b8b91afa198bf1a817155ed9_boo_store.jpg',175,67,'2023-03-20',1,0),(245,'214e10ecbf4f2ab3626dc83757db691f_boo_store.jpg',175,67,'2023-03-20',1,0),(246,'1fe0235867b3a6c4595f9f7a39045164_boo_store.jpg',176,67,'2023-03-20',1,0),(247,'cce222a9f95ee12936562256f1c195d2_boo_store.jpg',176,67,'2023-03-20',1,1),(248,'0293270d57ef41697d2a957a7b0d4dba_boo_store.jpg',176,67,'2023-03-20',1,0),(249,'2041b1badb96d74a84560ca2d7cd89bb_boo_store.jpg',176,67,'2023-03-20',1,0),(250,'ef845a7ec5eae8734253b0d606d7dd4a_boo_store.jpg',177,67,'2023-03-20',1,1),(251,'bf0a93e408d2449c85e9fbb7111812ca_boo_store.jpg',177,67,'2023-03-20',1,0),(252,'5e499431e98893e3e6501d831d4548cd_boo_store.jpg',177,67,'2023-03-20',1,0),(253,'722407928696865b84475743f38dc3d1_boo_store.jpg',177,67,'2023-03-20',1,0),(254,'29cca4a6cdac2e823449086c1537ce4a_boo_store.jpg',177,67,'2023-03-20',1,0),(255,'8c909a0d09a0227ed56de64c6584f770_boo_store.jpg',178,67,'2023-03-20',1,1),(256,'3753c8cf83b0ff8f4c41dc25a26f105f_boo_store.jpg',178,67,'2023-03-20',1,0),(257,'f6bca23b0aa207a57ddc02a3d8ecf36e_boo_store.jpg',178,67,'2023-03-20',1,0),(258,'ca60065b1f8253c606a9680eb3a893e2_boo_store.jpg',178,67,'2023-03-20',1,0),(259,'12b2452785785ba70ab81b567e4f58a0_boo_store.jpg',178,67,'2023-03-20',1,0),(260,'c258849c21e3914362c8b637e3258619_boo_store.jpg',178,67,'2023-03-20',1,0),(261,'4e029ac5f29607bdea0262ac05dbd6f6_boo_store.jpg',179,67,'2023-03-20',1,1),(262,'b9249f21e6f8fa33af62ee9b78defd05_boo_store.jpg',179,67,'2023-03-20',1,0),(263,'36d6240a8048b171debbd0c6ef74f672_boo_store.jpg',179,67,'2023-03-20',1,0),(264,'7655df0770f1275f9616364b1b60d45d_boo_store.jpg',179,67,'2023-03-20',1,0),(265,'09c63368b7c774bbdd4899d047d7af56_boo_store.jpg',179,67,'2023-03-20',1,0),(266,'9ad245a2f6f1bf7a02ecaaaccf19aca9_boo_store.jpg',180,67,'2023-03-20',1,1),(267,'b7492be2f283c3d2cae795f083fdd2b5_boo_store.jpg',180,67,'2023-03-20',1,0),(268,'022f6c93dcbcd508b1b69704ad9bacdb_boo_store.jpg',181,67,'2023-03-20',1,0),(269,'3f70b1749f28ac276a3a265d755a55ef_boo_store.jpg',181,67,'2023-03-20',1,1),(270,'c9c18c0083e7af5c690a8634633eb5b8_boo_store.jpg',181,67,'2023-03-20',1,0),(271,'155a32d4dd37550c890f60ec0fd8f4e9_boo_store.jpg',181,67,'2023-03-20',1,0),(272,'367815b18af4feb0d5799ab3c13571cc_boo_store.jpg',181,67,'2023-03-20',1,0),(273,'268019634a66c7d601798b437e9a3246_boo_store.jpg',181,67,'2023-03-20',1,0),(274,'3e0e7cc3f09a2c8705970a4799cb5b3e_boo_store.jpg',182,67,'2023-03-20',1,0),(275,'b81a8d85330db724c8b33c5796f7d3ab_boo_store.jpg',182,67,'2023-03-20',1,0),(276,'7f59c72c0ed3e0a9f1bbd04c24ea7fe2_boo_store.jpg',182,67,'2023-03-20',1,0),(277,'5ed435f8d263ff4c6098b96a392035bc_boo_store.jpg',182,67,'2023-03-20',1,1),(278,'027587e6b1ac0f88078f836b208e660f_boo_store.jpg',182,67,'2023-03-20',1,0),(279,'53f4fc414d72959652e6266c6d24c096_boo_store.jpg',182,67,'2023-03-20',1,0),(280,'9fa297db16087ee4e0bc72fd30afbf40_boo_store.jpg',182,67,'2023-03-20',1,0);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_metrics`
--

DROP TABLE IF EXISTS `product_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_metrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metric` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_metrics`
--

LOCK TABLES `product_metrics` WRITE;
/*!40000 ALTER TABLE `product_metrics` DISABLE KEYS */;
INSERT INTO `product_metrics` VALUES (20,'SACK',1,59,'2022-10-05','2022-10-05 08:54:03','sack'),(21,'BASIN',1,59,'2022-10-05','2022-10-05 08:54:11','basin'),(22,'Kgs',1,59,'2022-10-05','2022-10-05 08:54:25','kgs');
/*!40000 ALTER TABLE `product_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_rate`
--

DROP TABLE IF EXISTS `product_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `user` int NOT NULL,
  `rate` tinyint NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_rate`
--

LOCK TABLES `product_rate` WRITE;
/*!40000 ALTER TABLE `product_rate` DISABLE KEYS */;
INSERT INTO `product_rate` VALUES (8,169,62,3,'2022-10-18 10:28:34');
/*!40000 ALTER TABLE `product_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_set_colors`
--

DROP TABLE IF EXISTS `product_set_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_set_colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int NOT NULL,
  `product` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_set_colors`
--

LOCK TABLES `product_set_colors` WRITE;
/*!40000 ALTER TABLE `product_set_colors` DISABLE KEYS */;
INSERT INTO `product_set_colors` VALUES (62,'17','2022-10-07','2022-10-07 07:15:02',59,159),(63,'17','2022-10-07','2022-10-07 07:37:33',59,160),(64,'17','2022-10-07','2022-10-07 07:40:51',59,161),(65,'17','2022-10-07','2022-10-07 07:42:03',59,162),(66,'17','2022-10-07','2022-10-07 07:43:00',59,163),(67,'17','2022-10-07','2022-10-07 07:44:00',59,164),(68,'17','2022-10-07','2022-10-07 07:44:24',59,165),(69,'17','2022-10-07','2022-10-07 07:45:00',59,166),(70,'17','2022-10-07','2022-10-07 07:45:40',59,167),(71,'17','2022-10-07','2022-10-07 07:46:26',59,168),(72,'17','2022-10-11','2022-10-11 08:45:14',62,169),(73,'17','2023-03-20','2023-03-20 14:49:23',67,170),(74,'17','2023-03-20','2023-03-20 14:55:05',67,171),(75,'17','2023-03-20','2023-03-20 14:57:47',67,172),(76,'17','2023-03-20','2023-03-20 15:00:01',67,173),(77,'17','2023-03-20','2023-03-20 15:02:12',67,174),(78,'17','2023-03-20','2023-03-20 15:04:48',67,175),(79,'17','2023-03-20','2023-03-20 15:07:24',67,176),(80,'17','2023-03-20','2023-03-20 15:09:31',67,177),(81,'17','2023-03-20','2023-03-20 15:12:03',67,178),(82,'17','2023-03-20','2023-03-20 15:14:28',67,179),(83,'17','2023-03-20','2023-03-20 15:17:21',67,180),(84,'17','2023-03-20','2023-03-20 15:19:28',67,181),(85,'17','2023-03-20','2023-03-20 15:23:11',67,182);
/*!40000 ALTER TABLE `product_set_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` int NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product` int NOT NULL,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (143,27,'2022-10-07','2022-10-07 07:15:02',159,59),(144,27,'2022-10-07','2022-10-07 07:37:33',160,59),(145,27,'2022-10-07','2022-10-07 07:40:51',161,59),(146,27,'2022-10-07','2022-10-07 07:42:03',162,59),(147,27,'2022-10-07','2022-10-07 07:43:00',163,59),(148,27,'2022-10-07','2022-10-07 07:44:00',164,59),(149,27,'2022-10-07','2022-10-07 07:44:24',165,59),(150,27,'2022-10-07','2022-10-07 07:45:00',166,59),(151,27,'2022-10-07','2022-10-07 07:45:40',167,59),(152,27,'2022-10-07','2022-10-07 07:46:26',168,59),(153,27,'2022-10-11','2022-10-11 08:45:14',169,62),(154,27,'2023-03-20','2023-03-20 14:49:23',170,67),(155,27,'2023-03-20','2023-03-20 14:55:05',171,67),(156,27,'2023-03-20','2023-03-20 14:57:47',172,67),(157,27,'2023-03-20','2023-03-20 15:00:01',173,67),(158,27,'2023-03-20','2023-03-20 15:02:12',174,67),(159,27,'2023-03-20','2023-03-20 15:04:48',175,67),(160,27,'2023-03-20','2023-03-20 15:07:24',176,67),(161,27,'2023-03-20','2023-03-20 15:09:31',177,67),(162,27,'2023-03-20','2023-03-20 15:12:03',178,67),(163,27,'2023-03-20','2023-03-20 15:14:28',179,67),(164,27,'2023-03-20','2023-03-20 15:17:21',180,67),(165,27,'2023-03-20','2023-03-20 15:19:28',181,67),(166,27,'2023-03-20','2023-03-20 15:23:11',182,67);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sub_categories`
--

DROP TABLE IF EXISTS `product_sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(64) NOT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sub_categories`
--

LOCK TABLES `product_sub_categories` WRITE;
/*!40000 ALTER TABLE `product_sub_categories` DISABLE KEYS */;
INSERT INTO `product_sub_categories` VALUES (29,'None',1,59,'2022-10-05','2022-10-05 08:27:29','none',0,1),(30,'Kabale',1,59,'2022-10-07','2022-10-07 07:13:37','kabale',0,1),(31,'Masaka',1,59,'2022-10-07','2022-10-07 07:13:45','masaka',0,1);
/*!40000 ALTER TABLE `product_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplier_images`
--

DROP TABLE IF EXISTS `product_supplier_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supplier_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` varchar(150) NOT NULL,
  `supplier` int NOT NULL,
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `feature_photo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier_images`
--

LOCK TABLES `product_supplier_images` WRITE;
/*!40000 ALTER TABLE `product_supplier_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_supplier_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_suppliers`
--

DROP TABLE IF EXISTS `product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier` char(150) NOT NULL,
  `contacts` char(50) NOT NULL,
  `email` char(100) NOT NULL,
  `description` text NOT NULL,
  `user` int NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(64) NOT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `URL` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_suppliers`
--

LOCK TABLES `product_suppliers` WRITE;
/*!40000 ALTER TABLE `product_suppliers` DISABLE KEYS */;
INSERT INTO `product_suppliers` VALUES (18,'Jaslac Digital Store','+256755942584','info@jaslac.com','Jaslac Digital Store',59,'2022-10-05','2022-10-05 08:55:45',1,'jaslac-digital-store',0);
/*!40000 ALTER TABLE `product_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_views`
--

DROP TABLE IF EXISTS `product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_views` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `user` int NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_views`
--

LOCK TABLES `product_views` WRITE;
/*!40000 ALTER TABLE `product_views` DISABLE KEYS */;
INSERT INTO `product_views` VALUES (8,169,62,'Loving','2022-10-18 10:28:38');
/*!40000 ALTER TABLE `product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `metric` smallint DEFAULT NULL,
  `currency` smallint NOT NULL,
  `description` text NOT NULL,
  `summary` tinytext NOT NULL,
  `price_1` int NOT NULL,
  `price_2` int NOT NULL,
  `feature_photo` varchar(130) DEFAULT NULL,
  `rates` int DEFAULT NULL,
  `date_added` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int NOT NULL,
  `category` int NOT NULL,
  `sub_category` int NOT NULL,
  `supplier` int NOT NULL,
  `url` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `in_stock` tinyint(1) NOT NULL DEFAULT '1',
  `keywords` tinytext NOT NULL,
  `p_type` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (168,'Kabale Matooke',21,10,'kabale Matooke','Matooke from Kabale',200000,0,'13e852d83dff2bb8b2a12386a6e6e34f_boo_store.jpeg',NULL,'2022-10-11','2023-03-20 14:46:53',62,28,30,18,'kabale-matooke-5',0,1,'Kabale Matooke',1),(169,'Yellow Bananas (Bogoya)',22,10,'Cluster of Bogoya','Cluster of Bogoya',500,0,'a182d806bc8c78328cd69cdee760733d_boo_store.jpeg',NULL,'2022-10-11','2023-03-20 14:46:53',62,28,29,18,'yellow-bananas-bogoya-',0,1,'Yellow Banana (Bogoya)',1),(170,'Boys and Girls Suits Hooded',21,10,'Product','Product',20,0,'d9a9a01130ccfe7f4e16d016af5b3254_boo_store.jpg',NULL,'2023-03-20','2023-03-20 14:52:35',67,30,29,18,'boys-and-girls-suits-hooded',1,1,'Boys and Girls Suits Hooded',1),(171,'Cotton Breast Binder Tube Top Strap Pad Cup',21,10,'Cotton Breast Binder Tube Top Strap Pad Cup','Cotton Breast Binder Tube Top Strap Pad Cup',600,60,'5a747b0b6d58bc1109c45f85b15ad4b7_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:26:44',67,30,29,18,'cotton-breast-binder-tube-top-strap-pad-cup',1,1,'Cotton Breast Binder Tube Top Strap Pad Cup',1),(172,'Creative 3d Door Sticker Renovation',21,10,'Self-adhesive Sticker Decoration Bedroom Living Room Door Sticker Staircase Wall Sticker','Self-adhesive Sticker Decoration Bedroom Living Room Door Sticker Staircase Wall Sticker',89,80,'bc28a28ff9420a6e19c292ae03467366_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:26:44',67,30,30,18,'creative-3d-door-sticker-renovation',1,1,'Creative 3d Door Sticker Renovation Self-adhesive Sticker Decoration Bedroom Living Room Door Sticker Staircase Wall Sticker',1),(173,'Half Sleeve Short Sleeve Neutral Men&#039;s T-shirt',21,10,'Half Sleeve Short Sleeve Neutral Men\'s T-shirt','Half Sleeve Short Sleeve Neutral Men&#039;s T-shirt',90,90,'0a6d928005f60d3f357a1238645e69af_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,29,18,'half-sleeve-short-sleeve-neutral-men-039-s-t-shirt',1,1,'Half Sleeve Short Sleeve Neutral Men&#039;s T-shirt',1),(174,'Heart-shaped Women&#039;s Women&#039;s Necklace',21,10,'Heart-shaped Women\'s Women\'s Necklace','Heart-shaped Women&#039;s Women&#039;s Necklace',80,90,'c405bfde797681dbac784b18ea85059a_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,29,18,'heart-shaped-women-039-s-women-039-s-necklace',1,1,'Heart-shaped Women&#039;s Women&#039;s Necklace',1),(175,'Infant Sleeve Top Bread Pants Baby Girl Suit',21,10,'Infant Sleeve Top Bread Pants Baby Girl Suit','Infant Sleeve Top Bread Pants Baby Girl Suit',10,10,'bf56b57ece0aedcf104c8d0df613c1c0_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,30,18,'infant-sleeve-top-bread-pants-baby-girl-suit',1,1,'Infant Sleeve Top Bread Pants Baby Girl Suit',1),(176,'Men&#039;s Fitting Stand Collar Plain Business Casual Knitting Jacket',21,10,'Men\'s Fitting Stand Collar Plain Business Casual Knitting Jacket','Men&#039;s Fitting Stand Collar Plain Business Casual Knitting Jacket',10,10,'cce222a9f95ee12936562256f1c195d2_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,29,18,'men-039-s-fitting-stand-collar-plain-business-casual-knitting-jacket',1,1,'Men&#039;s Fitting Stand Collar Plain Business Casual Knitting Jacket',1),(177,'Men&#039;s High Top Breathable Versatile Casual Sporty Fashion',21,10,'Men\'s High Top Breathable Versatile Casual Sporty Fashion Comfortable Stylish Trendy Student Handsome Sneakers','Men&#039;s High Top Breathable Versatile Casual Sporty Fashion Comfortable Stylish Trendy Student Handsome Sneakers',60,60,'ef845a7ec5eae8734253b0d606d7dd4a_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,30,18,'men-039-s-high-top-breathable-versatile-casual-sporty-fashion',1,1,'Men&#039;s High Top Breathable Versatile Casual Sporty Fashion Comfortable Stylish Trendy Student Handsome Sneakers',1),(178,'Men&#039;s Slim Fit Trend Long Sleeve T-Shirt Sweatshirt',21,10,'Men\'s Slim Fit Trend Long Sleeve T-Shirt Sweatshirt','Men&#039;s Slim Fit Trend Long Sleeve T-Shirt Sweatshirt',59,59,'8c909a0d09a0227ed56de64c6584f770_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,30,18,'men-039-s-slim-fit-trend-long-sleeve-t-shirt-sweatshirt',1,1,'Men&#039;s Slim Fit Trend Long Sleeve T-Shirt Sweatshirt',1),(179,'Men&#039;s T Shirt T Shirt T Shirt Boyfriend',21,10,'Men\'s T Shirt T Shirt T Shirt Boyfriend','Men&#039;s T Shirt T Shirt T Shirt Boyfriend',60,50,'4e029ac5f29607bdea0262ac05dbd6f6_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,30,18,'men-039-s-t-shirt-t-shirt-t-shirt-boyfriend',1,1,'Men&#039;s T Shirt T Shirt T Shirt Boyfriend',1),(180,'Plus Size Men&#039;s Autumn Hooded Fashion Casual Outdoor Sportswear Set',21,10,'Plus Size Men\'s Autumn Hooded Fashion Casual Outdoor Sportswear Set','Plus Size Men&#039;s Autumn Hooded Fashion Casual Outdoor Sportswear Set',90,90,'9ad245a2f6f1bf7a02ecaaaccf19aca9_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,30,30,18,'plus-size-men-039-s-autumn-hooded-fashion-casual-outdoor-sportswear-set',1,1,'Plus Size Men&#039;s Autumn Hooded Fashion Casual Outdoor Sportswear Set',1),(181,'Vintage Hollow Plus Size All-fitting Set Of Feet Casual Flat Shoes',21,10,'Vintage Hollow Plus Size All-fitting Set Of Feet Casual Flat Shoes','Vintage Hollow Plus Size All-fitting Set Of Feet Casual Flat Shoes',90,90,'3f70b1749f28ac276a3a265d755a55ef_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:15',67,29,30,18,'vintage-hollow-plus-size-all-fitting-set-of-feet-casual-flat-shoes',1,1,'Vintage Hollow Plus Size All-fitting Set Of Feet Casual Flat Shoes',1),(182,'Wireless Microphone Mobile Live Broadcast Camera Radio Interview Recording Mini',21,10,'Wireless Microphone Mobile Live Broadcast Camera Radio Interview Recording Mini Capacitance Lavalier Microphone','Wireless Microphone Mobile Live Broadcast Camera Radio Interview Recording Mini Capacitance Lavalier Microphone',90,90,'5ed435f8d263ff4c6098b96a392035bc_boo_store.jpg',NULL,'2023-03-20','2023-03-20 15:35:14',67,30,30,18,'wireless-microphone-mobile-live-broadcast-camera-radio-interview-recording-mini',1,1,'Wireless Microphone Mobile Live Broadcast Camera Radio Interview Recording Mini Capacitance Lavalier Microphone',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_best_deals`
--

DROP TABLE IF EXISTS `products_best_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_best_deals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_best_deals`
--

LOCK TABLES `products_best_deals` WRITE;
/*!40000 ALTER TABLE `products_best_deals` DISABLE KEYS */;
INSERT INTO `products_best_deals` VALUES (23,168,'2022-10-07 08:01:24',59);
/*!40000 ALTER TABLE `products_best_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_featured`
--

DROP TABLE IF EXISTS `products_featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_featured` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_featured`
--

LOCK TABLES `products_featured` WRITE;
/*!40000 ALTER TABLE `products_featured` DISABLE KEYS */;
INSERT INTO `products_featured` VALUES (19,168,'2022-10-07 08:01:20',59),(20,169,'2022-10-11 08:46:03',62);
/*!40000 ALTER TABLE `products_featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_search_base`
--

DROP TABLE IF EXISTS `products_search_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_search_base` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `search_term` varchar(200) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_search_base`
--

LOCK TABLES `products_search_base` WRITE;
/*!40000 ALTER TABLE `products_search_base` DISABLE KEYS */;
INSERT INTO `products_search_base` VALUES (176,59,'asha','2022-10-07 06:23:46'),(177,59,'asha','2022-10-07 06:58:45'),(178,59,'fff','2022-10-07 07:04:07'),(179,59,'fff','2022-10-07 07:04:50'),(180,59,'fff','2022-10-07 07:06:09'),(181,59,'fff','2022-10-07 07:11:48'),(182,59,'ff','2022-10-07 07:11:53'),(183,59,'fff','2022-10-07 12:01:02'),(184,59,'ff','2022-10-07 12:01:10'),(185,59,'ka','2022-10-07 12:01:12'),(186,59,'kab','2022-10-07 12:01:15'),(187,59,'kaba','2022-10-07 12:01:15'),(188,59,'kab','2022-10-07 12:06:45'),(189,59,'fff','2022-10-07 12:08:35'),(190,59,'ff','2022-10-07 12:08:46'),(191,59,'ka','2022-10-07 12:08:49'),(192,59,'fff','2022-10-07 12:10:08'),(193,59,'ff','2022-10-07 12:10:15'),(194,59,'ka','2022-10-07 12:10:17'),(195,59,'fff','2022-10-07 12:11:16'),(196,59,'ff','2022-10-07 12:11:20'),(197,59,'ka','2022-10-07 12:11:21'),(198,59,'fff','2022-10-07 12:11:35'),(199,59,'ff','2022-10-07 12:11:39'),(200,59,'ka','2022-10-07 12:11:40'),(201,59,'kab','2022-10-07 12:11:42'),(202,59,'kaba','2022-10-07 12:13:48'),(203,59,'kab','2022-10-07 12:15:15'),(204,59,'kaba','2022-10-07 12:15:52'),(205,59,'kabal','2022-10-07 12:16:15'),(206,59,'kabale','2022-10-07 12:16:43'),(207,59,'kabal','2022-10-07 12:16:56'),(208,59,'kabale','2022-10-07 12:17:29'),(209,59,'kabal','2022-10-07 12:17:31'),(210,59,'kabale','2022-10-07 12:18:10'),(211,59,'kabal','2022-10-07 12:18:17'),(212,59,'kaba','2022-10-08 07:17:43'),(213,59,'kab','2022-10-08 07:17:43'),(214,59,'ka','2022-10-08 07:17:44'),(215,59,'ka','2022-10-08 07:17:51'),(216,59,'ka','2022-10-08 07:20:04'),(217,59,'ka','2022-10-08 07:24:25'),(218,59,'kab','2022-10-08 07:24:25'),(219,59,'ka','2022-10-08 07:24:25'),(220,59,'ka','2022-10-08 07:25:07'),(221,59,'kab','2022-10-08 07:25:07'),(222,59,'kaba','2022-10-08 07:25:08'),(223,59,'kaba','2022-10-08 07:25:09'),(224,59,'kaba','2022-10-08 07:25:09'),(225,59,'kaba','2022-10-08 07:25:22'),(226,59,'kabal','2022-10-08 07:25:22'),(227,59,'kabale','2022-10-08 07:31:31'),(228,59,'kabal','2022-10-08 07:32:48'),(229,59,'kaba','2022-10-08 07:32:48'),(230,59,'ka','2022-10-08 08:08:45'),(231,59,'ka','2022-10-08 08:08:47'),(232,59,'ka','2022-10-08 08:08:49'),(233,59,'ka','2022-10-08 08:08:49'),(234,59,'kab','2022-10-08 08:08:49'),(235,59,'kab','2022-10-08 08:08:50'),(236,59,'ka','2022-10-08 08:08:50'),(237,59,'ka','2022-10-08 08:08:51'),(238,59,'ka','2022-10-08 08:08:58'),(239,59,'ka','2022-10-08 08:08:59'),(240,59,'kab','2022-10-08 08:08:59'),(241,59,'kab','2022-10-08 08:09:33'),(242,59,'ka','2022-10-08 08:09:33'),(243,59,'ka','2022-10-08 08:09:33'),(244,59,'ka','2022-10-08 08:09:35'),(245,59,'ka','2022-10-08 08:09:35'),(246,59,'kab','2022-10-08 08:09:35'),(247,59,'ka','2022-10-08 08:12:36'),(248,59,'ka','2022-10-08 08:12:37'),(249,59,'kab','2022-10-08 08:12:37'),(250,59,'ka','2022-10-08 08:15:24'),(251,59,'ka','2022-10-08 08:15:25'),(252,59,'ka','2022-10-08 08:15:26'),(253,59,'ka','2022-10-08 08:15:33'),(254,59,'ka','2022-10-08 08:15:35'),(255,59,'ka','2022-10-08 08:15:35'),(256,59,'kab','2022-10-08 08:15:35'),(257,59,'ka','2022-10-08 08:16:14'),(258,59,'ka','2022-10-08 08:16:14'),(259,59,'kab','2022-10-08 08:16:15'),(260,59,'ka','2022-10-08 08:16:43'),(261,59,'ka','2022-10-08 08:16:44'),(262,59,'kab','2022-10-08 08:16:44'),(263,59,'ka','2022-10-08 08:17:16'),(264,59,'kab','2022-10-08 08:17:16'),(265,59,'ka','2022-10-08 08:17:16'),(266,59,'kab','2022-10-08 08:17:17'),(267,59,'kaba','2022-10-08 08:17:17'),(268,59,'ka','2022-10-08 08:17:29'),(269,59,'ka','2022-10-08 08:17:29'),(270,59,'kab','2022-10-08 08:17:29'),(271,59,'kab','2022-10-08 08:17:51'),(272,59,'ka','2022-10-08 08:17:51'),(273,59,'ka','2022-10-08 08:17:51'),(274,62,'ye','2022-10-11 08:58:38'),(275,62,'yel','2022-10-11 08:58:38'),(276,62,'ye','2022-10-11 08:58:38'),(277,62,'yel','2022-10-11 08:58:41'),(278,62,'yell','2022-10-11 08:58:41'),(279,62,'yello','2022-10-11 08:58:41'),(280,62,'yellow','2022-10-11 08:58:42'),(281,62,'yell','2022-10-11 08:58:43'),(282,62,'yello','2022-10-11 08:58:43'),(283,62,'yellow','2022-10-11 08:59:20'),(284,62,'yellow','2022-10-11 08:59:20'),(285,62,'yellow','2022-10-11 08:59:20'),(286,62,'yellow','2022-10-11 08:59:20'),(287,62,'yellow','2022-10-11 09:01:37'),(288,62,'yellow','2022-10-11 09:01:37'),(289,62,'yellow','2022-10-11 09:01:38'),(290,62,'yellow','2022-10-11 09:02:08'),(291,62,'ma','2022-10-12 19:28:45'),(292,62,'ma','2022-10-13 12:31:31'),(293,62,'ma','2022-10-13 12:31:31'),(294,62,'ma','2022-10-13 12:31:31'),(295,62,'mat','2022-10-13 12:31:32'),(296,62,'ma','2022-10-13 12:31:41'),(297,62,'ma','2022-10-13 12:31:41'),(298,62,'mat','2022-10-13 12:31:41'),(299,62,'mat','2022-10-13 12:31:42'),(300,62,'mato','2022-10-13 12:31:42'),(301,62,'mato','2022-10-13 12:31:43'),(302,62,'mato','2022-10-13 12:31:43'),(303,62,'mato','2022-10-13 12:31:43'),(304,62,'mato','2022-10-13 12:32:06'),(305,NULL,'ma','2022-10-24 11:35:09'),(306,NULL,'ma','2022-10-24 11:35:09'),(307,NULL,'mat','2022-10-24 11:35:09'),(308,NULL,'mat','2022-10-24 11:35:10'),(309,NULL,'mat','2022-10-24 11:35:11'),(310,NULL,'mat','2022-10-24 11:35:11'),(311,NULL,'mat','2022-10-24 11:36:10'),(312,NULL,'mat','2022-10-24 11:36:23'),(313,NULL,'mat','2022-10-24 11:36:52'),(314,NULL,'mat','2022-10-24 11:37:01'),(315,NULL,'mat','2022-10-24 11:37:52'),(316,NULL,'mat','2022-10-24 11:38:06'),(317,NULL,'mat','2022-10-24 11:38:19');
/*!40000 ALTER TABLE `products_search_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_searched`
--

DROP TABLE IF EXISTS `products_searched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_searched` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int DEFAULT NULL,
  `product` int NOT NULL,
  `search_query` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=877 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_searched`
--

LOCK TABLES `products_searched` WRITE;
/*!40000 ALTER TABLE `products_searched` DISABLE KEYS */;
INSERT INTO `products_searched` VALUES (752,59,168,185),(753,59,168,186),(754,59,168,187),(755,59,168,188),(756,59,168,191),(757,59,168,194),(758,59,168,197),(759,59,168,200),(760,59,168,201),(761,59,168,202),(762,59,168,203),(763,59,168,204),(764,59,168,205),(765,59,168,206),(766,59,168,207),(767,59,168,208),(768,59,168,209),(769,59,168,210),(770,59,168,211),(771,59,168,213),(772,59,168,212),(773,59,168,214),(774,59,168,215),(775,59,168,216),(776,59,168,217),(777,59,168,218),(778,59,168,219),(779,59,168,220),(780,59,168,221),(781,59,168,222),(782,59,168,223),(783,59,168,224),(784,59,168,225),(785,59,168,226),(786,59,168,227),(787,59,168,228),(788,59,168,229),(789,59,168,230),(790,59,168,231),(791,59,168,232),(792,59,168,233),(793,59,168,234),(794,59,168,235),(795,59,168,236),(796,59,168,237),(797,59,168,238),(798,59,168,239),(799,59,168,240),(800,59,168,241),(801,59,168,242),(802,59,168,243),(803,59,168,244),(804,59,168,245),(805,59,168,246),(806,59,168,247),(807,59,168,248),(808,59,168,249),(809,59,168,250),(810,59,168,251),(811,59,168,252),(812,59,168,253),(813,59,168,254),(814,59,168,255),(815,59,168,256),(816,59,168,257),(817,59,168,258),(818,59,168,259),(819,59,168,260),(820,59,168,261),(821,59,168,262),(822,59,168,263),(823,59,168,264),(824,59,168,265),(825,59,168,266),(826,59,168,267),(827,59,168,268),(828,59,168,269),(829,59,168,270),(830,59,168,271),(831,59,168,272),(832,59,168,273),(833,62,169,274),(834,62,169,275),(835,62,169,276),(836,62,169,277),(837,62,169,278),(838,62,169,279),(839,62,169,280),(840,62,169,281),(841,62,169,282),(842,62,169,283),(843,62,169,284),(844,62,169,285),(845,62,169,286),(846,62,169,287),(847,62,169,288),(848,62,169,289),(849,62,169,290),(850,62,168,291),(851,62,168,292),(852,62,168,293),(853,62,168,294),(854,62,168,295),(855,62,168,296),(856,62,168,297),(857,62,168,298),(858,62,168,299),(859,62,168,300),(860,62,168,301),(861,62,168,302),(862,62,168,303),(863,62,168,304),(864,NULL,168,305),(865,NULL,168,306),(866,NULL,168,307),(867,NULL,168,308),(868,NULL,168,309),(869,NULL,168,310),(870,NULL,168,311),(871,NULL,168,312),(872,NULL,168,313),(873,NULL,168,314),(874,NULL,168,315),(875,NULL,168,316),(876,NULL,168,317);
/*!40000 ALTER TABLE `products_searched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_special_offers`
--

DROP TABLE IF EXISTS `products_special_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_special_offers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_special_offers`
--

LOCK TABLES `products_special_offers` WRITE;
/*!40000 ALTER TABLE `products_special_offers` DISABLE KEYS */;
INSERT INTO `products_special_offers` VALUES (25,168,'2022-10-07 08:01:13',59),(26,169,'2022-10-11 08:46:51',62);
/*!40000 ALTER TABLE `products_special_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_view_location`
--

DROP TABLE IF EXISTS `products_view_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_view_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_view_id` int NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `region` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21926 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_view_location`
--

LOCK TABLES `products_view_location` WRITE;
/*!40000 ALTER TABLE `products_view_location` DISABLE KEYS */;
INSERT INTO `products_view_location` VALUES (21711,21711,'Unknown','Unknown','Unknown'),(21712,21712,'Unknown','Unknown','Unknown'),(21713,21713,'Unknown','Unknown','Unknown'),(21714,21714,'Unknown','Unknown','Unknown'),(21715,21715,'Unknown','Unknown','Unknown'),(21716,21716,'Unknown','Unknown','Unknown'),(21717,21717,'Unknown','Unknown','Unknown'),(21718,21718,'Unknown','Unknown','Unknown'),(21719,21719,'Unknown','Unknown','Unknown'),(21720,21720,'Unknown','Unknown','Unknown'),(21721,21721,'Unknown','Unknown','Unknown'),(21722,21722,'Unknown','Unknown','Unknown'),(21723,21723,'Unknown','Unknown','Unknown'),(21724,21724,'Unknown','Unknown','Unknown'),(21725,21725,'Unknown','Unknown','Unknown'),(21726,21726,'Unknown','Unknown','Unknown'),(21727,21727,'Unknown','Unknown','Unknown'),(21728,21728,'Unknown','Unknown','Unknown'),(21729,21729,'Unknown','Unknown','Unknown'),(21730,21730,'Unknown','Unknown','Unknown'),(21731,21731,'Unknown','Unknown','Unknown'),(21732,21732,'Unknown','Unknown','Unknown'),(21733,21733,'Unknown','Unknown','Unknown'),(21734,21734,'Unknown','Unknown','Unknown'),(21735,21735,'Unknown','Unknown','Unknown'),(21736,21736,'Unknown','Unknown','Unknown'),(21737,21737,'Unknown','Unknown','Unknown'),(21738,21738,'Unknown','Unknown','Unknown'),(21739,21739,'Unknown','Unknown','Unknown'),(21740,21740,'Unknown','Unknown','Unknown'),(21741,21741,'Unknown','Unknown','Unknown'),(21742,21742,'Unknown','Unknown','Unknown'),(21743,21743,'Unknown','Unknown','Unknown'),(21744,21744,'Unknown','Unknown','Unknown'),(21745,21745,'Unknown','Unknown','Unknown'),(21746,21746,'Unknown','Unknown','Unknown'),(21747,21747,'Unknown','Unknown','Unknown'),(21748,21748,'Unknown','Unknown','Unknown'),(21749,21749,'Unknown','Unknown','Unknown'),(21750,21750,'Unknown','Unknown','Unknown'),(21751,21751,'Unknown','Unknown','Unknown'),(21752,21752,'Unknown','Unknown','Unknown'),(21753,21753,'Unknown','Unknown','Unknown'),(21754,21754,'Unknown','Unknown','Unknown'),(21755,21755,'Unknown','Unknown','Unknown'),(21756,21756,'Unknown','Unknown','Unknown'),(21757,21757,'Unknown','Unknown','Unknown'),(21758,21758,'Unknown','Unknown','Unknown'),(21759,21759,'Unknown','Unknown','Unknown'),(21760,21760,'Unknown','Unknown','Unknown'),(21761,21761,'Unknown','Unknown','Unknown'),(21762,21762,'Unknown','Unknown','Unknown'),(21763,21763,'Unknown','Unknown','Unknown'),(21764,21764,'Unknown','Unknown','Unknown'),(21765,21765,'Unknown','Unknown','Unknown'),(21766,21766,'Unknown','Unknown','Unknown'),(21767,21767,'Unknown','Unknown','Unknown'),(21768,21768,'Unknown','Unknown','Unknown'),(21769,21769,'Unknown','Unknown','Unknown'),(21770,21770,'Unknown','Unknown','Unknown'),(21771,21771,'Unknown','Unknown','Unknown'),(21772,21772,'Unknown','Unknown','Unknown'),(21773,21773,'Unknown','Unknown','Unknown'),(21774,21774,'Unknown','Unknown','Unknown'),(21775,21775,'Unknown','Unknown','Unknown'),(21776,21776,'Unknown','Unknown','Unknown'),(21777,21777,'Unknown','Unknown','Unknown'),(21778,21778,'Unknown','Unknown','Unknown'),(21779,21779,'Unknown','Unknown','Unknown'),(21780,21780,'Unknown','Unknown','Unknown'),(21781,21781,'Unknown','Unknown','Unknown'),(21782,21782,'Unknown','Unknown','Unknown'),(21783,21783,'Unknown','Unknown','Unknown'),(21784,21784,'Unknown','Unknown','Unknown'),(21785,21785,'Unknown','Unknown','Unknown'),(21786,21786,'Unknown','Unknown','Unknown'),(21787,21787,'Unknown','Unknown','Unknown'),(21788,21788,'Unknown','Unknown','Unknown'),(21789,21789,'Unknown','Unknown','Unknown'),(21790,21790,'Unknown','Unknown','Unknown'),(21791,21791,'Unknown','Unknown','Unknown'),(21792,21792,'Unknown','Unknown','Unknown'),(21793,21793,'Unknown','Unknown','Unknown'),(21794,21794,'Unknown','Unknown','Unknown'),(21795,21795,'Unknown','Unknown','Unknown'),(21796,21796,'Unknown','Unknown','Unknown'),(21797,21797,'Unknown','Unknown','Unknown'),(21798,21798,'Unknown','Unknown','Unknown'),(21799,21799,'Unknown','Unknown','Unknown'),(21800,21800,'Unknown','Unknown','Unknown'),(21801,21801,'Unknown','Unknown','Unknown'),(21802,21802,'Unknown','Unknown','Unknown'),(21803,21803,'Unknown','Unknown','Unknown'),(21804,21804,'Unknown','Unknown','Unknown'),(21805,21805,'Unknown','Unknown','Unknown'),(21806,21806,'Unknown','Unknown','Unknown'),(21807,21807,'Unknown','Unknown','Unknown'),(21808,21808,'Unknown','Unknown','Unknown'),(21809,21809,'Unknown','Unknown','Unknown'),(21810,21810,'Unknown','Unknown','Unknown'),(21811,21811,'Unknown','Unknown','Unknown'),(21812,21812,'Unknown','Unknown','Unknown'),(21813,21813,'Unknown','Unknown','Unknown'),(21814,21814,'Unknown','Unknown','Unknown'),(21815,21815,'Unknown','Unknown','Unknown'),(21816,21816,'Unknown','Unknown','Unknown'),(21817,21817,'Unknown','Unknown','Unknown'),(21818,21818,'Unknown','Unknown','Unknown'),(21819,21819,'Unknown','Unknown','Unknown'),(21820,21820,'Unknown','Unknown','Unknown'),(21821,21821,'Unknown','Unknown','Unknown'),(21822,21822,'Unknown','Unknown','Unknown'),(21823,21823,'Unknown','Unknown','Unknown'),(21824,21824,'Unknown','Unknown','Unknown'),(21825,21825,'Unknown','Unknown','Unknown'),(21826,21826,'Unknown','Unknown','Unknown'),(21827,21827,'Unknown','Unknown','Unknown'),(21828,21828,'Unknown','Unknown','Unknown'),(21829,21829,'Unknown','Unknown','Unknown'),(21830,21830,'Unknown','Unknown','Unknown'),(21831,21831,'Unknown','Unknown','Unknown'),(21832,21832,'Unknown','Unknown','Unknown'),(21833,21833,'Unknown','Unknown','Unknown'),(21834,21834,'Unknown','Unknown','Unknown'),(21835,21835,'Unknown','Unknown','Unknown'),(21836,21836,'Unknown','Unknown','Unknown'),(21837,21837,'Unknown','Unknown','Unknown'),(21838,21838,'Unknown','Unknown','Unknown'),(21839,21839,'Unknown','Unknown','Unknown'),(21840,21840,'Unknown','Unknown','Unknown'),(21841,21841,'Unknown','Unknown','Unknown'),(21842,21842,'Unknown','Unknown','Unknown'),(21843,21843,'Unknown','Unknown','Unknown'),(21844,21844,'Unknown','Unknown','Unknown'),(21845,21845,'Unknown','Unknown','Unknown'),(21846,21846,'Unknown','Unknown','Unknown'),(21847,21847,'Unknown','Unknown','Unknown'),(21848,21848,'Unknown','Unknown','Unknown'),(21849,21849,'Unknown','Unknown','Unknown'),(21850,21850,'Unknown','Unknown','Unknown'),(21851,21851,'Unknown','Unknown','Unknown'),(21852,21852,'Unknown','Unknown','Unknown'),(21853,21853,'Unknown','Unknown','Unknown'),(21854,21854,'Unknown','Unknown','Unknown'),(21855,21855,'Unknown','Unknown','Unknown'),(21856,21856,'Unknown','Unknown','Unknown'),(21857,21857,'Unknown','Unknown','Unknown'),(21858,21858,'Unknown','Unknown','Unknown'),(21859,21859,'Unknown','Unknown','Unknown'),(21860,21860,'Unknown','Unknown','Unknown'),(21861,21861,'Unknown','Unknown','Unknown'),(21862,21862,'Unknown','Unknown','Unknown'),(21863,21863,'Unknown','Unknown','Unknown'),(21864,21864,'Unknown','Unknown','Unknown'),(21865,21865,'Unknown','Unknown','Unknown'),(21866,21866,'Unknown','Unknown','Unknown'),(21867,21867,'Unknown','Unknown','Unknown'),(21868,21868,'Unknown','Unknown','Unknown'),(21869,21869,'Unknown','Unknown','Unknown'),(21870,21870,'Unknown','Unknown','Unknown'),(21871,21871,'Unknown','Unknown','Unknown'),(21872,21872,'Unknown','Unknown','Unknown'),(21873,21873,'Unknown','Unknown','Unknown'),(21874,21874,'Unknown','Unknown','Unknown'),(21875,21875,'Unknown','Unknown','Unknown'),(21876,21876,'Unknown','Unknown','Unknown'),(21877,21877,'Unknown','Unknown','Unknown'),(21878,21878,'Unknown','Unknown','Unknown'),(21879,21879,'Unknown','Unknown','Unknown'),(21880,21880,'Unknown','Unknown','Unknown'),(21881,21881,'Unknown','Unknown','Unknown'),(21882,21882,'Unknown','Unknown','Unknown'),(21883,21883,'Unknown','Unknown','Unknown'),(21884,21884,'Unknown','Unknown','Unknown'),(21885,21885,'Unknown','Unknown','Unknown'),(21886,21886,'Unknown','Unknown','Unknown'),(21887,21887,'Unknown','Unknown','Unknown'),(21888,21888,'Unknown','Unknown','Unknown'),(21889,21889,'Unknown','Unknown','Unknown'),(21890,21890,'Unknown','Unknown','Unknown'),(21891,21891,'Unknown','Unknown','Unknown'),(21892,21892,'Unknown','Unknown','Unknown'),(21893,21893,'Unknown','Unknown','Unknown'),(21894,21894,'Unknown','Unknown','Unknown'),(21895,21895,'Unknown','Unknown','Unknown'),(21896,21896,'Unknown','Unknown','Unknown'),(21897,21897,'Unknown','Unknown','Unknown'),(21898,21898,'Unknown','Unknown','Unknown'),(21899,21899,'Unknown','Unknown','Unknown'),(21900,21900,'Unknown','Unknown','Unknown'),(21901,21901,'Unknown','Unknown','Unknown'),(21902,21902,'Unknown','Unknown','Unknown'),(21903,21903,'Unknown','Unknown','Unknown'),(21904,21904,'Unknown','Unknown','Unknown'),(21905,21905,'Unknown','Unknown','Unknown'),(21906,21906,'Unknown','Unknown','Unknown'),(21907,21907,'Unknown','Unknown','Unknown'),(21908,21908,'Unknown','Unknown','Unknown'),(21909,21909,'Unknown','Unknown','Unknown'),(21910,21910,'Unknown','Unknown','Unknown'),(21911,21911,'Unknown','Unknown','Unknown'),(21912,21912,'Unknown','Unknown','Unknown'),(21913,21913,'Unknown','Unknown','Unknown'),(21914,21914,'Unknown','Unknown','Unknown'),(21915,21915,'Unknown','Unknown','Unknown'),(21916,21916,'Unknown','Unknown','Unknown'),(21917,21917,'Unknown','Unknown','Unknown'),(21918,21918,'Unknown','Unknown','Unknown'),(21919,21919,'Unknown','Unknown','Unknown'),(21920,21920,'Unknown','Unknown','Unknown'),(21921,21921,'Unknown','Unknown','Unknown'),(21922,21922,'Unknown','Unknown','Unknown'),(21923,21923,'Unknown','Unknown','Unknown'),(21924,21924,'Unknown','Unknown','Unknown'),(21925,21925,'Unknown','Unknown','Unknown');
/*!40000 ALTER TABLE `products_view_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_viewed`
--

DROP TABLE IF EXISTS `products_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_viewed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `user` int DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21926 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_viewed`
--

LOCK TABLES `products_viewed` WRITE;
/*!40000 ALTER TABLE `products_viewed` DISABLE KEYS */;
INSERT INTO `products_viewed` VALUES (21711,168,59,'2022-10-08 07:31:42'),(21712,168,59,'2022-10-08 07:32:56'),(21713,168,59,'2022-10-08 07:37:33'),(21714,168,59,'2022-10-08 07:39:45'),(21715,168,59,'2022-10-08 07:40:58'),(21716,168,59,'2022-10-08 08:13:28'),(21717,168,59,'2022-10-08 08:17:13'),(21718,168,59,'2022-10-08 08:17:26'),(21719,168,0,'2022-10-10 06:26:10'),(21720,168,0,'2022-10-10 06:27:00'),(21721,168,0,'2022-10-10 06:27:55'),(21722,168,0,'2022-10-10 06:28:14'),(21723,168,0,'2022-10-10 06:28:36'),(21724,168,0,'2022-10-10 06:30:52'),(21725,168,62,'2022-10-10 10:46:05'),(21726,168,62,'2022-10-11 07:08:47'),(21727,168,62,'2022-10-11 07:09:58'),(21728,168,62,'2022-10-11 07:11:32'),(21729,168,62,'2022-10-11 07:11:35'),(21730,168,62,'2022-10-11 07:11:48'),(21731,168,62,'2022-10-11 07:12:04'),(21732,168,62,'2022-10-11 07:12:49'),(21733,168,62,'2022-10-11 07:13:04'),(21734,168,62,'2022-10-11 07:13:14'),(21735,168,62,'2022-10-11 07:13:50'),(21736,168,62,'2022-10-11 07:14:15'),(21737,168,62,'2022-10-11 07:16:22'),(21738,168,62,'2022-10-11 07:18:51'),(21739,168,62,'2022-10-11 07:19:14'),(21740,168,62,'2022-10-11 07:19:29'),(21741,168,62,'2022-10-11 07:19:45'),(21742,168,62,'2022-10-11 07:20:29'),(21743,168,62,'2022-10-11 07:20:55'),(21744,168,62,'2022-10-11 07:21:42'),(21745,168,62,'2022-10-11 07:22:05'),(21746,168,62,'2022-10-11 07:22:35'),(21747,168,62,'2022-10-11 07:22:55'),(21748,168,62,'2022-10-11 07:23:22'),(21749,168,62,'2022-10-11 07:24:32'),(21750,168,62,'2022-10-11 07:25:27'),(21751,168,62,'2022-10-11 07:27:37'),(21752,168,62,'2022-10-11 08:42:06'),(21753,169,62,'2022-10-11 09:18:39'),(21754,168,62,'2022-10-11 09:19:15'),(21755,168,62,'2022-10-11 09:20:47'),(21756,168,62,'2022-10-11 09:21:15'),(21757,168,62,'2022-10-11 09:21:27'),(21758,168,62,'2022-10-11 09:21:31'),(21759,168,62,'2022-10-11 09:21:37'),(21760,168,62,'2022-10-11 09:21:42'),(21761,168,62,'2022-10-11 09:23:35'),(21762,168,62,'2022-10-11 09:23:41'),(21763,168,62,'2022-10-11 09:24:20'),(21764,168,62,'2022-10-11 09:25:29'),(21765,168,62,'2022-10-11 09:26:10'),(21766,168,62,'2022-10-11 09:26:54'),(21767,168,62,'2022-10-11 09:27:29'),(21768,168,62,'2022-10-11 09:27:53'),(21769,168,62,'2022-10-11 09:28:29'),(21770,168,62,'2022-10-11 09:29:11'),(21771,168,62,'2022-10-11 09:29:55'),(21772,168,62,'2022-10-11 09:30:27'),(21773,168,62,'2022-10-11 09:31:04'),(21774,168,62,'2022-10-11 09:31:40'),(21775,168,62,'2022-10-11 09:32:25'),(21776,168,62,'2022-10-11 09:32:34'),(21777,168,62,'2022-10-11 09:33:09'),(21778,168,62,'2022-10-11 09:37:08'),(21779,168,62,'2022-10-11 09:37:19'),(21780,168,62,'2022-10-11 09:37:57'),(21781,168,62,'2022-10-11 09:38:44'),(21782,168,62,'2022-10-11 09:39:16'),(21783,168,62,'2022-10-11 09:39:36'),(21784,168,62,'2022-10-11 09:41:03'),(21785,168,62,'2022-10-11 09:41:19'),(21786,168,62,'2022-10-11 09:41:50'),(21787,168,62,'2022-10-11 09:42:13'),(21788,168,62,'2022-10-11 09:43:54'),(21789,168,62,'2022-10-11 09:44:46'),(21790,169,62,'2022-10-11 09:45:11'),(21791,168,62,'2022-10-11 09:47:38'),(21792,168,62,'2022-10-11 09:47:58'),(21793,168,62,'2022-10-11 09:48:03'),(21794,168,62,'2022-10-11 09:48:06'),(21795,168,62,'2022-10-11 09:48:14'),(21796,168,62,'2022-10-11 09:48:21'),(21797,168,62,'2022-10-11 09:48:26'),(21798,168,62,'2022-10-11 09:48:45'),(21799,168,62,'2022-10-11 09:50:19'),(21800,168,62,'2022-10-11 09:50:31'),(21801,168,62,'2022-10-11 09:50:37'),(21802,168,62,'2022-10-11 09:50:49'),(21803,169,62,'2022-10-11 09:51:05'),(21804,169,62,'2022-10-11 09:51:56'),(21805,169,62,'2022-10-11 09:57:33'),(21806,169,62,'2022-10-11 10:00:42'),(21807,169,62,'2022-10-13 10:13:03'),(21808,169,62,'2022-10-13 10:14:30'),(21809,169,62,'2022-10-13 10:18:05'),(21810,169,62,'2022-10-13 10:20:09'),(21811,169,62,'2022-10-13 12:09:17'),(21812,169,62,'2022-10-13 12:10:14'),(21813,169,62,'2022-10-13 12:10:32'),(21814,169,62,'2022-10-13 12:10:40'),(21815,169,62,'2022-10-13 12:10:51'),(21816,169,62,'2022-10-13 12:11:17'),(21817,168,62,'2022-10-13 12:31:34'),(21818,168,62,'2022-10-18 10:28:14'),(21819,169,62,'2022-10-19 11:28:09'),(21820,169,62,'2022-10-19 11:29:31'),(21821,169,0,'2022-10-24 09:33:05'),(21822,169,0,'2022-10-24 10:54:10'),(21823,168,0,'2022-11-06 10:38:58'),(21824,168,63,'2022-11-08 12:09:43'),(21825,168,63,'2022-11-08 13:41:06'),(21826,168,63,'2022-11-12 08:40:20'),(21827,168,63,'2022-11-12 08:41:41'),(21828,168,63,'2022-11-12 08:42:27'),(21829,168,63,'2022-11-12 08:43:42'),(21830,168,63,'2022-11-12 08:44:01'),(21831,168,63,'2022-11-12 08:45:02'),(21832,168,63,'2022-11-12 08:45:20'),(21833,169,63,'2022-11-12 10:13:05'),(21834,169,63,'2022-11-12 10:13:13'),(21835,169,63,'2022-11-12 10:14:31'),(21836,169,63,'2022-11-12 10:14:37'),(21837,169,63,'2022-11-12 10:15:15'),(21838,169,63,'2022-11-12 10:15:39'),(21839,169,63,'2022-11-12 10:15:49'),(21840,169,63,'2022-11-12 10:16:45'),(21841,169,63,'2022-11-12 10:16:53'),(21842,169,63,'2022-11-12 10:17:39'),(21843,169,63,'2022-11-12 10:17:42'),(21844,169,63,'2022-11-12 10:19:38'),(21845,169,63,'2022-11-12 10:19:43'),(21846,169,63,'2022-11-12 10:20:05'),(21847,169,63,'2022-11-15 16:53:54'),(21848,168,0,'2023-03-20 12:04:09'),(21849,168,0,'2023-03-20 12:04:14'),(21850,168,0,'2023-03-20 12:14:26'),(21851,168,0,'2023-03-20 12:14:31'),(21852,168,0,'2023-03-20 12:17:19'),(21853,168,0,'2023-03-20 12:17:23'),(21854,168,0,'2023-03-20 12:17:38'),(21855,168,0,'2023-03-20 12:17:40'),(21856,168,0,'2023-03-20 12:17:54'),(21857,168,0,'2023-03-20 12:17:55'),(21858,168,0,'2023-03-20 12:18:05'),(21859,168,0,'2023-03-20 12:18:06'),(21860,168,0,'2023-03-20 12:18:19'),(21861,168,0,'2023-03-20 12:18:22'),(21862,168,0,'2023-03-20 12:29:30'),(21863,168,0,'2023-03-20 12:29:32'),(21864,168,0,'2023-03-20 12:29:50'),(21865,168,0,'2023-03-20 12:29:55'),(21866,168,0,'2023-03-20 12:30:09'),(21867,168,0,'2023-03-20 12:30:11'),(21868,168,0,'2023-03-20 12:31:14'),(21869,168,0,'2023-03-20 12:31:15'),(21870,168,0,'2023-03-20 12:34:48'),(21871,168,0,'2023-03-20 12:34:50'),(21872,168,0,'2023-03-20 12:36:32'),(21873,168,0,'2023-03-20 12:36:36'),(21874,168,0,'2023-03-20 12:38:07'),(21875,168,0,'2023-03-20 12:38:10'),(21876,168,0,'2023-03-20 12:38:34'),(21877,168,0,'2023-03-20 12:38:38'),(21878,168,0,'2023-03-20 12:39:16'),(21879,168,0,'2023-03-20 12:41:16'),(21880,168,0,'2023-03-20 12:41:39'),(21881,168,0,'2023-03-20 12:43:30'),(21882,168,0,'2023-03-20 12:43:33'),(21883,169,0,'2023-03-20 12:44:18'),(21884,169,0,'2023-03-20 12:44:21'),(21885,169,0,'2023-03-20 12:50:16'),(21886,169,0,'2023-03-20 12:50:19'),(21887,168,0,'2023-03-20 12:51:31'),(21888,169,0,'2023-03-20 12:53:07'),(21889,169,0,'2023-03-20 12:54:08'),(21890,169,0,'2023-03-20 12:54:10'),(21891,169,0,'2023-03-20 12:56:26'),(21892,169,0,'2023-03-20 12:56:31'),(21893,168,0,'2023-03-20 12:57:06'),(21894,169,0,'2023-03-20 12:58:44'),(21895,169,0,'2023-03-20 12:58:51'),(21896,169,0,'2023-03-20 12:59:30'),(21897,169,0,'2023-03-20 12:59:35'),(21898,169,0,'2023-03-20 13:00:59'),(21899,169,0,'2023-03-20 13:01:02'),(21900,169,0,'2023-03-20 13:01:28'),(21901,169,0,'2023-03-20 13:01:39'),(21902,169,0,'2023-03-20 13:03:16'),(21903,169,0,'2023-03-20 13:03:25'),(21904,169,0,'2023-03-20 13:03:29'),(21905,169,0,'2023-03-20 13:03:31'),(21906,169,0,'2023-03-20 13:05:29'),(21907,169,0,'2023-03-20 13:05:31'),(21908,169,0,'2023-03-20 13:06:51'),(21909,169,0,'2023-03-20 13:07:04'),(21910,169,0,'2023-03-20 13:08:00'),(21911,169,0,'2023-03-20 13:08:03'),(21912,169,0,'2023-03-20 13:12:32'),(21913,169,0,'2023-03-20 13:12:35'),(21914,169,0,'2023-03-20 13:13:00'),(21915,169,0,'2023-03-20 13:13:03'),(21916,169,0,'2023-03-20 13:13:40'),(21917,169,0,'2023-03-20 13:13:42'),(21918,169,0,'2023-03-20 13:20:56'),(21919,169,0,'2023-03-20 13:20:59'),(21920,169,0,'2023-03-20 13:26:47'),(21921,169,0,'2023-03-20 13:26:50'),(21922,169,0,'2023-03-20 13:27:02'),(21923,169,0,'2023-03-20 13:27:03'),(21924,169,0,'2023-03-20 13:36:34'),(21925,169,0,'2023-03-20 13:36:37');
/*!40000 ALTER TABLE `products_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_requests`
--

DROP TABLE IF EXISTS `supplier_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `date_requested` date NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `business_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `address` tinytext NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `items_sold` tinytext NOT NULL,
  `district` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `business_type` varchar(50) NOT NULL DEFAULT 'Whole sale',
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_requests`
--

LOCK TABLES `supplier_requests` WRITE;
/*!40000 ALTER TABLE `supplier_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_charge`
--

DROP TABLE IF EXISTS `tx_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tx_charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `charge` float NOT NULL,
  `_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_charge`
--

LOCK TABLES `tx_charge` WRITE;
/*!40000 ALTER TABLE `tx_charge` DISABLE KEYS */;
INSERT INTO `tx_charge` VALUES (1,3,'2022-10-11 08:14:57');
/*!40000 ALTER TABLE `tx_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` int NOT NULL,
  `user` int NOT NULL,
  `date_added` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (51,168,59,'2022-10-08',1),(52,168,62,'2022-10-13',1),(53,169,62,'2022-10-13',1),(58,169,63,'2022-11-08',1),(59,168,63,'2022-11-08',1),(60,58,63,'2022-11-08',1),(61,59,63,'2022-11-08',1);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-20 18:40:07
