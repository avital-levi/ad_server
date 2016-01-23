-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ad_db
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add banner',7,'add_banner'),(20,'Can change banner',7,'change_banner'),(21,'Can delete banner',7,'delete_banner'),(22,'Can add campaign',8,'add_campaign'),(23,'Can change campaign',8,'change_campaign'),(24,'Can delete campaign',8,'delete_campaign'),(25,'Can add campaign banner',9,'add_campaignbanner'),(26,'Can change campaign banner',9,'change_campaignbanner'),(27,'Can delete campaign banner',9,'delete_campaignbanner'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$L1aRlYc1hWCB$tDIyuMeKth5Oljyr+mGwzgB8UwVIR0T0/qzb4hk9PNI=','2016-01-23 18:26:58.619000',1,'admin','','','admin@admin.admin',1,1,'2016-01-23 18:26:37.403000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `is_active` tinyint(1) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `file_location` varchar(100) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `updated_by` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (2,'b_1','',1,250,300,'static/ad_server/img/300x250/300x250_1.jpg','2016-01-23 12:39:46.205000','avital','2016-01-23 15:42:22.140000','avital'),(3,'b_2','',1,251,301,'static/ad_server/img/300x250/300x250_2.jpg','2016-01-23 14:57:38.455000','avital','2016-01-23 15:42:55.826000','avital'),(4,'b_3','',1,252,302,'static/ad_server/img/300x250/300x250_3.gif','2016-01-23 15:33:41.795000','avital','2016-01-23 16:44:42.291000','avital'),(5,'b_4','',1,253,303,'static/ad_server/img/300x250/300x250_4.gif','2016-01-23 15:34:49.297000','avital','2016-01-23 16:44:48.715000','avital'),(6,'b_5','',1,254,304,'static/ad_server/img/300x250/300x250_5.jpg','2016-01-23 15:35:33.619000','avital','2016-01-23 16:44:57.011000','avital'),(7,'b_6','',1,255,305,'static/ad_server/img/300x250/300x250_6.gif','2016-01-23 15:36:40.122000','avital','2016-01-23 16:45:16.022000','avital'),(8,'b_7','',1,600,300,'static/ad_server/img/300x600/300x600_1.jpg','2016-01-23 15:38:11.990000','avital','2016-01-23 15:38:11.991000','avital'),(9,'b_8','',1,601,301,'static/ad_server/img/300x600/300x600_2.jpg','2016-01-23 15:47:20.797000','avital','2016-01-23 15:47:20.797000','avital'),(10,'b_9','',1,602,302,'static/ad_server/img/300x600/300x600_3.png','2016-01-23 15:48:00.189000','avital','2016-01-23 15:53:21.410000','avital'),(11,'b_10','',1,603,303,'static/ad_server/img/300x600/300x600_4.gif','2016-01-23 15:48:51.693000','avital','2016-01-23 15:53:31.458000','avital'),(12,'b_11','',1,604,304,'static/ad_server/img/300x600/300x600_5.jpg','2016-01-23 15:51:01.522000','avital','2016-01-23 15:51:01.522000','avital'),(13,'b_12','',1,605,305,'static/ad_server/img/300x600/300x600_6.jpg','2016-01-23 15:51:20.273000','avital','2016-01-23 15:51:20.273000','avital'),(14,'b_13','',1,100,320,'static/ad_server/img/320x100/320x100_1.jpg','2016-01-23 15:52:49.720000','avital','2016-01-23 15:52:49.720000','avital'),(15,'b_14','',1,101,321,'static/ad_server/img/320x100/320x100_2.png','2016-01-23 15:55:18.112000','avital','2016-01-23 15:55:18.112000','avital'),(16,'b_15','',1,102,322,'static/ad_server/img/320x100/320x100_3.jpg','2016-01-23 15:56:04.757000','avital','2016-01-23 15:56:04.757000','avital'),(17,'b_16','',1,103,323,'static/ad_server/img/320x100/320x100_4.jpg','2016-01-23 15:56:41.200000','avital','2016-01-23 15:56:41.200000','avital'),(18,'b_17','',1,104,324,'static/ad_server/img/320x100/320x100_5.png','2016-01-23 15:57:14.441000','avital','2016-01-23 15:57:14.441000','avital'),(19,'b_18','',1,105,325,'static/ad_server/img/320x100/320x100_6.jpg','2016-01-23 15:57:40.187000','avital','2016-01-23 15:57:40.187000','avital'),(20,'b_19','',1,90,728,'static/ad_server/img/728x90/728x90_1.gif','2016-01-23 15:59:01.370000','avital','2016-01-23 15:59:01.370000','avital'),(21,'b_20','',1,91,729,'static/ad_server/img/728x90/728x90_2.jpg','2016-01-23 15:59:43.549000','avital','2016-01-23 16:00:32.317000','avital'),(22,'b_21','',1,92,730,'static/ad_server/img/728x90/728x90_3.gif','2016-01-23 16:00:21.043000','avital','2016-01-23 16:00:21.043000','avital'),(23,'b_22','',1,92,731,'static/ad_server/img/728x90/728x90_4.jpg','2016-01-23 16:01:07.530000','avital','2016-01-23 16:01:07.530000','avital'),(24,'b_23','',1,93,732,'static/ad_server/img/728x90/728x90_5.png','2016-01-23 16:02:02.471000','avital','2016-01-23 16:02:02.471000','avital'),(25,'b_24','',1,94,733,'static/ad_server/img/728x90/728x90_6.gif','2016-01-23 16:02:41.574000','avital','2016-01-23 16:02:41.574000','avital');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pricing_model` varchar(2) NOT NULL,
  `bid_price` decimal(9,3) NOT NULL,
  `e_cpm` decimal(9,3) NOT NULL,
  `landing_page` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (1,'c_1','pm',25.000,25.000,'http://1.com'),(2,'c_2','pc',30.000,120.000,'http://2.com'),(3,'c_3','pa',25.000,0.500,'http://3.com'),(4,'c_4','pm',45.000,45.000,'http://4.com'),(5,'c_5','pc',60.000,240.000,'http://5.com'),(6,'c_6','pa',82.000,1.640,'http://6.com');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_banner`
--

DROP TABLE IF EXISTS `campaign_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaign_banner_campaign_id_f2e8608b_uniq` (`campaign_id`,`banner_id`),
  KEY `campaign_banner_banner_id_7cad399b_fk_banner_id` (`banner_id`),
  CONSTRAINT `campaign_banner_banner_id_7cad399b_fk_banner_id` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`),
  CONSTRAINT `campaign_banner_campaign_id_97b15614_fk_campaign_id` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_banner`
--

LOCK TABLES `campaign_banner` WRITE;
/*!40000 ALTER TABLE `campaign_banner` DISABLE KEYS */;
INSERT INTO `campaign_banner` VALUES (2,1,2),(3,1,9),(4,1,17),(5,1,25),(8,2,3),(9,2,8),(10,2,16),(11,2,24),(12,3,4),(13,3,10),(14,3,15),(15,3,23),(16,4,5),(17,4,11),(18,4,14),(19,4,22),(20,5,6),(21,5,13),(22,5,19),(23,5,21),(24,6,7),(25,6,12),(26,6,18),(27,6,20);
/*!40000 ALTER TABLE `campaign_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'admin','logentry'),(7,'ad_server','banner'),(8,'ad_server','campaign'),(9,'ad_server','campaignbanner'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(6,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-01-23 09:37:54.283000'),(2,'auth','0001_initial','2016-01-23 09:38:06.163000'),(3,'admin','0001_initial','2016-01-23 09:38:08.646000'),(4,'admin','0002_logentry_remove_auto_add','2016-01-23 09:38:09.031000'),(5,'contenttypes','0002_remove_content_type_name','2016-01-23 09:38:10.462000'),(6,'auth','0002_alter_permission_name_max_length','2016-01-23 09:38:11.631000'),(7,'auth','0003_alter_user_email_max_length','2016-01-23 09:38:12.586000'),(8,'auth','0004_alter_user_username_opts','2016-01-23 09:38:12.671000'),(9,'auth','0005_alter_user_last_login_null','2016-01-23 09:38:13.724000'),(10,'auth','0006_require_contenttypes_0002','2016-01-23 09:38:13.793000'),(11,'auth','0007_alter_validators_add_error_messages','2016-01-23 09:38:13.855000'),(12,'sessions','0001_initial','2016-01-23 09:38:14.542000'),(13,'sites','0001_initial','2016-01-23 09:38:14.912000'),(14,'sites','0002_alter_domain_unique','2016-01-23 09:38:15.244000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('hcldvgn2vxyvcpysn3tvtny9q2k6oh97','YWNiMzg4OGM1ZTdkNDA5ODcxMmMxYmFmN2Y5M2MwM2ZhYTg0Y2I4YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJiYjUxNTFiNWVlYzMyOGM3YWYzNTcyNzYwYmRhOTU0ZTZiZTNhZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-02-06 18:26:58.706000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ad_db'
--

--
-- Dumping routines for database 'ad_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-23 20:41:38
