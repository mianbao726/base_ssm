CREATE DATABASE  IF NOT EXISTS `man` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `man`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: man
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
-- Table structure for table `man_user`
--

DROP TABLE IF EXISTS `man_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(4) NOT NULL,
  `del_flag` varchar(2) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_user`
--

LOCK TABLES `man_user` WRITE;
/*!40000 ALTER TABLE `man_user` DISABLE KEYS */;
INSERT INTO `man_user` VALUES (1,'2','2',3,'0',NULL,'2016-04-02 07:48:41'),(2,'sunny','sfasgfaf',24,'0',NULL,'2016-04-02 06:29:28'),(3,'sunny','sfasgfaf',24,'0',NULL,'2016-04-02 06:31:02'),(4,'sunny','sfasgfaf',24,'1',NULL,'2016-04-02 07:49:53'),(5,'sunny','sfasgfaf',24,'0',NULL,'2016-04-02 06:31:46'),(6,'sunny','sfasgfaf',24,'0',NULL,NULL),(7,'sunny','sfasgfaf',24,'0',NULL,NULL),(8,'sunny','sfasgfaf',24,'0',NULL,NULL),(9,'sunny','sfasgfaf',24,'0',NULL,NULL),(10,'sunny','sfasgfaf',24,'0',NULL,NULL),(11,'sunny','sfasgfaf',24,'1',NULL,'2016-04-04 22:44:18'),(12,'sunny','sfasgfaf',24,'0',NULL,NULL),(13,'sunny','sfasgfaf',24,'0',NULL,NULL),(14,'5','5',5,'1','2016-04-02 07:08:02','2016-04-04 22:23:05'),(15,'33','333',333,'0','2016-04-02 07:44:35',NULL),(16,'e','445e',532,'0','2016-04-02 07:49:57','2016-04-02 07:50:14'),(17,'12','2',3,'0','2016-04-04 21:48:30',NULL),(18,'33','22',33,'0','2016-04-04 22:23:42',NULL),(19,'mnkk','nmkk',886,'0','2016-04-04 22:39:15','2016-04-04 22:39:30'),(20,'似懂非懂','aaaaaa',12,'0','2016-04-04 22:43:47',NULL),(21,'fd','d',23,'0','2016-04-04 23:15:12',NULL),(22,'123','13',23,'0','2016-04-04 23:15:18',NULL),(23,'123','123',1,'0','2016-04-04 23:52:36',NULL);
/*!40000 ALTER TABLE `man_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'man'
--

--
-- Dumping routines for database 'man'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  0:51:17
