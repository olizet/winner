-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: winner
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis` (
  `id` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `fixture` varchar(255) DEFAULT NULL,
  `odds` double DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `result` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsg68a40jm26mgvvlh6jb78j0m` (`owner_id`),
  CONSTRAINT `FKsg68a40jm26mgvvlh6jb78j0m` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis`
--

LOCK TABLES `analysis` WRITE;
/*!40000 ALTER TABLE `analysis` DISABLE KEYS */;
INSERT INTO `analysis` VALUES (2,'2018-06-26 16:45:09','2018-06-27 00:00:00','Switzerland has much more quality players. They have to win to get to the next phase. Easy bet!','Switzerland-Costarica',1.72,NULL,'Switzerland','Switzerlan Win!',1),(3,'2018-06-26 16:53:04','2018-06-28 00:00:00','Colombia has to win. They played amazing football against Poland. They will destroy them. If you want to risk a bit, you can try handicap. Don\'t hesitate, easy win!','Senegal-Colombia',1.9,5,'Colombia','Must Bet! Senegal vs Colombia',1),(4,'2018-06-26 16:55:34','2018-06-28 00:00:00','Poland can\'t advance to the knockout stage. They\'ll play with no stress. Japan has to win, but I they haven\'t got enough quality to defeat Poland. As I sad, It\'s risky, but a good one. Good luck!','Poland-Japan',2.9,0.5,'Poland','Risky one! Poland vs Japan',1),(6,'2018-06-26 16:59:20','2018-06-27 00:00:00','North Korea plays very poor football during this world cup. Germany has to win to advance to the knockout stage. No doubts, they have enough quality to get a big win against South Korea. I recommend to play with handicap -1. Good luck!','Germany-South Korea',1.52,4.5,'Germany -1','Easy bet! Germany must win! handicap -1',5),(7,'2018-06-26 17:04:54','2018-06-30 00:00:00','You can call me a fool, but I\'m 100% sure that it will end like this. Believe me 0:0.','Portugal-Uruguay',6.5,4.5,'0:0','0:0 Portugal Uruguay, how about that?',5),(11,'2018-06-26 17:18:00','2018-06-28 00:00:00','Very easy Japan>Poland','Poland-Japan',2.1,0,'Japan','Japan Win!',10),(12,'2018-06-26 17:20:40','2018-06-27 00:00:00','I know that Swiss need this win, but this is las match for Costarica and I\'m sure they will do their best. I think it may be a draw','Switzerland-Costarica',3,4.5,'Draw','Draw!',10),(18,'2018-06-26 17:29:20','2018-06-28 00:00:00','It\'ll be boring match. Japan and Poland play very boring football. I won\'t even watch that','Poland-Japan',6.7,4.83,'0:0','Boring 0:0 ',17),(19,'2018-06-26 17:33:13','2018-06-27 00:00:00','South Korea is very ambitious. I know they can\'t get to next phase, but they\'ll do their best. Germany is in not a good shape','Germany-South Korea',5.6,2.33,'Draw','South Korea will fight, Risky bet!',17);
/*!40000 ALTER TABLE `analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `rating` double DEFAULT NULL,
  `text` text NOT NULL,
  `analysis_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrskkj9fyxx3n8bxd7cuh8c2hi` (`analysis_id`),
  KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`),
  CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrskkj9fyxx3n8bxd7cuh8c2hi` FOREIGN KEY (`analysis_id`) REFERENCES `analysis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (8,5,'That\'s a good one. Agreed 100%',3,5),(9,1,'I don\'t recommend that. No bet match. Can happen everything',4,5),(13,4,'Ok, prediction, but it\'s too risky for me. Good luck!',7,10),(14,0,'completely don\'t agree. 0 for you!',4,10),(15,4.5,'This is a good one!',6,10),(16,4.5,'I agree, I\'ll play that',7,1),(20,4.5,'Good one!',12,17),(21,5,'Agree with this analysis.',7,17),(22,0,'sory mate Poland>Japan',11,17),(23,0,'Completely don\'t agree. Germany will win that',19,1),(24,4.5,'That\'s a good one',18,1),(25,4,'Interesting. I\'ll analyse it further. Thanks for that!',19,5),(26,5,'Cool analysis!',18,5),(27,4.5,'Agreed!',12,5),(28,3,'not bad',19,10),(29,5,'That can happen',18,10);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (30),(30),(30);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'User1@user1.pl','Name1','LastName1','$2a$12$SCDFh6nev46fqVjuH2VAbOw8Vb29ZhyQWTRpRD0w6VmLXfAy95xhW'),(5,'User2@user2.pl','Name2','LastName2','$2a$12$bOx7otzokgfAqss8WQq6kO7wQVwtbRs46DIxG6HTaRupCUmuQpTUa'),(10,'User3@user3.pl','Name3','LastName3','$2a$12$3Ac34.SmluN1yBaNLktgtex1BcbYbAJRwzjpu.uRs04KhxjDJQGLm'),(17,'User4@user4.pl','User4','LastName4','$2a$12$tQxXi4o/CxsiGvIkIQpZAe/xec/O5LGDQnEcoDGnv/PRBM5ogwFFS');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-26 17:49:49
