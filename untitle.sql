-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: untitle
-- ------------------------------------------------------
-- Server version	8.0.31

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

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `emailId` varchar(20) NOT NULL COMMENT '邮件ID号',
  `emailSender` varchar(30) NOT NULL COMMENT '发送者邮箱地址',
  `emailReceiver` varchar(30) DEFAULT NULL COMMENT '收人邮箱地址',
  `date` timestamp NOT NULL COMMENT '发送日期',
  `content` blob NOT NULL COMMENT '邮件正文内容',
  `size` bigint NOT NULL COMMENT '邮件大小 单位Byte',
  PRIMARY KEY (`emailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('1','2624773733@qq.com','1234561234@qq.com','2023-10-13 16:20:51',_binary '﻿阳哥阳哥万人迷!!!',8);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationform`
--

DROP TABLE IF EXISTS `notificationform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationform` (
  `formId` varchar(20) NOT NULL COMMENT '表单单号',
  `publisherId` varchar(20) NOT NULL COMMENT '发布者ID',
  `publisherName` varchar(20) NOT NULL COMMENT '发布者姓名',
  `publishDate` timestamp NOT NULL COMMENT '发布时间',
  `content` blob NOT NULL COMMENT '公告单内容',
  PRIMARY KEY (`formId`),
  KEY `notificationform_user0_null_fk` (`publisherId`),
  KEY `notificationform_user0_userName_fk` (`publisherName`),
  CONSTRAINT `notificationform_user0_null_fk` FOREIGN KEY (`publisherId`) REFERENCES `user0` (`userId`),
  CONSTRAINT `notificationform_user0_userName_fk` FOREIGN KEY (`publisherName`) REFERENCES `user0` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='公告单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationform`
--

LOCK TABLES `notificationform` WRITE;
/*!40000 ALTER TABLE `notificationform` DISABLE KEYS */;
INSERT INTO `notificationform` VALUES ('1','1','赵阳','2023-10-13 16:18:18',_binary '﻿阳哥阳哥威武霸气！！！');
/*!40000 ALTER TABLE `notificationform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` int NOT NULL,
  `parentid` int NOT NULL COMMENT '父子权限',
  `level` int NOT NULL COMMENT '权限等级',
  `code` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`parentid`,`id`),
  KEY `permission_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,0,1,'read','读权限'),(2,0,0,'write','写权限');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL COMMENT '角色id',
  `roleName` varchar(30) NOT NULL COMMENT '角色名称',
  `code` varchar(30) NOT NULL COMMENT '角色代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'管理员','sys_manager'),(1,'普通用户','normal_user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolepermissionref`
--

DROP TABLE IF EXISTS `rolepermissionref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolepermissionref` (
  `id` int NOT NULL COMMENT '本表唯一标识id',
  `rid` int NOT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rolePermissionRef_role_null_fk` (`rid`),
  KEY `rolepermissionref_permission_null_fk` (`pid`),
  CONSTRAINT `rolepermissionref_permission_null_fk` FOREIGN KEY (`pid`) REFERENCES `permission` (`id`),
  CONSTRAINT `rolePermissionRef_role_null_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolepermissionref`
--

LOCK TABLES `rolepermissionref` WRITE;
/*!40000 ALTER TABLE `rolepermissionref` DISABLE KEYS */;
INSERT INTO `rolepermissionref` VALUES (0,1,1),(1,0,2);
/*!40000 ALTER TABLE `rolepermissionref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionrecord`
--

DROP TABLE IF EXISTS `transactionrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionrecord` (
  `transactionId` varchar(30) NOT NULL COMMENT '交易单号',
  `senderId` varchar(20) NOT NULL COMMENT '发款方ID',
  `receiverId` varchar(20) NOT NULL COMMENT '收款方ID',
  `changedMoney` double NOT NULL COMMENT '变动金额',
  `date` timestamp NOT NULL COMMENT '交易时间',
  `restMoney` double NOT NULL COMMENT '余额',
  `payWay` varchar(40) NOT NULL COMMENT '支付方式：余额 zfb  wx  bankCard',
  `transactionState` varchar(40) NOT NULL DEFAULT '成功' COMMENT '交易状态 ：成功 失败 ',
  `transactionType` varchar(30) NOT NULL COMMENT '交易类型：充值 消费 转账 提现',
  PRIMARY KEY (`transactionId`),
  KEY `transactionrecord_user0_null_fk1` (`senderId`),
  KEY `transactionrecord_user0_null_fk2` (`receiverId`),
  CONSTRAINT `transactionrecord_user0_null_fk` FOREIGN KEY (`senderId`) REFERENCES `user0` (`userId`),
  CONSTRAINT `transactionrecord_user0_null_fk1` FOREIGN KEY (`senderId`) REFERENCES `user0` (`userId`),
  CONSTRAINT `transactionrecord_user0_null_fk2` FOREIGN KEY (`receiverId`) REFERENCES `user0` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='交易记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionrecord`
--

LOCK TABLES `transactionrecord` WRITE;
/*!40000 ALTER TABLE `transactionrecord` DISABLE KEYS */;
INSERT INTO `transactionrecord` VALUES ('11111','1','2',-5,'2023-10-13 16:17:33',5,'余额','成功','消费');
/*!40000 ALTER TABLE `transactionrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user0`
--

DROP TABLE IF EXISTS `user0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user0` (
  `userId` varchar(20) NOT NULL COMMENT '用户系统ID',
  `userPassword` varchar(20) NOT NULL COMMENT '用户密码',
  `userName` varchar(50) NOT NULL COMMENT '用户用户名',
  `userGender` tinyint(1) NOT NULL COMMENT '用户性别：男1 女0',
  `userBornDay` date NOT NULL COMMENT '用户出生年月日: 2000/12/1',
  `userIdCard` varchar(18) NOT NULL COMMENT '用户身份证号:18位',
  `userTelephone` varchar(11) NOT NULL COMMENT '用户电话:11位纯数字',
  `userEmail` varchar(30) NOT NULL COMMENT '用户邮箱:xxx@qq.com',
  `userMoney` double NOT NULL DEFAULT '0' COMMENT '用户余额',
  `userCompany` varchar(100) NOT NULL COMMENT '用户单位',
  `userHome` varchar(100) NOT NULL COMMENT '用户住址',
  `userIp` varchar(20) NOT NULL COMMENT '用户IP',
  `userType` tinyint NOT NULL DEFAULT '1' COMMENT '用户类型: 管理员0 普通1 会员2 超级会员3...',
  PRIMARY KEY (`userId`),
  KEY `user0_userName_index` (`userName`) COMMENT '用于作为被其他表外键的引用对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user0`
--

LOCK TABLES `user0` WRITE;
/*!40000 ALTER TABLE `user0` DISABLE KEYS */;
INSERT INTO `user0` VALUES ('1','11','赵阳',1,'2006-05-10','410522200605100070','13290824341','2624773733@qq.com',10,'天津职业技术师范大学','天津市津南区天津职业技术师范大学东区7E宿舍楼','192.168.0.1',0),('2','22','赵阳阳',1,'2005-05-10','410522200505100070','13290824342','2624773734@qq.com',0,'天津职业技术师范大学','天津市津南区天津职业技术师范大学东区7E宿舍楼','192.168.0.2',0);
/*!40000 ALTER TABLE `user0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `uid` int NOT NULL,
  `upassword` varchar(20) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'11','用户','2312@qq.com'),(2,'22','管理员','1321@qq.com');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroleref`
--

DROP TABLE IF EXISTS `userroleref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroleref` (
  `id` int NOT NULL COMMENT '本表唯一标识id',
  `uid` int NOT NULL,
  `rid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userRoleRef_role_null_fk` (`rid`),
  KEY `userRoleRef_userinfo_null_fk` (`uid`),
  CONSTRAINT `userRoleRef_role_null_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`id`),
  CONSTRAINT `userRoleRef_userinfo_null_fk` FOREIGN KEY (`uid`) REFERENCES `userinfo` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroleref`
--

LOCK TABLES `userroleref` WRITE;
/*!40000 ALTER TABLE `userroleref` DISABLE KEYS */;
INSERT INTO `userroleref` VALUES (0,1,1),(1,2,0);
/*!40000 ALTER TABLE `userroleref` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-15 22:15:55
