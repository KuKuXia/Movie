-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

drop table IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
insert into `admin` values (1,'imoocmovie','pbkdf2:sha256:50000$Lxv6JZ3o$bd85235be0ca5d89e386a84b5c09bddfd77d32e64ded8e618298fcea6aa0184c',0,1,'2017-09-27 08:21:22'),(2,'imoocmovie1','pbkdf2:sha256:50000$Qv7oHY7r$731573923e91957301b19e5af9ffb4e9aedeffa88c8cefe51f99b3f748aa1dbe',0,1,'2017-09-27 16:27:45'),(3,'imoocmovie2','pbkdf2:sha256:50000$GAZMCwaL$72354149e89112350323ed58f016c9fe47d545dad11906998dad13cedf3c488a',null,2,'2017-10-04 22:26:58'),(4,'lxl','pbkdf2:sha256:150000$s2Dgs0fB$dddfcea09cd6f26396f2f6b86c5faa2cf7dbbfb1e92c72ac4bb2fdd1b9e46177',1,2,'2019-04-26 22:34:48');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlog`
--

drop table IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
insert into `adminlog` values (108,1,'127.0.0.1','2017-10-07 18:10:26'),(109,1,'127.0.0.1','2017-10-08 17:21:51'),(110,1,'127.0.0.1','2017-10-08 17:34:52'),(111,1,'127.0.0.1','2017-10-08 17:36:21'),(112,1,'127.0.0.1','2017-10-08 17:38:46'),(113,4,'127.0.0.1','2019-04-26 22:36:13'),(114,4,'127.0.0.1','2019-04-26 22:38:18'),(115,1,'127.0.0.1','2019-04-26 22:38:18'),(116,1,'127.0.0.1','2019-04-26 22:41:32'),(117,1,'127.0.0.1','2019-04-27 11:08:50'),(118,1,'127.0.0.1','2019-04-27 17:38:09');
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

drop table IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
insert into `auth` values (1,'添加标签','/admin/tag/add/','2017-10-04 11:41:55'),(2,'添加电影','/admin/movie/add/','2017-10-04 11:45:09'),(3,'标签列表','/admin/tag/list/<int:page>/','2017-10-04 15:44:10'),(4,'电影列表','/admin/movie/list/<int:page>/','2017-10-04 15:44:35'),(5,'编辑标签','/admin/tag/edit/<int:id>/','2017-10-04 15:45:36'),(6,'删除标签','/admin/tag/del/<int:id>/','2017-10-04 15:46:17');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

drop table IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
insert into `comment` values (13,'好看',7,1,'2017-10-02 22:55:05'),(14,'不错',7,2,'2017-10-02 22:55:05'),(15,'经典',7,3,'2017-10-02 22:55:05'),(17,'难看',7,5,'2017-10-02 22:55:05'),(18,'无聊',7,6,'2017-10-02 22:55:05'),(19,'乏味',9,7,'2017-10-02 22:55:05'),(20,'无感',10,8,'2017-10-02 22:55:05'),(22,'不错',7,6,'2017-10-02 22:55:24'),(25,'难看',9,5,'2017-10-02 22:55:24'),(26,'无聊',9,6,'2017-10-02 22:55:24'),(27,'乏味',9,7,'2017-10-02 22:55:24'),(34,'好看',10,1,'2017-10-02 23:10:36'),(51,'<p>你好<br/></p>',7,17,'2019-04-28 20:56:13'),(52,'<p>&nbsp;发士大夫<br/></p>',7,17,'2019-04-28 20:56:13'),(53,'<p>真的不错<br/></p>',7,17,'2019-04-28 21:13:55'),(54,'<p><img src=\"http://img.baidu.com/hi/jx2/j_0026.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0037.gif\"/></p>',7,17,'2019-04-28 21:13:55'),(59,'<p>sdf <br/></p>',10,17,'2019-04-28 22:18:06'),(60,'<p>超级帅<br/></p>',11,17,'2019-04-28 22:47:32'),(61,'<p>sadf <br/></p>',9,19,'2019-04-30 09:26:22');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

drop table IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
insert into `movie` values (7,'环太平洋1','20190427193618b5341ab63bcb4f3ba3d7cbb14b7d497f.mp4','ddddddddddddddddddddddd','20190427193618c1cba75e35244197bec81e7fbe9bcb4a.jpg',2,116,13,53,'三体文明','2017-10-26','34','2017-10-01 18:13:31'),(9,'天空之城1','20190427193550979a9595d85544729616598e60b670e3.mp4','天空之城11111111','2019042719355008c41b7ebd634e55838d3440b92bb70f.jpg',3,49,4,73,'日本','2017-10-12','12','2017-10-03 21:28:58'),(10,'空战1','20190427193515d0d672367f3149ddbcb61ddcaaf7ae3e.mp4','空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战空战','20190427193536520ced84b4b9409bb2022ecde6601be9.png',5,39,9,53,'中国','2017-10-19','21','2017-10-06 16:56:56'),(11,'惊奇队长','20190429100942c1e6926e7ef241d2a7dc01ffe298e00a.mov','Set in the 1990s, Marvel Studios Captain Marvel is an all-new adventure from a previously unseen period in the history of the Marvel Cinematic Universe that follows the journey of Carol Danvers as she becomes one of the universes most powerful heroes. While a galactic war between two alien races reaches Earth, Danvers finds herself and a small cadre of allies at the center of the maelstrom. The film stars Brie Larson, Samuel L. Jackson, Ben Mendelsohn, Djimon Hounsou, Lee Pace, Lashana Lynch, Gemma Chan, Rune Temte, Algenis Perez Soto, Mckenna Grace, with Annette Bening, with Clark Gregg, and Jude Law.\r\nRead more at http://www.hd-trailers.net/movie/captain-marvel/#eyhvt6FmwmAEPxtC.99','201904291006473e8ee8b3423c46fbad63a37a7bd588f4.jpg',5,60,1,53,'美国','2019-02-04','30','2019-04-27 21:31:40');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviecol`
--

