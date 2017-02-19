-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: wb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

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
  `name` varchar(45) DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `s_date` date DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `del_flag` varchar(45) DEFAULT '0',
  `serial_id` varchar(45) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `targetname` varchar(45) DEFAULT NULL,
  `craeted_at` timestamp NULL DEFAULT NULL,
  `pic_uuid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sjlr_package`
--

LOCK TABLES `sjlr_package` WRITE;
/*!40000 ALTER TABLE `sjlr_package` DISABLE KEYS */;
INSERT INTO `sjlr_package` VALUES (1,'2','1','和平区-四子王旗某牧民','6873775e-f50a-11e6-ae4a-40167ea6bd58','2400000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-18','0','SYGR1251487331842051',23,'s***y',NULL,NULL),(2,'2','1','沈河区-四子王旗某牧民','68737fa5-f50a-11e6-ae4a-40167ea6bd58','2500000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-18','1','SYGR1251487331842052',-1,'-***1',NULL,NULL),(3,'2','1','和平区-四子王旗某牧民','6873812f-f50a-11e6-ae4a-40167ea6bd58','2000000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-18','1','SYGR1251487331842053',NULL,NULL,NULL,NULL),(4,'2','1','和平区-四子王旗某牧民','68738212-f50a-11e6-ae4a-40167ea6bd58','4500000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-18','0','SYGR1251487331842054',23,'s***y',NULL,NULL),(5,'2','0','和平区-四子王旗某牧民','68738296-f50a-11e6-ae4a-40167ea6bd58','2000000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-16','0','SYGR1251487331842055',NULL,NULL,NULL,NULL),(6,'2','0','和平区-四子王旗某牧民','68738316-f50a-11e6-ae4a-40167ea6bd58','2000000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16',NULL,'0','SYGR1251487331842056',NULL,NULL,NULL,NULL),(7,'3','1','和平区-四子王旗某牧民','687383e6-f50a-11e6-ae4a-40167ea6bd58','1000000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-18','0','SYGR1251487331842057',23,'s***y',NULL,NULL),(8,'4','0','和平区-四子王旗某牧民','6873846e-f50a-11e6-ae4a-40167ea6bd58','2000000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16',NULL,'0','SYGR1251487331842058',NULL,NULL,NULL,NULL),(9,'45','0','和平区-四子王旗某牧民','687384d0-f50a-11e6-ae4a-40167ea6bd58','10000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16',NULL,'0','SYGR1251487331842059',NULL,NULL,NULL,NULL),(10,'56','0','和平区-四子王旗某牧民','68738513-f50a-11e6-ae4a-40167ea6bd58','500000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16',NULL,'0','SYGR1251487331842060',NULL,NULL,NULL,NULL),(11,'7','0','和平区-四子王旗某牧民','68738565-f50a-11e6-ae4a-40167ea6bd58','2000000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16',NULL,'0','SYGR1251487331842061',NULL,NULL,NULL,NULL),(12,'0','0','和平区-四子王旗某牧民','687385a3-f50a-11e6-ae4a-40167ea6bd58','900000','辽宁省沈阳市皇姑区长江南街6号',NULL,NULL,'2017-02-18','1','SYGR1251487331842062',NULL,NULL,NULL,NULL),(13,'0','0','2和平区-四子王旗某牧民3','687385eb-f50a-11e6-ae4a-40167ea6bd58','100000','辽宁省沈阳市皇姑区长江南街6号','2017-02-16','2017-02-16','2017-02-18','0','SYGR1251487331842063',NULL,NULL,NULL,NULL),(14,'0','1','开始快速健康1','f519b396-cfa5-4744-b940-d317870e5113','111','卡积分卡萨积分','2017-02-17','2017-02-17','2017-02-18','1','SYGR1251487331842064',-1,'-***1',NULL,NULL),(15,'0','0','开始快速健康2','f519b396-cfa5-4744-b940-d317870e5112','111','卡积分卡萨积分','2017-02-17','2017-02-17','2017-02-17','0','SYGR1251487331842065',NULL,NULL,NULL,NULL),(16,'0','1','审核去--四子王旗某牧民','f10dc995-24eb-4890-b181-6e28a400983e','4000000','阿隆索的空间里看见萨的立法科技','2017-02-17','2017-02-17','2017-02-18','0','SYGR1251487331842066',23,'s***y',NULL,NULL),(17,'3','1','123阿斯蒂芬斯大夫','7490b5dd-6053-4b68-b5c4-bb5bfd96191e','123','12312asdfasdfsdaf风俗大法寺的','2017-02-17','2017-02-17','2017-02-18','0','SYGR1251487332291767',23,'s***y',NULL,NULL),(18,'0','0','asdfsadf萨的风俗的','f7bba3d9-015c-4d68-b52a-ac76c9acfcfe','123','散大夫斯蒂芬斯的复苏的速度','2017-02-18','2017-02-18','2017-02-18','0','SYGR1251487388210829',NULL,NULL,'2017-02-18 03:23:30','67ce95b9-c9c3-44a5-b1c5-bbcf60d0907f'),(19,'0','1','2','f64213b4-ad4e-431b-be5c-435a1a1dd000','3','3','2017-02-05','2017-02-23','2017-02-18','0','SYGR1251487392275917',84,'s***y','2017-02-18 04:31:15',NULL),(20,'0','1','123','5a9cca5a-ff5b-4fcc-8284-67c4aaa5a5ae','12312','3','2017-02-08','2017-02-16','2017-02-18','0','SYGR1251487402267633',23,'s***y','2017-02-18 07:17:47','2efb5874-b0cc-473e-9bec-70652244aa39');
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
) ENGINE=InnoDB AUTO_INCREMENT=642 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action`
--

LOCK TABLES `sys_action` WRITE;
/*!40000 ALTER TABLE `sys_action` DISABLE KEYS */;
INSERT INTO `sys_action` VALUES (1,'测试action1','测试url1','1',0,'0',2,'fa-tag','','2016-03-30 13:40:29',NULL,'1'),(2,'测试action2','测试url2','1',0,'0',3,'fa-tag','','2016-03-30 13:40:29',NULL,'1'),(3,'测试action3','测试url3','1',0,'0',4,'fa-tag','','2016-03-30 13:40:29',NULL,'1'),(4,'测试action4edit','测试url4','1',0,'0',5,'fa-list-alt','','2016-03-30 13:40:29','2016-05-19 03:39:42','1'),(5,'测试action5','测试url5','1',0,'0',6,'fa-list-alt','','2016-03-30 13:40:29',NULL,'1'),(6,'债务包管理','测试url6','1',0,'0',1,'fa-desktop','','2016-03-30 13:40:29','2017-02-15 07:15:11','1'),(7,'系统管理','','1',0,'0',99,'fa-list','3234',NULL,'2015-12-08 07:15:40','1'),(8,'测试action8','测试url8','1',0,'0',7,'fa-list-alt',NULL,'2016-03-30 14:14:37',NULL,'1'),(11,'角色管理','role/index.html','1',7,'0',1,NULL,'',NULL,'2016-01-27 03:04:34','0'),(12,'人员管理','user/index.html','1',7,'0',2,NULL,'',NULL,'2016-01-27 03:04:44','0'),(31,'获取角色列表','base/getRoles.do','3',11,'0',31,NULL,NULL,NULL,NULL,'0'),(32,'新增部门保存','base/addDept.do','3',12,'0',32,NULL,NULL,NULL,NULL,'0'),(33,'编辑部门保存','base/updateDept.do','3',12,'0',33,NULL,NULL,NULL,NULL,'0'),(34,'删除部门','base/delDept.do','3',12,'0',34,NULL,NULL,NULL,NULL,'0'),(35,'根据公司取得部门','base/getDeptForCompany.do','3',12,'0',35,NULL,NULL,NULL,NULL,'0'),(36,'用户启用/停用','base/updateUserStatus.do','3',12,'0',36,NULL,NULL,NULL,NULL,'0'),(37,'删除用户','base/delUser.do','3',12,'0',37,NULL,NULL,NULL,NULL,'0'),(38,'职位列表','base/getPositionList.do','3',12,'0',38,NULL,NULL,NULL,NULL,'0'),(39,'新增员工','base/addUser.do','3',12,'0',39,NULL,NULL,NULL,NULL,'0'),(41,'用户信息修改','base/updateUser.do','3',12,'0',41,NULL,NULL,NULL,NULL,'0'),(42,'根据用户id查询用户信息','base/getOneForUserId.do','3',12,'0',42,NULL,NULL,NULL,NULL,'0'),(43,'用户绑定/解绑','base/updateUserBind.do','3',12,'0',43,NULL,NULL,NULL,NULL,'0'),(44,'根据用户名查询人员验证','base/getOneUserForName.do','3',12,'0',44,NULL,NULL,NULL,NULL,'0'),(45,'导入用户','base/importUser.do','3',12,'0',45,NULL,NULL,NULL,NULL,'0'),(46,'人员信息修改','base/updateUser.do','3',12,'0',46,NULL,NULL,NULL,NULL,'0'),(331,'添加权限','base/addModule.do','3',11,'0',2,'','',NULL,NULL,'0'),(354,'载入权限信息','base/getPermissonInfo.do','3',11,'0',99,NULL,'','2015-12-04 07:58:08',NULL,'0'),(359,'添加角色','base/addRole.do','3',11,'0',13,NULL,'','2015-12-07 06:14:41',NULL,'0'),(360,'删除角色','base/deleteRole.do','3',11,'0',3,NULL,'','2015-12-07 09:23:49',NULL,'0'),(361,'获取单个角色信息','base/goEdit.do','3',11,'0',21,NULL,'','2015-12-07 09:42:41',NULL,'0'),(362,'更新角色信息','base/updateRole.do','3',11,'0',1,NULL,'','2015-12-08 01:23:02',NULL,'0'),(363,'获取当前角色所对应的权限','base/getRoleActions.do','3',11,'0',12,NULL,'','2015-12-08 03:06:25',NULL,'0'),(364,'删除权限','base/deleteModule.do','3',11,'0',89,NULL,'','2015-12-08 07:11:34',NULL,'0'),(365,'获取人员列表','base/getUserPageList.do','3',12,'0',NULL,NULL,NULL,NULL,NULL,'0'),(440,'获取权限树','base/getWebModuleTree.do','3',11,'0',NULL,NULL,NULL,NULL,NULL,'0'),(446,'添加用户页面里面的角色权限列表','base/getAddUserRoleList.do','3',11,'0',NULL,NULL,NULL,NULL,NULL,'0'),(459,'更新模块','base/updateModule.do','3',11,'0',15,NULL,'','2016-01-26 07:40:05',NULL,'0'),(465,'展开详细操作日志','log/subList.do','1',463,'0',2,NULL,'','2016-02-22 19:30:00','2016-02-23 13:59:13','0'),(466,'获取用户信息','base/getUserInfos.do','3',12,'0',2,NULL,NULL,NULL,NULL,'0'),(468,'获取角色信息','base/getAllRole.do','3',11,'0',4,NULL,NULL,NULL,NULL,'0'),(470,'测试action470','测试url470','3',12,'0',7,NULL,NULL,NULL,NULL,'0'),(473,'测试action473','测试url473','3',11,'0',4,NULL,NULL,NULL,NULL,'0'),(493,'测试action493','测试url493','3',12,'0',7,NULL,'','2016-03-13 20:36:02',NULL,'0'),(494,'测试action494','测试url494','3',12,'0',5,NULL,'','2016-03-13 20:38:54',NULL,'0'),(495,'测试action495','测试url495','3',12,'0',3,NULL,'','2016-03-13 20:48:14',NULL,'0'),(496,'测试action496','测试url496','1',12,'0',6,NULL,'','2016-03-13 20:51:29',NULL,'0'),(539,'个人债务','debt/index_1.html','1',6,'0',1,NULL,'','2016-03-30 13:41:51','2017-02-15 07:16:20','0'),(541,'测试action541','测试url541','1',539,'0',2,NULL,'','2016-03-30 14:08:06',NULL,'0'),(542,'测试action542','测试url542','3',540,'0',1,NULL,'','2016-03-30 14:12:20',NULL,'0'),(543,'测试action543123sss111','测试url5433','3',0,'0',98,NULL,'','2016-03-30 14:14:37','2016-05-19 06:33:08','0'),(545,'测试action545','测试url545','3',540,'0',1,NULL,NULL,'2016-04-12 08:51:36',NULL,'0'),(546,'测试action546','测试url546','3',540,'0',1,NULL,NULL,'2016-04-13 02:22:22',NULL,'0'),(547,'测试action547','测试url547','3',540,'0',1,NULL,NULL,'2016-04-13 02:22:25',NULL,'0'),(548,'测试action548','测试url548','3',540,'0',1,NULL,NULL,'2016-04-13 02:22:28',NULL,'0'),(549,'测试action549','测试url549','3',540,'0',1,NULL,NULL,'2016-04-13 08:28:18',NULL,'0'),(550,'测试action550','测试url550','3',540,'0',1,NULL,NULL,'2016-04-14 01:45:17',NULL,'0'),(551,'测试action551','测试url551','1',1,'0',1,NULL,'','2016-04-14 02:36:55',NULL,'0'),(552,'测试action552','测试url552','3',540,'0',1,NULL,NULL,'2016-04-14 02:50:24',NULL,'0'),(553,'测试action553','测试url553','3',551,'0',1,NULL,'','2016-04-14 03:02:27',NULL,'0'),(554,'测试action554','测试url554','1',2,'0',2,NULL,'','2016-04-14 06:33:36',NULL,'0'),(555,'测试action555','测试url555','3',554,'0',1,NULL,'','2016-04-14 08:23:28',NULL,'0'),(556,'测试action556','测试url556','3',554,'0',1,NULL,NULL,'2016-04-14 09:42:21',NULL,'0'),(557,'测试action557','测试url557','1',2,'0',3,NULL,NULL,'2016-04-14 10:24:05',NULL,'0'),(558,'测试action558','测试url558','1',2,'0',4,NULL,NULL,'2016-04-14 10:29:41',NULL,'0'),(559,'测试action559','测试url559','1',5,'0',1,NULL,NULL,'2016-04-15 01:27:10',NULL,'0'),(560,'测试action560','测试url560','1',5,'0',2,NULL,NULL,'2016-04-15 02:05:08',NULL,'0'),(561,'测试action561','测试url561','1',3,'0',2,NULL,NULL,'2016-04-15 02:39:08',NULL,'0'),(562,'测试action562','测试url562','1',3,'0',3,'',NULL,'2016-04-15 03:07:01',NULL,'0'),(563,'测试action563','测试url563','1',3,'0',4,NULL,NULL,'2016-04-15 03:25:48',NULL,'0'),(564,'测试action564','测试url564','1',4,'0',1,NULL,NULL,'2016-04-15 05:44:25',NULL,'0'),(565,'测试action565','测试url565','3',554,'0',1,NULL,NULL,'2016-04-15 08:08:31',NULL,'0'),(566,'测试action566','测试url566','3',554,'0',1,NULL,NULL,'2016-04-15 08:39:27',NULL,'0'),(567,'测试action567','测试url567','3',554,'0',1,NULL,NULL,'2016-04-15 08:54:53',NULL,'0'),(568,'测试action568','测试url568','3',558,'0',1,NULL,NULL,'2016-04-18 02:34:07',NULL,'0'),(569,'测试action569','测试url569','1',3,'0',1,NULL,NULL,'2016-04-18 02:29:18',NULL,'0'),(570,'测试action570','测试url570','3',558,'0',1,NULL,NULL,'2016-04-18 02:43:24',NULL,'0'),(571,'测试action571','测试url571','3',558,'0',1,NULL,NULL,'2016-04-18 03:39:47',NULL,'0'),(572,'测试action572','测试url572','3',569,'0',1,NULL,NULL,'2016-04-18 05:40:04',NULL,'0'),(574,'测试action574','测试url574','3',558,'0',1,NULL,NULL,'2016-04-18 06:08:44',NULL,'0'),(575,'测试action575','测试url575','3',558,'0',1,NULL,NULL,'2016-04-18 06:13:54',NULL,'0'),(576,'测试action576','测试url576','3',558,'0',1,NULL,NULL,'2016-04-18 07:24:05',NULL,'0'),(577,'测试action577','测试url577','3',558,'0',1,NULL,NULL,'2016-04-18 07:41:10',NULL,'0'),(578,'测试action578','测试url578','3',558,'0',1,NULL,NULL,'2016-04-19 01:23:06',NULL,'0'),(579,'测试action579','测试url579','3',557,'0',1,NULL,NULL,'2016-04-19 02:00:47',NULL,'0'),(580,'测试action580','测试url580','3',557,'0',1,NULL,NULL,'2016-04-19 02:22:39',NULL,'0'),(581,'测试action581','测试url581','3',557,'0',1,NULL,NULL,'2016-04-19 03:05:03',NULL,'0'),(582,'测试action582','测试url582','1',2,'0',1,NULL,NULL,'2016-04-19 03:36:01',NULL,'0'),(583,'测试action583','测试url583','3',569,'0',1,NULL,NULL,'2016-04-19 03:47:01',NULL,'0'),(584,'测试action584','测试url584','3',559,'0',1,NULL,NULL,'2016-04-19 06:29:02',NULL,'0'),(585,'测试action585','测试url585','1',8,'0',1,NULL,NULL,'2016-04-21 01:39:55',NULL,'0'),(587,'测试action587','测试url587','3',564,'0',1,NULL,NULL,'2016-04-21 07:10:07',NULL,'0'),(588,'测试action588','测试url588','3',563,'0',1,NULL,NULL,'2016-04-21 07:31:57',NULL,'0'),(589,'测试action589','测试url589','3',563,'0',1,NULL,NULL,'2016-04-21 07:31:54',NULL,'0'),(590,'测试action590','测试url590','3',563,'0',1,NULL,NULL,'2016-04-21 07:32:59',NULL,'0'),(591,'测试action591','测试url591','3',563,'0',1,NULL,NULL,'2016-04-21 07:34:39',NULL,'0'),(592,'测试action592','测试url592','1',4,'0',1,NULL,NULL,'2016-04-21 07:53:04',NULL,'0'),(593,'测试action593','测试url593','3',592,'0',1,NULL,NULL,'2016-04-21 07:58:44',NULL,'0'),(594,'测试action594','测试url594','3',592,'0',1,NULL,NULL,'2016-04-21 08:36:00',NULL,'0'),(595,'测试action595','测试url595','3',592,'0',1,NULL,NULL,'2016-04-21 09:08:55',NULL,'0'),(596,'测试action596','测试url596','3',592,'0',1,NULL,NULL,'2016-04-21 09:43:40',NULL,'0'),(597,'测试action597','测试url597','3',592,'0',1,NULL,NULL,'2016-04-21 09:48:48',NULL,'0'),(598,'测试action598','测试url598','3',592,'0',1,NULL,NULL,'2016-04-22 01:01:37',NULL,'0'),(599,'测试action599','测试url599','3',592,'0',1,NULL,NULL,'2016-04-22 01:15:24',NULL,'0'),(600,'测试action600','测试url600','3',592,'0',1,NULL,NULL,'2016-04-22 03:09:56',NULL,'0'),(601,'测试action601','测试url601','3',12,'0',20,NULL,'','2016-04-21 17:41:48',NULL,'0'),(602,'测试action602','测试url602','3',585,'0',1,NULL,NULL,'2016-04-22 06:50:43',NULL,'0'),(603,'测试action603','测试url603','3',563,'0',2,NULL,NULL,'2016-04-22 09:14:28',NULL,'0'),(604,'测试action604','测试url604','3',585,'0',1,NULL,NULL,'2016-04-25 01:07:43',NULL,'0'),(605,'测试action605','测试url605','3',585,'0',1,NULL,NULL,'2016-04-25 01:41:34',NULL,'0'),(606,'测试action606','测试url606','3',558,'0',1,NULL,NULL,'2016-04-26 01:02:36',NULL,'0'),(607,'测试action607','测试url607','3',12,'0',55,NULL,'','2016-04-26 15:37:40',NULL,'0'),(618,'测试action618','测试url618','3',592,'0',1,NULL,NULL,'2016-04-29 09:12:42',NULL,'0'),(619,'测试action619','测试url619','3',558,'0',1,NULL,NULL,'2016-05-04 06:34:14',NULL,'0'),(620,'测试action620','测试url620','3',559,'0',1,NULL,NULL,'2016-05-05 02:54:39',NULL,'0'),(621,'测试action621','测试url621','3',569,'0',1,NULL,NULL,'2016-05-06 02:34:12',NULL,'0'),(626,'测试action626','测试url626','3',557,'0',1,NULL,NULL,'2016-05-11 07:08:40',NULL,'0'),(628,'测试action628','测试url628','3',563,'0',1,NULL,NULL,'2016-05-12 11:56:56',NULL,'0'),(630,'测试action630','测试url630','3',569,'0',1,NULL,NULL,'2016-05-16 07:46:01',NULL,'0'),(631,'系统欢迎页面','dashboard.html','3',7,'0',78,NULL,'','2016-05-22 12:09:14',NULL,'0'),(632,'银行债务','123','1',6,'0',2,NULL,'','2017-02-15 07:16:43',NULL,'0'),(633,'企业债务','123','1',6,'0',3,NULL,'','2017-02-15 07:17:04',NULL,'0'),(634,'债务拍卖','1232','1',6,'0',4,NULL,'','2017-02-15 07:17:38',NULL,'0'),(635,'债务列表','home/index.html','3',6,'0',5,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(636,'读取更多债务列表','home/loadMore.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(637,'读取人员信息','user/index.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(638,'获取债务基本信息','home/detial.html','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(639,'获取服务端的债务信息','debt/selectOne.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(640,'竞标','debt/target.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0'),(641,'管理员债务列表1','debt/index.do','3',6,'0',6,NULL,NULL,'2017-02-15 07:17:38',NULL,'0');
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
) ENGINE=InnoDB AUTO_INCREMENT=16574 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action_role`
--

