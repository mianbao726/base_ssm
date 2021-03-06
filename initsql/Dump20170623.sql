-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: xx
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
-- Table structure for table `ex_employee`
--

DROP TABLE IF EXISTS `ex_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ex_employee` (
  `id` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `office` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `salary` varchar(45) DEFAULT NULL,
  `extn` varchar(45) DEFAULT NULL,
  `create_at` timestamp(3) NULL DEFAULT NULL,
  `updated_at` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ex_employee`
--

LOCK TABLES `ex_employee` WRITE;
/*!40000 ALTER TABLE `ex_employee` DISABLE KEYS */;
INSERT INTO `ex_employee` VALUES ('09fbcc07-57da-11e7-9a46-dc0ea1e07acd','的的的','last_name','email@163.com','employee','japen','24','2017-06-23','9832','019','2017-06-23 06:06:04.007','2017-06-23 07:38:56.229'),('0d85784e-57db-11e7-9a46-dc0ea1e07acd','的的的的法','last_name','email@163.com','employee','japen','24','2017-06-23','9832','019','2017-06-23 06:13:19.439','2017-06-23 07:41:28.990'),('1eed265b-57db-11e7-9a46-dc0ea1e07acd','的的的','last_name','email@163.com','employee','japen','24','2017-06-23','9832','019','2017-06-23 06:13:48.640','2017-06-23 07:38:56.229'),('5ace81a9-57da-11e7-9a46-dc0ea1e07acd','的的的','last_name','email@163.com','employee','japen','24','2017-06-23','9832','019','2017-06-23 06:08:19.605','2017-06-23 07:38:56.229'),('868f8fa6-57da-11e7-9a46-dc0ea1e07acd','的的的','last_name','email@163.com','boss','japen','24','2017-06-23','9832','019','2017-06-23 06:09:33.013','2017-06-23 07:38:56.229'),('88a07e99-57da-11e7-9a46-dc0ea1e07acd','个法国','last_name','email@163.com','employee','japen','24','2017-06-23','9832','019','2017-06-23 06:09:36.479','2017-06-23 07:41:39.339'),('b43f1c1a-57b6-11e7-9a46-dc0ea1e07acd','的的的岁的','last_name','email@163.com','employee','japen','24','2017-06-23','9832','019','2017-06-23 01:53:07.778','2017-06-23 07:40:06.172');
/*!40000 ALTER TABLE `ex_employee` ENABLE KEYS */;
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

-- Dump completed on 2017-06-23 16:00:15