drop table IF EXISTS `moviecol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviecol`
--

LOCK TABLES `moviecol` WRITE;
/*!40000 ALTER TABLE `moviecol` DISABLE KEYS */;
insert into `moviecol` values (5,7,5,'2017-10-03 09:33:09'),(6,9,6,'2017-10-03 09:33:09'),(8,9,8,'2017-10-03 09:33:09'),(13,7,5,'2017-10-03 10:10:48'),(14,9,6,'2017-10-03 10:10:48'),(15,7,7,'2017-10-03 10:10:48'),(16,9,8,'2017-10-03 10:10:48'),(17,7,1,'2017-10-03 10:11:01'),(18,7,2,'2017-10-03 10:11:01'),(19,7,3,'2017-10-03 10:11:01'),(20,7,4,'2017-10-03 10:11:02'),(21,9,5,'2017-10-03 10:11:02'),(22,10,6,'2017-10-03 10:11:02'),(23,10,7,'2017-10-03 10:11:02'),(24,10,8,'2017-10-03 10:11:02'),(25,7,1,'2017-10-03 10:11:02'),(26,7,2,'2017-10-03 10:11:02'),(27,7,3,'2017-10-03 10:11:02'),(28,7,4,'2017-10-03 10:11:02'),(29,10,5,'2017-10-03 10:11:02'),(32,10,8,'2017-10-03 10:11:02'),(33,7,1,'2017-10-03 13:39:05'),(34,7,2,'2017-10-03 13:39:06'),(35,7,3,'2017-10-03 13:39:06'),(36,7,4,'2017-10-03 13:39:06'),(37,10,5,'2017-10-03 13:39:06'),(38,10,6,'2017-10-03 13:39:06'),(39,10,7,'2017-10-03 13:39:06'),(40,10,8,'2017-10-03 13:39:06'),(41,7,1,'2017-10-03 13:39:06'),(42,7,2,'2017-10-03 13:39:06'),(43,7,3,'2017-10-03 13:39:06'),(44,7,4,'2017-10-03 13:39:06'),(45,7,5,'2017-10-03 13:39:06'),(46,7,6,'2017-10-03 13:39:06'),(47,7,7,'2017-10-03 13:39:06'),(48,9,8,'2017-10-03 13:39:07'),(49,7,1,'2017-10-03 13:39:07'),(50,7,2,'2017-10-03 13:39:07'),(51,7,3,'2017-10-03 13:39:07'),(52,7,4,'2017-10-03 13:39:07'),(53,9,5,'2017-10-03 13:39:07'),(54,9,6,'2017-10-03 13:39:07'),(322,11,17,'2019-04-29 09:21:27');
/*!40000 ALTER TABLE `moviecol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oplog`
--

drop table IF EXISTS `oplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oplog`
--

LOCK TABLES `oplog` WRITE;
/*!40000 ALTER TABLE `oplog` DISABLE KEYS */;
insert into `oplog` values (1,1,'127.0.0.1','添加一个标签：异界','2017-10-03 19:45:50'),(2,1,'127.0.0.1','添加一个标签：治愈','2017-10-03 19:58:58'),(3,1,'127.0.0.1','修改标签“异界”为“神界”','2017-10-03 21:18:57'),(4,1,'127.0.0.1','修改了密码','2017-10-03 21:19:58'),(5,1,'127.0.0.1','删除标签：神界','2017-10-03 21:23:51'),(6,1,'127.0.0.1','添加一部电影：天空之城1','2017-10-03 21:28:58'),(7,1,'127.0.0.1','修改电影：天空之城1（原 天空之城）','2017-10-03 21:35:53'),(8,1,'127.0.0.1','修改电影：天空之城（原名：天空之城）','2017-10-03 21:36:37'),(9,1,'127.0.0.1','删除电影：环太平洋1','2017-10-03 21:38:10'),(10,1,'127.0.0.1','删除用户 鼠 在 环太平洋 的评论：好看','2017-10-03 22:06:26'),(11,1,'127.0.0.1','删除用户「虎」在「环太平洋」的评论：经典','2017-10-03 22:09:35'),(12,1,'127.0.0.1','删除用户「兔(4)」在「环太平洋」的评论：给力','2017-10-03 22:11:13'),(13,1,'127.0.0.1','删除会员「虎(3)」对电影《环太平洋》的收藏','2017-10-03 22:18:25'),(14,1,'127.0.0.1','删除会员「兔(4)」在《环太平洋》的评论：给力','2017-10-03 22:18:45'),(15,1,'127.0.0.1','修改电影预告：赛车预告（原名：赛车预告）','2017-10-03 22:20:47'),(16,1,'127.0.0.1','删除会员「虎(3)」对电影《环太平洋》的收藏','2017-10-03 22:21:40'),(17,1,'127.0.0.1','添加新权限：添加标签','2017-10-04 11:41:55'),(18,1,'127.0.0.1','添加新权限：添加电影','2017-10-04 11:45:09'),(19,1,'127.0.0.1','修改权限：添加电影1（原名：添加电影）','2017-10-04 12:23:34'),(20,1,'127.0.0.1','修改权限：添加电影（原名：添加电影1）','2017-10-04 12:24:22'),(21,1,'127.0.0.1','修改权限：添加电影1（原名：添加电影）','2017-10-04 12:27:47'),(22,1,'127.0.0.1','修改权限：添加电影（原名：添加电影1）','2017-10-04 12:28:01'),(23,1,'127.0.0.1','添加新权限：标签列表','2017-10-04 15:44:10'),(24,1,'127.0.0.1','添加新权限：电影列表','2017-10-04 15:44:35'),(25,1,'127.0.0.1','添加新权限：编辑标签','2017-10-04 15:45:36'),(26,1,'127.0.0.1','添加新权限：删除标签','2017-10-04 15:46:17'),(27,1,'127.0.0.1','删除标签：二次元','2017-10-04 15:59:12'),(28,1,'127.0.0.1','添加新标签：自然','2017-10-04 16:01:39'),(29,1,'127.0.0.1','添加新标签：小清新','2017-10-04 16:04:50'),(30,1,'127.0.0.1','添加新角色：test角色','2017-10-04 16:39:48'),(31,1,'127.0.0.1','修改权限：编辑标签1（原名：编辑标签）','2017-10-04 17:16:10'),(32,1,'127.0.0.1','修改权限：编辑标签（原名：编辑标签1）','2017-10-04 17:16:47'),(33,1,'127.0.0.1','修改电影：天空之城（原名：天空之城）','2017-10-04 17:44:35'),(34,1,'127.0.0.1','添加新角色：test角色1','2017-10-04 18:21:44'),(35,1,'127.0.0.1','修改角色：test角色1（原名：test角色1）','2017-10-04 18:21:55'),(36,1,'127.0.0.1','修改角色：test角色1（原名：test角色1）','2017-10-04 18:23:24'),(37,1,'127.0.0.1','修改角色：test角色2（原名：test角色1）','2017-10-04 18:39:08'),(38,1,'127.0.0.1','添加新角色：test角色1','2017-10-04 18:39:18'),(39,1,'127.0.0.1','删除角色：test角色1','2017-10-04 18:43:43'),(40,1,'127.0.0.1','删除角色：test角色2','2017-10-04 18:43:45'),(41,1,'127.0.0.1','修改角色：test角色（原名：test角色）','2017-10-04 18:44:54'),(42,1,'127.0.0.1','修改角色：超级管理员（原名：超级管理员）','2017-10-04 18:58:59'),(43,1,'127.0.0.1','添加新权限：qqq','2017-10-04 18:59:24'),(44,1,'127.0.0.1','修改角色：超级管理员（原名：超级管理员）','2017-10-04 19:00:12'),(45,1,'127.0.0.1','删除权限：qqq','2017-10-04 19:03:10'),(46,1,'127.0.0.1','修改角色：超级管理员（原名：超级管理员）','2017-10-04 19:03:43'),(47,1,'127.0.0.1','修改角色：test角色（原名：test角色）','2017-10-04 19:06:32'),(48,1,'127.0.0.1','添加新管理员：imoocmovie2','2017-10-04 22:26:58'),(49,2,'127.0.0.1','删除标签：历史','2017-10-04 22:54:17'),(50,2,'127.0.0.1','删除标签：恐怖','2017-10-04 22:54:21'),(51,1,'127.0.0.1','添加新电影预告：标题有了','2017-10-06 12:36:32'),(52,1,'127.0.0.1','添加新电影预告：标题有了1','2017-10-06 12:36:42'),(53,1,'127.0.0.1','添加新电影预告：标题有了2','2017-10-06 12:36:50'),(54,1,'127.0.0.1','添加新电影预告：标题有了3','2017-10-06 12:36:58'),(55,1,'127.0.0.1','添加新电影预告：标题有了4','2017-10-06 12:37:04'),(56,1,'127.0.0.1','删除电影预告：环太平洋','2017-10-06 16:16:29'),(57,1,'127.0.0.1','删除电影预告：赛车预告','2017-10-06 16:16:31'),(58,1,'127.0.0.1','修改电影预告：标题有了5（原名：标题有了）','2017-10-06 16:16:47'),(59,1,'127.0.0.1','添加新电影：空战','2017-10-06 16:56:56'),(60,1,'127.0.0.1','修改电影：空战1（原名：空战1）','2017-10-07 19:38:04'),(61,1,'127.0.0.1','添加新标签：搞笑','2017-10-08 17:22:21'),(62,1,'127.0.0.1','添加新标签：新鲜','2017-10-08 17:22:58'),(63,1,'127.0.0.1','修改了密码','2017-10-08 17:35:01'),(64,1,'127.0.0.1','修改了密码','2017-10-08 17:36:41'),(65,1,'127.0.0.1','添加角色论坛经理, 权限：2,3 ','2019-04-26 21:32:49'),(66,1,'127.0.0.1','添加角色论坛坛主, 权限：4 ','2019-04-26 21:32:49'),(67,1,'127.0.0.1','添加角色123, 权限：2 ','2019-04-26 21:35:12'),(68,1,'127.0.0.1','添加权限：阿斯蒂芬','2019-04-26 21:35:12'),(69,1,'127.0.0.1','添加权限：风风光光和','2019-04-26 21:38:04'),(70,1,'127.0.0.1','添加权限：水电费','2019-04-26 21:42:50'),(71,1,'127.0.0.1','添加权限：撒旦法','2019-04-26 21:45:16'),(72,1,'127.0.0.1','添加角色阿萨德, 权限：4 ','2019-04-26 21:54:16'),(73,1,'127.0.0.1','添加权限： 发送到','2019-04-26 21:54:16'),(74,1,'127.0.0.1','添加标签和达到发的货使得','2019-04-26 21:56:59'),(75,1,'127.0.0.1','添加标签打好阿萨德','2019-04-26 21:56:59'),(76,1,'127.0.0.1','添加角色 哈哈哈, 权限：3 ','2019-04-26 21:58:49'),(77,1,'127.0.0.1','删除角色 哈哈哈','2019-04-26 21:58:49'),(78,1,'127.0.0.1','删除角色阿萨德','2019-04-26 21:58:49'),(79,1,'127.0.0.1','删除角色123','2019-04-26 21:58:49'),(80,1,'127.0.0.1','添加管理员lxl','2019-04-26 22:34:48'),(81,1,'127.0.0.1','删除权限 发送到','2019-04-26 22:43:29'),(82,1,'127.0.0.1','删除权限撒旦法','2019-04-26 22:43:29'),(83,1,'127.0.0.1','删除权限水电费','2019-04-26 22:43:29'),(84,1,'127.0.0.1','删除权限风风光光和','2019-04-26 22:43:29'),(85,1,'127.0.0.1','删除权限阿斯蒂芬','2019-04-26 22:43:29'),(86,1,'127.0.0.1','修改电影：空战1','2019-04-27 11:08:50'),(87,1,'127.0.0.1','修改电影预告: 标题有了5','2019-04-27 16:45:26'),(88,1,'127.0.0.1','修改电影预告: 标题有了4','2019-04-27 16:45:26'),(89,1,'127.0.0.1','修改电影预告: 标题有了3','2019-04-27 16:45:26'),(90,1,'127.0.0.1','修改电影预告: 标题有了2','2019-04-27 16:45:26'),(91,1,'127.0.0.1','修改电影预告: 标题有了2','2019-04-27 16:45:26'),(92,1,'127.0.0.1','修改电影预告: 标题有了1','2019-04-27 16:45:26'),(93,1,'127.0.0.1','修改电影预告: 标题有了5','2019-04-27 17:06:05'),(94,1,'127.0.0.1','修改电影预告: 标题有了5','2019-04-27 17:12:45'),(95,1,'127.0.0.1','修改电影预告: 标题有了4','2019-04-27 17:12:45'),(96,1,'127.0.0.1','修改电影预告: 标题有了3','2019-04-27 17:12:45'),(97,1,'127.0.0.1','修改电影预告: 标题有了2','2019-04-27 17:12:45'),(98,1,'127.0.0.1','修改电影预告: 标题有了1','2019-04-27 17:12:45'),(99,1,'127.0.0.1','删除电影预告：标题有了5','2019-04-27 17:38:09'),(100,1,'127.0.0.1','删除电影预告：标题有了4','2019-04-27 17:38:09'),(101,1,'127.0.0.1','删除电影预告：标题有了3','2019-04-27 17:38:09'),(102,1,'127.0.0.1','删除电影预告：标题有了2','2019-04-27 17:38:09'),(103,1,'127.0.0.1','删除电影预告：标题有了1','2019-04-27 17:38:09'),(104,1,'127.0.0.1','添加电影预告：周杰伦粉丝版MV','2019-04-27 17:38:09'),(105,1,'127.0.0.1','添加电影预告：乐侃有声节目第二期','2019-04-27 17:38:09'),(106,1,'127.0.0.1','添加电影预告：乐见大牌：”荣“耀之声，”维“我独尊','2019-04-27 17:38:09'),(107,1,'127.0.0.1','添加电影预告：王力宏四年心血结晶','2019-04-27 17:38:09'),(108,1,'127.0.0.1','添加电影预告：MV精选：《武媚》女神团美艳大比拼','2019-04-27 17:38:09'),(109,1,'127.0.0.1','删除标签和达到发的货使得','2019-04-27 18:59:05'),(110,1,'127.0.0.1','删除标签打好阿萨德','2019-04-27 18:59:05'),(111,1,'127.0.0.1','修改电影：空战1','2019-04-27 19:34:27'),(112,1,'127.0.0.1','修改电影：空战1','2019-04-27 19:34:27'),(113,1,'127.0.0.1','修改电影：空战1','2019-04-27 19:34:27'),(114,1,'127.0.0.1','修改电影：天空之城1','2019-04-27 19:34:27'),(115,1,'127.0.0.1','修改电影：环太平洋1','2019-04-27 19:34:27'),(116,1,'127.0.0.1','修改电影：空战1','2019-04-27 19:38:38'),(117,1,'127.0.0.1','添加标签动画','2019-04-27 19:38:38'),(118,1,'127.0.0.1','修改电影：天空之城1','2019-04-27 19:42:40'),(119,1,'127.0.0.1','修改电影：环太平洋1','2019-04-27 19:42:40'),(120,1,'127.0.0.1','添加电影: 惊奇队长','2019-04-27 21:31:40'),(121,1,'127.0.0.1','修改电影：惊奇队长','2019-04-27 21:31:40'),(122,1,'127.0.0.1','修改电影：惊奇队长','2019-04-27 21:31:40'),(123,1,'127.0.0.1','删除用户:小虾米 对电影：环太平洋1评论','2019-04-28 21:37:24'),(124,1,'127.0.0.1','删除用户:小虾米 对电影：环太平洋1评论','2019-04-28 21:37:24'),(125,1,'127.0.0.1','删除用户:小虾米 对电影：环太平洋1评论','2019-04-28 21:37:24'),(126,1,'127.0.0.1','删除用户:小虾米 对电影：环太平洋1评论','2019-04-28 21:37:24'),(127,1,'127.0.0.1','修改电影：惊奇队长','2019-04-28 22:53:53'),(128,1,'127.0.0.1','修改电影：惊奇队长','2019-04-29 09:21:27'),(129,1,'127.0.0.1','添加电影预告：惊奇队长','2019-04-29 09:43:33'),(130,1,'127.0.0.1','修改电影预告: 惊奇队长','2019-04-29 09:53:33'),(131,1,'127.0.0.1','修改电影：惊奇队长','2019-04-29 10:02:53'),(132,1,'127.0.0.1','修改电影：惊奇队长','2019-04-29 10:02:53'),(133,1,'127.0.0.1','修改电影：惊奇队长','2019-04-29 10:08:56'),(134,1,'127.0.0.1','修改电影：惊奇队长','2019-04-29 10:09:34');
/*!40000 ALTER TABLE `oplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preview`
--

drop table IF EXISTS `preview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preview`
--

LOCK TABLES `preview` WRITE;
/*!40000 ALTER TABLE `preview` DISABLE KEYS */;
insert into `preview` values (9,'周杰伦粉丝版MV','20190427174208bb2bbcd060b748f395f765ac5b906822.jpg','2019-04-27 17:38:09'),(10,'乐侃有声节目第二期','20190427174224eb5b5269d9ec477a983ec5dbf5d13143.jpg','2019-04-27 17:38:09'),(11,'乐见大牌：”荣“耀之声，”维“我独尊','20190427174245cde8ba2199754acd86a2ef46032be1d7.jpg','2019-04-27 17:38:09'),(12,'王力宏四年心血结晶','2019042717425638cde15ca2494c96aa24b47a52187764.jpg','2019-04-27 17:38:09'),(13,'MV精选：《武媚》女神团美艳大比拼','20190427174307993847b31700487d814624858b1111e0.jpg','2019-04-27 17:38:09'),(14,'惊奇队长','201904290954414c7c5a750da743dba7d4fa86756c6cce.jpg','2019-04-29 09:43:33');
/*!40000 ALTER TABLE `preview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

drop table IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
insert into `role` values (1,'超级管理员','3','2017-09-27 08:13:05'),(2,'test角色','2,4,6','2017-10-04 16:39:48'),(3,'论坛经理','2,3','2019-04-26 21:32:49'),(4,'论坛坛主','4','2019-04-26 21:32:49');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

drop table IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
insert into `tag` values (45,'喜剧','2017-09-30 01:27:34'),(46,'爱情','2017-09-30 01:27:37'),(48,'侦探','2017-09-30 01:27:46'),(50,'悬疑','2017-09-30 01:27:52'),(53,'科幻','2017-09-30 02:09:52'),(54,'离奇','2017-10-01 16:41:04'),(55,'测试','2017-10-02 23:17:07'),(56,'武打','2017-10-02 23:17:14'),(57,'经典','2017-10-02 23:17:22'),(58,'冷门','2017-10-02 23:17:36'),(60,'文艺','2017-10-02 23:17:59'),(61,'热门','2017-10-02 23:18:21'),(62,'网络','2017-10-02 23:18:38'),(63,'游戏','2017-10-02 23:18:42'),(64,'言情','2017-10-02 23:18:45'),(66,'治愈','2017-10-03 19:58:58'),(67,'自然','2017-10-04 16:01:39'),(68,'小清新','2017-10-04 16:04:50'),(69,'搞笑','2017-10-08 17:22:21'),(70,'新鲜','2017-10-08 17:22:58'),(73,'动画','2019-04-27 19:38:38');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

drop table IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
insert into `user` values (1,'鼠','1231','1231@123.com','13888888881','鼠','1f401.png','2017-10-02 21:52:08','d32a72bdac524478b7e4f6dfc8394fc0'),(2,'牛','1232','1232@123.com','13888888882','牛','1f402.png','2017-10-02 21:52:11','d32a72bdac524478b7e4f6dfc8394fc1'),(3,'虎','1233','1233@123.com','13888888883','虎','1f405.png','2017-10-02 21:52:15','d32a72bdac524478b7e4f6dfc8394fc2'),(4,'兔','1234','1234@123.com','13888888884','兔','1f407.png','2017-10-02 21:52:19','d32a72bdac524478b7e4f6dfc8394fc3'),(5,'龙','1235','1235@123.com','13888888885','龙','1f409.png','2017-10-02 21:52:23','d32a72bdac524478b7e4f6dfc8394fc4'),(6,'蛇','1236','1236@123.com','13888888886','蛇','1f40d.png','2017-10-02 21:52:27','d32a72bdac524478b7e4f6dfc8394fc5'),(7,'马','1237','1237@123.com','13888888887','马','1f434.png','2017-10-02 21:52:30','d32a72bdac524478b7e4f6dfc8394fc6'),(8,'羊','1238','1238@123.com','13888888888','羊','1f411.png','2017-10-02 21:52:33','d32a72bdac524478b7e4f6dfc8394fc7'),(9,'猴','1239','1239@123.com','13888888889','猴','1f412.png','2017-10-02 21:52:37','d32a72bdac524478b7e4f6dfc8394fc8'),(10,'鸡','1240','1240@123.com','13888888891','鸡','1f413.png','2017-10-02 21:52:41','d32a72bdac524478b7e4f6dfc8394fc9'),(11,'狗','1241','1241@123.com','13888888892','狗','1f415.png','2017-10-02 21:52:44','d32a72bdac524478b7e4f6dfc8394fd0'),(12,'猪','1242','1242@123.com','13888888893','猪','1f416.png','2017-10-02 21:52:48','d32a72bdac524478b7e4f6dfc8394fd1'),(17,'小虾米','pbkdf2:sha256:150000$P5lQst0J$02c20e9a2e2a0d7f9fcf8fd04b95f0cde79bb1a89abdbb8b2ac1c2960f5261b8','12354646@qq.com','15888888888','春眠不觉晓','201904271132485bb9dbbd2de649b4b2f012ce390d7c81.jpg','2019-04-27 09:50:16','7ee97605910a4e3ca6b129e4fc9806eb'),(18,'小龙虾','pbkdf2:sha256:150000$7sFc25s4$65bd648c064137f4e76f9fe1e63d0cbcb39f6156f7687f20ebe97d77ae2f70d6','4564654654@qq.com','15866666666','暗室逢灯','20190427151955b7e3272c96694b08b864a81d8a325ced','2019-04-27 15:13:51','c4b6eb19551840109ee8a4ecf109484d'),(19,'xxx','pbkdf2:sha256:150000$17riJLrH$91e3052599a816ceeb5dfd1614f09f97c7126668c3e6fff2d9180753c4fad6ea','123455@qq.com','15899999999',null,null,'2019-04-30 09:26:22','a3544314be6a459895b49a258708036f');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

drop table IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
create TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
insert into `userlog` values (1,1,'192.168.4.1','2017-10-03 20:26:06'),(2,2,'192.168.4.2','2017-10-03 20:26:06'),(3,3,'192.168.4.3','2017-10-03 20:26:06'),(4,4,'192.168.4.4','2017-10-03 20:26:06'),(5,5,'192.168.4.5','2017-10-03 20:26:06'),(6,6,'192.168.4.6','2017-10-03 20:26:06'),(7,7,'192.168.4.7','2017-10-03 20:26:06'),(8,8,'192.168.4.8','2017-10-03 20:26:06'),(9,9,'192.168.4.9','2017-10-03 20:26:06'),(10,1,'192.168.4.1','2017-10-03 20:26:10'),(11,2,'192.168.4.2','2017-10-03 20:26:10'),(12,3,'192.168.4.3','2017-10-03 20:26:10'),(13,4,'192.168.4.4','2017-10-03 20:26:10'),(14,5,'192.168.4.5','2017-10-03 20:26:10'),(15,6,'192.168.4.6','2017-10-03 20:26:10'),(16,7,'192.168.4.7','2017-10-03 20:26:10'),(17,8,'192.168.4.8','2017-10-03 20:26:10'),(18,9,'192.168.4.9','2017-10-03 20:26:10'),(19,1,'192.168.4.1','2017-10-03 20:26:11'),(20,2,'192.168.4.2','2017-10-03 20:26:11'),(21,3,'192.168.4.3','2017-10-03 20:26:11'),(22,4,'192.168.4.4','2017-10-03 20:26:11'),(23,5,'192.168.4.5','2017-10-03 20:26:11'),(24,6,'192.168.4.6','2017-10-03 20:26:11'),(25,7,'192.168.4.7','2017-10-03 20:26:11'),(26,8,'192.168.4.8','2017-10-03 20:26:11'),(27,9,'192.168.4.9','2017-10-03 20:26:11'),(28,1,'192.168.4.1','2017-10-03 20:26:12'),(29,2,'192.168.4.2','2017-10-03 20:26:12'),(30,3,'192.168.4.3','2017-10-03 20:26:12'),(31,4,'192.168.4.4','2017-10-03 20:26:12'),(32,5,'192.168.4.5','2017-10-03 20:26:12'),(33,6,'192.168.4.6','2017-10-03 20:26:12'),(34,7,'192.168.4.7','2017-10-03 20:26:12'),(35,8,'192.168.4.8','2017-10-03 20:26:12'),(36,9,'192.168.4.9','2017-10-03 20:26:12'),(37,13,'127.0.0.1','2017-10-05 20:51:50'),(38,10,'127.0.0.1','2017-10-05 21:30:23'),(39,10,'127.0.0.1','2017-10-05 23:18:58'),(40,10,'127.0.0.1','2017-10-06 11:07:57'),(41,10,'127.0.0.1','2017-10-06 11:10:29'),(42,10,'127.0.0.1','2017-10-06 11:41:33'),(43,10,'127.0.0.1','2017-10-06 11:41:35'),(44,10,'127.0.0.1','2017-10-06 11:41:36'),(45,10,'127.0.0.1','2017-10-06 11:41:38'),(46,10,'127.0.0.1','2017-10-06 11:41:40'),(47,10,'127.0.0.1','2017-10-06 11:41:41'),(48,10,'127.0.0.1','2017-10-06 11:41:43'),(49,10,'127.0.0.1','2017-10-06 11:41:58'),(50,10,'127.0.0.1','2017-10-06 11:42:01'),(51,10,'127.0.0.1','2017-10-06 21:52:44'),(52,16,'127.0.0.1','2017-10-07 11:17:16'),(53,10,'127.0.0.1','2017-10-07 11:33:39'),(54,10,'127.0.0.1','2017-10-07 13:27:17'),(66,17,'127.0.0.1','2019-04-27 10:35:31'),(67,17,'127.0.0.1','2019-04-27 10:45:08'),(68,17,'127.0.0.1','2019-04-27 10:59:04'),(69,18,'127.0.0.1','2019-04-27 15:13:51'),(70,17,'127.0.0.1','2019-04-27 15:47:35'),(71,17,'127.0.0.1','2019-04-27 15:50:47'),(72,17,'127.0.0.1','2019-04-27 15:50:47'),(73,17,'127.0.0.1','2019-04-27 15:50:47'),(74,17,'127.0.0.1','2019-04-27 15:50:47'),(75,17,'127.0.0.1','2019-04-27 16:05:42'),(76,17,'127.0.0.1','2019-04-27 16:18:50'),(77,17,'127.0.0.1','2019-04-27 19:30:28'),(78,17,'127.0.0.1','2019-04-28 11:47:10'),(79,17,'127.0.0.1','2019-04-28 20:39:44'),(80,17,'127.0.0.1','2019-04-28 21:34:33'),(81,17,'127.0.0.1','2019-04-29 10:28:46'),(82,17,'127.0.0.1','2019-04-29 10:28:46'),(83,17,'127.0.0.1','2019-04-29 10:32:53'),(84,19,'127.0.0.1','2019-04-30 09:26:22'),(85,19,'127.0.0.1','2019-04-30 09:44:08');
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-30 20:08:58
