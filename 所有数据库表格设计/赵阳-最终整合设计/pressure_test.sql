-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: pressureTest
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Table structure for table `sys_announcement`
--

DROP TABLE IF EXISTS `sys_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement` (
  `announcement_id` bigint(20) NOT NULL COMMENT '公告单号',
  `publisher_id` bigint(20) NOT NULL COMMENT '发布者ID',
  `publisher_name` varchar(25) NOT NULL COMMENT '发布者姓名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `title` varchar(130) NOT NULL COMMENT '公告标题',
  `content_body` text NOT NULL COMMENT '公告内容',
  `priority` tinyint(4) NOT NULL COMMENT '公告显示优先级: 0代表最普通 1代表vip  2代表s_vip 3代表ss_vip',
  `link` varchar(255) NOT NULL COMMENT '可选的公告链接',
  PRIMARY KEY (`announcement_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `publisher_name` (`publisher_name`),
  CONSTRAINT `sys_announcement_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `sys_announcement_ibfk_2` FOREIGN KEY (`publisher_name`) REFERENCES `sys_user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement`
--

LOCK TABLES `sys_announcement` WRITE;
/*!40000 ALTER TABLE `sys_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email`
--

DROP TABLE IF EXISTS `sys_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email` (
  `email_id` bigint(20) NOT NULL COMMENT '邮件ID号',
  `email_sort` bigint(20) DEFAULT NULL COMMENT '便于排序',
  `email_sender` varchar(30) NOT NULL COMMENT '发送者邮箱地址',
  `email_receiver` varchar(30) NOT NULL COMMENT '收件人邮箱地址',
  `email_title` varchar(120) DEFAULT NULL COMMENT '邮件标题',
  `email_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送日期',
  `text_body` text NOT NULL COMMENT '邮件正文内容',
  `email_size` bigint(20) NOT NULL COMMENT '邮件大小 单位Byte',
  PRIMARY KEY (`email_id`),
  KEY `email_sender` (`email_sender`),
  CONSTRAINT `sys_email_ibfk_1` FOREIGN KEY (`email_sender`) REFERENCES `sys_user` (`user_sys_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email`
--

LOCK TABLES `sys_email` WRITE;
/*!40000 ALTER TABLE `sys_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_power`
--

DROP TABLE IF EXISTS `sys_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_power` (
  `power_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `power_name` varchar(30) NOT NULL COMMENT '权限名称',
  `power_type` tinyint(1) NOT NULL COMMENT '权限类型（1：可操作 2:可访问）',
  `power_comment` varchar(100) DEFAULT '' COMMENT '权限描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `notes` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_power`
--

LOCK TABLES `sys_power` WRITE;
/*!40000 ALTER TABLE `sys_power` DISABLE KEYS */;
INSERT INTO `sys_power` VALUES (1,'公告系统',1,'公告系统','2023-10-22 21:53:14',''),(2,'内部邮箱系统',1,'内部邮箱系统','2023-10-22 21:53:14',''),(3,'用户管理',1,'用户管理','2023-10-22 21:53:14',''),(4,'任务管理',1,'任务管理','2023-10-22 21:53:14',''),(5,'内部服务器集群管理',1,'内部服务器集群管理','2023-10-22 21:53:14',''),(6,'发布任务',1,'发布任务','2023-10-22 21:53:15',''),(7,'任务状态',1,'任务状态','2023-10-22 21:53:15',''),(100,'发布公告',1,'发布公告','2023-10-22 21:53:14',''),(101,'删除公告',1,'删除公告','2023-10-22 21:53:15',''),(102,'菜单管理',1,'菜单管理','2023-10-22 21:53:15',''),(600,'开始任务',1,'开始任务','2023-10-22 21:53:15',''),(601,'暂停任务',1,'暂停任务','2023-10-22 21:53:15',''),(602,'结束任务',1,'结束任务','2023-10-22 21:53:15',''),(700,'查看测试结果',1,'查看测试结果','2023-10-22 21:53:15','');
/*!40000 ALTER TABLE `sys_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` smallint(8) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` smallint(4) NOT NULL COMMENT '显示顺序',
  `status_flag` tinyint(1) NOT NULL COMMENT '角色状态（0正常 1停用 2删除）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_sort` (`role_sort`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','admin',1,0,'超级管理员'),(2,'测试者','test',2,0,'普通角色'),(3,'被测者','tested',3,0,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_power`
--

DROP TABLE IF EXISTS `sys_role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_power` (
  `role_id` smallint(8) NOT NULL COMMENT '角色ID',
  `power_id` int(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`power_id`),
  KEY `sys_role_power_sys_power_power_id_fk` (`power_id`),
  CONSTRAINT `sys_role_power_sys_power_power_id_fk` FOREIGN KEY (`power_id`) REFERENCES `sys_power` (`power_id`),
  CONSTRAINT `sys_role_power_sys_role_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_power`
--

LOCK TABLES `sys_role_power` WRITE;
/*!40000 ALTER TABLE `sys_role_power` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_task`
--

DROP TABLE IF EXISTS `sys_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_task` (
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `task_publisher_id` bigint(20) NOT NULL COMMENT '指向任务发布者id',
  `task_sort` bigint(20) NOT NULL COMMENT '任务排序',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `task_nick_name` varchar(255) NOT NULL COMMENT '任务名称(英文)',
  `task_publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务发布时间',
  `task_http_method` varchar(255) NOT NULL COMMENT 'http方法 post，get，patch等',
  `target_system_url` varchar(255) NOT NULL COMMENT '接口测试url',
  `test_script` text NOT NULL COMMENT '脚本文本代码',
  `concurrent_users` int(11) NOT NULL COMMENT '并发测试人数',
  `frequency_value` int(11) NOT NULL COMMENT '时间频率值',
  `time_unit` varchar(10) NOT NULL COMMENT '时间单位字段 秒 分钟',
  `task_reward` double NOT NULL COMMENT '任务报酬',
  `duration` int(11) NOT NULL COMMENT '测试时间',
  `time_unit_two` varchar(10) NOT NULL COMMENT '时间单位字段 秒 分钟',
  `result` text NOT NULL COMMENT '返回结果数据集',
  `status` varchar(10) NOT NULL COMMENT '任务状态 未开始 进行中 已完成',
  `detail` varchar(500) NOT NULL COMMENT '任务详情信息',
  PRIMARY KEY (`task_id`),
  KEY `task_publisher_id` (`task_publisher_id`),
  CONSTRAINT `sys_task_ibfk_1` FOREIGN KEY (`task_publisher_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_task`
--

LOCK TABLES `sys_task` WRITE;
/*!40000 ALTER TABLE `sys_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_task_result`
--

DROP TABLE IF EXISTS `sys_task_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_task_result` (
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `result_format` varchar(50) NOT NULL COMMENT '返回结果的格式 json xml HTML binary',
  `result_field_name` varchar(50) NOT NULL COMMENT '返回的字段名称 比如接口会返回code码 ，data，msg等',
  `result_field_type` varchar(20) NOT NULL COMMENT '返回字段类型 code码就是整数integer，data等会是string',
  `result_field_detail` varchar(255) DEFAULT NULL COMMENT '返回字段描述（声明简介）可为空',
  `result_num` int(11) NOT NULL COMMENT '返回结果数',
  `fail_num` int(11) NOT NULL COMMENT '测试失败数',
  `success_num` int(11) NOT NULL COMMENT '测试成功数',
  PRIMARY KEY (`task_id`),
  CONSTRAINT `sys_task_result_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `sys_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务测试结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_task_result`
--

LOCK TABLES `sys_task_result` WRITE;
/*!40000 ALTER TABLE `sys_task_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_task_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_task_script`
--

DROP TABLE IF EXISTS `sys_task_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_task_script` (
  `script_id` bigint(20) NOT NULL COMMENT '脚本id',
  `task_id` bigint(20) NOT NULL COMMENT '对应任务的id',
  `script_name` varchar(255) NOT NULL COMMENT '脚本名称',
  `script_type` varchar(50) NOT NULL COMMENT '压测方式 同一时间，持续一段时间',
  `ip` varchar(50) NOT NULL COMMENT '请求ip',
  `port` varchar(50) NOT NULL COMMENT '请求port',
  `protocol` varchar(50) NOT NULL COMMENT '协议类型',
  `heads` varchar(255) NOT NULL COMMENT '报文头信息',
  `script_content` text NOT NULL COMMENT '脚本内容代码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `stop_time` int(11) NOT NULL COMMENT '间隔时间',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`script_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `sys_task_script_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `sys_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务脚本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_task_script`
--

LOCK TABLES `sys_task_script` WRITE;
/*!40000 ALTER TABLE `sys_task_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_task_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_transaction_record`
--

DROP TABLE IF EXISTS `sys_transaction_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_transaction_record` (
  `transaction_id` bigint(20) NOT NULL COMMENT '交易单号唯一标识符号',
  `sender_id` bigint(20) NOT NULL COMMENT '发款方ID',
  `receiver_id` bigint(20) NOT NULL COMMENT '收款方ID',
  `changed_money` double NOT NULL COMMENT '变动金额',
  `transaction_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `rest_money` double NOT NULL COMMENT '余额',
  `pay_way` varchar(40) NOT NULL COMMENT '支付来源：余额 zfb  wx  bankCard',
  `transaction_type` varchar(30) NOT NULL COMMENT '交易类型：充值 消费 转账 提现',
  `transaction_state` varchar(40) NOT NULL DEFAULT 'success' COMMENT '交易状态 ：成功 失败 待处理',
  `currency_type` varchar(40) NOT NULL DEFAULT 'RMB' COMMENT '人民币 美元 欧元 英镑..',
  `transaction_notes` varchar(500) DEFAULT NULL COMMENT '交易备注：如：来自老赵给你的农机租赁款',
  PRIMARY KEY (`transaction_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `sys_transaction_record_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `sys_transaction_record_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_transaction_record`
--

LOCK TABLES `sys_transaction_record` WRITE;
/*!40000 ALTER TABLE `sys_transaction_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_transaction_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '不作为用户登录的id 只是便于系统排序 统计当前注册用户数量',
  `user_sort` bigint(20) NOT NULL COMMENT '显示顺序',
  `user_name` varchar(25) NOT NULL COMMENT '用户用户名 邮箱 电话都可作为用户账号登录',
  `user_telephone` varchar(11) NOT NULL COMMENT '用户电话:11位纯数字',
  `user_sys_email` varchar(25) NOT NULL COMMENT '用户邮箱:xxx@qq.com',
  `user_password` varchar(255) NOT NULL COMMENT '用户密码 20位英文+字符+数字组合  经过hash过后的',
  `user_nick_name` varchar(40) NOT NULL COMMENT '用户昵称 最多40个字符',
  `user_gender` tinyint(1) NOT NULL COMMENT '用户性别：男1 女0',
  `user_born_day` date NOT NULL COMMENT '用户出生年月日: 2000/12/1',
  `user_id_card` varchar(18) NOT NULL COMMENT '用户身份证号:18位',
  `user_money` double NOT NULL DEFAULT '0' COMMENT '用户余额 ',
  `user_company` varchar(100) NOT NULL COMMENT '用户单位',
  `user_home` varchar(100) NOT NULL COMMENT '用户住址',
  `user_ip` varchar(20) NOT NULL COMMENT '用户IP',
  `user_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '无符号tinyint取值范围为-128 到 127 0代表此用户已删除 1代表管理员 -1代表账户停用的管理员 2代表普通用户 -2代表停机的用户',
  `user_personal_profile` varchar(500) DEFAULT NULL COMMENT '用户个人简介',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_sort` (`user_sort`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_telephone` (`user_telephone`),
  UNIQUE KEY `user_sys_email` (`user_sys_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,1,'赵阳','16666666666','1666666@qq.com','1666666','Harmmer',1,'2008-10-08','666666666666666666',0,'TUTE','HeNanAnYang','192.168.100.10',2,'技术'),(2,2,'Zi','18888888888','1888888@qq.com','1888888','Ray',1,'2006-10-13','888888888888888888',0,'TUTE','HeNanAnYang','192.168.100.11',2,'technology'),(3,3,'NiuMaoJi','19999999999','1999999@qq.com','1999999','Niu',1,'2006-10-08','999999999999999999',0,'TUTE','HeNanAnYang','192.168.100.12',2,'technology'),(4,4,'LingStar','10000000000','1000000@qq.com','1000000','Star',1,'2004-10-10','000000000000000000',0,'TUTE','HeNanAnYang','192.168.100.13',2,'technology');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_announcement`
--

DROP TABLE IF EXISTS `sys_user_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_announcement` (
  `user_id` bigint(20) NOT NULL COMMENT '连接sys_user表的id',
  `announcement_id` bigint(20) NOT NULL COMMENT '连接sys_announcement的id',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`announcement_id`),
  KEY `announcement_id` (`announcement_id`),
  CONSTRAINT `sys_user_announcement_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `sys_user_announcement_ibfk_2` FOREIGN KEY (`announcement_id`) REFERENCES `sys_announcement` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户公告对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_announcement`
--

LOCK TABLES `sys_user_announcement` WRITE;
/*!40000 ALTER TABLE `sys_user_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` smallint(8) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `sys_user_role_sys_role_id_fk` (`role_id`),
  CONSTRAINT `sys_user_role_sys_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `sys_user_role_sys_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
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

-- Dump completed on 2023-10-22 22:02:30
