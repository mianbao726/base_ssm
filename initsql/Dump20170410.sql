-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: xx
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `sjlr_package`
--

DROP TABLE IF EXISTS `sjlr_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sjlr_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL COMMENT '0 个人  1 银行  2 企业  3债务转让',
  `status` varchar(45) DEFAULT '0' COMMENT '0 初始   1 被接收  2已完成',
  `name` varchar(450) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `address` varchar(450) DEFAULT NULL,
  `s_date` date DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `del_flag` varchar(45) DEFAULT '0',
  `serial_id` varchar(45) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `targetname` varchar(450) DEFAULT NULL,
  `craeted_at` timestamp NULL DEFAULT NULL,
  `pic_uuid` varchar(45) DEFAULT NULL,
  `area` varchar(450) DEFAULT NULL COMMENT '0沈河 1和平 2皇姑 3铁西 4大东 5东陵 6于洪 7沈北新区 8浑南新区 9苏家屯区 10其他地区',
  `detial` varchar(450) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `pay_amount` varchar(45) DEFAULT NULL,
  `c2_1` varchar(450) DEFAULT NULL,
  `c2_2` varchar(450) DEFAULT NULL,
  `c2_3` varchar(450) DEFAULT NULL,
  `c2_4` varchar(450) DEFAULT NULL,
  `c2_5` varchar(450) DEFAULT NULL,
  `c3_1` varchar(450) DEFAULT NULL,
  `c3_2` varchar(450) DEFAULT NULL,
  `c3_3` varchar(450) DEFAULT NULL,
  `c2_1_title` varchar(45) DEFAULT NULL,
  `c2_2_title` varchar(45) DEFAULT NULL,
  `c2_3_title` varchar(45) DEFAULT NULL,
  `c2_4_title` varchar(45) DEFAULT NULL,
  `c2_5_title` varchar(45) DEFAULT NULL,
  `c3_1_title` varchar(45) DEFAULT NULL,
  `c3_2_title` varchar(45) DEFAULT NULL,
  `c3_3_title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sjlr_package`
--

LOCK TABLES `sjlr_package` WRITE;
/*!40000 ALTER TABLE `sjlr_package` DISABLE KEYS */;
INSERT INTO `sjlr_package` VALUES (1,'0','0','张先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8c7','2','沈阳皇姑区昆山西路88号','2017-03-01','2017-03-02','2017-03-10','0','SYGR1251488283531525',NULL,NULL,'2017-01-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','1','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'0','0','李先生 欠款六个月年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8c6','63','沈阳皇姑区长江街40号','2017-03-01','2017-03-02','2017-03-10','0','SYGR1251488283531525',NULL,NULL,'2017-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','2','张先生 欠2122款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚','1','223',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'0','0','刘先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8c1','45','沈阳皇姑区昆山西路88号','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2016-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','3','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'0','0','赵先生 欠款三年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8cs','4','昆山西路88号 ','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2016-03-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','4','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'0','0','王先生 欠款二十天 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8cg','7','沈阳皇姑区昆山西路88号','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2016-04-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','5','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'0','0','邵先生 欠款六年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8c3','12','皇姑区长江街105号','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2016-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','6','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'0','0','浩先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8c4','15','沈阳皇姑区昆山西路88号','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2016-05-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','7','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'0','0','福先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8c5','18','皇姑区长江街105号','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2016-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','8','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'0','0','张先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-d5fc1279f8c6','21','皇姑区长江街105号','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2017-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','8','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'0','0','总先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8cn','25','昆山西路88号 ','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2017-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','9','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'0','0','张先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8cm','15','昆山西路88号 ','2017-03-01','2017-03-02','2017-02-28','0','SYGR1251488283531525',NULL,NULL,'2017-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','10','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'0','1','龙先生 欠款二十余年 急待解决  酬劳优厚','41d91eed-7fc5-47d2-a6d5-85fc1279f8ck','1555','沈阳皇姑区昆山西路88号','2017-03-01','2017-03-02','2017-03-10','0','SYGR1251488283531525',100,'1***8','2017-02-28 12:05:31','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd','1','张先生 欠款二十沈阳皇姑区昆山西路88号余年 急待解决  酬劳优厚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a11','2','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-03-10','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','2','阿的','1','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'1','0','招商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a12','22','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','3','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a13','12','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','4','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'1','0','招商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a14','33','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','5','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a15','223','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','6','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'1','0','网商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a16','41','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','7','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'1','0','招商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a17','33','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','8','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a18','21','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','9','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'1','0','网商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a19','19','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','10','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1a','17','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','1','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1b','15','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','3','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'1','0','招商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1c','13','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','2','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1d','11','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','4','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'1','0','网商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1e','8','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','5','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'1','0','招商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1f','6','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','6','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1g','4','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','7','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'1','0','网商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1h','3','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','8','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'1','0','广发银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1i','2','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','9','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'1','0','招商银行 拖欠李某保险费用 急！','0cc94455-9d90-4394-82b2-91d174d49a1j','26','和平北大街34号344-23-1','2017-02-28','2017-03-09','2017-02-28','0','SYGR1251488284263587',NULL,NULL,'2017-02-28 12:17:43','a613d4a7-3f5e-4c20-9ee2-df6008490b36','1','特请有勇有谋之人前来解决 拖欠李某保险费用 广发银行  急！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74d69c1712b','23','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-03-10','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！','0','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce2','18','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b1','2','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-03-10','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！','1','22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce1','3','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b2','4','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8cff','23','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b3','12','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce3','32','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b4','8','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce4','7','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b5','2','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce5','5','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b6','54','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce6','53','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b7','24','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce7','8','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'2','0','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b8','7','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-02-28','0','SYGR1251488285072600',NULL,NULL,'2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','0','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce8','5','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','0','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'2','1','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b9','3','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-03-10','0','SYGR1251488285072600',100,'1***8','2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','0','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'3','0','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce9','2','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-02-28','0','SYGR1251488285205726',NULL,NULL,'2017-02-28 12:33:25','','0','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'2','1','阿里巴巴巨额欠款 尚未还清 急！！','d10e3399-80e1-43e7-8ea4-b74169c1712b0','32','沙阳路33好 八道湾胡同 2门','2017-03-01','2017-03-08','2017-03-10','0','SYGR1251488285072600',100,'1***8','2017-02-28 12:31:12','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f','3','阿沙阳路33好 八道湾胡同 2门里巴巴巨额欠款 尚未还清 急！！',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'3','1','腾讯债权无法收回 特价出售','e4bf54a2-bd05-4dce-8aa8-ee95ec9a8ce0','44','建国门 22号 和平北里33号22-31-1','2017-03-02','2017-03-12','2017-03-08','0','SYGR1251488285205726',100,'1***8','2017-02-28 12:33:25','','4','腾讯债权无法收回 特价出售  建国门 22号 和平北里33号22-31-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'0','0','搜索','19d8475e-7182-44cc-b1cb-9df1fde13ddd','22.2','afas asdf法斯蒂芬','2017-03-24','2017-03-24','2017-03-10','0','SYGR1251489108815277',NULL,NULL,'2017-03-10 01:20:15','fb3bf6f8-91ea-4d7b-9f7c-47ffd58334be','2','阿斯蒂芬斯大夫撒旦','1','22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'0','1','阿萨','581ee211-f369-4503-9c2d-4d3630b53cb6','22','阿地方','2017-03-30','2017-04-06','2017-03-10','0','SYGR1251489108838463',100,'1***8','2017-03-10 01:20:38','','0','1231','0','23','121',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'1','1','ss','ace9d16e-52ea-47a7-b93e-7a521cac8044','2','2','2017-03-30','2017-04-05','2017-03-10','0','SYGR1251489109145469',100,'1***8','2017-03-10 01:25:45','','0','2','0','1','22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'1','0','2','b2c3435f-c41a-43c0-b399-b69a74bb5a11','2','2','2017-03-28','2017-04-05','2017-03-10','0','SYGR1251489109157655',NULL,NULL,'2017-03-10 01:25:57','','0','2','1','2','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'2','1','1','db2bab83-cd8a-4e3e-8a21-e8f8125e2ebf','1','1','2017-03-30','2017-03-30','2017-03-10','0','SYGR1251489109438918',100,'1***8','2017-03-10 01:30:38','','0','1','0','1','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'2','0','2','eb10e140-5c1a-45e1-a7fc-a1ae89c38306','2','2','2017-03-29','2017-04-07','2017-03-10','0','SYGR1251489109452485',NULL,NULL,'2017-03-10 01:30:52','','0','2','1','2','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'3','1','1','d6c336a8-3a68-4a90-870d-bdc894410896','1','1','2017-04-05','2017-04-05','2017-03-10','0','SYGR1251489109472351',100,'1***8','2017-03-10 01:31:12','','0','1','1','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'3','0','2','21b31bb6-50ae-4ec4-a203-b128d0ace142','68.5','2','2017-04-05','2017-04-09','2017-03-10','0','SYGR1251489109482272',NULL,NULL,'2017-03-10 01:31:22','','4','2','0','21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'0','0','1','07acf565-311d-4c88-bdab-e09deff5e36d','2','1','2017-03-28','2017-04-05','2017-03-10','0','SYGR1251489129157699',NULL,NULL,'2017-03-10 06:59:17','','3','萨伏','0','1','3','22','44','116','68','610','612','614','616','1','3','5','7','9','11','13','15'),(63,'1','0','1','bced0e17-b4cf-4418-81c9-6bcf43779f84','2','4','2017-03-29','2017-04-05','2017-03-11','0','SYGR1251489129985729',NULL,NULL,'2017-03-10 07:13:05','','0','5','0','6','3','2','4','6','8','11','13','15','17','1','3','5','7','9','12','14','16'),(64,'2','0','1','6ea58ad9-88c4-4741-b46b-3461a313a7b7','2','4','2017-03-28','2017-04-06','2017-03-11','0','SYGR1251489130009742',NULL,NULL,'2017-03-10 07:13:29','','0','5','0','2','33','2','4','6','8','10','12','14','16','1','3','5','7','9','11','13','15'),(65,'3','0','1','52b1d0f1-1ddb-42c3-8bf0-df1c390ae430','2','4','2017-03-14','2017-04-06','2017-03-11','0','SYGR1251489130027112',NULL,NULL,'2017-03-10 07:13:47','','0','5','0','6','32','2','444','6','8','110','12','14','16','1','3','5','7','9','11','13','15'),(66,'0','0','库萨克萨克','d6dad0c2-adea-4110-be85-debdc405f6cb','22','阿斯顿立法空军司令大口径','2017-03-11','2017-03-11','2017-03-11','0','SYGR1251489200885391',NULL,NULL,'2017-03-11 02:54:45','','0','阿的斯洛伐克杰拉三等奖分类岁的克己复礼三等奖立法撒旦奖弗兰克军队司令开放角色领导简历库','0','23','2','债务包是赏金猎人推出的便捷高效的自动出借工具。债务包在用户认可的标的范围内，对符合要求的标的进行自动出借，且回款本金在相应期限内自动复投，期限结束后债务包会通过赏金猎人债权转让平台进行转让退出。该计划所对应的标的均适用于赏金猎人资金安全伞计划并由系统实现标的分散资。2','机构担保标、实地认证标4','30 天6','一次性还本付息8','资金安全伞计划10','债务包所对应出借项目适用赏金猎人资金安全伞计划且拥有风险金无延迟优先赔付优势。12','债务包到期后，我们会在债务包到期当日（T+0）把您的本金和收益一并返还至您的安润账户中，无需任何手动操作；债务包暂时不支持自动复投，您可以手动选择其他A产品进行出借。14','债务包是依据风险分散原则，由赏金猎人智 能出借平台将客户出借资金自动分散投资到多个严格甄选的优质标的中，所投资债权日常利息回款在计划未到期前会进行立即复投以提升整体出借收益率，债务包到期后客户持有债权会自动转让给其他出借人以实现资金退出。与出借散标相比债务包具有出借简单、低风险、资金管理清晰等优势。16','悬赏介绍1','接标范围3','锁定期5','回款方式7','风险保障9','债务包安全吗？11','到期后如何取回本13','债务包和散标的区15'),(67,'3','0','1','ac33d532-20b6-4fed-8593-7cae46319f69','2','4','2017-03-11','2017-03-11','2017-03-11','0','SYGR1251489215001997',NULL,NULL,'2017-03-11 06:50:02','','0','3','0','1','3','债务包是赏金猎人推出的便捷高效的自动出借工具。债务包在用户认可的标的范围内，对符合要求的标的进行自动出借，且回款本金在相应期限内自动复投，期限结束后债务包会通过赏金猎人债权转让平台进行转让退出。该计划所对应的标的均适用于赏金猎人资金安全伞计划并由系统实现标的分散资。2','机构担保标、实地认证标4','30 天6','一次性还本付息8','资金安全伞计划10','债务包所对应出借项目适用赏金猎人资金安全伞计划且拥有风险金无延迟优先赔付优势。22','债务包到期后，我们会在债务包到期当日（T+0）把您的本金和收益一并返还至您的安润账户中，无需任何手动操作；债务包暂时不支持自动复投，您可以手动选择其他A产品进行出借。13','债务包是依据风险分散原则，由赏金猎人智 能出借平台将客户出借资金自动分散投资到多个严格甄选的优质标的中，所投资债权日常利息回款在计划未到期前会进行立即复投以提升整体出借收益率，债务包到期后客户持有债权会自动转让给其他出借人以实现资金退出。与出借散标相比债务包具有出借简单、低风险、资金管理清晰等优势。15','悬赏介绍1','接标范围3','锁定期5','回款方式7','风险保障9','债务包安全吗？11','到期后如何取回本12','债务包和散标的区14'),(68,'3','0','1','f7cd4a69-c4fd-41ba-8a0b-ffc4d7bac471','2','4','2017-03-11','2017-03-11','2017-03-11','0','SYGR1251489215093504',NULL,NULL,'2017-03-11 06:51:33','','0','5','0','6','3','2债务包是赏金猎人推出的便捷高效的自动出借工具。债务包在用户认可的标的范围内，对符合要求的标的进行自动出借，且回款本金在相应期限内自动复投，期限结束后债务包会通过赏金猎人债权转让平台进行转让退出。该计划所对应的标的均适用于赏金猎人资金安全伞计划并由系统实现标的分散资。','4机构担保标、实地认证标','630 天','8一次性还本付息','10资金安全伞计划','12债务包所对应出借项目适用赏金猎人资金安全伞计划且拥有风险金无延迟优先赔付优势。','14债务包到期后，我们会在债务包到期当日（T+0）把您的本金和收益一并返还至您的安润账户中，无需任何手动操作；债务包暂时不支持自动复投，您可以手动选择其他A产品进行出借。','16债务包是依据风险分散原则，由赏金猎人智 能出借平台将客户出借资金自动分散投资到多个严格甄选的优质标的中，所投资债权日常利息回款在计划未到期前会进行立即复投以提升整体出借收益率，债务包到期后客户持有债权会自动转让给其他出借人以实现资金退出。与出借散标相比债务包具有出借简单、低风险、资金管理清晰等优势。','悬赏介绍1','3接标范围','5锁定期','7回款方式','9风险保障','11债务包安全吗？','13到期后如何取回','15债务包和散标的'),(69,'2','0','1','38bc767d-04bb-4186-a7f1-ad6118f00672','23','5','2017-03-11','2017-03-11','2017-03-11','0','SYGR1251489215150637',NULL,NULL,'2017-03-11 06:52:30','','0','6','0','7','4','2债务包是赏金猎人推出的便捷高效的自动出借工具。债务包在用户认可的标的范围内，对符合要求的标的进行自动出借，且回款本金在相应期限内自动复投，期限结束后债务包会通过赏金猎人债权转让平台进行转让退出。该计划所对应的标的均适用于赏金猎人资金安全伞计划并由系统实现标的分散资。','4机构担保标、实地认证标','630 天','89一次性还本付息','10资金安全伞计划','12债务包所对应出借项目适用赏金猎人资金安全伞计划且拥有风险金无延迟优先赔付优势。','14债务包到期后，我们会在债务包到期当日（T+0）把您的本金和收益一并返还至您的安润账户中，无需任何手动操作；债务包暂时不支持自动复投，您可以手动选择其他A产品进行出借。','16债务包是依据风险分散原则，由赏金猎人智 能出借平台将客户出借资金自动分散投资到多个严格甄选的优质标的中，所投资债权日常利息回款在计划未到期前会进行立即复投以提升整体出借收益率，债务包到期后客户持有债权会自动转让给其他出借人以实现资金退出。与出借散标相比债务包具有出借简单、低风险、资金管理清晰等优势。','1','3接标范围','5锁定期','7回款方式','9风险保障','11债务包安全吗？','13后如何取回本息？','债务包和散标的15'),(70,'1','0','1','1bfbe7c8-5d18-472e-ac73-4507992fd3b9','2','4','2017-03-11','2017-03-11','2017-03-11','0','SYGR1251489215184617',NULL,NULL,'2017-03-11 06:53:04','','0','5','0','6','3','2债务包是赏金猎人推出的便捷高效的自动出借工具。债务包在用户认可的标的范围内，对符合要求的标的进行自动出借，且回款本金在相应期限内自动复投，期限结束后债务包会通过赏金猎人债权转让平台进行转让退出。该计划所对应的标的均适用于赏金猎人资金安全伞计划并由系统实现标的分散资。','4机构担保标、实地认证标','630 天','8一次性还本付息','10资金安全伞计划','12债务包所对应出借项目适用赏金猎人资金安全伞计划且拥有风险金无延迟优先赔付优势。','14债务包到期后，我们会在债务包到期当日（T+0）把您的本金和收益一并返还至您的安润账户中，无需任何手动操作；债务包暂时不支持自动复投，您可以手动选择其他A产品进行出借。','16债务包是依据风险分散原则，由赏金猎人智 能出借平台将客户出借资金自动分散投资到多个严格甄选的优质标的中，所投资债权日常利息回款在计划未到期前会进行立即复投以提升整体出借收益率，债务包到期后客户持有债权会自动转让给其他出借人以实现资金退出。与出借散标相比债务包具有出借简单、低风险、资金管理清晰等优势。','1','3','5','7','9','11','13','15');
/*!40000 ALTER TABLE `sjlr_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_action`
--

DROP TABLE IF EXISTS `sys_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(100) DEFAULT NULL,
  `action_url` varchar(500) DEFAULT NULL,
  `action_level` varchar(2) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `del_state` varchar(2) DEFAULT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `action_pic` varchar(200) DEFAULT NULL,
  `help` varchar(1024) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `is_leaf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action`
