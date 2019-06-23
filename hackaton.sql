-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: hackaton
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `dislikes` int(11) NOT NULL DEFAULT 0,
  `isAnswer` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,63,1,'<p>asd</p>',1,1,0,'2019-04-15 13:59:42','2019-04-15 14:02:42'),(2,7,11,'<p><span style=\"color: rgb(0, 0, 0);\">Se cheama&nbsp;</span><em style=\"color: rgb(0, 0, 0);\">culegeri</em><span style=\"color: rgb(0, 0, 0);\">&nbsp;si le gasesti in orice librarie.&nbsp;<img src=\"http://forum.portal.edu.ro/html/emoticons/smile.gif\" alt=\"smile.gif\"></span></p>',0,0,0,'2019-04-16 03:57:45','2019-04-16 03:57:45');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplines`
--

DROP TABLE IF EXISTS `disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
INSERT INTO `disciplines` VALUES (1,'Matematica',NULL,NULL),(2,'Informatica',NULL,NULL),(3,'Romana',NULL,NULL),(4,'Chimie',NULL,NULL),(5,'Fizica',NULL,NULL),(6,'Sport',NULL,NULL),(7,'Istorie',NULL,NULL),(8,'Geografie',NULL,NULL);
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dislikes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dislikes_user_id_foreign` (`user_id`),
  KEY `dislikes_question_id_foreign` (`question_id`),
  CONSTRAINT `dislikes_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `dislikes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (1,63,'comment',1,'2019-04-15 14:02:42','2019-04-15 14:02:42'),(2,63,'question',1,'2019-04-15 14:04:24','2019-04-15 14:04:24');
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_question_id_foreign` (`question_id`),
  CONSTRAINT `likes_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,63,1,'question','2019-04-15 13:58:19','2019-04-15 13:58:19'),(2,63,1,'comment','2019-04-15 13:59:45','2019-04-15 13:59:45');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_to` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_09_03_144628_create_permission_tables',1),(4,'2017_09_11_174816_create_social_accounts_table',1),(5,'2017_09_26_140332_create_cache_table',1),(6,'2017_09_26_140528_create_sessions_table',1),(7,'2017_09_26_140609_create_jobs_table',1),(8,'2018_04_08_033256_create_password_histories_table',1),(9,'2018_04_20_192306_create_schools_table',1),(10,'2018_04_20_203318_create_students_table',1),(11,'2018_04_20_203331_create_teachers_table',1),(12,'2018_04_20_203924_create_disciplines_table',1),(13,'2018_04_20_204002_create_teacher_disciplines_table',1),(14,'2018_04_20_204302_create_questions_table',1),(15,'2018_04_20_212538_create_messages_table',1),(16,'2018_04_20_224438_add_discipline_id_on_question',1),(17,'2018_04_21_101014_alter_messages_table',1),(18,'2018_04_21_103925_create_comments_table',1),(19,'2018_04_21_110649_create_student_disciplines_table',1),(20,'2018_04_21_143052_alter_table_questions_add_answe_user_id_column',1),(21,'2018_04_21_143324_add_reputation_column_to_users',1),(22,'2018_04_21_171625_add_last_activity_users_table',1),(23,'2019_04_15_163502_create_likes_table',1),(24,'2019_04_15_164458_create_dislikes_table',1),(25,'2019_04_15_164613_create_views_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\Auth\\User',1),(1,'App\\Models\\Auth\\User',2),(3,'App\\Models\\Auth\\User',3),(3,'App\\Models\\Auth\\User',4),(3,'App\\Models\\Auth\\User',5),(3,'App\\Models\\Auth\\User',6),(3,'App\\Models\\Auth\\User',7),(3,'App\\Models\\Auth\\User',8),(3,'App\\Models\\Auth\\User',9),(3,'App\\Models\\Auth\\User',10),(3,'App\\Models\\Auth\\User',11),(3,'App\\Models\\Auth\\User',12),(3,'App\\Models\\Auth\\User',13),(3,'App\\Models\\Auth\\User',14),(3,'App\\Models\\Auth\\User',15),(3,'App\\Models\\Auth\\User',16),(3,'App\\Models\\Auth\\User',17),(3,'App\\Models\\Auth\\User',18),(3,'App\\Models\\Auth\\User',19),(3,'App\\Models\\Auth\\User',20),(3,'App\\Models\\Auth\\User',21),(3,'App\\Models\\Auth\\User',22),(3,'App\\Models\\Auth\\User',23),(3,'App\\Models\\Auth\\User',24),(3,'App\\Models\\Auth\\User',25),(3,'App\\Models\\Auth\\User',26),(3,'App\\Models\\Auth\\User',27),(3,'App\\Models\\Auth\\User',28),(3,'App\\Models\\Auth\\User',29),(3,'App\\Models\\Auth\\User',30),(3,'App\\Models\\Auth\\User',31),(3,'App\\Models\\Auth\\User',32),(3,'App\\Models\\Auth\\User',33),(3,'App\\Models\\Auth\\User',34),(3,'App\\Models\\Auth\\User',35),(3,'App\\Models\\Auth\\User',36),(3,'App\\Models\\Auth\\User',37),(3,'App\\Models\\Auth\\User',38),(3,'App\\Models\\Auth\\User',39),(3,'App\\Models\\Auth\\User',40),(3,'App\\Models\\Auth\\User',41),(3,'App\\Models\\Auth\\User',42),(3,'App\\Models\\Auth\\User',43),(3,'App\\Models\\Auth\\User',44),(3,'App\\Models\\Auth\\User',45),(3,'App\\Models\\Auth\\User',46),(3,'App\\Models\\Auth\\User',47),(3,'App\\Models\\Auth\\User',48),(3,'App\\Models\\Auth\\User',49),(3,'App\\Models\\Auth\\User',50),(3,'App\\Models\\Auth\\User',51),(3,'App\\Models\\Auth\\User',52),(3,'App\\Models\\Auth\\User',53),(3,'App\\Models\\Auth\\User',54),(3,'App\\Models\\Auth\\User',55),(3,'App\\Models\\Auth\\User',56),(3,'App\\Models\\Auth\\User',57),(3,'App\\Models\\Auth\\User',58),(3,'App\\Models\\Auth\\User',59),(3,'App\\Models\\Auth\\User',60),(3,'App\\Models\\Auth\\User',61),(3,'App\\Models\\Auth\\User',62),(3,'App\\Models\\Auth\\User',63),(3,'App\\Models\\Auth\\User',64),(3,'App\\Models\\Auth\\User',65),(3,'App\\Models\\Auth\\User',66),(3,'App\\Models\\Auth\\User',67),(3,'App\\Models\\Auth\\User',68),(3,'App\\Models\\Auth\\User',69),(3,'App\\Models\\Auth\\User',70),(3,'App\\Models\\Auth\\User',71),(3,'App\\Models\\Auth\\User',72),(3,'App\\Models\\Auth\\User',73),(3,'App\\Models\\Auth\\User',74),(3,'App\\Models\\Auth\\User',75),(3,'App\\Models\\Auth\\User',76),(3,'App\\Models\\Auth\\User',77),(3,'App\\Models\\Auth\\User',78),(3,'App\\Models\\Auth\\User',79),(3,'App\\Models\\Auth\\User',80),(3,'App\\Models\\Auth\\User',81);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_histories`
--

