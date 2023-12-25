-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nesta_sm
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
-- Current Database: `nesta_sm`
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,7,24,'kat','6559a9792376a_54515105_299617577351932_5045927007557255168_n.jpg','awesome'),(2,7,23,'sushan','6558c4e7d1355_52109756.jpeg','lol'),(3,6,24,'kat','6559a9792376a_54515105_299617577351932_5045927007557255168_n.jpg','Yesu ko namm ma!!! :)'),(4,7,24,'kat','655cce567157e_tu.png','mula'),(5,7,24,'kat','655cce567157e_tu.png','muji'),(6,7,24,'kat','655cce567157e_tu.png','mula muji'),(7,7,24,'kat','655cce567157e_tu.png','mula muji chor'),(8,8,24,'kat','655cce567157e_tu.png','aayo admission muji'),(9,8,24,'kat','655cd3a33a6e1_310744149_138849292227168_6277413707493345585_n.jpg','muji'),(10,8,24,'kat','655cd3a33a6e1_310744149_138849292227168_6277413707493345585_n.jpg','mula'),(11,8,24,'kat','655cd3a33a6e1_310744149_138849292227168_6277413707493345585_n.jpg','Mula');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (19,8,23,'sushan',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_lists`
--

LOCK TABLES `friend_lists` WRITE;
/*!40000 ALTER TABLE `friend_lists` DISABLE KEYS */;
INSERT INTO `friend_lists` VALUES (50,24,23,'1','1'),(51,24,25,'1','1'),(52,24,26,'1','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (30,6,23,'sushan',1),(31,8,24,'kat',1),(32,7,23,'sushan',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (63,'2023-11-18','04:57:54 pm',24,23,'kat','bkqMiY4YrF10r4Edqc59B3DVf2wMf3IeGG9gwifK4MpM8tC+mabUmueBHeIjtD9pt2AcMrG/fjDof/ZrlRsDB6NIKr+tKwl1d7zm1HAVH/Yd8nlp8sZ5d9m9RVQ51rE0ZgMonfLHiKWIrxBPPLFD7KU7JyEg8ZWP5eO0rIv1wILRRkwKpnBb/0D5grkWSvEZ1+ysazh29cbDTCmXq5o9H9YtZ/HsrW5VWjqa+20d/Bqo1jXDq+6yatej/qZkbnT33itjucP2I70Eg2h9bqKrUi2olq3PMVQ9oUFWcahEguy6XJlmIzbZvy8TQ+swhihDFE2Opt+VlNEpUGoIx8JmMislK52WEdgtW3XJJV+BtcV+z5pktDf7RaRaINAG7gDRqOHhj+v5jsSyyX7SHrF71cen3KEfXHsX61gioJCGdSq/7AwzweBl3TICUV+OshkhwQiy1qwOaZABKsECRVjNXjpID0F440Q1BhFV7ErKa8tEu37yBtHWCCOrFUl8RWbCblS/HJxfJyUsMRFa7UHMZNFHJepW8TGZVsSsRHm2vGAM4pxbnODTPtDBWuXjr+G3QavfqyTeWpDqkQ4VyZjr06evj/0DbgQGE+ENPuMG2aXonWMjOtPaBvoRGa0VOyE9BzpdpvVEhfRMfTKFlRCKuWxWOGPTEL3SMIkmauN4xxw=',NULL,'0','1'),(64,'2023-11-18','04:58:47 pm',23,24,'sushan','iSOnig5wqyMR7zr27l8BQSddxKjT1i6Sm+pmOfkmDXdtgfgEdqlphwLSDQvcbj+0O8fSIaOTN/ovCbRFbsnXrFKiIdd6fKTXE1Zqv4iBe3pnSKEcMhydi/6Fb7tHVLOb6NNdxJSNukaoeLFq+5TVOYAc5KuFW2Y7D7fqiHqmaNWyqzVKGq/ZLdmnG8EtGwRmW84c1Ee+pUrsUy9m9c9q0uayFFk2nGH7PWsJcseVG9WcUx5R5CUo7OCBom66WGpfgxdtipBr7eBN2+Z4ZAb25+EbVDXVRetSvSuaxzrfIjcE+AaIo0UAX0LhTqRtczUQgc/oNf9Bxuo0PJ+lfubDy/MHO6G306//max9dB2GwPVr9RGTxp2E+1RuTO8+iS0u2QChj/Scyairpkz8kCzxBvZ4R0IbcuL/z5NupcZP0A+vepvTsSqc9dPKM+JlDv1BsdqOcfCkspBxPcxQe2BaKc9tAs/YE98cJFU7jiaiCVVIkzWg/CaElGRFvi0FAuMvWn4AOKp4lu4ySJLbrHzUgh7cycoEClbYzrTP1fmkhcOErsVHAf1Q2EJnJyvPAgOTezeRRjqHGtayTHP4OhP3psktL3mvvDlpMwU0GSB200cmTWvMhNWMVVaYX3PuRLYsFIKS75j6gbt5Use4G3pdirPGBzr0pzg6n/TrAGpH5Qc=',NULL,'0','1'),(65,'2023-11-18','04:59:04 pm',23,24,'sushan','mk+hsfwtm/Jhf4WSEYesucMndAh5heZ7yVOzSQs4lSNNI0IdG0kHyW1SUMUJx4fQdRsa9ZD5jGyD7knNFgV9jirtvBgdFiJ8h/az632A770o2E4CJADsdgxVTXZcEMXCThiQSU+WMGPDSj+zWjzHnMgVms64f20xvvcYmg4RkihZRA7T9ldFSCMzUWJInYmpez1NXijGIEPGOym//lpbreoTR98R5GGbwprDqEiBPgZ0hMtCsa3Kud+GiMmcK0miIgLc8cGjSwusj81b3PhcrbeB0LU9Ib3TbjisaqoGRmx/lbLfKTylowfFYWckyUdK1YZIoXfvo78FGhLiHEvn7vwqkJt0s8q2jY1NCleGqLxvZ+pRaX9Zi5BK16UKpBzH0HRSh6JzjfXYaIFWvt+O1tWnzn+DsgiPPqzIcWt6jRq0vloCkEg0XZJ+PusToALjyn30qIt+tkEf4lLZUoW/BidVOCZJak9MzmcHSinuJIVPaK7gri4iHAnsa97yH6Yml2rE1i9TWN0NKQ/NP5y5p5w6E8hmmNJEEiteJbjDBchO+2AN24eHUAXiFZVtBu0OZdTn+/BuajELBMdIJFSfWfK1ArDGf80CB7nnRTEO/gvn7dNcQoWoKMpqo22xmHjlxYT2yU64B/zUb1Pli2exMxZEx2m1X/q3HvbDj403vhE=',NULL,'0','1'),(66,'2023-11-18','04:59:13 pm',24,23,'kat','ojIp2CHFKKWRIpgBIQCzKg9ftE9ozMqftTK5zR7f/cnGv00meBjpqSEW0lKxn2QgInvk7Q0RtWMOdcebyETEJX2k9WJ1sVeD7FXq3kxqwLhdEFtwHi0R29XqRuU4mlVExgNTSp7KokAeNQLfRfS2L5yuZU9jSkWWGjYRaIKWHoIUHZgJTmA1zcg/aoRqMdx4qB4OfLoyZQ6TTxXQT9220QJQ0MbiMBujXyZVJ4uCU8CkUkkA5WaZXaEiBCXiVPIVeguZ6ewKLqK1SPxAbZGTetSt24xFd/g770HBp1XjQNQVBEDT83u7jeRUeA8MvI5PDM3SzhsxCmsSzY8r3TWTPQ7otvuQGCHnPsqG5VOskp54MZl1VbbERQ8sXyoLZR9fXfhbYuCNlStrRP+EsccGifdgHEZGrXIODIHTz4V+ZvXy9E+44PvXi9LBkXvx2p6fVfc16aX9OPuE4S1a/r05tj88EKgoTwd8uWY4LL/ORKDTCigwty5I3O2YYsiX+Oq9KGkJWdFJK3hLdnSov1qO2td3K9xP3OowdTSYormmHTKwOx7abji98+7Bm1kCKY/jMcPJgDd3ROGfMNNZlonAh/75G37s4Oxlnx+c/CyQ7/7PQcuZCmf8XYOsMq1Gk3Tez/o+hChjLorVTIdJc2TN6U6g72fAcoc+UbUwJMbmh4o=',NULL,'0','1'),(67,'2023-11-18','05:00:13 pm',24,23,'kat','G+CBg01WHy/1AdUVWabj7SXHGz2+jIsGML/mDblENx4eDyf0WR5aA344+bFGx57/BofdX+l+esxSycxbFYyll8yjJxqs/VhTvdIiU7fDKJz7JQMitCJvBsVS1nHONDBkOI8qc68/YIjxjv528jNrXE2/ESeoeKzaiRDSCjoChSBQvcE0XWDFCYfn63ZD5y/xxapN1EPeQDjlDSpXeR66kwUBl8g1bVrDjcf6ce6eHkWCUOAVkIQx7Hrsi+2KHU/+kY05upcef+/3rMiTJ8aCtuQpux7EE32/GGOXMe5ZpOUVpGlDrgdJgJWjdVvDRWwhRkRvizSbLjjWSMn7TIyV5svqZbzyx/X/Y3oYbPlEUIssBtSMTwn6jCYz25/ksn9hQIjY5e91cD5YRonQ9PfarH3Moj1wsL67tIXf6tageg36EDUqpWQmmeVR+NPDiTMkHkLqOwyD96Wlnvh4vJs1aGk8GmMAoX1ZT1yJR08cRorHY4nr2P4CsHJ4zZl6SS5tXQzr3kqKy5Grd9Ez6391wRtoV8cS9RtbrUx8CJbGAAIweWNEyVekzyzbWbr5aMV0QyzBSGEv8hBV3vB82IrLNquJbVhIjf0prlKL1thAT15f3762f2fvlIvdL5lGAnnYNCH82xd59qIqZ0/GKAIcIV9hlnBEDns2CHujGIM3/x4=',NULL,'0','1'),(68,'2023-11-18','05:01:34 pm',23,24,'sushan','nvghQtce1d/q/6Et0833hY1b/x5MQ5t9QhAT9RGGOlI1oBTpL/cyKhszx8u1EJ5bj1aja6/Obn8SA9shy6b5Ng9IJg0eUfGRPSMLFXUHXlQIXxBmNQ7S6WWWgseNlhwox25G+2wVeokh/cfZnK2Vk+/HV1F8gXmN71nlvRCNLs5wQgpAVOFYVgmsIYa6AvvnKTsJWVpQ8BCRpJKBFuMTSK4c9/Sbj0nZcnzcB+4lDMKa18nZf8iiA+i1EwWf+SMc94GWOXD5MLmf9rgrPYdD+afPY4iUpL5Pi0KgleWJQtUAEMqAQ1PlIC/eRd2lE+dUcb840uEVMF0/afB44XNYwVBz/mWfqQi3tUA6KsNrX1uzZxQF2cicquwCEQppDQg3EkOAVk0LPbOMOD8Q8bSw+O7nidfikb3HRvJGk6LG+SocQ9oduinJPRahj6x5+opblEiaVONG6t7+qIiDajRDrqCwjyZ5TN9rxcLFDq68JF255u7C8RbjRWxEnz9YCAIHtbK92CLfJq68jYLkckAvqieR5NQsXoarsOBNtJgjHhfEAmGKS5PGey2hMdOv2mp/AFgTZ0wrN/dsZMVBILQnE6A8aU6ET2HFquPKdV/sJwSP9c3KJATi2K8ArrwT7RNfTftlnRgqERwjbExpKjqGewni9FA63vGrd4mg9xTJ5L0=','65589d128f71b_324916892_898809137810268_8262357650608425898_n.jpg','0','1'),(69,'2023-11-18','05:02:17 pm',24,23,'kat','myPZOyxjXRsLbL81u6fWMaeMttQrmfIeC23lZUIrk35LbqVk61hphwP/8aY4RuSqdbq9UpyV2dZPNxJ5ZpCRIrLqGq+XmX4NyKPqeWwi9VKkE4Xtp+0/g4lRDfeWns2XXR7iwXWJFpaj8ObVESpiMUsQfJsN2BNxnuxY8io539ZtY9HdBmOgK6ckkIgvakaZjnta/J0tkPv3DZUA61FUF+fF7KeIC+UNpVMVCu0Ir/jL/hO8CQ5hQ5MOB+KVUNtDmcWAayULaedpGF7FsSIThlvD/y/96ek0dKrsh3Dxe9t+dtnFY1OfWmsLjdNwC6xC15faHeMqM0juZI42tTnIhAq8Ay7qhR8wy1bZVHA4XQM94itxE5h2RpeP2uUkFQnSUT+2K4PxqopFPupfi93aVyeaccU2sy/yFxpAzvNoxzRs0s+CnkFDObhWDoJ2QS8qSUtadf/hffnNrOIzcIv5NsNdk3xlQ15iDmLnD1qo5VM/PQXoqP8WbqqucTkgnpxQspuTMy7OviU3+XTe9Pfp1uNmRttdCsZ6E3yc1gP/xB+xsknAnWsymSXJbIj+L/G6keJKMKhc2vDYQjZbSpDK7BsVPnMOSCkvvyO0pcf6wLVaGK99lNqlTXSS9RcR3qsaPL737g+7ZVMQrcMDnzpuUlSHVUuhoaszg1CG4C7FZcM=',NULL,'0','1'),(70,'2023-11-18','05:02:57 pm',23,24,'sushan','fW3Cya5Qhaqs+V/kdhh3voFH3sqsRTgo0rYzKRsJPGioV9XN+fwW7GL2QCnYAkZ4w70T9ImucDgx6mSwTYwFh+T35dvnlbfLZkGBBUsock7UY19g0mlMVZdNCRPWzsFMoilaSxtY8RCYkCOzfIn6u999RhMIXh6wgPgd9bCucmJrQ+oX9am2nFxq+qu/llao+vEw3H0FFgoHVuA08cQQ+3BcWy4anqodH9cBkb3QwOtgg1P6FwjL8Jx8CoBh6r3xQf3WmFbiepr+0VGE3ZeluhSZq06B6IHFwmFtZE75vl6Zzh9B0BxVGzwGr4qL0+MxZib8jPcF+N2gQSKMmtliTPNIwouvkYEZ+Iz6SO4RbYd3g5oXG2109ANKdwb16ddG5lYA3eEc48SsK6NEB9lFPidOph9HWHrIMGCw6F9xkeTQgQ+73iHif8DVQUl5N2X6/zWFkWXV69GIEVaZ1FlxjdTlU4dXVUMu1BmwIN8RzWtHyVw5lcLvBMxlnXwbBMZ8X+OPi3KBEEGmTomUbicGtRbkegACQbqP8yxDIs0NVhZvMV03NXDunna7ybKFk/ArU+JSXECA0uUNeAivfpx2gwb053cBp5O4613CYQ8G5VTnJbXOrKpFDa80G8q3C7ZMAH7OKU2OB123nMaT73aHtJk9MZds+ZKr9BLdL/uaSa4=',NULL,'0','1'),(71,'2023-11-18','05:03:09 pm',23,24,'sushan','S+CfCQM6aQq1EII/tY/aboS0JQ7sbtGuTNQOSlLwiyd9c44ZUM8z2ccPSqNKp+6MAi9qElxDdEa8DJRDGK/RvBwuAEvhbLJjZo7I8zkTB42wj0GqfDd7qwDkBXjy/MgT4IkAyzxxoeCWS4HVlwyNmk5ehlK3Q8CpARHxDdkW8YinbV4qf/hKOBXJyXTv0QptvvBH8rSsqZO1i7NXvBTOKk7d5QTYE6Vy2HF+hChtQaJGRJYgYBX7u8DaWz69qYZf6ycND/NFWms0eRxNIMfnaxt27qxLSH34FmUQdQIsJd5LCSGj8bFQo48Uzjwx1Nq4JypXq3LV5oCaShdENpiGSfj4kx2QdGlJr+p4Ma+hAzvyEcvW31NbdMdfr9wEJC7jSy/YGSX2YtIlB8hsBIpzZeZe1cO1wdSOVZrg/dSWGKJ6mpv16Pm0CdGUyn0bFVWSxSeKFHgszFPeBtVDDKhvhKhhASzWB1c1PXmRmPQWIf2S3uabswlWwCo8LaQFzS0BF0y+lrZP2ye4dNvddOLRX0CJYkDChaOV+ljDOgw0q/nmgbgT5Q4o9qOjdnw5Yf7I7bIpk8M2LnNYQ26IUhLtyUrKvYRDLcUXDHHn6gmZyz3sMurjmLoZ4UawMYoYiLDsvaNftdQ9TcZXYitx8WCdT5KXAjBW4Zv89iWTcTOjLuQ=',NULL,'0','1'),(72,'2023-11-18','08:09:00 pm',24,23,'kat','I7KSyuzrHsoRYLJIMS8aI0aQ3kWgZuZc4Nbl+Ey3x9iGxRvsh6sYqGSndarNEIJowunJmEBkvrNcGqggziCQ93ons8qvT9W9VjBCCv4BlJi7INxuqe69PNeXNlSaceBgWT1vRJ1Wnz5WZLgl387zuHjao3ynBHUpooVAVVB/rfU4/nXl03FxZ4NIS7Cx4wQN5dGqy0TqySM5ln9gEeX+M3xh3XMWOs6QYyWbQttXwSsT21Cj0jsrLXDS5Cc7iwktAyxQgusrHikWRtZ8r+e0S4IXOIV1tAfLrawZY8sShIzLXulIFc2llDg2kuUt/eurBur+UNCaeDXpdOHHgalNCgmN5ks14xXtWluX4LF4b1SW8gTinOlbQGnPoC3w4xJ+HTZIbTivwDlX7wrGRjTaqc+RRRkRuzfMQDRyM94UOp24Q38p38LB66SC7tFukUxGLJXJpsAywL0BfXMvBVXvHCLtzd5T/L27N4AGlZbMZwqwF7RQAbBIE6V8cC7OdZHg5FmAdVdiROkmWATteqhyE4nKF0JPz0P6DfyyrnWqaOA6axE/V4ooTvOMtMyLywwGFff0PC4ex9Lof17jeUkUCVrmQWXj5Pmg5b2UjMe/Dsf5/iyf46Wnw6MpSuTctA8QyLFPPK2S51eikTDRluVCSVgr87tx+qXFkbZNrrEWapE=',NULL,'0','1'),(73,'2023-11-18','08:09:56 pm',24,23,'kat','Wg4Lz/lEUPX+RdGjrXj7v7Wp+UM1y/JkqScT5WpK8B5LJQOg8monNZgS/AF6Sa85f1wVt8PxnVvfyiisVQ4pD7+nu5JD6ltScupZ9XrnC3iLAHQtHNvu73aRY0/+yRrupNqCBP9J0mwhvfSTVP+Dp6SxhqCIjKI5YTwTJDdoOkox5bqemtYeRPgrhWmfzDSBLWILntfYHneOILHdiugfOpSFuummJ+ZH83BJYPcmTLfJOdrH1J9mm3rk/19YodGTIOsSsObk9NpPAL1Sduz0ul0jiKOB5f+so+JoU/Sn8XNRS5NqV65k+XgICKuvhFy+dFD0S52tYBTyEYr2XhMfX3AaauEQGWdaelFlcD2d+l8WO9Wt77ziqhWNGjlchd95eW5Iv3YDbfKLyMp7WQTjqRkwvMyZl5MQXJ2hf73q+SO7/tJrTeZiwuy8QoyNeXodh5iWhwnbuCIUtlPlHXnLtExDDEnu52EVcV52HYl1vhNiRqBpoNoeU+8g9SGgOv5z4X6aQMLl4/jor4wKc3NXqp5bilEnVmAqT4Sbwoi6cg8dGh2xTQVBrs2YWiLReJhQWb1rqiyyeF4ov5YHDPXgJJzGkGuaxxL1fMRuuszFIfIz9J4sQColVuxviTv7ABaWrDo0k/QfzqJfw9A3iZ3n3lXRiUDq8p3seMfcx2HKfQ0=',NULL,'0','1'),(74,'2023-11-19','11:37:16 am',23,24,'sushan','axSRa3IsYyaeeyUF43YQjzKO8oSBxsIk41rHh9b8VK0bQMlQgQAPWmwSGtImsr/hlsPqIIq4mxnFahx256QRGOpZrDGAwYAKEzh6aD7SWJvcgyXrzVwN82pzfjX34ZGzvWUzLzRh0qzafwFs1GXoU8OPFYYj25lwGqfNz57xgRZMpeQkb0wis+RHkzR+5hJY8LgQUNDPLGc/jtQdOoXZxUS77aIURRt53/vjCSzra6QayLSnnCBjVoRhG5o7+iSwwanjBtBGkZZvp6Ou4Cs6xFNDQvPyvf3CCIQsdeTsWPSk18zkYY/Iw79FRyEuKqiAoUGPn/9bwUguy1yUSXTmBjuDwjMp8iu8+asywDKPl5eb4InBb//pJlTItO8PqIt+ffYlHjgUBKuyEGpmZ5oZ8qhljGo3xFzLjFT/lmllWzRsrhVyeIa8qofVTLJBUsfTaM7qKSWRzuJXuchQwCrTnbhais8pz369bZdFGSbxzDZPoOm345raUJtni6c7uSTwvz6lQHu7nf2TjWsN8iwVB310D0WxmY8N5UMJgDSMBl9yN6IuMjlQJHvHMwuNWHpprbz6HZAyWSpEPz01APg911opyh0CrwrmFJJtKo+Sac+r3IL+KEdpNPPugVjvcH4V8kGSl/IdJG7eW31I8PT7KUp3XF3s5Bxz/6DEBQHXPww=',NULL,'0','1'),(75,'2023-11-19','12:07:09 pm',24,23,'kat','WYIjeHG3osmgK0JWCrizCVfrRTwtwjzfJ5r1CUH0fK19yAoUj0P8455LeZ5f+COImKmfx1/Yvs4vjcmN3n77QhMq5w1pO98xBYK6hkcjGp4nrv2ZOIyZrkcU+gOKv13RRP5qcuMhkt872EH3wDWMoKW7QXHcEOmBBekQAhqQZAcxR4lifsFKidW4OAr4d9vfMuKNey5QjsqDUFI5HFhrTEt01bX5SNAZdsC59yFJC57VacR06dEnAlSwxkFauX+UpMtXkzuTfjP2tsQOYBQ4DLWZf49cI1lyeWOVCgLWaFzY8LBgmGLBSo92pRQM/Djn8cOYfBcPK104/pMI2DV8G6mYH++hPgbqFpNLLJT8igvnJ3Ws8YSB14hF6jIqtFJBkGvpE+wSc0KknL29XPsviyKaYzIkYGDt117LP9psm5GpF9XtDtkxj6+0R5ARscVL8BtFyFNmBGsFmfZBXwykpsQvhf16wkozMYdHNeZpClLv5wCe6nc4abSSob5twPKxdIVQVYkmtE2sbNUPQrpcpQA8ulKSP/O6IVZccuCpeK6Qf5F8nu1JrMFeNAZ22gljhJuv/oHLR7j+kYeU5zGO/0O/OCs9cmPD0GOY0vkNuXQycs/gN5szJeZvUsD0VUdOYnmJNtmncICjXWU0yYxmaJ2BSLPhfIga8cNWXGY2IYg=',NULL,'0','1'),(76,'2023-11-21','09:31:35 pm',24,23,'kat','HP0q9wQE9A/8ldQ+TfURuC/C9RDzS3Jh+Lw8RX4SeWZL5luAziurmYHTHC9g8sTlsCZ8j4Dxi6AqS6R4aYnE6AfxZT6Z/7r4Q0LvLQBGbqwLCXbZOqF6NPehWQmgAwu8HsWE9zyijRpTbIJchb/96WSJwh3TpdMGjk/Yw9h5yJ6LuB/HJRNeO72KQaC73EIQHA70rAFcc7rtEgBTa/lyi2ZWPyNP6K1LW/QvcNINwCGgfm35Z5WqCoPYSBa7NEcRWshehWT+ZC8nQjOM9IHTGCwJoKe7oVR2VsydykcHXkkmdaSmwRuyh0pF2zjQo4wjvKzgTMrENl3c3AUOaMV1P5cs2iag38Vpql0x4b1bnJq4b72C8MOb0GkLne+0nvH5wjJncnO4l61V4s24Cll/YccgacsQC+Gorg+JhxFlBZOKB0iN1EmLyCPdk0QlhI5a5+waZQcn/NoPMrTR42rkLnJHXmiuytu3UPKC7zaTAdASOj8lthdfsvgDC297UvMLQ9Wq15woiS7y7LKc2tPLhobwNgjS711m1yEPc1rixP/zuTDf0kDS0M+WCkEbrcUxpcqflVktZkOWKnN7PWZKpIA354MrVEtAwASGwkFT5kS6Z3ipF9OIOZ8v3wv2zI5W3KfZGoNwQz5r4ENESvZNx3HXeORBNFl9JBpM/K4VQ+U=',NULL,'0','1'),(77,'2023-11-23','04:46:25 pm',23,24,'sushan','OTVpUykm3e2uZAvLBivkZgTHieekiGKhvksNy+xDQDMuG3kLCjzpMf7yjXXAki4hjofgcpaFD9lbf8d7+IZ1gXPu34hn634lSpAO7+DbjnMUTKjgAN7Hqkzbzs3pDBvBT0jPnJvT3RcNsQZp/m9WdEJstDHvjyGqerJnGlrjgvrwqqEf+NoiyJ5VL9ovCFctmQu4lkjvBp5Sdj0KQY5sphIpqgnywLaFcF7GLVd8L8co8HVsneUztvfiT2hYrxT8Aa5ywxu5jAAMd/nHCT0QS5bCMVZyI8viYDPKDHNvTA2kDs4NbsXuoLG5kflQR2cfoBWKtgS8tjLHs3J/vsU0LZ03bgXPqLCuOyaCwXpNxFXSx+GSUyVm7DaEGqZEsxS2t32CwFwnF4Nx+VIcABxoYQTyd4Jbks4XWeB7YS07W1zZelRjIeGQJPmtiuEPKJqirwpuFmrTqAaJD7P7Fs9R+UHH27EIk8fy6mRb9cmPPfj6nQj0OVWGW2YzMl+7EWlACYXTN/oD/sj3+laieJfmCJUfTQUHI5Gu5xQqVS+42pR3dP3pnXj5g30lNHVKuzZZHkEJUbVejUpTNbECCBba0gBeaRVqK7C9HwAx5RTJws/aUzqr3TxDaskmxQKBbD/rn/HiEkXyknwrFoE0qY9qvrgwX5mXAxkDPa2nvlb0ViE=',NULL,'0','1'),(78,'2023-11-23','04:49:36 pm',23,24,'sushan','S3OIDe91H6UmVL8rqJvLDLfR6xNkaunBl97p9mFEViVRFHqVxkeViAMFATZ2KkjLC+1WdLW7VB7fsk5wSmCU3UQ6viUMhyyEMkWYQDPBc/3Liy7ZR6s/FoTljgpCP7Teeq5bHyqqsscTRk51GL5KkyjFs/JmZB3SUp3BrT2v8fgWl04GsBueZzxgEVHI2aQko+aPmdwGZwC0s/wI+iiUF4XygineLSk2WXqq/i4vp/oaMMHKHN0uYFbyuhKhVH6o0pcFFB4Auj6hpEDzgrz9kth4aYSmOjcIM9S1W070GmTQJWUVETF4IqhdnkcV9juErNg27RR6aA0CAvYyFGwty8N8YYDxvDc8ziAVXdVVTfFOXfrh6euPcjGyQ4iW0VV8ZKGP9Rtqd5E8E1RjERR0pwLyiiSbr1LSp8GL3zj+ABiRA+RWFgO4BrpXevMG0YM1bpGggg6HNlGjLIn+P0Cyl+JmC2pMvFFrlCqxUs5J4uRdl+Fa8m5qb4HZPrDkAAikdcRLmIMqtJOOyn2c6kkLOfyONEjuEgA7NhoigGKLyQk16c+/3+pvwltVQMO1GoPAL7AVlTarV81yNHVMTil3DhPACM0O7RFhjhfJ98x7CboA/qUm9IEEr3gnyJdytcTCrMuAON4fpzG1gy+yKwHn1aNY6PJUWg0IhCaEZw4E0Bc=','655f31c4e69de_maxresdefault.jpg','0','1'),(79,'2023-11-23','04:51:03 pm',24,23,'kat','','655f321b88cd5_Screenshot_2023-11-22-21-46-59-878_com.instagram.android.jpg','0','1'),(80,'2023-11-23','04:51:20 pm',23,24,'sushan','','655f322c0e0ee_img_1_1699781985394.jpg','0','1'),(81,'2023-11-26','08:50:54 am',24,26,'kat','QG3HHJAW7d7orugiHiSsMG1fZV5ErMaXJEzNNLNbCHNdsR8Q4uiNW659GAIQQQY3AHjdjdbC0Egs2v9tmYnoU3OR8AZir8hG1waMbPweM6bKoShUiasYAsizzMxKh89wgacOb0GJgZhnNYALtqpLR4BHRCzmIfRQ0eztBO8qSShlMyEVpxaoHR38tWIhg4iUUjDBI46I/9gk8eRknUkeQLayCc39y3oScHHdgwAkMGLuE0k7OgPbBWb9RfMKSIFUVCXjybFyaqheoaPiqWrOmKnTfa3yp/2GpAU2/T5clj49me0oeCkCFCmr70xrigMrVrm3rInsngb26gd9HWSsBgG/ymwKBq6pYxSrRU2Q6cbb+xON/2pODl/9f2/RCUulM0Hjp8r5hmk4HsjF9+b3Fd9MK+zeSZwJYwz17s0ubz9ExjtCaLF7Bs1Nq7i5l7B+ACigVgP9J/QCsqfFxIlTjPWUsn2e6xMp5/nbcgtaMjlZMv2cua4+6qy0lkCLiHnyDUZd1NEuQnY4TVQSzOeXXlgtKGXbHCc/W7TDGn6/7gn4sWPauE5tKfzkVLWRKq2ulAKzk+ANADEQKvZbJH/uNhq5hS1Zvz8ds1q/4BAlZKZl0yuJ55U0Hbg2sxfmr9xu/NrXpcv0noHcq4/I4j1W2gz00utDKDdNunBW35Q9kMg=',NULL,'0','1'),(82,'2023-11-26','08:51:05 am',26,24,'sandhya','LagzRSm5oRx0LtfhwauxnKA+oIBmyYZ1Bf1bFaXQTUpYTVgQ0jd6/LclSE/H4aQz4mN+GHA9LU6MkVILsJznQoz07rtwiVXplDJUECQ/cqDneIatQTpHuQYxb0MZ1EyHjY+ZU6fODDzkrMq2mStVF+R74P6YaE3faVNf+AVZPoMZvv2Lav/zpxkg3GdxcBQakdXBwjShYPqis6O7ys4u6A7m/HURigNga3MojK9pBD2EGThy645rGidzNvkqmsn3rAsqcEnX2jfZ7MReosKCkXl1vig0UVPzGKrcq3PzI4x8Mm6p+7XGe5zozrlGdAaxFUq9DjJqz35RrWLMQCEqODeZn64b1Ly0TjHvPLnCmHTnvnKuVjkcsgvWR0XISyQ1cpNyGwkiiahHv32JEdUPXXCI4soWn0oydWP+gS0iMdWfZxCu7K34/XbSvPwBB/0qkADBmMD6c+0t3UHlh6q2NhIFLg3581sCEVsDZNBPelYlxzN8QymG9AkODVlJh2FwWcFA24s1/3JD6IdntOxyJP+UXEvbOIlaXF7qmpz2I5TsZBo5Mbd6wQHG4MXlpnF6945s4Yw6+yJ5QINyjdJF+AoMUbZguySYaZxsmZwM3YhDLMfAl7JhWHvInM832t0FWmGF5D8MWoZY+WBZ0itp84zgJ0GEG+SyBAw0RepuBZI=',NULL,'0','1'),(83,'2023-11-26','08:51:09 am',24,26,'kat','YqcxIm4vC9eG+Cf4T8EuN3gP9+feKd6owqoPGvSXf63PO4qWSQjJcL7p2pG7Q8wC0RjFx+G/0m54EHUoACX//pBQxRJpCLJjDfQNd/8pNL/dsRNq3jSV7OUoNiEtGrhZM0OsGXUs3r/NHgPW7qJzTvdhALy7XxJ7Qbye0wvzujZUdfBdvPgCD0qbgaj6Q5cOQtoXiE3Yllzn/E5+piALDQn7B+6v5sj3wvVFpCRjIbEXuenPTsSGO/KqZRmiIu/E6kXDwIu7VzOu+57sb8khJhGawmrHPIIx9+VPToXBqwlxd5qeH4+aDt2jGr/i5lR0g5Fkt5RCjt+RG+i70EwtybqTYTYqzEIVjOMXy9Cb9V7U/Rb+eJ0R/XUqVtfzTcYIC73Ohi2mgUCUWNw2rk1KYnifQi+R8q7eQxZpbJbcKv+h5LLXLcXKfejnc47n8nk8WMoQ/hsZZwWPMCOvMZnA2Z9guOtdq2Ud8wMkMssWvt0TBQyTLos/3PE7NdPaj/KPNybXK9ejSEnfYbp7HCKaood0S2aGkHQxLOx4nd1X/SEwD0M2YBlAJZqngzK3eiDGAXiBd5r0PkZtdsnewL6RjjR7uirqLwTYV0n9NAHK+aIjJku/w4VbvCwaouJDt0pxcSxNR5o4KCbmSZxG/Ya13JbNJnbl3bbBit+2y2p3w08=',NULL,'0','1'),(84,'2023-11-26','08:51:13 am',26,24,'sandhya','N7sumZQNZOurFDwj7WNsCWM8TPqUvm4CvDog7CLG5d2BBZMmpMkOj1ieuSZLsdOcB6MsAkrFv6Ea9jcP6i614EMR0zcF57Vt63kL8vNKtrruNEK0INgjvt1WYuyBiQLkWG5B+pj7iImzzbd8h17T8cX4NAbI4XICSiiZEVHivddHXyS50POk/lqS5rgosZCS8h5gfs7/mgG1BTkepXuQiZmWfx5foZW7hXMNW6jh7vNMzwLWxCTGqogfuQtqlhRpi+A8JthL5NXeg+Rjl4YK7GfNPeICst/cZ+EK7Nl8pNf5M00GQtmiEpnDjmYB6UCx0cPGviXT4JB2Kaj/zRYvbhvXeoaUQCfCMT8adNnmxRj/EAeMqg7/Y0HRfSwZAvt7yAWLtDWX1vU5Kw6t1eNNaFhhygmfE+sifFXVsrNZPWlXE1CBvGize0Qe2mk+2l7/ang4m3ygocBcFIYpZ0K96G5XOG6i6+ygLADWYwLbmdtkE02uqinegQ0SnvKyvSERn12YK70Qp8sMzsKvv2aeDJRT86wyXQrOFGjrKEE7KrO0SxscPtKoWZzvEJcmEUIiXvGkzQgyo4lceRUFnzOv4Pq6ppWCqmt0CZuyx/107OLSvkXwnXeLdXq5LjZVNxdek5Ce/uHAeptBq0SdejYyA9XOiAkINIm0IPvv3cg0kI8=',NULL,'0','1'),(85,'2023-11-26','08:51:26 am',26,24,'sandhya','gNSZoQMCOWQFZjiMvAJvuIggnJVsRx0W3VqsrAsC/4Q/rRtYR8zCiPqtdPTjSc/Qbt6Ekrp1ysG9U/TzkmWaMFrtZIUfD/bSfchCdtBZ2TB4hS+sJj2TsuXdRJtT2eduEVE3nicviE4A055GjMbAogL92Ua6Y5ybtj5/WLf67WFxlkOMR/Z48CcPsbz9ts8k88maoF4n/iba5kmk47iR+YsoBwLyIRmI3qkqnqjXeJpQFQ9nZwVtP34lJda2bo58GcfSf3C96O10keEt3RvVyPQCuDwSq1yihMB3eY5/HPEhHlKZKolcIcKoZMIcja7k/xNF/1pul8Z1+7dct1LlEFXWeScG9klkcr+2z0B2GaJzALXX1/Dm099vhoNLBhxW7YQqkCKNCe+5Tw2nVKpdjIlGFXmXhMz2xAFLn5rVRI0GjHsDSS78dxsPW9+NP1GHNN7VaOp85EN73d4CGIJdj0BLRfmp+ZRyuGA9xlxW3fmANRveRt0NH6Qas8y9NxuNaQ2xOj+7Js5RSSaXATpNZqbPHXesjkxikLWV6R2IJKXm9CTWckcpl6vQdWq7C3A0M1LTcT/5RctD8Ebc334BfBAx4aSEche0O/BJ3gfVu4aP5pYv28NjqeWs+KbvH3zUXJXT1/QYIUzR63inHFgQ71F9stTER0sgQXRCkyVo9P8=','6562b6322e1e1_336521650_1345670296009371_1064710480154738894_n.jpg','0','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `more_details`
--

LOCK TABLES `more_details` WRITE;
/*!40000 ALTER TABLE `more_details` DISABLE KEYS */;
INSERT INTO `more_details` VALUES (3,23,'sushan','About Me (Sushan Khaitu ;)','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Hic harum corrupti laudantium eveniet commodi doloremque deserunt suscipit aliquid ipsum error!','Pascal National College, CCRC, Bhaktapur School','CEO, CTO, Intern','Bhaktapur, Nepal','Music, Video Game, Travelling, FootBall'),(4,24,'kat','About Me',' Lorem ipsum dolor, sit amet consectetur adipisicing elit. Error iste voluptatibus ullam nesciunt? Perspiciatis perferendis vero recusandae quia! Dolorem, facilis fugit obcaecati mollitia deserunt placeat.','Pascal National College, VS niketon School','CEO, Recepsonist','Nepal','Music'),(5,25,'test','About Me','NULL ','NULL ','NULL ','NULL ','NULL '),(6,26,'sandhya','About Me','NULL ','NULL ','NULL ','NULL ','NULL ');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsfeed`
--

LOCK TABLES `newsfeed` WRITE;
/*!40000 ALTER TABLE `newsfeed` DISABLE KEYS */;
INSERT INTO `newsfeed` VALUES (6,23,'sushan','6558c4e7d1355_52109756.jpeg','My first Picture','655b781266b1f_290929939_462437482552056_4730715474021710558_n.jpg'),(7,24,'kat','6559a9792376a_54515105_299617577351932_5045927007557255168_n.jpg','Dashain','655ca5443d537_272999124_3180732085582625_6391622957893453487_n.jpg'),(8,24,'kat','655cce567157e_tu.png','Admission mula','655cd1e761a18_165121283_471308500892953_1862040743368390398_n.jpg');
/*!40000 ALTER TABLE `newsfeed` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (18,26,'sandhya','6562b611a295e_F6Z-Qc6XYAEeHTT.jpeg','6562b66abb749_320750983_888280772533990_6062511728512241705_n.jpg',NULL,'2023-11-26','08:52:22');
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
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
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `approved_status` varchar(20) DEFAULT NULL,
  `admin_flag` tinyint(1) DEFAULT NULL,
  `online_status` varchar(20) DEFAULT NULL,
  `public_key` blob DEFAULT NULL,
  `private_key` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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

-- Dump completed on 2023-11-26  8:54:12