--

LOCK TABLES `sys_action` WRITE;
/*!40000 ALTER TABLE `sys_action` DISABLE KEYS */;
INSERT INTO `sys_action` VALUES (1,'测试action1','测试url1','1',0,'0',2,'fa-tag','','2016-03-30 13:40:29',NULL,'1'),(2,'测试action2','测试url2','1',0,'0',3,'fa-tag','','2016-03-30 13:40:29',NULL,'1'),(3,'测试action3','测试url3','1',0,'0',4,'fa-tag','','2016-03-30 13:40:29',NULL,'1'),(4,'测试action4edit','测试url4','1',0,'0',5,'fa-list-alt','','2016-03-30 13:40:29','2016-05-19 03:39:42','1'),(5,'测试action5','测试url5','1',0,'0',6,'fa-list-alt','','2016-03-30 13:40:29',NULL,'1'),(6,'债务包管理','测试url6','1',0,'0',1,'fa-desktop','','2016-03-30 13:40:29','2017-02-15 07:15:11','1'),(7,'系统管理','','1',0,'0',99,'fa-list','3234',NULL,'2015-12-08 07:15:40','1'),(8,'测试action8','测试url8','1',0,'0',7,'fa-list-alt',NULL,'2016-03-30 14:14:37',NULL,'1'),(11,'角色管理','role/index.html','1',7,'0',1,NULL,'',NULL,'2016-01-27 03:04:34','0'),(12,'人员管理','user/index.html','1',7,'0',2,NULL,'',NULL,'2016-01-27 03:04:44','0'),(31,'获取角色列表','base/getRoles.do','3',11,'0',31,NULL,NULL,NULL,NULL,'0'),(32,'新增部门保存','base/addDept.do','3',12,'0',32,NULL,NULL,NULL,NULL,'0'),(33,'编辑部门保存','base/updateDept.do','3',12,'0',33,NULL,NULL,NULL,NULL,'0'),(34,'删除部门','base/delDept.do','3',12,'0',34,NULL,NULL,NULL,NULL,'0'),(35,'根据公司取得部门','base/getDeptForCompany.do','3',12,'0',35,NULL,NULL,NULL,NULL,'0'),(36,'用户启用/停用','base/updateUserStatus.do','3',12,'0',36,NULL,NULL,NULL,NULL,'0'),(37,'删除用户','base/delUser.do','3',12,'0',37,NULL,NULL,NULL,NULL,'0'),(38,'职位列表','base/getPositionList.do','3',12,'0',38,NULL,NULL,NULL,NULL,'0'),(39,'新增员工','base/addUser.do','3',12,'0',39,NULL,NULL,NULL,NULL,'0'),(41,'用户信息修改','base/updateUser.do','3',12,'0',41,NULL,NULL,NULL,NULL,'0'),(42,'根据用户id查询用户信息','base/getOneForUserId.do','3',12,'0',42,NULL,NULL,NULL,NULL,'0'),(43,'用户绑定/解绑','base/updateUserBind.do','3',12,'0',43,NULL,NULL,NULL,NULL,'0'),(44,'根据用户名查询人员验证','base/getOneUserForName.do','3',12,'0',44,NULL,NULL,NULL,NULL,'0'),(45,'导入用户','base/importUser.do','3',12,'0',45,NULL,NULL,NULL,NULL,'0'),(46,'人员信息修改','base/updateUser.do','3',12,'0',46,NULL,NULL,NULL,NULL,'0'),(331,'添加权限','base/addModule.do','3',11,'0',2,'','',NULL,NULL,'0'),(354,'载入权限信息','base/getPermissonInfo.do','3',11,'0',99,NULL,'','2015-12-04 07:58:08',NULL,'0'),(359,'添加角色','base/addRole.do','3',11,'0',13,NULL,'','2015-12-07 06:14:41',NULL,'0'),(360,'删除角色','base/deleteRole.do','3',11,'0',3,NULL,'','2015-12-07 09:23:49',NULL,'0'),(361,'获取单个角色信息','base/goEdit.do','3',11,'0',21,NULL,'','2015-12-07 09:42:41',NULL,'0'),(362,'更新角色信息','base/updateRole.do','3',11,'0',1,NULL,'','2015-12-08 01:23:02',NULL,'0'),(363,'获取当前角色所对应的权限','base/getRoleActions.do','3',11,'0',12,NULL,'','2015-12-08 03:06:25',NULL,'0'),(364,'删除权限','base/deleteModule.do','3',11,'0',89,NULL,'','2015-12-08 07:11:34',NULL,'0'),(365,'获取人员列表','base/getUserPageList.do','3',12,'0',NULL,NULL,NULL,NULL,NULL,'0'),(440,'获取权限树','base/getWebModuleTree.do','3',11,'0',NULL,NULL,NULL,NULL,NULL,'0'),(446,'添加用户页面里面的角色权限列表','base/getAddUserRoleList.do','3',11,'0',NULL,NULL,NULL,NULL,NULL,'0'),(459,'更新模块','base/updateModule.do','3',11,'0',15,NULL,'','2016-01-26 07:40:05',NULL,'0'),(465,'展开详细操作日志','log/subList.do','1',463,'0',2,NULL,'','2016-02-22 19:30:00','2016-02-23 13:59:13','0'),(466,'获取用户信息','base/getUserInfos.do','3',12,'0',2,NULL,NULL,NULL,NULL,'0'),(468,'获取角色信息','base/getAllRole.do','3',11,'0',4,NULL,NULL,NULL,NULL,'0'),(470,'测试action470','测试url470','3',12,'0',7,NULL,NULL,NULL,NULL,'0'),(473,'测试action473','测试url473','3',11,'0',4,NULL,NULL,NULL,NULL,'0'),(493,'测试action493','测试url493','3',12,'0',7,NULL,'','2016-03-13 20:36:02',NULL,'0'),(494,'测试action494','测试url494','3',12,'0',5,NULL,'','2016-03-13 20:38:54',NULL,'0'),(495,'测试action495','测试url495','3',12,'0',3,NULL,'','2016-03-13 20:48:14',NULL,'0'),(496,'测试action496','测试url496','1',12,'0',6,NULL,'','2016-03-13 20:51:29',NULL,'0'),(539,'个人债务','debt/index_1.html','1',6,'0',1,NULL,'','2016-03-30 13:41:51','2017-02-15 07:16:20','0'),(541,'测试action541','测试url541','1',539,'0',2,NULL,'','2016-03-30 14:08:06',NULL,'0'),(542,'测试action542','测试url542','3',540,'0',1,NULL,'','2016-03-30 14:12:20',NULL,'0'),(543,'测试action543123sss111','测试url5433','3',0,'0',98,NULL,'','2016-03-30 14:14:37','2016-05-19 06:33:08','0'),(545,'测试action545','测试url545','3',540,'0',1,NULL,NULL,'2016-04-12 08:51:36',NULL,'0'),(546,'测试action546','测试url546','3',540,'0',1,NULL,NULL,'2016-04-13 02:22:22',NULL,'0'),(547,'测试action547','测试url547','3',540,'0',1,NULL,NULL,'2016-04-13 02:22:25',NULL,'0'),(548,'测试action548','测试url548','3',540,'0',1,NULL,NULL,'2016-04-13 02:22:28',NULL,'0'),(549,'测试action549','测试url549','3',540,'0',1,NULL,NULL,'2016-04-13 08:28:18',NULL,'0'),(550,'测试action550','测试url550','3',540,'0',1,NULL,NULL,'2016-04-14 01:45:17',NULL,'0'),(551,'测试action551','测试url551','1',1,'0',1,NULL,'','2016-04-14 02:36:55',NULL,'0'),(552,'测试action552','测试url552','3',540,'0',1,NULL,NULL,'2016-04-14 02:50:24',NULL,'0'),(553,'测试action553','测试url553','3',551,'0',1,NULL,'','2016-04-14 03:02:27',NULL,'0'),(554,'测试action554','测试url554','1',2,'0',2,NULL,'','2016-04-14 06:33:36',NULL,'0'),(555,'测试action555','测试url555','3',554,'0',1,NULL,'','2016-04-14 08:23:28',NULL,'0'),(556,'测试action556','测试url556','3',554,'0',1,NULL,NULL,'2016-04-14 09:42:21',NULL,'0'),(557,'测试action557','测试url557','1',2,'0',3,NULL,NULL,'2016-04-14 10:24:05',NULL,'0'),(558,'测试action558','测试url558','1',2,'0',4,NULL,NULL,'2016-04-14 10:29:41',NULL,'0'),(559,'测试action559','测试url559','1',5,'0',1,NULL,NULL,'2016-04-15 01:27:10',NULL,'0'),(560,'测试action560','测试url560','1',5,'0',2,NULL,NULL,'2016-04-15 02:05:08',NULL,'0'),(561,'测试action561','测试url561','1',3,'0',2,NULL,NULL,'2016-04-15 02:39:08',NULL,'0'),(562,'测试action562','测试url562','1',3,'0',3,'',NULL,'2016-04-15 03:07:01',NULL,'0'),(563,'测试action563','测试url563','1',3,'0',4,NULL,NULL,'2016-04-15 03:25:48',NULL,'0'),(564,'测试action564','测试url564','1',4,'0',1,NULL,NULL,'2016-04-15 05:44:25',NULL,'0'),(565,'测试action565','测试url565','3',554,'0',1,NULL,NULL,'2016-04-15 08:08:31',NULL,'0'),(566,'测试action566','测试url566','3',554,'0',1,NULL,NULL,'2016-04-15 08:39:27',NULL,'0'),(567,'测试action567','测试url567','3',554,'0',1,NULL,NULL,'2016-04-15 08:54:53',NULL,'0'),(568,'测试action568','测试url568','3',558,'0',1,NULL,NULL,'2016-04-18 02:34:07',NULL,'0'),(569,'测试action569','测试url569','1',3,'0',1,NULL,NULL,'2016-04-18 02:29:18',NULL,'0'),(570,'测试action570','测试url570','3',558,'0',1,NULL,NULL,'2016-04-18 02:43:24',NULL,'0'),(571,'测试action571','测试url571','3',558,'0',1,NULL,NULL,'2016-04-18 03:39:47',NULL,'0'),(572,'测试action572','测试url572','3',569,'0',1,NULL,NULL,'2016-04-18 05:40:04',NULL,'0'),(574,'测试action574','测试url574','3',558,'0',1,NULL,NULL,'2016-04-18 06:08:44',NULL,'0'),(575,'测试action575','测试url575','3',558,'0',1,NULL,NULL,'2016-04-18 06:13:54',NULL,'0'),(576,'测试action576','测试url576','3',558,'0',1,NULL,NULL,'2016-04-18 07:24:05',NULL,'0'),(577,'测试action577','测试url577','3',558,'0',1,NULL,NULL,'2016-04-18 07:41:10',NULL,'0'),(578,'测试action578','测试url578','3',558,'0',1,NULL,NULL,'2016-04-19 01:23:06',NULL,'0'),(579,'测试action579','测试url579','3',557,'0',1,NULL,NULL,'2016-04-19 02:00:47',NULL,'0'),(580,'测试action580','测试url580','3',557,'0',1,NULL,NULL,'2016-04-19 02:22:39',NULL,'0'),(581,'测试action581','测试url581','3',557,'0',1,NULL,NULL,'2016-04-19 03:05:03',NULL,'0'),(582,'测试action582','测试url582','1',2,'0',1,NULL,NULL,'2016-04-19 03:36:01',NULL,'0'),(583,'测试action583','测试url583','3',569,'0',1,NULL,NULL,'2016-04-19 03:47:01',NULL,'0'),(584,'测试action584','测试url584','3',559,'0',1,NULL,NULL,'2016-04-19 06:29:02',NULL,'0'),(585,'测试action585','测试url585','1',8,'0',1,NULL,NULL,'2016-04-21 01:39:55',NULL,'0'),(587,'测试action587','测试url587','3',564,'0',1,NULL,NULL,'2016-04-21 07:10:07',NULL,'0'),(588,'测试action588','测试url588','3',563,'0',1,NULL,NULL,'2016-04-21 07:31:57',NULL,'0'),(589,'测试action589','测试url589','3',563,'0',1,NULL,NULL,'2016-04-21 07:31:54',NULL,'0'),(590,'测试action590','测试url590','3',563,'0',1,NULL,NULL,'2016-04-21 07:32:59',NULL,'0'),(591,'测试action591','测试url591','3',563,'0',1,NULL,NULL,'2016-04-21 07:34:39',NULL,'0'),(592,'测试action592','测试url592','1',4,'0',1,NULL,NULL,'2016-04-21 07:53:04',NULL,'0'),(593,'测试action593','测试url593','3',592,'0',1,NULL,NULL,'2016-04-21 07:58:44',NULL,'0'),(594,'测试action594','测试url594','3',592,'0',1,NULL,NULL,'2016-04-21 08:36:00',NULL,'0'),(595,'测试action595','测试url595','3',592,'0',1,NULL,NULL,'2016-04-21 09:08:55',NULL,'0'),(596,'测试action596','测试url596','3',592,'0',1,NULL,NULL,'2016-04-21 09:43:40',NULL,'0'),(597,'测试action597','测试url597','3',592,'0',1,NULL,NULL,'2016-04-21 09:48:48',NULL,'0'),(598,'测试action598','测试url598','3',592,'0',1,NULL,NULL,'2016-04-22 01:01:37',NULL,'0'),(599,'测试action599','测试url599','3',592,'0',1,NULL,NULL,'2016-04-22 01:15:24',NULL,'0'),(600,'测试action600','测试url600','3',592,'0',1,NULL,NULL,'2016-04-22 03:09:56',NULL,'0'),(601,'测试action601','测试url601','3',12,'0',20,NULL,'','2016-04-21 17:41:48',NULL,'0'),(602,'测试action602','测试url602','3',585,'0',1,NULL,NULL,'2016-04-22 06:50:43',NULL,'0'),(603,'测试action603','测试url603','3',563,'0',2,NULL,NULL,'2016-04-22 09:14:28',NULL,'0'),(604,'测试action604','测试url604','3',585,'0',1,NULL,NULL,'2016-04-25 01:07:43',NULL,'0'),(605,'测试action605','测试url605','3',585,'0',1,NULL,NULL,'2016-04-25 01:41:34',NULL,'0'),(606,'测试action606','测试url606','3',558,'0',1,NULL,NULL,'2016-04-26 01:02:36',NULL,'0'),(607,'测试action607','测试url607','3',12,'0',55,NULL,'','2016-04-26 15:37:40',NULL,'0'),(618,'测试action618','测试url618','3',592,'0',1,NULL,NULL,'2016-04-29 09:12:42',NULL,'0'),(619,'测试action619','测试url619','3',558,'0',1,NULL,NULL,'2016-05-04 06:34:14',NULL,'0'),(620,'测试action620','测试url620','3',559,'0',1,NULL,NULL,'2016-05-05 02:54:39',NULL,'0'),(621,'测试action621','测试url621','3',569,'0',1,NULL,NULL,'2016-05-06 02:34:12',NULL,'0'),(626,'测试action626','测试url626','3',557,'0',1,NULL,NULL,'2016-05-11 07:08:40',NULL,'0'),(628,'测试action628','测试url628','3',563,'0',1,NULL,NULL,'2016-05-12 11:56:56',NULL,'0'),(630,'测试action630','测试url630','3',569,'0',1,NULL,NULL,'2016-05-16 07:46:01',NULL,'0'),(631,'系统欢迎页面','dashboard.html','3',7,'0',78,NULL,'','2016-05-22 12:09:14',NULL,'0'),(632,'银行债务','debt/index_2.html','1',6,'0',2,NULL,'','2017-02-15 07:16:43',NULL,'0'),(633,'企业债务','debt/index_3.html','1',6,'0',3,NULL,'','2017-02-15 07:17:04',NULL,'0'),(634,'债务拍卖','debt/index_4.html','1',6,'0',4,NULL,'','2017-02-15 07:17:38',NULL,'0'),(635,'债务列表','home/index.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(636,'读取更多债务列表','home/loadMore.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(637,'读取人员信息','user/index.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(638,'获取债务基本信息','home/detial.html','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(639,'获取服务端的债务信息','debt/selectOne.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(640,'竞标','debt/target.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(641,'管理员债务列表1','debt/index.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(642,'债务列表2','home/index2.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(643,'债务列表3','home/index3.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(644,'债务列表4','home/index4.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(645,'债务列表1','home/index1.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(646,'债务详情1','home/detial1.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(647,'债务详情2','home/detial2.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(648,'债务详情3','home/detial3.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(649,'债务详情4','home/detial4.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(650,'读取更多债务列表fuck','home/detialtypeone.html','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0');
/*!40000 ALTER TABLE `sys_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_action_role`
--

DROP TABLE IF EXISTS `sys_action_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_action_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ACTION_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  `DATA_ID` int(11) DEFAULT NULL,
  `CREATER_ID` varchar(32) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16617 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action_role`
--

LOCK TABLES `sys_action_role` WRITE;
/*!40000 ALTER TABLE `sys_action_role` DISABLE KEYS */;
INSERT INTO `sys_action_role` VALUES (16185,7,16,1,NULL,NULL),(16186,631,16,1,NULL,NULL),(16520,6,1,1,NULL,NULL),(16521,539,1,1,NULL,NULL),(16522,541,1,1,NULL,NULL),(16523,632,1,1,NULL,NULL),(16524,633,1,1,NULL,NULL),(16525,634,1,1,NULL,NULL),(16526,7,1,1,NULL,NULL),(16527,11,1,1,NULL,NULL),(16528,31,1,1,NULL,NULL),(16529,331,1,1,NULL,NULL),(16530,354,1,1,NULL,NULL),(16531,359,1,1,NULL,NULL),(16532,360,1,1,NULL,NULL),(16533,361,1,1,NULL,NULL),(16534,362,1,1,NULL,NULL),(16535,363,1,1,NULL,NULL),(16536,364,1,1,NULL,NULL),(16537,440,1,1,NULL,NULL),(16538,446,1,1,NULL,NULL),(16539,459,1,1,NULL,NULL),(16540,468,1,1,NULL,NULL),(16541,473,1,1,NULL,NULL),(16542,12,1,1,NULL,NULL),(16543,32,1,1,NULL,NULL),(16544,33,1,1,NULL,NULL),(16545,34,1,1,NULL,NULL),(16546,35,1,1,NULL,NULL),(16547,36,1,1,NULL,NULL),(16548,37,1,1,NULL,NULL),(16549,38,1,1,NULL,NULL),(16550,39,1,1,NULL,NULL),(16551,41,1,1,NULL,NULL),(16552,42,1,1,NULL,NULL),(16553,43,1,1,NULL,NULL),(16554,44,1,1,NULL,NULL),(16555,45,1,1,NULL,NULL),(16556,46,1,1,NULL,NULL),(16557,365,1,1,NULL,NULL),(16558,466,1,1,NULL,NULL),(16559,470,1,1,NULL,NULL),(16560,493,1,1,NULL,NULL),(16561,494,1,1,NULL,NULL),(16562,495,1,1,NULL,NULL),(16563,496,1,1,NULL,NULL),(16564,601,1,1,NULL,NULL),(16565,607,1,1,NULL,NULL),(16566,631,1,1,NULL,NULL),(16567,635,1,1,NULL,NULL),(16568,636,1,1,NULL,NULL),(16569,637,1,1,NULL,NULL),(16570,638,1,1,NULL,NULL),(16571,639,1,1,NULL,NULL),(16572,640,1,1,NULL,NULL),(16573,641,1,1,NULL,NULL),(16574,7,3,1,NULL,NULL),(16575,12,3,1,NULL,NULL),(16576,32,3,1,NULL,NULL),(16577,33,3,1,NULL,NULL),(16578,34,3,1,NULL,NULL),(16579,35,3,1,NULL,NULL),(16580,36,3,1,NULL,NULL),(16581,37,3,1,NULL,NULL),(16582,38,3,1,NULL,NULL),(16583,39,3,1,NULL,NULL),(16584,41,3,1,NULL,NULL),(16585,42,3,1,NULL,NULL),(16586,43,3,1,NULL,NULL),(16587,44,3,1,NULL,NULL),(16588,45,3,1,NULL,NULL),(16589,46,3,1,NULL,NULL),(16590,365,3,1,NULL,NULL),(16591,466,3,1,NULL,NULL),(16592,470,3,1,NULL,NULL),(16593,493,3,1,NULL,NULL),(16594,494,3,1,NULL,NULL),(16595,495,3,1,NULL,NULL),(16596,496,3,1,NULL,NULL),(16597,601,3,1,NULL,NULL),(16598,607,3,1,NULL,NULL),(16599,1,17,1,NULL,'2017-02-28 11:42:40'),(16600,551,17,1,NULL,'2017-02-28 11:42:40'),(16601,553,17,1,NULL,'2017-02-28 11:42:40'),(16602,642,16,1,NULL,'2017-02-28 11:42:40'),(16603,643,16,1,NULL,'2017-02-28 11:42:40'),(16604,644,16,1,NULL,'2017-02-28 11:42:40'),(16605,645,16,1,NULL,'2017-02-28 11:42:40'),(16606,646,16,1,NULL,'2017-02-28 11:42:40'),(16607,647,16,1,NULL,'2017-02-28 11:42:40'),(16608,648,16,1,NULL,'2017-02-28 11:42:40'),(16609,649,16,1,NULL,'2017-02-28 11:42:40'),(16610,635,16,1,NULL,NULL),(16611,636,16,1,NULL,NULL),(16612,638,16,1,NULL,NULL),(16613,639,16,1,NULL,NULL),(16614,640,13,1,NULL,NULL),(16615,640,16,1,NULL,NULL),(16616,650,16,1,NULL,NULL);
/*!40000 ALTER TABLE `sys_action_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filename_ori` varchar(2000) DEFAULT NULL,
  `filename_new` varchar(2000) DEFAULT NULL,
  `real_path` varchar(2000) DEFAULT NULL,
  `del_flag` varchar(2) DEFAULT '0',
  `size` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,'2017-02-28 12:05:25','2017-02-28 12:05:25','logo.png','logo.png','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/44924b34-7e7e-4f3f-b92f-86971071d298','0','58941','image/png','19d2abb5-bca4-4dfd-bdfa-76dbb775c4dd'),(2,'2017-02-28 12:17:38','2017-02-28 12:17:38','listbg.png','listbg.png','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/e1b1e16c-8536-4248-8c85-57314ea5ade0','0','867','image/png','a613d4a7-3f5e-4c20-9ee2-df6008490b36'),(3,'2017-02-28 12:31:08','2017-02-28 12:31:08','butright3.png','butright3.png','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/96ca378a-3bdb-4a3c-961f-0f4dd4fdccb3','0','15479','image/png','8759597a-ca0f-44b0-8eb1-1bbaf2a8d22f'),(4,'2017-03-10 01:20:11','2017-03-10 01:20:11','index2.html','index2.html','/home/zhuwj/workspace/2017JUNO/base_ssm/src/main/webapp/upload/869af102-4da5-4653-8926-171ccaec24b4','0','7489','text/html','fb3bf6f8-91ea-4d7b-9f7c-47ffd58334be');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `ROLE_TYPE` varchar(20) DEFAULT NULL,
  `ROLE_INFO` varchar(1024) DEFAULT NULL,
  `DEL_STATE` varchar(2) DEFAULT '0',
  `CREATE_USER` int(11) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_DATE` timestamp NULL DEFAULT NULL,
  `role_main` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','1','维护系统，创建用户，维护角色等。','0',NULL,'2015-06-19 04:00:17',23,'2017-02-15 13:16:16','user/index.html'),(16,'默认角色',NULL,'用户注册的默认角色','0',NULL,'2016-05-22 11:44:06',NULL,'2016-05-22 12:31:21','home/list.html');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `age` int(4) DEFAULT NULL,
  `status` varchar(45) DEFAULT '0' COMMENT '0初始\n1审核通过',
  `del_flag` varchar(2) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `realname` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `idcard` varchar(45) DEFAULT NULL,
  `Introduction` varchar(450) DEFAULT NULL,
  `sex` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (23,'xx','96E79218965EB72C92A549DD5A330112','sunny@163.com',18,'0','0','2016-05-17 02:43:02','2017-03-09 15:33:18','管理员','和平区莎莎姐','210102200088888888','管理整个网站','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ROLE_CODE` varchar(100) DEFAULT NULL,
  `USER_NAME` varchar(100) DEFAULT NULL,
  `CREATE_USER` int(11) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (7,3,39,NULL,'sun3ny',NULL,'2016-05-22 11:18:45'),(11,5,38,NULL,'sunny3',23,'2016-05-22 11:39:24'),(12,16,NULL,NULL,NULL,-1,'2016-05-22 11:47:51'),(13,16,NULL,NULL,NULL,-1,'2016-05-22 11:48:47'),(14,16,NULL,NULL,NULL,-1,'2016-05-22 11:54:51'),(15,16,NULL,NULL,NULL,-1,'2016-05-22 11:58:10'),(16,16,52,NULL,NULL,-1,'2016-05-22 11:59:21'),(17,16,54,NULL,NULL,-1,'2016-05-22 12:00:08'),(18,16,56,NULL,'111115',-1,'2016-05-22 12:01:55'),(20,3,58,NULL,'zhanghaoguanliyuan',58,'2016-05-22 12:06:09'),(23,16,60,NULL,'newcomer',23,'2016-05-22 12:10:01'),(25,5,59,NULL,'juese',23,'2016-05-22 12:32:18'),(26,16,73,'16','8',8,'2017-02-15 03:21:01'),(27,16,74,'16','13',13,'2017-02-15 03:31:54'),(28,16,75,'16','4',4,'2017-02-15 03:35:50'),(29,16,78,'16','2',2,'2017-02-15 03:39:42'),(30,16,79,'16','123',123,'2017-02-15 05:19:40'),(31,16,80,'16','123',123,'2017-02-15 05:20:20'),(32,16,81,'16','186555115',186555115,'2017-02-15 05:20:56'),(33,16,84,'16','1864445551',23,'2017-02-15 05:58:39'),(34,16,85,'16','18866665555',23,'2017-02-15 06:10:59'),(36,1,23,NULL,'sunny',23,'2017-02-15 13:59:22'),(37,3,86,'3','ss',23,'2017-02-15 14:16:53'),(38,16,87,'16','12312311231',23,'2017-02-16 14:51:29'),(39,16,88,'16','18655554444',23,'2017-02-19 02:17:23'),(40,16,89,'16','18644445555',23,'2017-02-22 14:07:10'),(41,16,90,'16','18644445552',23,'2017-02-22 14:07:59'),(42,16,91,'16','18644445552',23,'2017-02-22 14:08:11'),(43,16,95,'16','18777778899',23,'2017-02-22 14:15:30'),(44,16,96,'16','123',23,'2017-02-22 14:16:18'),(45,16,97,'16','1232',-1,'2017-02-23 00:02:34'),(46,16,98,'16','18640395127',-1,'2017-02-23 12:41:33'),(47,16,99,'16','1887777888',-1,'2017-02-25 02:20:05'),(48,16,100,'16','18888888888',-1,'2017-02-28 12:51:22'),(49,16,101,'16','18866668889',-1,'2017-03-07 16:58:43'),(50,16,102,'16','12312',-1,'2017-03-09 09:44:19'),(51,16,103,'16','1',-1,'2017-03-09 09:45:25'),(52,16,104,'16','13122222221',-1,'2017-03-09 15:03:34'),(53,16,105,'16','18844445555',-1,'2017-03-09 15:07:36'),(54,16,106,'16','18844446666',-1,'2017-03-09 15:08:15'),(55,16,107,'16','18866668888',-1,'2017-03-09 15:14:31'),(56,16,108,'16','18866668881',-1,'2017-03-09 15:16:11'),(57,16,109,'16','18844445555',-1,'2017-03-10 08:23:10');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-10 19:52:49