LOCK TABLES `sys_action_role` WRITE;
/*!40000 ALTER TABLE `sys_action_role` DISABLE KEYS */;
INSERT INTO `sys_action_role` VALUES (15784,7,3,1,NULL,NULL),(15785,12,3,1,NULL,NULL),(15786,32,3,1,NULL,NULL),(15787,33,3,1,NULL,NULL),(15788,34,3,1,NULL,NULL),(15789,35,3,1,NULL,NULL),(15790,36,3,1,NULL,NULL),(15791,37,3,1,NULL,NULL),(15792,38,3,1,NULL,NULL),(15793,39,3,1,NULL,NULL),(15794,41,3,1,NULL,NULL),(15795,42,3,1,NULL,NULL),(15796,43,3,1,NULL,NULL),(15797,44,3,1,NULL,NULL),(15798,45,3,1,NULL,NULL),(15799,46,3,1,NULL,NULL),(15800,365,3,1,NULL,NULL),(15801,466,3,1,NULL,NULL),(15802,470,3,1,NULL,NULL),(15803,493,3,1,NULL,NULL),(15804,494,3,1,NULL,NULL),(15805,495,3,1,NULL,NULL),(15806,496,3,1,NULL,NULL),(15807,601,3,1,NULL,NULL),(15808,607,3,1,NULL,NULL),(16185,7,16,1,NULL,NULL),(16186,631,16,1,NULL,NULL),(16520,6,1,1,NULL,NULL),(16521,539,1,1,NULL,NULL),(16522,541,1,1,NULL,NULL),(16523,632,1,1,NULL,NULL),(16524,633,1,1,NULL,NULL),(16525,634,1,1,NULL,NULL),(16526,7,1,1,NULL,NULL),(16527,11,1,1,NULL,NULL),(16528,31,1,1,NULL,NULL),(16529,331,1,1,NULL,NULL),(16530,354,1,1,NULL,NULL),(16531,359,1,1,NULL,NULL),(16532,360,1,1,NULL,NULL),(16533,361,1,1,NULL,NULL),(16534,362,1,1,NULL,NULL),(16535,363,1,1,NULL,NULL),(16536,364,1,1,NULL,NULL),(16537,440,1,1,NULL,NULL),(16538,446,1,1,NULL,NULL),(16539,459,1,1,NULL,NULL),(16540,468,1,1,NULL,NULL),(16541,473,1,1,NULL,NULL),(16542,12,1,1,NULL,NULL),(16543,32,1,1,NULL,NULL),(16544,33,1,1,NULL,NULL),(16545,34,1,1,NULL,NULL),(16546,35,1,1,NULL,NULL),(16547,36,1,1,NULL,NULL),(16548,37,1,1,NULL,NULL),(16549,38,1,1,NULL,NULL),(16550,39,1,1,NULL,NULL),(16551,41,1,1,NULL,NULL),(16552,42,1,1,NULL,NULL),(16553,43,1,1,NULL,NULL),(16554,44,1,1,NULL,NULL),(16555,45,1,1,NULL,NULL),(16556,46,1,1,NULL,NULL),(16557,365,1,1,NULL,NULL),(16558,466,1,1,NULL,NULL),(16559,470,1,1,NULL,NULL),(16560,493,1,1,NULL,NULL),(16561,494,1,1,NULL,NULL),(16562,495,1,1,NULL,NULL),(16563,496,1,1,NULL,NULL),(16564,601,1,1,NULL,NULL),(16565,607,1,1,NULL,NULL),(16566,631,1,1,NULL,NULL),(16567,635,1,1,NULL,NULL),(16568,636,1,1,NULL,NULL),(16569,637,1,1,NULL,NULL),(16570,638,1,1,NULL,NULL),(16571,639,1,1,NULL,NULL),(16572,640,1,1,NULL,NULL),(16573,641,1,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,NULL,NULL,'ajaxfileupload.js',NULL,'/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/d97a2fd8-2069-4cd2-8582-7e0b36eaae96','0','7395','application/javascript',NULL),(2,'2017-02-18 06:45:09','2017-02-18 06:45:09','fileuploadajax-v1-2.zip','fileuploadajax-v1-2.zip','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/5084328d-e2ff-494d-8954-20535bdb8448','0','14512','application/zip',NULL),(3,'2017-02-18 06:48:24','2017-02-18 06:48:24','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/125a3ff7-2bab-4cd2-8f11-ddcddd012ee0','0','7395','application/javascript',NULL),(4,'2017-02-18 06:48:35','2017-02-18 06:48:35','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/ef95a851-e79b-4a74-ab2c-947b49250862','0','7395','application/javascript',NULL),(5,'2017-02-18 06:50:21','2017-02-18 06:50:21','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/b5049c5b-9ed7-4abf-a31e-a82105537188','0','7395','application/javascript',NULL),(6,'2017-02-18 06:50:35','2017-02-18 06:50:35','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/0e04b173-a06c-4505-a2f3-bf05b09d63cd','0','7395','application/javascript',NULL),(7,'2017-02-18 06:51:16','2017-02-18 06:51:16','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/d9dda6c2-8772-43ea-80d0-51cf837c891f','0','7395','application/javascript',NULL),(8,'2017-02-18 06:54:28','2017-02-18 06:54:28','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/9a277da2-0f81-4757-b255-68766f075081','0','7395','application/javascript',NULL),(9,'2017-02-18 06:58:25','2017-02-18 06:58:25','fileuploadajax-v1-2.zip','fileuploadajax-v1-2.zip','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/490cb334-f1ee-4cb4-b926-6963c71c1fc7','0','14512','application/zip','a281fda0-9d59-405a-9518-991cb630eee5'),(10,'2017-02-18 06:59:42','2017-02-18 06:59:42','logo.png.png','logo.png.png','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/2c7fb25e-59c4-455f-98c4-3255241e161b','0','2138','image/png','4c332191-773f-44a6-a361-da8e921d871f'),(11,'2017-02-18 07:01:25','2017-02-18 07:01:25','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/4f70cb22-f111-4432-a681-6169b06fa1c9','0','7395','application/javascript','11fc19af-ff7f-4a54-adc7-76c538d01f71'),(12,'2017-02-18 07:02:30','2017-02-18 07:02:30','dd.tar.gz','dd.tar.gz','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/68ea0005-c509-4fd7-b971-a29bba18c450','0','81491','application/gzip','90ecef9e-e695-4386-b7bc-f38abda73bef'),(13,'2017-02-18 07:03:37','2017-02-18 07:03:37','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/e4e9d467-a1f7-48d9-9087-e7cd47a6b698','0','7395','application/javascript','ccae8414-f2bc-4311-b4e8-c0753d312be4'),(14,'2017-02-18 07:06:52','2017-02-18 07:06:52','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/0526eee2-9bac-4829-927a-8051ca970ba6','0','7395','application/javascript','37e5de75-52da-4c5e-92f1-2d28e26ae3dc'),(15,'2017-02-18 07:10:10','2017-02-18 07:10:10','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/4a064e3d-bedf-4f3e-9f9a-4beaa93e0c08','0','7395','application/javascript','467e7f96-94af-419e-88b9-d5b2291e9433'),(16,'2017-02-18 07:11:56','2017-02-18 07:11:56','fileuploadajax-v1-2.zip','fileuploadajax-v1-2.zip','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/56fafba9-bc64-48c1-8e6f-707892f86508','0','14512','application/zip','d0e09d70-c80b-446a-9a0f-d8b09c5ef536'),(17,'2017-02-18 07:12:11','2017-02-18 07:12:11','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/ce075077-6de6-43c1-9473-63138d9f886d','0','7395','application/javascript','f55da55a-0c70-4975-9dd6-6bc1b8850f27'),(18,'2017-02-18 07:12:15','2017-02-18 07:12:15','fileuploadajax-v1-2.zip','fileuploadajax-v1-2.zip','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/87812c0d-fdf3-40b7-a168-365dd2d90813','0','14512','application/zip','104bf1db-20a6-4764-8d3a-e443cffcf4fb'),(19,'2017-02-18 07:12:26','2017-02-18 07:12:26','dd.tar.gz','dd.tar.gz','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/2c88269a-1607-4647-9da8-c6af2cdb0cdb','0','81491','application/gzip','3ae51938-e5dd-4bac-b33a-53118d53e551'),(20,'2017-02-18 07:12:31','2017-02-18 07:12:31','moban1870.rar','moban1870.rar','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/575faba6-61ed-4c75-ab47-49b160830df1','0','4638744','application/x-rar','73218785-51c6-46d6-9729-fb40639f2e34'),(21,'2017-02-18 07:12:35','2017-02-18 07:12:35','人月神话(英文版).pdf','人月神话(英文版).pdf','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/4cf18736-600c-4dee-a4f5-df268b82c1d7','0','4851607','application/pdf','2d6017fc-6806-423e-a928-0538fc361b29'),(22,'2017-02-18 07:12:44','2017-02-18 07:12:44','xampp-linux-x64-5.6.28-0-installer.run','xampp-linux-x64-5.6.28-0-installer.run','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/007ec25b-2c74-4490-b579-4fcbe2c6317e','0','133700963','application/octet-stream','b34bbf96-1714-4754-9fad-df9569824975'),(23,'2017-02-18 07:14:14','2017-02-18 07:14:14','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/a1b23ab4-8d49-4133-bbbc-679a09b9cde2','0','7395','application/javascript','05ee9122-0c97-4eb1-8eee-6b5624123879'),(24,'2017-02-18 07:17:43','2017-02-18 07:17:43','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/6a85e4d8-b97a-413f-8171-982ad74320c2','0','7395','application/javascript','891d15b9-bbdb-4ff3-87a5-ed4f1d7661cf'),(25,'2017-02-18 07:32:03','2017-02-18 07:32:03','fileuploadajax-v1-2.zip','fileuploadajax-v1-2.zip','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/97c745a1-e233-4d6e-b593-7873b55f3a75','0','14512','application/zip','2efb5874-b0cc-473e-9bec-70652244aa39'),(26,'2017-02-18 07:43:04','2017-02-18 07:43:04','font.css','font.css','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/c45eb456-8ac6-447d-b631-c1831adaae13','0','707','text/css','44563ad5-2650-4515-b6cc-8641e65f1248'),(27,'2017-02-18 07:43:25','2017-02-18 07:43:25','9975c9d95305df6143bb8d558cd8e989fa447a66.jpg','9975c9d95305df6143bb8d558cd8e989fa447a66.jpg','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/c389bd08-54ce-4877-91eb-7ca9a7e3c0b4','0','112470','image/jpeg','15c1a5c8-9ace-4b36-a5f1-2d79f87627b6'),(28,'2017-02-18 07:44:38','2017-02-18 07:44:38','ajaxfileupload.js','ajaxfileupload.js','/home/zhuwj/workspace/server/base_ssm/src/main/webapp/upload/568dcb10-f98b-4078-bfac-72b9fd948e0e','0','7395','application/javascript','67ce95b9-c9c3-44a5-b1c5-bbcf60d0907f');
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
INSERT INTO `sys_role` VALUES (1,'超级管理员','1','维护系统，创建用户，维护角色等。','0',NULL,'2015-06-19 04:00:17',23,'2017-02-15 13:16:16','user/index.html'),(3,'账号管理员',NULL,'管理用户账号信息','0',NULL,'2016-05-18 09:43:31',NULL,'2016-05-22 09:00:01','user/index.html'),(16,'默认角色',NULL,'用户注册的默认角色','0',NULL,'2016-05-22 11:44:06',NULL,'2016-05-22 12:31:21','dashboard.html');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (23,'sunny','96E79218965EB72C92A549DD5A330112','sunny@163.com',18,'0','0','2016-05-17 02:43:02','2017-02-15 22:04:59','管理员','和平区莎莎姐','210102200088888888','管理整个网站','0'),(58,'zhanghaoguanliyuan','8FA0EF04D621492C6448AA9318B3C0C8','zhanghaoguanliyuan@163.com',23,'0','1','2016-05-22 08:05:30','2017-02-15 13:47:55',NULL,NULL,NULL,NULL,NULL),(59,'juese','B3C2522984F85F4720D130C84A9AF760','jueseguanliyuan@163.com',332,'0','1','2016-05-22 08:06:39','2017-02-15 13:47:53',NULL,NULL,NULL,NULL,NULL),(60,'newcomer','70CDB187B254F92D19C289FD2AFFC4B4','newcomer@163.com',NULL,'0','1','2016-05-22 08:10:01','2017-02-15 13:47:50',NULL,NULL,NULL,NULL,NULL),(61,'1','2','3',NULL,'0','0','2017-02-15 10:52:44',NULL,NULL,NULL,NULL,NULL,NULL),(62,'1','2','3',NULL,'0','0','2017-02-15 10:52:44',NULL,NULL,NULL,NULL,NULL,NULL),(63,'123','123','23',NULL,'0','0','2017-02-15 10:52:57',NULL,NULL,NULL,NULL,NULL,NULL),(64,'4','5','5',5,'0','1','2017-02-15 10:55:20','2017-02-15 10:55:25',NULL,NULL,NULL,NULL,NULL),(65,'1','23','4',34,'0','0','2017-02-15 11:05:26',NULL,NULL,NULL,NULL,NULL,NULL),(66,'1','23','4',34,'0','0','2017-02-15 11:05:26',NULL,NULL,NULL,NULL,NULL,NULL),(67,'5','5','5',5,'0','0','2017-02-15 11:07:39',NULL,NULL,NULL,NULL,NULL,NULL),(68,'3','4','5',6,'0','0','2017-02-15 11:14:01',NULL,NULL,NULL,NULL,NULL,NULL),(69,'3','4','5',6,'0','0','2017-02-15 11:14:01',NULL,NULL,NULL,NULL,NULL,NULL),(70,'3','4','5',6,'0','0','2017-02-15 11:18:44',NULL,NULL,NULL,NULL,NULL,NULL),(71,'3','4','5',6,'0','0','2017-02-15 11:18:44',NULL,NULL,NULL,NULL,NULL,NULL),(72,'7','7','7',7,'0','0','2017-02-15 11:19:28',NULL,NULL,NULL,NULL,NULL,NULL),(73,'8','8','8',8,'0','1','2017-02-15 11:21:01','2017-02-15 11:29:42',NULL,NULL,NULL,NULL,NULL),(74,'13','3','3',3,'0','1','2017-02-15 11:31:54','2017-02-15 11:35:33',NULL,NULL,NULL,NULL,NULL),(75,'4','4','4',4,'0','1','2017-02-15 11:35:50','2017-02-15 11:38:24',NULL,NULL,NULL,NULL,NULL),(76,'g5','5','5',5,'0','0','2017-02-15 11:39:02',NULL,NULL,NULL,NULL,NULL,NULL),(77,'f','3','3',3,'0','0','2017-02-15 11:39:19',NULL,NULL,NULL,NULL,NULL,NULL),(78,'2','2','2',2,'1','1','2017-02-15 11:39:42','2017-02-15 13:50:20',NULL,NULL,NULL,NULL,NULL),(79,'123','96E79218965EB72C92A549DD5A330112','',11,'0','1','2017-02-15 13:19:40','2017-02-15 13:50:18','123','12312','21010219870726132','所风俗的',NULL),(80,'123','96E79218965EB72C92A549DD5A330112','',11,'0','1','2017-02-15 13:20:20','2017-02-15 13:50:16','123','123','123','123123',NULL),(81,'186555115','E10ADC3949BA59ABBE56E057F20F883E','',121,'0','1','2017-02-15 13:20:56','2017-02-15 13:50:14','111112','1212','13123132','13215',NULL),(82,'18644445555','96E79218965EB72C92A549DD5A330112','',11,'0','0','2017-02-15 13:54:51',NULL,'张三阿','sdf撒旦风俗的','210102198707267213','asdfs挲得分阿斯蒂芬阿斯蒂芬撒旦',NULL),(83,'18644445555','96E79218965EB72C92A549DD5A330112','',11,'0','0','2017-02-15 13:56:43',NULL,'张三阿','sdf撒旦风俗的','210102198707267213','asdfs挲得分阿斯蒂芬阿斯蒂芬撒旦',NULL),(84,'1864445551','96E79218965EB72C92A549DD5A330112','',11,'1','0','2017-02-15 13:58:39','2017-02-15 22:05:06','斯蒂芬','阿的法斯蒂芬斯的方法','21010219887774475','123123123',NULL),(85,'1865554441','96E79218965EB72C92A549DD5A330112','',33,'0','0','2017-02-15 14:10:59','2017-02-15 22:19:35','库斯科','卡斯历代封建拉斯基地方','2101021987072672111','','1'),(86,'ss2','73882AB1FA529D7273DA0DB6B49CC4F3','',44,'0','0','2017-02-15 22:16:53','2017-02-15 22:17:24','ss','ss','54144484','44','0'),(87,'12312311231','96E79218965EB72C92A549DD5A330112','',111,'0','0','2017-02-16 22:51:29',NULL,'阿科技','拉阔三间的分类角色离开房间','21010219877774444','123','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (7,3,39,NULL,'sun3ny',NULL,'2016-05-22 11:18:45'),(11,5,38,NULL,'sunny3',23,'2016-05-22 11:39:24'),(12,16,NULL,NULL,NULL,-1,'2016-05-22 11:47:51'),(13,16,NULL,NULL,NULL,-1,'2016-05-22 11:48:47'),(14,16,NULL,NULL,NULL,-1,'2016-05-22 11:54:51'),(15,16,NULL,NULL,NULL,-1,'2016-05-22 11:58:10'),(16,16,52,NULL,NULL,-1,'2016-05-22 11:59:21'),(17,16,54,NULL,NULL,-1,'2016-05-22 12:00:08'),(18,16,56,NULL,'111115',-1,'2016-05-22 12:01:55'),(20,3,58,NULL,'zhanghaoguanliyuan',58,'2016-05-22 12:06:09'),(23,16,60,NULL,'newcomer',23,'2016-05-22 12:10:01'),(25,5,59,NULL,'juese',23,'2016-05-22 12:32:18'),(26,16,73,'16','8',8,'2017-02-15 03:21:01'),(27,16,74,'16','13',13,'2017-02-15 03:31:54'),(28,16,75,'16','4',4,'2017-02-15 03:35:50'),(29,16,78,'16','2',2,'2017-02-15 03:39:42'),(30,16,79,'16','123',123,'2017-02-15 05:19:40'),(31,16,80,'16','123',123,'2017-02-15 05:20:20'),(32,16,81,'16','186555115',186555115,'2017-02-15 05:20:56'),(33,16,84,'16','1864445551',23,'2017-02-15 05:58:39'),(34,16,85,'16','18866665555',23,'2017-02-15 06:10:59'),(36,1,23,NULL,'sunny',23,'2017-02-15 13:59:22'),(37,3,86,'3','ss',23,'2017-02-15 14:16:53'),(38,16,87,'16','12312311231',23,'2017-02-16 14:51:29');
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

-- Dump completed on 2017-02-19  8:42:28