DROP TABLE IF EXISTS `password_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `password_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_histories`
--

LOCK TABLES `password_histories` WRITE;
/*!40000 ALTER TABLE `password_histories` DISABLE KEYS */;
INSERT INTO `password_histories` VALUES (1,1,'$2y$10$Xc1vpTYRYKcmWiWG7a/LZeY82d9SarJSN/oEHI9IsU2ENB.NCCVhy','2019-04-15 13:57:41','2019-04-15 13:57:41'),(2,2,'$2y$10$JxpNlcAZDma3u3/GsGei6.Shjym/3VohSpfnBjAYM.NrACIt/P5oW','2019-04-15 13:57:41','2019-04-15 13:57:41'),(3,3,'$2y$10$kc.LF6ohFKM03tLBBAgwMeDGBEH.NHFyfpgeLQ33U8l508XgXJf5W','2019-04-15 13:57:41','2019-04-15 13:57:41'),(4,4,'$2y$10$EHYZZXMu5omKdeeE9fQ5tORiCKYfHatAXZK9Ax7hayTQLVJmacSsi','2019-04-15 13:57:41','2019-04-15 13:57:41'),(5,5,'$2y$10$THmqG3LF9awweg7rdaRYJOPGODB.S5SWldZXPUuyPxoonCFbNDLtG','2019-04-15 13:57:41','2019-04-15 13:57:41'),(6,6,'$2y$10$fI3d/hypCHFVVoAiHteiIefaYXgNZpNixq5ZT.kSMfmJfdNcKRSRu','2019-04-15 13:57:41','2019-04-15 13:57:41'),(7,7,'$2y$10$ES9JXni1Er9gPQeV7hKkfOivzapS12.UCk3ugZ9rtsKcwXiUm68km','2019-04-15 13:57:42','2019-04-15 13:57:42'),(8,8,'$2y$10$UM39mycGM.ni5KDjrufPEOCJBUjD.HdZdjdu06W7.28dHILXy/hqC','2019-04-15 13:57:42','2019-04-15 13:57:42'),(9,9,'$2y$10$H8VmctM5XsP1YmAEy2Y06evbFprNPfeuiWeVtwwNcusQ677y4IIz6','2019-04-15 13:57:42','2019-04-15 13:57:42'),(10,10,'$2y$10$fx48ZNGZIkD0AMQ7jrQNneJBODeqRRBNx6mR3KHDInfuUmMqcXtWy','2019-04-15 13:57:42','2019-04-15 13:57:42'),(11,11,'$2y$10$2T4lj98Bwf1LeEN6fJMCXeOY3/qgtLijlxO7xdJWrXldmifc5mtee','2019-04-15 13:57:42','2019-04-15 13:57:42'),(12,12,'$2y$10$G92A/pGyZ5KgDbYvZinyBOxb7vxSWWdyUfoOmtOx9xjdb4gr7CA9W','2019-04-15 13:57:42','2019-04-15 13:57:42'),(13,13,'$2y$10$nob.R3K5wv5q/gJQCl11wurLlNC4EeeaJJ8zm.rttghH.imEvFraG','2019-04-15 13:57:42','2019-04-15 13:57:42'),(14,14,'$2y$10$fCFqag2QaZrXsU8HUuuA3uNYoEpQhPa07lrYB2jR8OJEh/QGB1peC','2019-04-15 13:57:42','2019-04-15 13:57:42'),(15,15,'$2y$10$699htxU86FMx8.AR1lvdUu3Jk3a.eM9dXn36C1ceL.uIsPkue86n.','2019-04-15 13:57:42','2019-04-15 13:57:42'),(16,16,'$2y$10$Mjno44NP3SjlttO2SMvrkunxbj8oMxyWw/1jRx3yLaih9b45r6t02','2019-04-15 13:57:42','2019-04-15 13:57:42'),(17,17,'$2y$10$WEaDIrAKzlhLU2GmqzMuMu98yTXHDiVyA1ZuUo2T03leoOEHaN39.','2019-04-15 13:57:42','2019-04-15 13:57:42'),(18,18,'$2y$10$QpO1DilxlvvAUF429ASQzeUmRrfIJTLP4pD/DFXqM.F9biFKW0D1O','2019-04-15 13:57:42','2019-04-15 13:57:42'),(19,19,'$2y$10$LN27mjfjEetAq5n51NwQb.LpliGh6k5dlaLAx1V/mewBtUCbb4GX.','2019-04-15 13:57:42','2019-04-15 13:57:42'),(20,20,'$2y$10$FZAl4DrEi8zdcW0VI.aZbeq8I7GsYFIPqrYYqDquFV/BM9exl3Jty','2019-04-15 13:57:43','2019-04-15 13:57:43'),(21,21,'$2y$10$RKiPHQbgGcv34XyEF8dEwOFDPX7yf0FwNdGV.JXmhmzypQoFO0meK','2019-04-15 13:57:43','2019-04-15 13:57:43'),(22,22,'$2y$10$4dyB0pQyx.a6sVlYepWHre9UFaXkraKTH4TyVEP6KJ8HsC6C4o/wu','2019-04-15 13:57:43','2019-04-15 13:57:43'),(23,23,'$2y$10$pbzk4gVUgQGuXzbuBiQDZeFc7Cbtp0v07F9HAtVGGdm8IRgj0.eWC','2019-04-15 13:57:43','2019-04-15 13:57:43'),(24,24,'$2y$10$O01FTJjHmjW9/5TfMvvpjOYxHu1eXEt5mU59CFo5CN1On5pzVT3.S','2019-04-15 13:57:43','2019-04-15 13:57:43'),(25,25,'$2y$10$qmMZPdjkUPa1FgYPD8N9NOFLAe27e0wCJMcqwpfiX95WlMkGjUtP2','2019-04-15 13:57:43','2019-04-15 13:57:43'),(26,26,'$2y$10$GwXHzbMbp6fg569fsPxP9eJlloX.AqBPkKOSEVoppITJcB4tOlQgK','2019-04-15 13:57:43','2019-04-15 13:57:43'),(27,27,'$2y$10$8J5SMRQConnnaFw.xjIQrOwV10McMXtuJ1NZTQ6RyF27qsHuwBo.2','2019-04-15 13:57:43','2019-04-15 13:57:43'),(28,28,'$2y$10$s9X8NWqXiQWRga0YOd1LsOUSOKkLFWQfdDSZwiQxfMjujqqrHZJue','2019-04-15 13:57:43','2019-04-15 13:57:43'),(29,29,'$2y$10$CtCL4IikpF7qSRVBZka8BuL1hFHRcqIM84rrjs/fHdjZE3sObAhDG','2019-04-15 13:57:43','2019-04-15 13:57:43'),(30,30,'$2y$10$lUHxGMx65drt7t4KQZpSS.yTycCwEjMFFyaxMpNAOkVY9zCGzl0q6','2019-04-15 13:57:43','2019-04-15 13:57:43'),(31,31,'$2y$10$xtHcocTT0x5UlQPBpLWZVuLZprKC.ZyZtj30L.PiL6RBAJ4dOHjdy','2019-04-15 13:57:43','2019-04-15 13:57:43'),(32,32,'$2y$10$Y2z.fBqZVKZzV1vadTTFTebJIGOImI4AsT1UNRk0Y.CtgBlGbxJMy','2019-04-15 13:57:43','2019-04-15 13:57:43'),(33,33,'$2y$10$vrRyQa3EEsvlzAWPFNxLueE1KtaycHTp6OykjG1u.xylFSyIOVTCe','2019-04-15 13:57:43','2019-04-15 13:57:43'),(34,34,'$2y$10$9Rw.cP85EaFXaoaV/n7Y3uJQJ2aDPKv19Yg5G2FtmjJMfvG3XHBuu','2019-04-15 13:57:43','2019-04-15 13:57:43'),(35,35,'$2y$10$ST.JMw.BLfw9eZIP4qbE/u6dadiDNRlKz/Ny8RgQi4z7H2u5Jojie','2019-04-15 13:57:44','2019-04-15 13:57:44'),(36,36,'$2y$10$qXp7bWTkG9/O1mG5Dlk6x.6vnkdqj1Eas9/70JrKqO2hwH1X4wWV2','2019-04-15 13:57:44','2019-04-15 13:57:44'),(37,37,'$2y$10$fh5VPtnnzWX8okIpBOWszet4njO6lT8DDsxvJe2r50LX6KSZ/mPtO','2019-04-15 13:57:44','2019-04-15 13:57:44'),(38,38,'$2y$10$ZXE8kF6zFnFs.0.zADiEHOk5lruLlaaXN0HdHKuqwhIgkN1Ew.RfC','2019-04-15 13:57:44','2019-04-15 13:57:44'),(39,39,'$2y$10$cyvNlwGOuKHT.li/UphF4uXtEbuCOJ8rT.3wTaNbxu1mFPjZao7RG','2019-04-15 13:57:44','2019-04-15 13:57:44'),(40,40,'$2y$10$wViJP3sWmLujaf1N.5NowOZhc6hK7GNDxUzWONmF/lvdBt2D42sLW','2019-04-15 13:57:44','2019-04-15 13:57:44'),(41,41,'$2y$10$MTe7tFyfYUbHBQOMiOmJguvBZmsdPmyDzSsDooaZ4SXUzFh/xXmk.','2019-04-15 13:57:44','2019-04-15 13:57:44'),(42,42,'$2y$10$pktSAi56G3UCDC1T8Nle8.c4xU24fQfDaleenTQ9xhSTMn1ESqvxu','2019-04-15 13:57:44','2019-04-15 13:57:44'),(43,43,'$2y$10$dhmVmmwZNGCPzJhLCTA6U.bCN7b49XA91fCku1nMUavwZQKb7aA5C','2019-04-15 13:57:44','2019-04-15 13:57:44'),(44,44,'$2y$10$JNa7mttk25KtX1mUN7TgGOocFexnlQbqzT7.WmjLBNrZhDwHLRaUO','2019-04-15 13:57:44','2019-04-15 13:57:44'),(45,45,'$2y$10$vd9TLtAvFISMKaMcjXD79.a.1xegKe6L4O.As1hYNCZBAIkOmLzjC','2019-04-15 13:57:44','2019-04-15 13:57:44'),(46,46,'$2y$10$LQtg1MakN9b0wDQ7ULxXk.fxk3hpiRzGVksnTrRS8xe7ole83GQ9K','2019-04-15 13:57:44','2019-04-15 13:57:44'),(47,47,'$2y$10$HundKBpw6LulCCTAVQuKfeyCLUr9LKQztJhQEg6D437WS9s3cGEke','2019-04-15 13:57:44','2019-04-15 13:57:44'),(48,48,'$2y$10$ZVz/CeqaIDJq7rQ4g8/MeOoHBpizKK.Cy.9ShVAQNYS/zNcr5Nvf2','2019-04-15 13:57:44','2019-04-15 13:57:44'),(49,49,'$2y$10$fv12ovwHDtSMbUdQO6u5GODSiEMCV2Sse4H4tNWTjX.b4.N0AAJBC','2019-04-15 13:57:45','2019-04-15 13:57:45'),(50,50,'$2y$10$iRp07ZjIloqk6F8pP0ovLutkA72KXv1XHuhbqxL/L15n6QYLafNw6','2019-04-15 13:57:45','2019-04-15 13:57:45'),(51,51,'$2y$10$LWFRVcnP0J3x4kxgF6FX7uX6EPBHNRHkXTRqjDCAR.i.QUbz0i/XC','2019-04-15 13:57:45','2019-04-15 13:57:45'),(52,52,'$2y$10$wdj6Ec0GHLFiVWjL9.9l2OqLPigNAr.SrnxpoEHpg2floDEukOv2O','2019-04-15 13:57:45','2019-04-15 13:57:45'),(53,53,'$2y$10$QV9GHfMMCScGBxIfAehMKe9IYPjChZS2ZNLSavXuqhNtBw/KMKpL.','2019-04-15 13:57:45','2019-04-15 13:57:45'),(54,54,'$2y$10$NUTEFn8ejMqoQnvwveHTQuh.HoOVxFK9fOOmyFyDrUz6nLDkbYGxq','2019-04-15 13:57:45','2019-04-15 13:57:45'),(55,55,'$2y$10$zY/X5ICk.Hsu.PTPKh8qruRiNN71LxTlMCvJDTmqLm5tFdqrGwZmS','2019-04-15 13:57:45','2019-04-15 13:57:45'),(56,56,'$2y$10$QVq0xGpL3qaKRM3rKak6nOIeEOa37V6VGWkoSuQLb9.HErEBVb96O','2019-04-15 13:57:45','2019-04-15 13:57:45'),(57,57,'$2y$10$.5/dqO6VrnSk9Kl04eDTPOnx/wF.3ndPhvKmcP7eSDdDgULd7l6qu','2019-04-15 13:57:45','2019-04-15 13:57:45'),(58,58,'$2y$10$DsqL29S4RsPZqPSo/xCYYumCwCgP7NO77fqgGA5m7duc0gPSkBx2K','2019-04-15 13:57:45','2019-04-15 13:57:45'),(59,59,'$2y$10$ZG38GQXjYMzm2/KiDz5WkuYZyavaxidBqsJUBq5EDmsDdf.aDRvIu','2019-04-15 13:57:45','2019-04-15 13:57:45'),(60,60,'$2y$10$m9SMmmuUYLprehHEPyw/vOj7iQ0YesoUXULbTHRNmAADpK1fKsBVO','2019-04-15 13:57:45','2019-04-15 13:57:45'),(61,61,'$2y$10$1QEuBxKVsbJO9woFIban3uypZj6XpGl/X8E8cBIkOvRM0AsXHDklG','2019-04-15 13:57:45','2019-04-15 13:57:45'),(62,62,'$2y$10$/Os56liIZD1MNQN/PBZakOytoXVhFuu6/5a7XvROFbNSqwwvf7Qu2','2019-04-15 13:57:45','2019-04-15 13:57:45'),(63,63,'$2y$10$B9NhD99tf33BMUUuzjxw6uYTieikXae7dgKJIFhMovEmIdxuMMWwW','2019-04-15 13:57:46','2019-04-15 13:57:46'),(64,64,'$2y$10$ooVp6q0yPXWcc8ZNnwE/UeAUZD8IH4xeumbbMGPEPn7E.0TNhQB7q','2019-04-15 13:57:46','2019-04-15 13:57:46'),(65,65,'$2y$10$YTrnAYVL3jIVe3wQDvOfQuNDlX58n3UIQHwvqvoIre8fePEdagz4m','2019-04-15 13:57:46','2019-04-15 13:57:46'),(66,66,'$2y$10$0SGrNiM6mxc/D5aqsL.cMOUtIyjBS8vxP4MLMht7xcLAGTFmIGL3W','2019-04-15 13:57:46','2019-04-15 13:57:46'),(67,67,'$2y$10$3RJz2lEdmxglx2TO1sEkTu4ir9lADeS6lNlgYqwnYTmwWJTxhTPEu','2019-04-15 13:57:46','2019-04-15 13:57:46'),(68,68,'$2y$10$0z9/SOHBWnsn.febZk/BV.IlVCq.LlVXjoK8GjpIVbTgLM2ie3FsO','2019-04-15 13:57:46','2019-04-15 13:57:46'),(69,69,'$2y$10$6JUtsh3xDSX1XmoeJUVlJeqzTCLYeEljcV.YHpin5QIOESyspt/8q','2019-04-15 13:57:46','2019-04-15 13:57:46'),(70,70,'$2y$10$0WeXNp8cvrbjuLnrSXsW0u0hnvwRtPtJnAjhVZxTuEXva6VR85qbW','2019-04-15 13:57:46','2019-04-15 13:57:46'),(71,71,'$2y$10$gfLjtPi1Qf4yWxorRq0VSusSfPKXhvcerDHtl4WliGfAM/nEuwjHS','2019-04-15 13:57:46','2019-04-15 13:57:46'),(72,72,'$2y$10$oj64stfGrhi6AdfGgXHQJ.LybmJSrWABF/I0uCcVrLbPdWdevC54y','2019-04-15 13:57:46','2019-04-15 13:57:46'),(73,73,'$2y$10$vLf4t1qBHdTLVPOrKtzSKeiZJ8up9nI2DqCj6R9C3I31exyoxrAyO','2019-04-15 13:57:46','2019-04-15 13:57:46'),(74,74,'$2y$10$UXFwv2O0nKpCTl.4OLkzJ.8fsL9bF5hDEPJU2MMe34/dNmhoWxKli','2019-04-15 13:57:46','2019-04-15 13:57:46'),(75,75,'$2y$10$gTd5nAalDGOqdmpPhaPSDOZYxi/PlPuuKe4/x7UtYQinvaxrlNTAm','2019-04-15 13:57:46','2019-04-15 13:57:46'),(76,76,'$2y$10$c9lfSVPz3JEACcGVz1NkAuImTKfvg./H6A0pARtu8.61pmPUxwcgG','2019-04-15 13:57:46','2019-04-15 13:57:46'),(77,77,'$2y$10$0ST7gHN/i6909SwGqF0lYeAy71nGf/MSJdtQS3/2Eu5S6GUhki3e.','2019-04-15 13:57:46','2019-04-15 13:57:46'),(78,78,'$2y$10$AhQs5/C..5qsZV1ZltEyA.W482hbuneh4pjdJJAgqUYjUtZwDuVMC','2019-04-15 13:57:47','2019-04-15 13:57:47'),(79,79,'$2y$10$F2mxKfpteKu1YGrn1GQeZew3JpMCuuIgwL2Tg216aEx9u9eI4G4LS','2019-04-15 13:57:47','2019-04-15 13:57:47'),(80,80,'$2y$10$IUd6/o6HSG87XxHSygkm1.lLEvBOw65UlmRxcr7qTe1FPvDTBH9IW','2019-04-15 13:57:47','2019-04-15 13:57:47'),(81,81,'$2y$10$sWQckt/Ir6rYdkCj0u.5yuAgpFz39tO6jCeHgqP85A2FcJSx7DyQ.','2019-04-15 13:57:47','2019-04-15 13:57:47');
/*!40000 ALTER TABLE `password_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view backend','web','2019-04-15 13:57:47','2019-04-15 13:57:47');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `dislikes` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `answered` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discipline_id` int(10) unsigned DEFAULT NULL,
  `answer_user_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,63,'<p>sad</p>',1,1,0,0,'2019-04-15 13:58:03','2019-04-15 14:04:24',1,0),(2,7,'<p><span style=\"color: rgb(0, 0, 0);\">Să se găsească funcțiile f(x) și g(x) știind că verifică sistemul ecuații:</span></p><p><span style=\"color: rgb(0, 0, 0);\">|f(x)+3g(x)|=3-x</span></p><p><span style=\"color: rgb(0, 0, 0);\">|3g(x)-f(x)|=x-3.&nbsp;</span></p>',0,0,0,0,'2019-04-16 03:54:49','2019-04-16 03:54:49',1,0),(3,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramul divxy care primeşte prin parametrii x şi y două valori întregi pozitive (0&lt;x&lt;1000 şi&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">0&lt;y&lt;1000) şi returnează valoarea 1 dacă y este divizor al lui x sau x este divizor al lui y şi returnează valoarea 0 altfel.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi definiţia completă a subprogramului divxy.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Scrieţi un program C/C++ care citeşte de la tastatură trei numere naturale nenule a, b şi n, cu cel mult 3 cifre&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">fiecare şi care afişează pe ecran toţi divizorii lui n din intervalul închis determinat de a şi b folosind apeluri utile ale subprogramului divxy. Intervalul închis determinat de a şi b este [a,b] dacă a&lt;b sau [b,a] dacă b≤a. Numerele afişate&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">sunt separate prin câte un spaţiu. Dacă nu există niciun astfel de număr se afişează mesajul NU EXISTA. Exemplu:&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">pentru a=85, b=10 şi n=40 se afişează: 10 20 40 (nu neapărat în această ordine)</span></p>',0,0,0,0,'2019-04-16 03:55:09','2019-04-16 03:55:09',2,0),(4,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramul dist2, care primeşte prin intermediul parametrilor xa, ya şi respectiv xb, yb,&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">coordonatele carteziene întregi (abscisă, ordonată) pentru două puncte din plan, A şi respectiv B. Subprogramul&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">returnează pătratul distanţei dintre cele două puncte.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi în limbajul C/C++ definiţia completă a subprogramului dist2.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Scrieţi un program C/C++ care citeşte de la tastatură 8 valori întregi reprezentând</span></p><p><span style=\"color: rgb(0, 0, 0);\">coordonatele carteziene pentru patru puncte din plan şi afişează mesajul Da dacă cele patru puncte pot fi vârfurile&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">unui pătrat, iar în caz contrar afişează mesajul Nu,folosind apeluri utile ale subprogramului dist2. Exemplu: dacă&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">coordonatele punctelor sunt cele alăturate</span></p><p><span style=\"color: rgb(0, 0, 0);\">0 0</span></p><p><span style=\"color: rgb(0, 0, 0);\">3 0</span></p><p><span style=\"color: rgb(0, 0, 0);\">3 3</span></p><p><span style=\"color: rgb(0, 0, 0);\">0 3 atunci se va afişa mesajul Da&nbsp;</span></p>',0,0,0,0,'2019-04-16 03:55:34','2019-04-16 03:55:34',2,0),(5,7,'<p><span style=\"color: rgb(0, 0, 0);\">Subprogramul mult, cu doi parametri, primeşte prin intermediul primului parametru, n, un număr natural nenul cu&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">maximum trei cifre şi prin intermediul celui de-al doilea parametru, a, un tablou unidimensional având n componente&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">numere naturale cu cel mult 8 cifre fiecare. Subprogramul returnează valoarea true dacă cele n componente ale lui a&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">pot forma o mulţime şi returnează false în caz contrar.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi definiţia completă a subprogramului mult.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Fişierul text date.in conţine cel mult 400 de numere naturale având maximum 8 cifre fiecare. Scrieţi un program&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">C/C++ care, folosind apeluri utile ale subprogramului mult, afişează pe ecran valoarea maximă k, astfel încât primele&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">k numere succesive din fişier să poată forma o mulţime. Exemplu: dacă fişierul date.in conţine</span></p><p><span style=\"color: rgb(0, 0, 0);\">16 17 8 31 8 2 10 atunci se va afişa 4 (deoarece primele patru numere din fişier pot forma o mulţime şi</span></p><p><span style=\"color: rgb(0, 0, 0);\">acesta este cardinalul maxim posibil în condiţiile impuse de enunţul problemei).</span></p>',0,0,0,0,'2019-04-16 03:55:52','2019-04-16 03:55:52',2,0),(6,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramul cmmdc, care primeşte prin intermediul a doi parametri, a şi b, două numere naturale&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">nenule, cu maximum 8 cifre fiecare, şi returnează cel mai mare divizor comun al valorilor parametrilor a şi b.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi definiţia completă a subprogramului cmmdc.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Scrieţi un program Pascal care citeşte de la tastatură un număr natural n (n&lt;300), şi, cu ajutorul subprogramului&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">cmmdc, determină numărul perechilor de valori naturale (a,<img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">, 1&lt;a&lt;b&lt;n, cu proprietatea că a şi b nu au niciun divizor&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">comun în afară de 1. Numărul obţinut se va afişa pe ecran. Exemplu: dacă se citeşte n=6, atunci se va afişa 6&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">(deoarece perechile (2,3), (2,5), (3,4), (3,5), (4,5), (5,6) satisfac condiţiile din enunţ).</span></p>',0,0,0,0,'2019-04-16 03:56:16','2019-04-16 03:56:16',2,0),(7,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramul inv, care primeşte prin intermediul primului parametru a un număr natural, cu&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">minimum două cifre şi maximum 8 cifre, şi furnizează prin intermediul celui de-al doilea parametru, b, valoarea&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">numărului natural format cu aceleaşi cifre ca şi a, considerate în ordine inversă. De exemplu, pentru a=3805, după apel&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">b va avea valoarea 5083., iar dacă a=3800, după apel b va avea valoarea 83.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi definitia completă a subprogramului inv.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Scrieţi un program C/C++ care citeşte de la tastatură un număr natural n de minimum două şi maximum 8 cifre şi&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">afişează pe ecran un număr palindrom cu valoarea cea mai apropiată de valoarea lui n citită. În cazul în care există&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">două astfel de numere, se va afişa cel mai mic dintre ele. Se vor folosi apeluri utile ale subprogramului inv. Spunem că&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">un număr natural x este palindrom dacă numărul format din cifrele lui x considerate de la stânga către dreapta este&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">acelaşi cu numărul format din cifrele lui x considerate de la dreapta către stânga.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Exemplu: dacă n=16, atunci se afişează valoarea 11, dacă n=126, atunci se afişează</span></p><p><span style=\"color: rgb(0, 0, 0);\">121, iar dacă a=33, atunci se afişează 33.</span></p>',0,0,0,0,'2019-04-16 03:56:29','2019-04-16 03:56:29',2,0),(8,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramul cifre, care primeşte prin intermediul primului parametru, a, un număr natural cu&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">maximum 8 cifre nenule şi returnează, prin intermediul celui de-al doilea parametrul b, cel mai mic număr care se&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">poate forma cu toate cifrele distincte ale lui a.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi definiţia completă a subprogramului cifre.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Se consideră fişierul text date.in ce conţine pe prima linie un număr natural nenul n (n≤100), iar pe a doua linie n&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">numere naturale, separate prin câte un spaţiu, fiecare număr având maximum 8 cifre nenule. Scrieţi un program C/C++&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">care citeşte toate numerele din fişierul text date.in şi afişează pe ecran, despărţite prin câte un spaţiu, numerele&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">situatepe a doua linie a fişierului, formate numai din cifre distincte ordonate strict crescător, folosind apeluri utile ale&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">subprogramului cifre. În cazul în care nu există niciun astfel de număr se va afişa valoarea 0.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Exemplu: dacă fişierul date.in are conţinutul alăturat, 6</span></p><p><span style=\"color: rgb(0, 0, 0);\">16 175 333 242477 321 269 atunci se vor afişa numerele: 16 269</span></p>',0,0,0,0,'2019-04-16 03:56:41','2019-04-16 03:56:41',2,0),(9,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramele</span></p><p><span style=\"color: rgb(0, 0, 0);\">– prim, care primeşte prin intermediul unicului său parametrului x un număr natural nenul de cel mult 4 cifre şi&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">returnează valoarea 1 dacă x este un număr prim şi 0 în caz contrar;– numar, care primeşte prin intermediul parametrului x un număr natural nenul de cel mult 4 cifre şi furnizează prin&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">intermediul parametrului nrp numărul de numere prime mai mici decât x.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi numai antetul subprogramului prim şi definiţia completă a subprogramului</span></p><p><span style=\"color: rgb(0, 0, 0);\">numar.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Scrieţi un programul C/C++ în care se citesc de la tastatură două numere naturale</span></p><p><span style=\"color: rgb(0, 0, 0);\">nenule de cel mult 4 cifre, a şi b (a&lt;b), şi, prin apeluri utile ale subprogramului numar, se verifică dacă intervalul&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">închis [a,b] conţine cel puţin un număr prim. Progr. va afişa pe ecran, în caz afirmativ, mesajul DA, iar în caz contrar,&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">mesajul NU.</span></p>',0,0,0,0,'2019-04-16 03:56:52','2019-04-16 03:56:52',2,0),(10,7,'<p><span style=\"color: rgb(0, 0, 0);\">Se consideră subprogramul multiplu, cu doi parametri, care:</span></p><p><span style=\"color: rgb(0, 0, 0);\">– primeşte prin intermediul parametrilor a şi k două numere întregi de cel mult 4 cifre;</span></p><p><span style=\"color: rgb(0, 0, 0);\">– returnează cel mai mic multiplu al lui k mai mare sau egal cu a.</span></p><p><span style=\"color: rgb(0, 0, 0);\">a) Scrieţi numai antetul subprogramului multiplu.&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\"><img src=\"http://forum.portal.edu.ro/html/emoticons/cool.gif\" alt=\"cool.gif\">&nbsp;Scrieţi declarările de date şi programul principal C/C++ care citeşte de la tastatură trei numere naturale nenule x, y,&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">z, de cel mult 4 cifre fiecare, (x≤y), şi care, prin apeluri utile ale subprogramului multiplu, verifică dacă intervalul&nbsp;</span></p><p><span style=\"color: rgb(0, 0, 0);\">[x,y] conţine cel puţin un multiplu al lui z. Programul va afişa pe ecran, în caz afirmativ, mesajul DA, iar în caz contrar</span></p><p><span style=\"color: rgb(0, 0, 0);\">mesajul NU.&nbsp;</span></p>',0,0,0,0,'2019-04-16 03:57:02','2019-04-16 03:57:02',2,0),(11,7,'<p><span style=\"color: rgb(0, 0, 0);\">Nu va suparati nu stiti unde as putea gasi niste exercitii rezolvate pentru concursuri sau olimpiade? Un link sau o carte, daca se poate.</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">Multumesc.&nbsp;<img src=\"http://forum.portal.edu.ro/html/emoticons/ph34r.gif\" alt=\"ph34r.gif\"></span></p>',0,0,0,0,'2019-04-16 03:57:30','2019-04-16 03:57:30',7,0),(12,7,'<p><span style=\"color: rgb(0, 0, 0);\">Sa se gaseasca ecuatiile de gradul 2 cu coeficienti reali, astfel incat una dintre solutii sa fie:</span></p><p><span style=\"color: rgb(0, 0, 0);\">a). (2-i)(2i-1);</span></p><p><span style=\"color: rgb(0, 0, 0);\">B). a+ib, a,b din R</span></p><p><span style=\"color: rgb(0, 0, 0);\">c. 1/(a+ib), ab &lt;&gt; de 0.</span></p>',0,0,0,0,'2019-04-16 03:58:05','2019-04-16 03:58:05',1,0),(13,7,'<p><span style=\"color: rgb(0, 0, 0);\">Am nevoie de ajutor la urmatoarea problema de clasa a 9:</span></p><p><span style=\"color: rgb(0, 0, 0);\">Sa se calculeze suma :</span></p><p><span style=\"color: rgb(0, 0, 0);\">1/(1*5)+1/(2*6)+1/(3*7)+...+1/n(n+4) ,</span><strong style=\"color: rgb(0, 0, 0);\">&nbsp;n</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;apartine lui N stelat.</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">Multumesc!&nbsp;<img src=\"http://forum.portal.edu.ro/html/emoticons/smile.gif\" alt=\"smile.gif\">&nbsp;</span></p>',0,0,0,0,'2019-04-16 03:58:22','2019-04-16 03:58:22',1,0),(14,7,'<p><span style=\"color: rgb(0, 0, 0);\">Prezinta,in cateva randuri,o situatie in care ai ascultat sau ai cantat un imn,precizand si titlul acestuia. (macar dati-mi niste idei va rog)</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">Multumesc!</span></p>',0,0,0,0,'2019-04-16 04:01:07','2019-04-16 04:01:07',3,0),(15,7,'<p><span style=\"color: rgb(0, 0, 0);\">Gigel îi propune lui Costel un joc: fiecare dintre ei are un pachet de N cărţi de joc, amestecate (cărţile sunt numerotate distinct de la 1 la N).concurenţii se uită la fiecare carte din pachet începând cu prima, până se ajunge la cartea cu numărul 1, pe care o scoate din joc, cel care a găsit-o. Apoi caută cartea cu numărul 2, cartea cu numărul 3, s.a.m.d. Pentru fiecare carte, căutarea începe de unde a rămas (de la cartea care urmează după cartea scoasă din joc). Dacă un concurent ajunge la sfârşitul pachetului, primeşte o bilă neagră şi continuă căutarea de la începutul pachetului. Jocul se termină când fiecare concurent a eliminat ultima carte din pachet.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Scrieţi un program care să determine câştigătorul jocului, precizând şi câte bile negre a acumulat.</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">va rog:(</span></p>',0,0,0,0,'2019-04-16 04:01:34','2019-04-16 04:01:34',2,0),(16,7,'<p><span style=\"color: rgb(0, 0, 0);\">Cine ma poate ajuta cu cateva idei la un eseu argumentativ despre Ion (de L.Rebreanu) plecand de la citatul:</span></p><p><span style=\"color: rgb(0, 0, 0);\">\"Ion nu e insa decat o bruta, careia siretenia ii tine loc de desteptaciune.\" ?</span></p><p><span style=\"color: rgb(0, 0, 0);\">Nu stiu cum sa incep si ce sa mai scriu pe acolo.Romana asta,mai bine aveam 10 exercitii la mate decat un eseu&nbsp;<img src=\"http://forum.portal.edu.ro/html/emoticons/mad.gif\" alt=\"mad.gif\">&nbsp;.</span></p>',0,0,0,0,'2019-04-16 04:01:46','2019-04-16 04:01:46',3,0),(17,7,'<p><span style=\"color: rgb(0, 0, 0);\">Baiatul meu are ca tema ptr luni sa povesteasca ceea ce a retinut din \'\'Baiatul si Vantul\'\'</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">din pacate la clasa mare lucru nu a retinut, si nu reusesc sa gasesc pe nicaieri aceasta poveste , basm .. ce-o fi el ..&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">as avea rugamintea daca stie cineva un autor sau un link ptr a o citi sa ma ajute.</span></p>',0,0,0,0,'2019-04-16 04:02:00','2019-04-16 04:02:00',3,0),(18,7,'<p><span style=\"color: rgb(0, 0, 0);\">Sa se arate vectorial ca se poate construi un triunghi avand laturile egale si paralele cu medianele unui triunghi dat.</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">Problemă de fizică, clasa a IX-a.</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">Vă rog, dacă e dispus cineva să o rezolve aş fii recunoscător.&nbsp;<img src=\"http://forum.portal.edu.ro/html/emoticons/sad.gif\" alt=\"sad.gif\"></span></p>',0,0,0,0,'2019-04-16 04:02:21','2019-04-16 04:02:21',5,0),(19,7,'<p><span style=\"color: rgb(0, 0, 0);\">Ma poate ajuta cineva cu schema comentarii unei opere lirice? Ce ar trebui sa contina comentariul meu, etc.</span></p>',0,0,0,0,'2019-04-16 04:02:41','2019-04-16 04:02:41',3,0);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator','web','2019-04-15 13:57:47','2019-04-15 13:57:47'),(2,'teacher','web','2019-04-15 13:57:47','2019-04-15 13:57:47'),(3,'student','web','2019-04-15 13:57:47','2019-04-15 13:57:47');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'Mihai Eminescu','Cluj-Napoca',NULL,NULL),(2,'Tiberiu Popoviciu','Bucuresti',NULL,NULL),(3,'Stefan cel Mare','Cluj-Napoca',NULL,NULL);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_disciplines`
