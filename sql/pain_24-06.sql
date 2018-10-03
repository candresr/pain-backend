-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pain
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application` timestamp NULL DEFAULT NULL,
  `suppose` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_dose` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Application_Recipe_Product_Dose` (`id_dose`),
  CONSTRAINT `FK_Application_Recipe_Product_Dose` FOREIGN KEY (`id_dose`) REFERENCES `Dose` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application`
--

LOCK TABLES `Application` WRITE;
/*!40000 ALTER TABLE `Application` DISABLE KEYS */;
/*!40000 ALTER TABLE `Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `id_user` int(11) DEFAULT NULL,
  `id_specialization` int(11) DEFAULT NULL,
  `profile` text,
  `id_country` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  KEY `FK_Doctor_Country` (`id_country`),
  KEY `FK_Doctor_Specialization` (`id_specialization`),
  KEY `FK_Doctor_User` (`id_user`),
  CONSTRAINT `FK_Doctor_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_Doctor_Country` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`),
  CONSTRAINT `FK_Doctor_Specialization` FOREIGN KEY (`id_specialization`) REFERENCES `Specialization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dose`
--

DROP TABLE IF EXISTS `Dose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dose` (
  `id_recipe` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` timestamp NULL DEFAULT NULL,
  `frecuency` int(11) DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `start_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Recipe_Product_Dose_Product` (`id_product`),
  KEY `FK_Recipe_Product_Dose_Recipe` (`id_recipe`),
  CONSTRAINT `FK_Recipe_Product_Dose_Product` FOREIGN KEY (`id_product`) REFERENCES `Product` (`id`),
  CONSTRAINT `FK_Recipe_Product_Dose_Recipe` FOREIGN KEY (`id_recipe`) REFERENCES `Recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dose`
--

LOCK TABLES `Dose` WRITE;
/*!40000 ALTER TABLE `Dose` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `public` tinyint(4) DEFAULT '0',
  `erased` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (1,'Administrador','Administrador del sistema',0,0),(2,'Medicos','Médicos certificados para aplicación del medicamento',0,0),(3,'Pacientes','Ingresados para tratar el dolor ',0,0);
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_user`
--

DROP TABLE IF EXISTS `Group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Group_user` (
  `id_user` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  KEY `FK_Group_user_Group` (`id_group`),
  KEY `FK_Group_user_User` (`id_user`),
  CONSTRAINT `FK_Group_user_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_Group_user_Group` FOREIGN KEY (`id_group`) REFERENCES `Group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_user`
--

LOCK TABLES `Group_user` WRITE;
/*!40000 ALTER TABLE `Group_user` DISABLE KEYS */;
INSERT INTO `Group_user` VALUES (1,1,NULL);
/*!40000 ALTER TABLE `Group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library`
--

DROP TABLE IF EXISTS `Library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` text,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library`
--

LOCK TABLES `Library` WRITE;
/*!40000 ALTER TABLE `Library` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Line`
--

DROP TABLE IF EXISTS `Line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_country` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Line_Country` (`id_country`),
  CONSTRAINT `FK_Line_Country` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Line`
--

LOCK TABLES `Line` WRITE;
/*!40000 ALTER TABLE `Line` DISABLE KEYS */;
/*!40000 ALTER TABLE `Line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `text` text,
  `link` text,
  `id_dose` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Notification_Recipe_Product_Dose` (`id_dose`),
  KEY `FK_Notification_User` (`id_user`),
  CONSTRAINT `FK_Notification_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_Notification_Recipe_Product_Dose` FOREIGN KEY (`id_dose`) REFERENCES `Dose` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification`
--

LOCK TABLES `Notification` WRITE;
/*!40000 ALTER TABLE `Notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nurse` (
  `id_user` int(11) DEFAULT NULL,
  KEY `FK_Nurse_User` (`id_user`),
  CONSTRAINT `FK_Nurse_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse`
--

LOCK TABLES `Nurse` WRITE;
/*!40000 ALTER TABLE `Nurse` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pain_report`
--

DROP TABLE IF EXISTS `Pain_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pain_report` (
  `id_patient` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_Pain_report_User` (`id_patient`),
  CONSTRAINT `FK_Pain_report_User` FOREIGN KEY (`id_patient`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pain_report`
--

LOCK TABLES `Pain_report` WRITE;
/*!40000 ALTER TABLE `Pain_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pain_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `id_user` int(11) DEFAULT NULL,
  KEY `FK_Patient_User` (`id_user`),
  CONSTRAINT `FK_Patient_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission_group`
--

DROP TABLE IF EXISTS `Permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission_group` (
  `id_permission` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  KEY `FK_Permission_group_Group` (`id_group`),
  KEY `FK_Permission_group_Permission` (`id_permission`),
  CONSTRAINT `FK_Permission_group_Permission` FOREIGN KEY (`id_permission`) REFERENCES `Permission` (`id`),
  CONSTRAINT `FK_Permission_group_Group` FOREIGN KEY (`id_group`) REFERENCES `Group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission_group`
--

LOCK TABLES `Permission_group` WRITE;
/*!40000 ALTER TABLE `Permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `Permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `picture` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_line` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Product_Line` (`id_line`),
  CONSTRAINT `FK_Product_Line` FOREIGN KEY (`id_line`) REFERENCES `Line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `id_patient` int(11) DEFAULT NULL,
  `id_doctor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Recipe_User` (`id_patient`),
  KEY `FK_Recipe_User_02` (`id_doctor`),
  CONSTRAINT `FK_Recipe_User` FOREIGN KEY (`id_patient`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_Recipe_User_02` FOREIGN KEY (`id_doctor`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rss_channel`
--

DROP TABLE IF EXISTS `Rss_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rss_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `link` text,
  `language` varchar(255) DEFAULT NULL,
  `copyright` text,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rss_channel`
--

LOCK TABLES `Rss_channel` WRITE;
/*!40000 ALTER TABLE `Rss_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rss_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rss_item`
--

DROP TABLE IF EXISTS `Rss_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rss_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `link` text,
  `description` text,
  `copyright` text,
  `pubDate` datetime DEFAULT NULL,
  `id_channel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Rss_Rss_channel` (`id_channel`),
  CONSTRAINT `FK_Rss_Rss_channel` FOREIGN KEY (`id_channel`) REFERENCES `Rss_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rss_item`
--

LOCK TABLES `Rss_item` WRITE;
/*!40000 ALTER TABLE `Rss_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rss_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schema_tables`
--

DROP TABLE IF EXISTS `Schema_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schema_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(50) DEFAULT NULL,
  `column_type` varchar(50) DEFAULT NULL,
  `tittle` varchar(50) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `rules` varchar(250) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `search` tinyint(1) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  `join` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schema_tables`
--

LOCK TABLES `Schema_tables` WRITE;
/*!40000 ALTER TABLE `Schema_tables` DISABLE KEYS */;
INSERT INTO `Schema_tables` VALUES (1,'id','hidden','Id',0,'User',1,'','',0,0,''),(2,'name','varchar','Nombre',1,'User',2,'trim|required','',1,0,''),(3,'lastname','varchar','Apellido',1,'User',3,'trim|required','',1,0,NULL),(4,'email','varchar','Correo',1,'User',4,'trim|required|valid_email','',1,0,''),(5,'password','password','Contraseña',0,'User',5,'trim|required','',0,0,NULL),(6,'active','hidden','Activo',0,'User',6,'','',0,0,NULL),(7,'id','hidden','Id',0,'Group',1,'','',0,0,NULL),(8,'name','varchar','Nombre',1,'Group',2,'trim|required','',1,0,''),(9,'description','text','Descripcion',1,'Group',3,'trim|required','',1,0,NULL),(10,'public','hidden','Publico',0,'Group',4,'','',0,0,NULL),(11,'type_user','combobox','Grupo',1,'User',7,NULL,'Doctor',1,0,NULL);
/*!40000 ALTER TABLE `Schema_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Session` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `device` text,
  `token` text,
  `valid_to` date DEFAULT NULL,
  KEY `FK_Session_User` (`id_user`),
  CONSTRAINT `FK_Session_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialization`
--

DROP TABLE IF EXISTS `Specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specialization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialization`
--

LOCK TABLES `Specialization` WRITE;
/*!40000 ALTER TABLE `Specialization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Structure_tables`
--

DROP TABLE IF EXISTS `Structure_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Structure_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_table` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Structure_tables`
--

LOCK TABLES `Structure_tables` WRITE;
/*!40000 ALTER TABLE `Structure_tables` DISABLE KEYS */;
INSERT INTO `Structure_tables` VALUES (1,'User','Usuarios','admin/listAll',0),(2,'Group','Grupos','admin/listAll',0),(3,'Doctor','Medicos','admin/listAll',0),(4,'Patient','Pacientes','admin/listAll',0);
/*!40000 ALTER TABLE `Structure_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `erased` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Cesar','Ramirez','cesar@correo.com','d033e22ae348aeb5660fc2140aec35850c4da997','',0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-24 17:17:57
