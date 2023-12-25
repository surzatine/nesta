-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nesta_messenger
-- ------------------------------------------------------
-- Server version	10.5.21-MariaDB-0+deb11u1

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
-- Current Database: `nesta_messenger`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `nesta_sm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `nesta_sm`;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `newsfeed_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_profile` varchar(255) DEFAULT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `newsfeed_id` (`newsfeed_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`newsfeed_id`) REFERENCES `newsfeed` (`nid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dislikes` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `newsfeed_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `disliked_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `newsfeed_id` (`newsfeed_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `dislikes_ibfk_1` FOREIGN KEY (`newsfeed_id`) REFERENCES `newsfeed` (`nid`),
  CONSTRAINT `dislikes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (12,3,3,'admin',1),(13,4,2,'sushan',1);
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_lists`
--

DROP TABLE IF EXISTS `friend_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_lists` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `friend_id_1` int(11) DEFAULT NULL,
  `friend_id_2` int(11) DEFAULT NULL,
  `friend_approve_1` varchar(10) DEFAULT NULL,
  `friend_approve_2` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `friend_id_1` (`friend_id_1`),
  KEY `friend_id_2` (`friend_id_2`),
  CONSTRAINT `friend_lists_ibfk_1` FOREIGN KEY (`friend_id_1`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_lists_ibfk_2` FOREIGN KEY (`friend_id_2`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_lists`
--

LOCK TABLES `friend_lists` WRITE;
/*!40000 ALTER TABLE `friend_lists` DISABLE KEYS */;
INSERT INTO `friend_lists` VALUES (19,5,2,'1','1'),(31,3,5,'1','0'),(32,3,2,'1','1'),(33,3,11,'1','0'),(39,2,11,'1','0'),(41,2,12,'1','0'),(42,2,10,'1','0'),(43,11,12,'1','0'),(44,3,12,'1','0'),(45,3,10,'1','0'),(46,7,12,'1','0'),(47,7,11,'1','0'),(48,7,2,'1','0'),(49,15,16,'1','1');
/*!40000 ALTER TABLE `friend_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `newsfeed_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `liked_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `newsfeed_id` (`newsfeed_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`newsfeed_id`) REFERENCES `newsfeed` (`nid`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (16,3,2,'sushan',1),(25,2,3,'admin',1),(26,4,3,'admin',1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `message_unread` varchar(5) DEFAULT NULL,
  `message_counter` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'2023-07-19','10:29:43 pm',3,2,'admin','lol',NULL,'0','0'),(2,'2023-07-19','10:30:33 pm',3,2,'admin','dude',NULL,'0','1'),(4,'2023-07-19','10:42:11 pm',3,2,'admin','dude',NULL,'0','1'),(5,'2023-07-19','10:43:46 pm',3,2,'admin','hello',NULL,'0','1'),(6,'2023-07-19','10:52:02 pm',2,3,'sushan','dude',NULL,'0','1'),(7,'2023-07-19','10:52:12 pm',3,2,'admin','mula',NULL,'0','1'),(8,'2023-07-20','12:34:01 pm',3,2,'admin','iajy',NULL,'0','1'),(9,'2023-07-20','01:03:58 pm',3,2,'admin','mula',NULL,'0','1'),(10,'2023-07-20','01:04:04 pm',2,3,'sushan','mula',NULL,'0','1'),(11,'2023-07-20','01:04:20 pm',3,2,'admin','mhyampakha',NULL,'0','1'),(13,'2023-09-23','05:06:42 pm',2,3,'sushan','','650eca4651508_315527100_574236231372180_2486624015591340237_n.jpg','0','1'),(14,'2023-09-23','05:09:28 pm',2,3,'sushan','lol',NULL,'0','1'),(15,'2023-09-23','09:25:09 pm',5,2,'kat','hello',NULL,'0','1'),(16,'2023-09-23','09:43:10 pm',5,2,'kat','test',NULL,'0','1'),(17,'2023-09-23','09:43:26 pm',2,5,'sushan','lol',NULL,'0','1'),(18,'2023-09-23','09:49:44 pm',5,2,'kat','','650f0c9c91c7f_android_studio.png','0','1'),(19,'2023-09-23','09:51:15 pm',2,5,'sushan','','650f0cf7a8f94_325430628_659676059181162_9168175588637193939_n.jpg','0','1'),(20,'2023-09-23','09:54:36 pm',5,2,'kat','lol',NULL,'0','1'),(21,'2023-09-23','09:55:14 pm',2,5,'sushan','test',NULL,'0','1'),(22,'2023-09-23','09:57:23 pm',5,2,'kat','hey',NULL,'0','1'),(23,'2023-09-24','10:01:29 am',2,3,'sushan','hello',NULL,'0','1'),(24,'2023-09-24','10:07:10 am',2,3,'sushan','scroll to bottom',NULL,'0','1'),(28,'2023-09-27','04:57:37 pm',2,5,'sushan','mula',NULL,'0','1'),(29,'2023-09-27','04:58:37 pm',2,3,'sushan','whats up?',NULL,'0','1'),(30,'2023-09-27','05:03:10 pm',3,2,'admin','','65140f72b5efc_326016515_637823324784442_4416766522716256599_n.jpg','0','1'),(31,'2023-09-27','05:09:53 pm',2,3,'sushan','nice meme',NULL,'0','1'),(32,'2023-09-28','03:53:33 pm',3,2,'admin','sofia robot 🤖',NULL,'0','1'),(34,'2023-09-28','09:54:04 pm',3,2,'admin','jonn',NULL,'0','1'),(35,'2023-09-28','09:54:13 pm',2,3,'sushan','hjjj',NULL,'0','1'),(36,'2023-09-28','10:00:38 pm',3,2,'admin','asdfg',NULL,'0','1'),(37,'2023-09-28','10:00:38 pm',3,2,'admin','',NULL,'0','1'),(38,'2023-09-28','10:00:52 pm',2,3,'sushan','test reply',NULL,'0','1'),(39,'2023-09-29','09:26:40 pm',2,3,'sushan','lol',NULL,'0','1'),(40,'2023-09-29','09:27:40 pm',3,2,'admin','hey test 1234',NULL,'0','1'),(41,'2023-09-29','09:28:58 pm',3,2,'admin','test',NULL,'0','1'),(42,'2023-09-29','09:44:26 pm',2,3,'sushan','','6516f45eb3f86_54515105_299617577351932_5045927007557255168_n.jpg','0','1'),(43,'2023-10-03','07:29:05 am',2,5,'sushan','mula',NULL,'0','1'),(44,'2023-10-04','08:13:36 am',3,2,'admin','talai fataha',NULL,'0','1'),(45,'2023-10-04','08:14:02 am',3,2,'admin','talai mula',NULL,'0','1'),(46,'2023-10-04','08:17:26 am',3,2,'admin','fghfghfhgh',NULL,'0','1'),(47,'2023-10-04','08:26:56 am',3,2,'admin','machikney',NULL,'0','1'),(48,'2023-11-05','11:41:56 am',16,15,'test_user','E7qkkVlyooyHISlkA9ZJ+76xz61cP3Gj8XAaTuS4swcH8TH6Y/z9YLLwr9nLCcob7tS5xqfQrrjqv4m8lZNITFz8FMyoWTH3mBuXVJILpkPnMpkNlYpRzNnUas1A+cJdvqDnQoQXvF1A08bJpFyyqBmZd/NrUmjOhOCDpQqq1R748rAs74mdrZZDIOWWsPSAdj+iVopVs2LAWxTJ3lCls9bAQfxUWBbYI8mXVXpvUTnBn1a32XMXdhp0PfOODkwCCKdyBjpDavc4N2IHmaE9wyWOD9n2bvTyt6+euEiygtqh4ggaHoK15JAmbIf31eY3tTZYt+aXADm/ckENCZ7i1FP9LA+4TXUqTPsQoS7WnIVxpE1s3g+7PGI8KUUneMpk85L77h7WS6kbB7yCaj/uvhvJlDL72zYxCIh+xB/ZIA0yjuWp/pfoNX9D6i+CcqsSFlyIY/m24XyACSczNXVfF5baw16m2uvqbBdhz8AM2KrUEEX7S7T0Qrz16G8ceXpNrEO3resGfmmVJVNCsYlfHCa4n3ag0N14/Z4ECoyTg9bYPjMb7rsdYFyOgTzrR2W64KsEWkplXaaMh/lp7T86AgmWf/HWCDYTjymKOiTmK51eDvWQdh9mbbjuzHWIK4xAq2uslaGeczVi8J/vCyt3qcsWmhHYiPfnLsY8Nq9RWNs=',NULL,'0','1'),(49,'2023-11-05','11:42:14 am',15,16,'rytegog','tBjvvu7So9uh9kqd1laau47zGzqY2z1f6aJg7cl1eY3+Bc+2fGuGH9Fg/DYb2+tl7t8qtl2wjEW6J/b4clIKxpbNim+kbeM9HvhGaStTwZL9z/lIc3tdawGoO/TZEjWx7kgV9RCgg72Gasa5/dALrlllfi9XZtd3DDa7rmUtzVcLRcROa63o8z7badS30Mq8oaOozujSVCv7lq/rTaotC4isUZRq2FbYOFCOSRuBDWuZTGolthvxg5c1OGY7fj0Y4Sru1ETSU5dVkgPxCL8teJkNvoDTMEVvx0QPgXysU1z4rKWta7CfX+JVsKZTJkg9kEpnyFqFTzJ0pcgj1n9CWk0uONbBMrETXmEGFGT3BSPfb5wQI71a6P/g9Rqjrm3zto8E9teHo/PuvKEU4Ethp0k+l1Nc9SGbowVYr+7bMky/nvIE6ZtD0rSRcknauatVbnC7KZioavTwUyWYeG0W3dXL/BkCN9PddTkuYaKDOVJjDU8N+JW+hVoSuN6o5sA/VtXii9+ROvdqsFT2C1A120rHXg9JmcwhIWFWlHo9CW9A0PDfAwN5u2H9wOxoyy4tM5TOouQ6A1Sf9vag1DtJQYJrjGlLrWoaIinrC8Pukr+Odzs+nimW3G22F5+C8iOZBaiJ3ezOQ3AuYsbXtGmrUcmfTkMhX2X0o8/C92E8zwI=',NULL,'0','1'),(50,'2023-11-05','11:46:09 am',15,16,'rytegog','NRuZFbH14ASmGvt4B3O0U8TWBkTkxB7tII4cS/nv1Ki0oZ1USRQ1KMJz2ZwtGPZxucNlkNelwuIDkuybcsa4iYHeW8KOhppZxEpVDX2+d8OWIDCI1m7omeFmUMKqAs7Ku9fzQQIntza9CPahrM5ZE4Ccwsr4KXeMJDPPEpGIQt2Kkfn8QYsifIjSIfh1o/aXfq/eSiTpbPzIGl8BKgO4FzrHLTzCaikB2a3VEGv3KfYwowJGcU9A7Tvckelp3UbC3NbVK0d8SanIN6PB0ohYSJ9jlH/Rm5dVteZfiJr3RbrV5b1KrODdU8FcPqegyenFljNoqMIHhYmV3cp5dNZZM5GEKDwP7ZeXkwc/fAE/IJ2c8RNErmcCqaAc5k79zWJ3czcOjptqX9scBDeijKS86lAk2LRwHRVhtxmKeyJmvo/as7pDLv7JcJWy6Ek/TNY+DrIiDUrfGWcB7kcRqWi3SZ4ihe/5ygen72DvLf4AUN+X3jPkhufzouDFiTgP8VWenQU2wj2Ob3Q0KG/rlhgd3uCg83fN7NZflSRN0omnAnek5311F0LquhKyIyi7H7tZs6RlEeCrPyKAatWt/cL5F+LllEKZOJU0td8t5YztUsal0kdbkzJBee3bjyZoCbNvVeEho3iADOwywciRX5LHwhCFJ0YfM1t8GpJlH6LCXAs=',NULL,'0','1'),(51,'2023-11-05','11:46:29 am',16,15,'test_user','EHsF9IvohtvJlej/Lr52osHhDbslyIEqQjghwuWxcYPBq8YttVLIcevHlCZQQnkYU0MQ+LCanpfvohcv/i7pGE4kcEQGbLrma8NWHbNnMxoF0y1rRg1KQdmd68M5YKK5fKXG4nGo5Y4FFDOPCTfSBqyCdUSa8SSwpHA+j5KyTHl5QlG2KGHydG8cCFvqTRIo75ymO/0oC5xuchPkditwosDGvc8Y0D5kabNNqeJB7WEOv5twzS93hGP5YSpqlGApfyO7/8rmZJO3N25F1+ovaIye+s2pnmItNbhso9VTXvIZIpOWEzLlTV5WwgF45yExM4ppD2hMk2PCVHMc2ETTtmZrOoPQF1PyZsmXvbOqmHTbByq6nzDo4EorsneVNhGwfzjvwiwQegm5NxBuN/Odk1XSMw/kziEDDsckrjvWfm8BXWsME/cGgmKDBytrQczKUe8GZ0M6R0bxz34NyPXD41AHFwh+pLo8hdhLZi0xg7+TAqRwoqOiHk4NjTnK/zizEWOMVlLRKw1An3QS9SwmRUdGCVdmPSoJTupZlTL2jyiUmRjcx28dZbgfOGkStVur3S+LyBktiyApOxRvBNS/QXZOqYVhCEyC8YxHniFst2T08WAPH4xIjdTnMmIH9d3QS+Xoj+0NhPFguGJ564YU3OMLM2HnKQKHsHvM5JFpBug=',NULL,'0','1'),(52,'2023-11-05','11:47:19 am',16,15,'test_user','QS1z2Dqmab5FFTCWjKfSspdcbg6ZfsFOBwGBXWMRWvXo4wSGr2Yj0QHQ9ugdSePFWghquSxpvbKlM0h1Y44mNvpa4chJWNSVLc8/n1QtwX9PTTAcy+/Ab1CA7tpF80b87Dwzks6GX1IqR5ulXfDLIvhtdnC+9xdMlXSLzHHjaQg42f65IX+CXqpICo4Ax+JqFMd1ENbfXWSnWc74xgcZ6A6QOO8Gfhrf20lhz3LSCTeO/MKSVmDFJyzlObdpcUtI3pUPGL63qdhqQ9jMPuKB1vx0seWsN9u41BRLSEhsU0LDkeHiQF7WtCP9iLfo6YybJ8Tj347XdMh40rV1VGS4pqV8gw12CiXLvXG1MDJ7AVwJRDgReWCzKHZN7UBy4eA01s4NIJ/Lbf0RCJgkUrDG7XTSqWub/OV0qUbCxUPKsj5eVonuXQG5H46p3FtcGvWELqh3jO49BpJFNWKt1KpYzPZnBqNs04tr+KO+a4Q1a5z4EI30lmzihoK8IFN+0J4yMvElNmYqChmnuCD8Zxo7nJD3xB4Irz+Wwa0fh5qWnyvxCf4JjnfRDLp1bl0i/8a3XnvPw9MDRe2w/3s+cILSPNHWGqtdWKzMFDFrjbl583iqyolv/7WXN+u/IcCEIIxuK7OkSZA2mIaxOIg7/njTNTKwiy/eG9Any7t7XXEbbq8=',NULL,'0','1'),(53,'2023-11-05','11:47:28 am',15,16,'rytegog','DJPRl3fTpLkxMhP9tdQ/6wCZjn/joB04/XsEYSP8rmdJtwiXQmoWQztl2j0BDsMhGvfAytfrccDUAmCeOfEYzQtLR/yvMrCVpfxEuyRydB+qvrKwbla0zp8b2ReXwUpKL+8Me+Y+40Ik+DFY2+COeJyPV+q/r34xY/a/XYbqSy7T1v+bfvI6YheECavI/CIE8glIWHlexJA+0RxTqYvv0g9oB659hoSSN5LzxQOC+so5h4+cOgLuPXg53h7/PA0JetoxPgvK32lI5V3PA3pril7b71+CrT3EOOave7x4zGuNGc3Hi3Ssza0LxrRJGHuUtH02guv7oQ9a8MzCKrAtIKe1k9mlp5oh0r9zivWYpsxUq8K8gpLb5sYIxqEuA7HBU+9nI9Z5tPqFvnj4EWjP0X7YR//q54ZEvRSLJ+n09tHiMrnxizQcDsTw9le29ty6CfhHWNr/ObsbvAq5xlMHcJpvfgYQ+iFmeFEJ0oCt3exzLnJfK7eXDSlMV+/SpNUvoWn1wyMQha642mnGuVLSO8l2FIIvDJB69znpJSumlGnpwe9Sl8+pZxVY3KwVQ7cPNe50UTuz03jRHiPu5UYZNKwHijaBsp9vKxbbXRxA3ieH/rNWXkT26p4/CSxBoDyEu0IBheJ+F1Fyv18pccvlAnngRVlOt4lbkLgh7DR5zOw=',NULL,'0','1'),(54,'2023-11-05','11:47:44 am',16,15,'test_user','bxj+piG/3TUCCEHjTsmW4cwuFvWTxHn2sCSmb6sZLPCwtuUFP79/8Ba0IvtP48FB4s7M+tLntCG6DL9Zd2/dqdY96j4uzmtHodaiCu0Eyn3HL/SCqJnz7mmLPkafzpfmyBF2+xT66MFgSKnAjeXsOJ7bHBy1gYpVYUreaTJJw8nd3AORfajFqmadRAnYofd0+tyHY7o1DThJo2oRgzzR+W5IpS9QkVeJMJWlzM5ApmwvVE5LZ5JhXHo26Tf2EnAfru2Q6AzWZIgYPDWOpc0mb83hvq5zgAgMd6/7u6O1dROrKzxFcIkupa2xeUIMW+6l1UVxpa1UrbduGmV7Qg3U7KsQkwGS/ZGAyUZUknwJbGDFLOj4oY7G6YEOW4IO+udMbQo5pkXmqC83DXaaekRHh6LdDiKc8ZD4ZWaOotZ+ShHjv3D7h8xoFHYSSr3z9gcMY4xhh5bjJRRM/BySe6IDVRt7col6CJhXqqZcB+M3/Q7fkTlydFMKlf79kITNSZvA2wyygZOOsHtslc0mDFon8H+LByuUQB9ovm+cUloR1YBpXCyBdzGq1T8nprFnGC/cPk4j5tm0CDMeoPjrdE7QYzYgIbQV/YDJ6ZO0LKtldpbRVMqgppTVXwXNqxWj6YhA8lDcxnsTfcaH3HljcidipQeWMusPiUt8pZn84Sf5pW4=',NULL,'0','1'),(55,'2023-11-05','11:48:04 am',15,16,'rytegog','','654730185edaa_F6Z-Qc6XYAEeHTT.jpeg','1','1'),(56,'2023-11-16','01:03:55 pm',2,3,'sushan','hey',NULL,'0','1'),(57,'2023-11-16','01:04:04 pm',3,2,'admin','mula',NULL,'0','1'),(58,'2023-11-16','01:05:18 pm',3,2,'admin','','6555c2b25b8f6_341480325_197980669658918_9120688597161256985_n.jpg','0','1'),(59,'2023-11-16','01:32:53 pm',3,2,'admin','lol',NULL,'0','1'),(60,'2023-11-16','01:33:05 pm',3,2,'admin','hey',NULL,'0','1'),(61,'2023-11-16','04:08:37 pm',2,3,'sushan','tori',NULL,'1','1'),(62,'2023-11-16','04:10:16 pm',2,3,'sushan','muka',NULL,'1','1');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `more_details`
--

DROP TABLE IF EXISTS `more_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `more_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `more_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `more_details`
--

LOCK TABLES `more_details` WRITE;
/*!40000 ALTER TABLE `more_details` DISABLE KEYS */;
INSERT INTO `more_details` VALUES (1,17,'rywum','About Me',' ',' ',' ',' ',' '),(2,2,'sushan','Sushan Khaitu','Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente temporibus reiciendis aspernatur atque non              culpa ex deserunt cumque, consectetur soluta excepturi recusandae enim earum voluptas maiores sit voluptates beatae ducimus error              accusantium consequatur? Necessitatibus repellat non velit harum, quis eius, beatae sunt ab in a iste quaerat hic aut vero voluptates!               Inventore nostrum ratione officiis corporis numquam, error harum molestiae fuga nihil doloremque voluptatibus cum, cumque et autem non.               Blanditiis sint odio neque quasi nulla provident adipisci illo necessitatibus cum. Soluta at molestias animi eum sit et expedita, quibusdam                vero illo, consectetur possimus quisquam exercitationem deleniti neque iure maiores veritatis. Odio?','Pascal National College, Bhaktapur Campus','CEO,CTO,Intern','Bhaktapur,Nepal','Art,Driving,Gaming');
/*!40000 ALTER TABLE `more_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsfeed`
--

DROP TABLE IF EXISTS `newsfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsfeed` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_profile` varchar(255) DEFAULT NULL,
  `newsfeed` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `newsfeed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsfeed`
--

LOCK TABLES `newsfeed` WRITE;
/*!40000 ALTER TABLE `newsfeed` DISABLE KEYS */;
INSERT INTO `newsfeed` VALUES (1,2,'sushan','64aec9f2be768_52109756.jpeg','this is first image','6517c94aad3fc_317961288_193035999969845_4593790037139537836_n.jpg'),(2,2,'sushan','64aec9f2be768_52109756.jpeg','this is test image','6517cd6b2240c_313018198_577233477537424_1416717656470396202_n.jpg'),(3,3,'admin','649430923e26f_lol.png','if uploaded?','651810807abc2_337294332_6475357152498292_6957394981995140686_n.jpg'),(4,7,'test123','64d628db5df97_Screenshot_20220625-084142_Firefox.png','😂😂😂','651811c68b3eb_IMG_20230930_180010_397.jpg'),(5,3,'admin','649430923e26f_lol.png','meme','651cd02d3087b_308597799_1783610085323649_2170855477321002838_n.jpg');
/*!40000 ALTER TABLE `newsfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(40) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `notice` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'2023-07-24','03:00:12 pm','ADMIN','fee submission','64be41203d14e_viber_image_2023-01-10_11-40-37-122.jpg','Dear students! This is to inform you that your Project Mid Defense will take place this Friday by 10:00 AM onwards. Take a note that your project documentation will be as the format of Final Documentation (not like your proposal). Also, you should have meet your Supervisor for more than 3 times till now and needed to be signed by your Supervisor in the log-sheet. Do it seriously.  Thank You.'),(3,'2023-07-24','03:09:12 pm','ADMIN','exam','64be433cdfecd_viber_image_2023-01-10_11-40-37-122.jpg','Dear students! This Friday by 7:30 AM onwards, Respected Ashok Kumar Pant sir will guide you with tips that you beed in your upcoming project work. So I wish you everyone will come with your \'Refined\' proposal documents. We wish you have made the changes that\'s guided you to do in your Proposal Defense time.  Thank You.   Dear students! As your mid term examination has been ended today, you are given a leave for Tomorrow. Your classes will resume by this Thursday.  Thank You.');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_profile` varchar(255) DEFAULT NULL,
  `story_img` varchar(255) DEFAULT NULL,
  `story_blog` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `story_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (15,3,'admin','649430923e26f_lol.png','6555c9dfd63e0_space-cowboy-futuristic-western-detailed-space-bounty-hunter-attire-plasma-revolver-cybernetic-e-238665882.png',NULL,'2023-11-16','13:35:55');
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_users_1`
--

DROP TABLE IF EXISTS `test_users_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_users_1` (
  `id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `registration` varchar(40) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `approved_status` varchar(20) DEFAULT NULL,
  `admin_flag` tinyint(1) DEFAULT NULL,
  `online_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_users_1`
--

LOCK TABLES `test_users_1` WRITE;
/*!40000 ALTER TABLE `test_users_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_users_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `approved_status` varchar(20) DEFAULT NULL,
  `admin_flag` tinyint(1) DEFAULT NULL,
  `online_status` varchar(20) DEFAULT NULL,
  `public_key` blob DEFAULT NULL,
  `private_key` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 13:38:14