--

DROP TABLE IF EXISTS `student_disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_disciplines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_disciplines`
--

LOCK TABLES `student_disciplines` WRITE;
/*!40000 ALTER TABLE `student_disciplines` DISABLE KEYS */;
INSERT INTO `student_disciplines` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,2,1,NULL,NULL),(5,2,3,NULL,NULL),(6,2,4,NULL,NULL),(7,3,5,NULL,NULL),(8,3,2,NULL,NULL),(9,3,7,NULL,NULL);
/*!40000 ALTER TABLE `student_disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `classroom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_user_id_foreign` (`user_id`),
  KEY `students_school_id_foreign` (`school_id`),
  CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,6,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(2,7,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(3,8,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(4,9,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(5,10,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(6,11,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(7,12,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(8,13,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(9,14,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(10,15,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(11,16,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(12,17,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(13,18,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(14,19,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(15,20,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(16,21,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(17,22,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(18,23,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(19,24,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(20,25,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(21,26,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(22,27,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(23,28,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(24,29,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(25,30,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(26,31,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(27,32,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(28,33,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(29,34,1,'IX A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(30,35,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(31,36,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(32,37,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(33,38,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(34,39,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(35,40,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(36,41,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(37,42,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(38,43,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(39,44,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(40,45,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(41,46,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(42,47,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(43,48,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(44,49,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(45,50,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(46,51,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(47,52,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(48,53,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(49,54,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(50,55,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(51,56,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(52,57,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(53,58,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(54,59,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(55,60,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(56,61,1,'IX B','2019-04-15 13:57:47','2019-04-15 13:57:47'),(57,62,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(58,63,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(59,64,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(60,65,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(61,66,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(62,67,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(63,68,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(64,69,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(65,70,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(66,71,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(67,72,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(68,73,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(69,74,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(70,75,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(71,76,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(72,77,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(73,78,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(74,79,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(75,80,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(76,81,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47'),(77,82,1,'X A','2019-04-15 13:57:47','2019-04-15 13:57:47');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_disciplines`
--

DROP TABLE IF EXISTS `teacher_disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_disciplines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) unsigned NOT NULL,
  `discipline_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_disciplines`
--

LOCK TABLES `teacher_disciplines` WRITE;
/*!40000 ALTER TABLE `teacher_disciplines` DISABLE KEYS */;
INSERT INTO `teacher_disciplines` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,2,3,NULL,NULL),(4,2,4,NULL,NULL);
/*!40000 ALTER TABLE `teacher_disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teachers_user_id_foreign` (`user_id`),
  KEY `teachers_school_id_foreign` (`school_id`),
  CONSTRAINT `teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,5,1,'2019-04-15 13:57:47','2019-04-15 13:57:47');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 1,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reputation` int(11) NOT NULL DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'4ba66f17-9b25-460e-a743-1696c41bf5da','Admin','Istrator','admin@admin.com','gravatar',NULL,'$2y$10$Xc1vpTYRYKcmWiWG7a/LZeY82d9SarJSN/oEHI9IsU2ENB.NCCVhy',NULL,1,'e0ea42b0a95b5da3aad1d2b53daf1d26',1,'UTC',NULL,'2019-04-15 13:57:41','2019-04-15 13:57:41',NULL,0,NULL),(2,'c14699ad-4bea-447c-bae7-7d3f369af1e1','Backend','User','executive@executive.com','gravatar',NULL,'$2y$10$JxpNlcAZDma3u3/GsGei6.Shjym/3VohSpfnBjAYM.NrACIt/P5oW',NULL,1,'3bfaa69f2365802c852646c69eef19fb',1,'UTC',NULL,'2019-04-15 13:57:41','2019-04-15 13:57:41',NULL,0,NULL),(3,'243ae2e7-f149-4300-b921-36cfa24bf0d8','Default','User','user@user.com','gravatar',NULL,'$2y$10$kc.LF6ohFKM03tLBBAgwMeDGBEH.NHFyfpgeLQ33U8l508XgXJf5W',NULL,1,'6e292c84d45e7b87c6cd10816b124db9',1,'UTC',NULL,'2019-04-15 13:57:41','2019-04-15 13:57:41',NULL,0,NULL),(4,'f44afed4-76bf-41ba-ad2f-d95f9e4731bf','Student 1','Prenume 1','student1@student.com','gravatar',NULL,'$2y$10$EHYZZXMu5omKdeeE9fQ5tORiCKYfHatAXZK9Ax7hayTQLVJmacSsi',NULL,1,'c394ccfa6d3046a957abbeea30f05740',1,'UTC',NULL,'2019-04-15 13:57:41','2019-04-15 13:57:41',NULL,0,NULL),(5,'90202ddd-c0de-4b25-a173-4faa3f158069','Simona','Arsenov','simona.arsenov@gmail.com','gravatar',NULL,'$2y$10$THmqG3LF9awweg7rdaRYJOPGODB.S5SWldZXPUuyPxoonCFbNDLtG',NULL,1,'e558ff5c44f7801d69dd02d35a98e354',1,'UTC',NULL,'2019-04-15 13:57:41','2019-04-15 13:57:41',NULL,0,NULL),(6,'c48ce9cb-05de-460a-bbea-2f463cd6b8af','Antone','Maria','antone.maria@gmail.com','gravatar',NULL,'$2y$10$fI3d/hypCHFVVoAiHteiIefaYXgNZpNixq5ZT.kSMfmJfdNcKRSRu',NULL,1,'1107837cf7be598b987456881b6be7f4',1,'UTC',NULL,'2019-04-15 13:57:41','2019-04-15 13:57:41',NULL,0,NULL),(7,'7947cdee-4912-4bf9-a023-d8bf0bb9b122','Butu','Eduard','butu.eduard@gmail.com','gravatar',NULL,'$2y$10$ES9JXni1Er9gPQeV7hKkfOivzapS12.UCk3ugZ9rtsKcwXiUm68km',NULL,1,'98f332c183a525a1da571044fe25db85',1,'UTC','lKndQp24W01UdZIuwvgHFnb7uccWtTX8BOs1VQhqTyeph2gXqNSWhAbL8dRb','2019-04-15 13:57:42','2019-04-16 04:06:59',NULL,0,'2019-04-16 10:06:59'),(8,'5caeae4f-de70-4627-b5fa-5ac5ea149f1e','Carlan','Alexandra','carlan.alexandra@gmail.com','gravatar',NULL,'$2y$10$UM39mycGM.ni5KDjrufPEOCJBUjD.HdZdjdu06W7.28dHILXy/hqC',NULL,1,'43e09bfc98c77f8a11c32f7a868efc10',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(9,'de358867-78cf-4060-889e-a1ecced9c174','Chipurici','Victoria','chipurici.victoria@gmail.com','gravatar',NULL,'$2y$10$H8VmctM5XsP1YmAEy2Y06evbFprNPfeuiWeVtwwNcusQ677y4IIz6',NULL,1,'50899817d25a3fca6c44647b705208fe',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(10,'5d860f82-6e56-42af-94a1-523b85b51036','Chirita','Bogdan','chirita.bogdan@gmail.com','gravatar',NULL,'$2y$10$fx48ZNGZIkD0AMQ7jrQNneJBODeqRRBNx6mR3KHDInfuUmMqcXtWy',NULL,1,'ec1f5667076c6da29751d056906dc3b5',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(11,'c9dab6a2-21e0-45fa-927d-a5590bc0b120','Cojocaru','Ana','cojocaru.ana@gmail.com','gravatar',NULL,'$2y$10$2T4lj98Bwf1LeEN6fJMCXeOY3/qgtLijlxO7xdJWrXldmifc5mtee',NULL,1,'5c01513401db7fcfd5971a8dbc8468c7',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(12,'c2405515-47de-46ef-9f32-1b73c97fb90b','Dragan','Tudor','dragan.tudor@gmail.com','gravatar',NULL,'$2y$10$G92A/pGyZ5KgDbYvZinyBOxb7vxSWWdyUfoOmtOx9xjdb4gr7CA9W',NULL,1,'fe2727203e856b7bdfc6d6309e3aed90',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(13,'6a5ddfe0-95f6-4c25-857d-f82416aa16f1','Dumitrascu','Vadim','dumitrascu.vadim@gmail.com','gravatar',NULL,'$2y$10$nob.R3K5wv5q/gJQCl11wurLlNC4EeeaJJ8zm.rttghH.imEvFraG',NULL,1,'c14dc523d299941acc0a72a6d6662311',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(14,'7dad1533-4a2b-4a25-9f1f-87bc621d39ee','Eremia','Andreea','eremia.andreea@gmail.com','gravatar',NULL,'$2y$10$fCFqag2QaZrXsU8HUuuA3uNYoEpQhPa07lrYB2jR8OJEh/QGB1peC',NULL,1,'8e4eb672b0dec8f1c34eac3d2102cade',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(15,'06b3358a-06fc-4dcf-bd3a-a75036f255d8','Florescu','Sabina','florescu.sabina@gmail.com','gravatar',NULL,'$2y$10$699htxU86FMx8.AR1lvdUu3Jk3a.eM9dXn36C1ceL.uIsPkue86n.',NULL,1,'63b0ad733beb52ea03cd3a86cc5c62b0',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(16,'23220b4d-7e70-495f-a429-1912dddaa196','Georgescu','Julia','georgescu.julia@gmail.com','gravatar',NULL,'$2y$10$Mjno44NP3SjlttO2SMvrkunxbj8oMxyWw/1jRx3yLaih9b45r6t02',NULL,1,'cc92d5c337dfc68f10430be972884f91',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(17,'f3863e1f-e285-41ee-b765-4008be845720','Gherasim','Razvan','gherasim.rasvan@gmail.com','gravatar',NULL,'$2y$10$WEaDIrAKzlhLU2GmqzMuMu98yTXHDiVyA1ZuUo2T03leoOEHaN39.',NULL,1,'4dba9545be00abdcb1c29fa07fc2c37e',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(18,'29b09749-55b0-404f-a126-bd7166188dd9','Ilie','Dana','ilie.dana@gmail.com','gravatar',NULL,'$2y$10$QpO1DilxlvvAUF429ASQzeUmRrfIJTLP4pD/DFXqM.F9biFKW0D1O',NULL,1,'3077cb0a4343af7781592d9d8f58260a',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(19,'bd7cd311-4956-4ea3-abd9-38178f5a611e','Iosif','Delia','iosif.delia@gmail.com','gravatar',NULL,'$2y$10$LN27mjfjEetAq5n51NwQb.LpliGh6k5dlaLAx1V/mewBtUCbb4GX.',NULL,1,'41182e3f0886c7973a246e5b9657f2a6',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(20,'56d824cc-282e-4a2e-9825-e6cb894df73c','Lazar','Raluca','lazar.raluca@gmail.com','gravatar',NULL,'$2y$10$FZAl4DrEi8zdcW0VI.aZbeq8I7GsYFIPqrYYqDquFV/BM9exl3Jty',NULL,1,'f6c4921a25c6e634e301d084e2a6d23e',1,'UTC',NULL,'2019-04-15 13:57:42','2019-04-15 13:57:42',NULL,0,NULL),(21,'876590be-b51f-437d-8490-45d2b98521f7','Lucinschi','Olga','lucinschi.olga@gmail.com','gravatar',NULL,'$2y$10$RKiPHQbgGcv34XyEF8dEwOFDPX7yf0FwNdGV.JXmhmzypQoFO0meK',NULL,1,'d8fecd26c519972bcf13e77169eb9996',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(22,'47f31316-0743-4b5f-8b0b-4d7c7f688d5c','Moldoveanu','Elena','moldoveanu.elena@gmail.com','gravatar',NULL,'$2y$10$4dyB0pQyx.a6sVlYepWHre9UFaXkraKTH4TyVEP6KJ8HsC6C4o/wu',NULL,1,'c19e083e91e83e8258a28a03e7a87110',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(23,'c7cd0678-f349-41de-ad7e-4a4878b05d1a','Petre','Alexandru','petre.alexandru@gmail.com','gravatar',NULL,'$2y$10$pbzk4gVUgQGuXzbuBiQDZeFc7Cbtp0v07F9HAtVGGdm8IRgj0.eWC',NULL,1,'851cd11d71ecf56eacc5ecd3b7378875',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(24,'5c7136dc-c451-49f2-9d89-17b5450250e0','Radu','Andrei','radu.andrei@gmail.com','gravatar',NULL,'$2y$10$O01FTJjHmjW9/5TfMvvpjOYxHu1eXEt5mU59CFo5CN1On5pzVT3.S',NULL,1,'94935319b297a54eaa45f9912a9ee096',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(25,'e1c9bb03-114e-44f5-b623-d5cff08f8ed1','Radulescu','Andrei','radulescu.andrei@gmail.com','gravatar',NULL,'$2y$10$qmMZPdjkUPa1FgYPD8N9NOFLAe27e0wCJMcqwpfiX95WlMkGjUtP2',NULL,1,'78c6b1b20074f7e1cb5261008938307c',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(26,'c9bbc9d7-b3eb-4e97-b008-7d75f296ddfe','Rotea','Cristina','rotea.cristina@gmail.com','gravatar',NULL,'$2y$10$GwXHzbMbp6fg569fsPxP9eJlloX.AqBPkKOSEVoppITJcB4tOlQgK',NULL,1,'312a2fa459a7a03407879b60ff33a651',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(27,'d13be6f2-11f6-4de7-9336-db0497b5e202','Ruxanda','Maria','ruxanda.maria@gmail.com','gravatar',NULL,'$2y$10$8J5SMRQConnnaFw.xjIQrOwV10McMXtuJ1NZTQ6RyF27qsHuwBo.2',NULL,1,'3ab5906dfaf39882bf7501f905898432',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(28,'5bbd3aae-3af7-438a-8c3c-f68fad9cb607','Sima','Maria','sima.maria@gmail.com','gravatar',NULL,'$2y$10$s9X8NWqXiQWRga0YOd1LsOUSOKkLFWQfdDSZwiQxfMjujqqrHZJue',NULL,1,'2002c3b48f3a3cd0fcf1dd792d5822a9',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(29,'b7a26b2e-066a-4faf-9896-53550bc4c58e','Tasiu','Tatiana','tasiu.tatiana@gmail.com','gravatar',NULL,'$2y$10$CtCL4IikpF7qSRVBZka8BuL1hFHRcqIM84rrjs/fHdjZE3sObAhDG',NULL,1,'74c76524db17b1efdcc9b0be3fd3599a',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(30,'5bc60180-4b65-4575-aca0-1fa83f097900','Tanase','Maria','tanase.maria@gmail.com','gravatar',NULL,'$2y$10$lUHxGMx65drt7t4KQZpSS.yTycCwEjMFFyaxMpNAOkVY9zCGzl0q6',NULL,1,'7fddddf4c7a50290ed59b59b15d40872',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(31,'33faf62e-357d-41b1-a257-f285e551ede7','Trusca','Raluca','trusca.raluca@gmail.com','gravatar',NULL,'$2y$10$xtHcocTT0x5UlQPBpLWZVuLZprKC.ZyZtj30L.PiL6RBAJ4dOHjdy',NULL,1,'a3e04f4a38ecde252e4db26f13709ebe',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(32,'dfafa3f6-bdb8-46a0-90c2-5ade23ce7782','Vasilescu','Matei','vasilescu.matei@gmail.com','gravatar',NULL,'$2y$10$Y2z.fBqZVKZzV1vadTTFTebJIGOImI4AsT1UNRk0Y.CtgBlGbxJMy',NULL,1,'f4fe8e0a961c7c978a9dfc3cb388f652',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(33,'06700d45-6e10-49b6-9dd7-f5593d57e88d','Zurini','Leonerdo','zurini.leonardo@gmail.com','gravatar',NULL,'$2y$10$vrRyQa3EEsvlzAWPFNxLueE1KtaycHTp6OykjG1u.xylFSyIOVTCe',NULL,1,'d3b94e3f42d7b81e0f973a745983607d',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(34,'712b34fd-e1cc-4dd7-8243-d6577a286f74','Adoc','Danu','adoc.danu@gmail.com','gravatar',NULL,'$2y$10$9Rw.cP85EaFXaoaV/n7Y3uJQJ2aDPKv19Yg5G2FtmjJMfvG3XHBuu',NULL,1,'f3a18d7512055501799a23291a16f48d',1,'UTC',NULL,'2019-04-15 13:57:43','2019-04-15 13:57:43',NULL,0,NULL),(35,'23469cb9-49dd-4a39-8f89-556206b4a07d','Ardelean','Denisa','ardelean.denisa@gmail.com','gravatar',NULL,'$2y$10$ST.JMw.BLfw9eZIP4qbE/u6dadiDNRlKz/Ny8RgQi4z7H2u5Jojie',NULL,1,'bc74160a57ccf86fb0e14711cd0d6233',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(36,'78be66cd-9d18-43b8-87d1-011d360e8cec','Berari','George','berari.george@gmail.com','gravatar',NULL,'$2y$10$qXp7bWTkG9/O1mG5Dlk6x.6vnkdqj1Eas9/70JrKqO2hwH1X4wWV2',NULL,1,'91a1976b475d0bdd5277d6ec48a20b6e',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(37,'9e55f08b-5e34-4268-91cd-a6e9202db8e3','Borza','Alex','borza.alex@gmail.com','gravatar',NULL,'$2y$10$fh5VPtnnzWX8okIpBOWszet4njO6lT8DDsxvJe2r50LX6KSZ/mPtO',NULL,1,'48ca0a208b0fda2706a771a1a91e8d0c',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(38,'6a6e4616-2b13-421e-a7d8-cc085acf4c2f','Busui','Bogdan','busui.bogdan@gmail.com','gravatar',NULL,'$2y$10$ZXE8kF6zFnFs.0.zADiEHOk5lruLlaaXN0HdHKuqwhIgkN1Ew.RfC',NULL,1,'e4621b7711f745ae0603df9b6e25f663',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(39,'05b2156f-1a52-470a-821e-7161410ed2e9','Cionca','Paul','cionca.paul@gmail.com','gravatar',NULL,'$2y$10$cyvNlwGOuKHT.li/UphF4uXtEbuCOJ8rT.3wTaNbxu1mFPjZao7RG',NULL,1,'25f50dfda2c895d8d71aeafc619ab79e',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(40,'b7c95c3d-fcee-4ab2-9f0b-2a4c860378bf','Cret','Alexandru','cret.alexandru@gmail.com','gravatar',NULL,'$2y$10$wViJP3sWmLujaf1N.5NowOZhc6hK7GNDxUzWONmF/lvdBt2D42sLW',NULL,1,'adde898628be1dd2475c305251a5a910',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(41,'1e5cb0a9-f328-43fe-bc7b-f0e7ec73e65f','Damina','Melisa','damian.melisa@gmail.com','gravatar',NULL,'$2y$10$MTe7tFyfYUbHBQOMiOmJguvBZmsdPmyDzSsDooaZ4SXUzFh/xXmk.',NULL,1,'03da162425d67ebb2da9ff5e24c7a754',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(42,'b178b9ba-4d2b-4fd4-aec1-1f8cf726d4ea','Darie','Patrick','darie.patrick@gmail.com','gravatar',NULL,'$2y$10$pktSAi56G3UCDC1T8Nle8.c4xU24fQfDaleenTQ9xhSTMn1ESqvxu',NULL,1,'09be2791924bf098e77d7c8c73c24059',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(43,'51910e95-0036-4657-828c-23c2d2e63570','Dascau','Andreea','dascau.andreea@gmail.com','gravatar',NULL,'$2y$10$dhmVmmwZNGCPzJhLCTA6U.bCN7b49XA91fCku1nMUavwZQKb7aA5C',NULL,1,'7951f6aefd8a8d863acdd9b24d845ec6',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(44,'5941ea00-8ac1-45d5-bd32-9e1ff7d7cd5c','Dumitrescu','Iasmina','dumitrescu.iasmina@gmail.com','gravatar',NULL,'$2y$10$JNa7mttk25KtX1mUN7TgGOocFexnlQbqzT7.WmjLBNrZhDwHLRaUO',NULL,1,'a2e96387d3c99b32886cd2d60834212a',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(45,'1778c2b8-7036-43f8-b659-02680bce3892','Giurgiu','Alexandru','giurgiu.alexandru@gmail.com','gravatar',NULL,'$2y$10$vd9TLtAvFISMKaMcjXD79.a.1xegKe6L4O.As1hYNCZBAIkOmLzjC',NULL,1,'2ae5ab1d455949ce729d4f8d390e9e34',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(46,'e8a2d57c-4502-4f80-88f5-07c1f40fc07f','Horga','Sebastian','horga.sebastian@gmail.com','gravatar',NULL,'$2y$10$LQtg1MakN9b0wDQ7ULxXk.fxk3hpiRzGVksnTrRS8xe7ole83GQ9K',NULL,1,'2a8c73fd793bd1c95b4f023a44b2bded',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(47,'908fe0dc-b988-4c34-bb9b-a21c77b55946','Iov','Robert','iov.robert@gmail.com','gravatar',NULL,'$2y$10$HundKBpw6LulCCTAVQuKfeyCLUr9LKQztJhQEg6D437WS9s3cGEke',NULL,1,'9dddca92117d1e43b3c4e9ff7a53b113',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(48,'6c3d54a9-a453-4e2d-ab29-e7a81489343d','Jurj','Diana','jurj.diana@gmail.com','gravatar',NULL,'$2y$10$ZVz/CeqaIDJq7rQ4g8/MeOoHBpizKK.Cy.9ShVAQNYS/zNcr5Nvf2',NULL,1,'3ebbb5bacae07738af2531939f46332e',1,'UTC',NULL,'2019-04-15 13:57:44','2019-04-15 13:57:44',NULL,0,NULL),(49,'f8cc29ee-98d9-460d-910f-ff00e6633a75','Koteles','Patrick','koteles.patrick@gmail.com','gravatar',NULL,'$2y$10$fv12ovwHDtSMbUdQO6u5GODSiEMCV2Sse4H4tNWTjX.b4.N0AAJBC',NULL,1,'fad56e0c899a1c94cc0eebefbab45bf1',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(50,'e5c93477-65d3-4a24-83cf-b7f798e4a0c0','Kovacs','Patric','kovacs.patrick@gmail.com','gravatar',NULL,'$2y$10$iRp07ZjIloqk6F8pP0ovLutkA72KXv1XHuhbqxL/L15n6QYLafNw6',NULL,1,'4e4c86bcc31c30e95d4c0d19ab0a3ea5',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(51,'ddd3fda9-da05-44be-9961-1611838923a4','Mircea','Sebastian','mircea.sebastian@gmail.com','gravatar',NULL,'$2y$10$LWFRVcnP0J3x4kxgF6FX7uX6EPBHNRHkXTRqjDCAR.i.QUbz0i/XC',NULL,1,'e43ae775ff9549e2728c6a71e9fc5ec1',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(52,'8d3fc90d-8031-4ccb-becf-d7c242a371f6','Moraru','Ovidiu','moraru.ovidiu@gmail.com','gravatar',NULL,'$2y$10$wdj6Ec0GHLFiVWjL9.9l2OqLPigNAr.SrnxpoEHpg2floDEukOv2O',NULL,1,'aa9f9cba603480d39be551f52eba349c',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(53,'a9c24551-fb71-46c0-96ba-29ad90ab27a3','Nasui','Elisa','nasui.elisa@gmail.com','gravatar',NULL,'$2y$10$QV9GHfMMCScGBxIfAehMKe9IYPjChZS2ZNLSavXuqhNtBw/KMKpL.',NULL,1,'ee36a1cf2ebff36e59ad2ddd1035e890',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(54,'06d16f70-3089-4abc-904a-d9999b0cb66d','Ruja','Roxana','ruja.roxana@gmail.com','gravatar',NULL,'$2y$10$NUTEFn8ejMqoQnvwveHTQuh.HoOVxFK9fOOmyFyDrUz6nLDkbYGxq',NULL,1,'1a5184136062f3ee8374abc9a924ab22',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(55,'88506e0c-753f-45c3-8a2e-a9d04aa8affb','Sida','Ioana','sida.ioana@gmail.com','gravatar',NULL,'$2y$10$zY/X5ICk.Hsu.PTPKh8qruRiNN71LxTlMCvJDTmqLm5tFdqrGwZmS',NULL,1,'d5a96963b527643ec0fbd7d6368d2966',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(56,'536be9fd-3e9c-4236-b880-993c34f455c0','Stanescu','Ana Maria','stanescu.ana.maria@gmail.com','gravatar',NULL,'$2y$10$QVq0xGpL3qaKRM3rKak6nOIeEOa37V6VGWkoSuQLb9.HErEBVb96O',NULL,1,'709e0256e7e22c608d59096a8bd3d8cb',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(57,'03c8d253-4da0-4887-bed0-737bb7473fb0','Streanga','Eduard','streanga.eduard@gmail.com','gravatar',NULL,'$2y$10$.5/dqO6VrnSk9Kl04eDTPOnx/wF.3ndPhvKmcP7eSDdDgULd7l6qu',NULL,1,'e77fcece91a47ba4128cb3480b1d54c8',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(58,'626bf441-8ef1-42a7-8816-d9b899781249','Toderici','Mihai','toderici.mihai@gmail.com','gravatar',NULL,'$2y$10$DsqL29S4RsPZqPSo/xCYYumCwCgP7NO77fqgGA5m7duc0gPSkBx2K',NULL,1,'50460a70dbe9f12c4ebe618f2d8cf63a',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(59,'6289ba33-848f-4824-a5df-a763863ccc2f','Vanya','Iulia','vanya.iulia@gmail.com','gravatar',NULL,'$2y$10$ZG38GQXjYMzm2/KiDz5WkuYZyavaxidBqsJUBq5EDmsDdf.aDRvIu',NULL,1,'efabda210404d4d8f095f6d9b1a06810',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(60,'1b374dcc-9a43-479c-bf49-ed9ff16d61fb','Aron','Raluca','aron.raluca@gmail.com','gravatar',NULL,'$2y$10$m9SMmmuUYLprehHEPyw/vOj7iQ0YesoUXULbTHRNmAADpK1fKsBVO',NULL,1,'5d5ebd5c010c66a16a1af0deb3c0fa22',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(61,'2f325bcb-65e8-4355-90c3-1f01ca84f206','Bloboli','Dominik','blaboli.dominik@gmail.com','gravatar',NULL,'$2y$10$1QEuBxKVsbJO9woFIban3uypZj6XpGl/X8E8cBIkOvRM0AsXHDklG',NULL,1,'8d90d5e78cb4ec4a85b96cf02d7f352d',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(62,'31c90fa9-8131-4819-94d6-3bb264687787','Bornea','Andra','bornea.andra@gmail.com','gravatar',NULL,'$2y$10$/Os56liIZD1MNQN/PBZakOytoXVhFuu6/5a7XvROFbNSqwwvf7Qu2',NULL,1,'7b105203fd425fd7d014cd871d0f5597',1,'UTC',NULL,'2019-04-15 13:57:45','2019-04-15 13:57:45',NULL,0,NULL),(63,'f0c5cc13-e1d8-409c-8151-292e1e865f97','Brita','Catalin','brita.catalin@gmail.com','gravatar',NULL,'$2y$10$B9NhD99tf33BMUUuzjxw6uYTieikXae7dgKJIFhMovEmIdxuMMWwW',NULL,1,'f9ae2799da32b129e46b07da32c699ae',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 14:11:57',NULL,0,'2019-04-15 20:11:57'),(64,'76500560-6264-404e-a6c9-803d39d1991b','Chesa','Razvan','chesa.razvan@gmail.com','gravatar',NULL,'$2y$10$ooVp6q0yPXWcc8ZNnwE/UeAUZD8IH4xeumbbMGPEPn7E.0TNhQB7q',NULL,1,'bd68dcdb546278a5debe5c2528ca6ee4',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(65,'feedf48c-d599-4313-a374-997377f4aeaf','Csaky','Carina','csaky.carina@gmail.com','gravatar',NULL,'$2y$10$YTrnAYVL3jIVe3wQDvOfQuNDlX58n3UIQHwvqvoIre8fePEdagz4m',NULL,1,'0e1738f021e0839830888f8ad2dbe59a',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(66,'9126e05d-4a72-4373-8c20-8df5751a26b7','De Marco','Alexia','marco.alexia@gmail.com','gravatar',NULL,'$2y$10$0SGrNiM6mxc/D5aqsL.cMOUtIyjBS8vxP4MLMht7xcLAGTFmIGL3W',NULL,1,'76ad04b7ae5ff8f422477f4737c6d32a',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(67,'a449c0d8-1df7-43d7-8393-bdaf6ac7aa20','Deffert','Cristina','deffert.cristina@gmail.com','gravatar',NULL,'$2y$10$3RJz2lEdmxglx2TO1sEkTu4ir9lADeS6lNlgYqwnYTmwWJTxhTPEu',NULL,1,'bec91925c3ec30eef310169ab6a3d7d2',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(68,'6cca318e-c197-4fff-9ccb-2057939da467','Gancea','Ioana','gancea.ioana@gmail.com','gravatar',NULL,'$2y$10$0z9/SOHBWnsn.febZk/BV.IlVCq.LlVXjoK8GjpIVbTgLM2ie3FsO',NULL,1,'9fef587e67e71cb8f63207efdbf7f3f1',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(69,'58ae0426-af8d-4c16-8235-11d37cf3d413','Gyarmathy','Andrei','gyarmathy.andrei@gmail.com','gravatar',NULL,'$2y$10$6JUtsh3xDSX1XmoeJUVlJeqzTCLYeEljcV.YHpin5QIOESyspt/8q',NULL,1,'924518a6ff8bc5806101674f68fa135a',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(70,'70f6fe98-9356-4815-9b04-c91d10db91dd','Havran','Victor','havran.victor@gmail.com','gravatar',NULL,'$2y$10$0WeXNp8cvrbjuLnrSXsW0u0hnvwRtPtJnAjhVZxTuEXva6VR85qbW',NULL,1,'fd56317b75690ab974e153354ea51cb0',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(71,'f454acf0-d162-4b14-90a3-89e62b2ad109','Lucaci','David','lucaci.david@gmail.com','gravatar',NULL,'$2y$10$gfLjtPi1Qf4yWxorRq0VSusSfPKXhvcerDHtl4WliGfAM/nEuwjHS',NULL,1,'4c4162a568270f6880314eab77b3a451',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(72,'d75501d9-a964-4139-bd8f-f1b3aae915ec','Lupas','Victor','lupas.victor@gmail.com','gravatar',NULL,'$2y$10$oj64stfGrhi6AdfGgXHQJ.LybmJSrWABF/I0uCcVrLbPdWdevC54y',NULL,1,'124603b31a444a2912b17ca02e739631',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(73,'d687b067-1225-4b08-8da9-01e4c8c89189','Marin','Maria','marin.maria@gmail.com','gravatar',NULL,'$2y$10$vLf4t1qBHdTLVPOrKtzSKeiZJ8up9nI2DqCj6R9C3I31exyoxrAyO',NULL,1,'b5a1a31463fcbb3f6634f7749bfe42d4',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(74,'7758a5d6-dbdb-4b06-be98-7a68595388b9','Mihai','Alexia','mihai.alexia@gmail.com','gravatar',NULL,'$2y$10$UXFwv2O0nKpCTl.4OLkzJ.8fsL9bF5hDEPJU2MMe34/dNmhoWxKli',NULL,1,'36a608f9891340fa7141abe70156c7b1',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(75,'2cb92ff6-d643-4244-9184-73940dbbdb38','Neamt','Diana','neamt.diana@gmail.com','gravatar',NULL,'$2y$10$gTd5nAalDGOqdmpPhaPSDOZYxi/PlPuuKe4/x7UtYQinvaxrlNTAm',NULL,1,'b6e42c36410be4f29b23cb6974cdecb9',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(76,'00f1fbb9-aca2-4dee-ae8c-50625988a385','Pirv','Ioana','pirv.ioana@gmail.com','gravatar',NULL,'$2y$10$c9lfSVPz3JEACcGVz1NkAuImTKfvg./H6A0pARtu8.61pmPUxwcgG',NULL,1,'998036bc14cb185f5bfbd0b112dc753d',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(77,'fe3bbbb4-deb2-412c-9c21-c272a1c0f2a0','Roman','Paula','roman.paula@gmail.com','gravatar',NULL,'$2y$10$0ST7gHN/i6909SwGqF0lYeAy71nGf/MSJdtQS3/2Eu5S6GUhki3e.',NULL,1,'b15394f6ca39bd7cfa568204e5a59299',1,'UTC',NULL,'2019-04-15 13:57:46','2019-04-15 13:57:46',NULL,0,NULL),(78,'0794d672-dd7f-4a32-b553-d0e3900aa53e','Tanasescu','Emma','tanasescu.emma@gmail.com','gravatar',NULL,'$2y$10$AhQs5/C..5qsZV1ZltEyA.W482hbuneh4pjdJJAgqUYjUtZwDuVMC',NULL,1,'4714f1547891f05d57920a2beabe2d24',1,'UTC',NULL,'2019-04-15 13:57:47','2019-04-15 13:57:47',NULL,0,NULL),(79,'d72e5d63-1cab-4b52-a84a-a862592f8f9f','Toader','Sebastian','toader.sebastian@gmail.com','gravatar',NULL,'$2y$10$F2mxKfpteKu1YGrn1GQeZew3JpMCuuIgwL2Tg216aEx9u9eI4G4LS',NULL,1,'6e0db5f0e9b1a4ccc5eb75b6b920dab4',1,'UTC',NULL,'2019-04-15 13:57:47','2019-04-15 13:57:47',NULL,0,NULL),(80,'3f887d15-c13b-4e30-b85e-392464429f69','Ungur','Radu','ungur.radu@gmail.com','gravatar',NULL,'$2y$10$IUd6/o6HSG87XxHSygkm1.lLEvBOw65UlmRxcr7qTe1FPvDTBH9IW',NULL,1,'3807b6f4d5294b90da3b21ccce6c0647',1,'UTC',NULL,'2019-04-15 13:57:47','2019-04-15 13:57:47',NULL,0,NULL),(81,'ba4bd502-a619-432f-b70c-bffc34d3918e','Vonica','Iulia','vonica.iulia@gmail.com','gravatar',NULL,'$2y$10$sWQckt/Ir6rYdkCj0u.5yuAgpFz39tO6jCeHgqP85A2FcJSx7DyQ.',NULL,1,'1e74f51cc43298dec52b2814bd789f78',1,'UTC',NULL,'2019-04-15 13:57:47','2019-04-15 13:57:47',NULL,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `views_user_id_foreign` (`user_id`),
  KEY `views_question_id_foreign` (`question_id`),
  CONSTRAINT `views_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-16 10:13:36
