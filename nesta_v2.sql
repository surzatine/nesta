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
INSERT INTO `test_users_1` VALUES (2,'sushan','5f4dcc3b5aa765d61d8327deb882cf99','Sushan',NULL,'Khaitu','2000-02-29','Nepal',987654,'sushan@gmail.com','2022-01-06',2022,'64aec9f2be768_52109756.jpeg','1',0,'1'),(3,'admin','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'649430923e26f_lol.png','1',1,'0'),(5,'kat','b146a357c57fddd450f6b5c446108672','loryheqacu','       ','jhjnjn','1987-05-22','majynid',389855,'wosy@mailinator.com','pifob',1977,'64bab85405c0e_325377377_1241841756712073_3522198626046371610_n.jpg','1',NULL,'0'),(7,'test123','cc03e747a6afbbcbf8be7668acfebee5','toqiluxafy','','toqiluxafy','1984-08-08','buvehydi',61,'webukarul@mailinator.com','jaxuxysec',1990,'64d628db5df97_Screenshot_20220625-084142_Firefox.png','1',NULL,'0'),(10,'root','f3ed11bbdb94fd9ebdefbaf646ab94d3','xabinum','','xabinum','1990-09-03','retyduroti',19,'viwityr@mailinator.com','kyqerojin',2018,'6516f1db37c39_cool-profile-pictures-for-steam-wYIepIm.jpg','1',NULL,'0');
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
INSERT INTO `users` VALUES (2,'sushan','5f4dcc3b5aa765d61d8327deb882cf99','Sushan',NULL,'Khaitu','2000-02-29','Nepal',987654,'sushan@gmail.com','64aec9f2be768_52109756.jpeg','1',0,'1',NULL,NULL),(3,'admin','5f4dcc3b5aa765d61d8327deb882cf99',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'649430923e26f_lol.png','1',1,'1',NULL,NULL),(5,'kat','b146a357c57fddd450f6b5c446108672','loryheqacu','       ','jhjnjn','1987-05-22','majynid',389855,'wosy@mailinator.com','64bab85405c0e_325377377_1241841756712073_3522198626046371610_n.jpg','1',0,'1',NULL,NULL),(7,'test123','cc03e747a6afbbcbf8be7668acfebee5','toqiluxafy','','toqiluxafy','1984-08-08','buvehydi',61,'webukarul@mailinator.com','64d628db5df97_Screenshot_20220625-084142_Firefox.png','1',0,'1',NULL,NULL),(10,'root','f3ed11bbdb94fd9ebdefbaf646ab94d3','xabinum','','xabinum','1990-09-03','retyduroti',19,'viwityr@mailinator.com','6516f1db37c39_cool-profile-pictures-for-steam-wYIepIm.jpg','1',0,'0',NULL,NULL),(11,'byte','f3ed11bbdb94fd9ebdefbaf646ab94d3','litixy','','litixy','2012-12-19','xobimucuvu',100,'boty@mailinator.com','6517d093a26ec_335877920_607380180841153_8506655231942111526_n.jpg','1',0,'0',NULL,NULL),(12,'bipuxus','f3ed11bbdb94fd9ebdefbaf646ab94d3','xaqodeh','','xaqodeh','1991-08-19','pakydamu',10,'silaq@mailinator.com','6518f077c7f82_339586617_183554187810374_5404464559531348855_n.jpg','1',0,'0',NULL,NULL),(13,'kate','f3ed11bbdb94fd9ebdefbaf646ab94d3','netakyze','','netakyze','2006-05-10','wewuleco',5,'qysesafycu@mailinator.com','6518f7840e0ea_337002195_2139558339766795_5894645410754855481_n.jpg','0',0,'0',NULL,NULL),(14,'vizasuj','f3ed11bbdb94fd9ebdefbaf646ab94d3','batisuk','','batisuk','2013-08-02','rimerelyle',67,'mumepusoz@mailinator.com','651b6e61264d0_ac66bd64ce404dc4be9991cbeb3e0cf8.jpeg','0',0,'0',NULL,NULL),(15,'rytegog','f3ed11bbdb94fd9ebdefbaf646ab94d3','tawydicapi','','tawydicapi','2007-05-03','zowakaqo',68,'vomicicera@mailinator.com','65472997d1ff1_photo_2023-06-28_20-53-25.jpg','1',0,'1','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAkbsKipzUgtXbf4XILkzM\nWpt35UbEW4Dv6cYOePJzytg4j0I4Td9vMWjubnopG1AarClFFSpm41Q/QOpo6Axo\nBqlHcJ/LgjKCE2AaWkIib+7uyozytUvVOd1wJJ1N2ovB5qhFU0VCDpUye/0FHsqd\nXgff1i2auHRhsYX4EDRr1CeP/obTAGZuet9CnAN1SBynT4NZg6YqbhEd3uip3voc\nug0V1dz4xdu/Lj8NtkkyymgapSAYs4S3ZOdi7/aNBInRO3DPU+I/XhM4JOdS4l57\nrEYk6lPkYUkAmT0F9lqp/symN6jUkvZDjAFpvuiPd/OXQ+1LmMETtYQpH+0JzBcR\n0pTvP9Itrn6xZJwG6/GZkh2PcUQwLy+TNBslnGP/7CIpPLtk5nIjBZ9RSFmcM/9I\n+MTEtBDpmsPYzItOorPYu82c0/XTIt6vHXCAX1nIfTmUavGLy1B6yFOYmcbIS3Iw\nlYTSVy6PKN5p1C8B63JgHEMT9D/1ciHB79fQoTRxL1g5I5jN5qUrMj+M7yNy4Rej\n8AiJbNIsHu+8Yw3cyzqrAfUuVWpdJZKTWO5m/DTwIU8gPuxP1QwhrPfGSu3Q6Jba\nhzOsORgMNVbTCXnI2FNwTaiBjgrCHXMhjHRC4yvR4fmO/NpLXszZV2TthrtIaHoW\nXbG/27wYdNtlp6Aahq/JjBsCAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\nx3wkcdAAN3vTkeg2ZNBDd/cwSuCCtw==\n-----END PRIVATE KEY-----\n'),(16,'test_user','f3ed11bbdb94fd9ebdefbaf646ab94d3','vyfidu','','vyfidu','2004-06-23','govobyhid',99,'ryky@mailinator.com','65472e5fab584_n.png','1',0,'1','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA3ucBe2gdzk0E+GQPKE2I\nSlzDZ21pG61opIw/VBNZLlgfjRfuEkuA3AtluaUHJLqAQzm+DRNdPBW4GaBhCtYI\nWJUZZZ0cZj8H2bMDuoe6LErROx7jPzntnDQ/efyK5zCkrKPODmORqo4VoYbJgqxm\nLJiW2+gPKJwrbW9GqlRhBlhjMSvdanrq3tDybj8iRPxz2/DvxN04XUUDC6VLATdj\nFkP8b4hok4fwtkPvpmeMGjdG0I2now3f5Q0is4Mt8ChxzKViPVLZPlAByyvq/W5T\nw7plMFrFR8UEYOiGCniWaab35QY/o3TPBTT5O8yUkSahvYk0OwdLwiOUopUtU+CO\n6LFK4+dpAZxiLwU5GpSHKQT96+nLKGsA4o2bcz8p9fR4iIp40Cwy6MRE8ozseu4x\nIQ0W07ohckhyQE+seYnMYoiw4bsuHkPEvn54tBKcc9kbZeEKxhZ+cdgtSgjzM4Sw\nmzvTVj/BgIh09JWe2mfSaUyQU5NUQ5XYWRzz8Er+ddCbMlPrn9TCvJEUxqB1EJXZ\nPRkGThTJTJs8jKbrDucLdA21Da28U1ugX/GD5Fsdr6fSi1WRPbMNYgRUCQ/zmlaC\nq7Wlswm16dZdN6+sHmGgEfWXOI+BEm4pZf3IulfPT3XwatDrxAnSF4CAHNgfqC19\n8FyqKunWYBbQQdcC4Uc+Gc8CAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\nCyUjMvX7LpjCVTA6QSJ35IMycvlF6A==\n-----END PRIVATE KEY-----\n'),(17,'rywum','f3ed11bbdb94fd9ebdefbaf646ab94d3','dupawyco','','dupawyco','1992-05-27','qonelofod',86,'vunywol@mailinator.com','6554d7f1237f0_347431908_628020192228748_5086423623434773395_n.jpg','1',0,'0','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA22W3A169ALf5kVyMJtco\nYEACJ0EaUTelzHWxnCC0aCLEeRMBVaufawKUsNxQck19PxcCRq+WTCtqHVObG4Uu\nLX0zBViV54/e8oqtT39rS5EdyMhic90vptFNJR1zfbaHub50lm9ANUYlSvOm8xjt\nHhzZt0gw8Z/7JY0pL2BdKZmH+/9JRwhsERh843yRLkbGijvfnNe1R0s3Y129LE5l\nGBIxjOz3o5af70qfHOFkhWrkz4mxwVHT1ilcr3PK74L8cCj9fAhBZSGr2Tcqlmv+\nLp8mS1/S8JVwGaVXt3Qiy5yT/HP0+p1gvWULo2Dpr/A1UbQqGnZBlZ9iaPrCldjf\nk5DTjvi1ssj11ZZmGoKn7aLH7cIXlFARB3gffen4gw329QPg6d4NwpoI+4be6RqK\ngYDCSnbwgwA7nwDw6sxLn6ZnYKpmQcMvwNByQLGqNEXd/ywI1UBBLmC05nko7MYL\noDI3gwcLAj07mkGph4+utwZDGYNysS+ipt1tzbwnK+E+pjYwqOGaWEmN4gYYf9FE\n5grasg50ZqwHqBk0dM2PARr/nrt53IXWIA/vKXoswaryubM/QuNWrLtnzXpxNeEe\nhquIIJ0kQvSsXLWH1Ny+GkgLXkqaA1x05JJleHtmkhPtGgLmC0ShiWVPT/q2mN5Q\ngNf7aG90nO6roEJeIaQekh0CAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\nD/447asCTyBTyH3nSJdbau+KmwSFKw==\n-----END PRIVATE KEY-----\n');
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
