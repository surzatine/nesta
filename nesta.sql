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
INSERT INTO `users` VALUES (23,'sushan','5f4dcc3b5aa765d61d8327deb882cf99','Sushan','Cypher    ','Khaitu','2000-02-29','Nepal','9801549144','gesafipyw@mailinator.com','655cce24d0658_52109756.jpeg','1',0,'1','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEApASmsMFpA6uqBgqcxF8A\nCd4TdNjE6mp9Yo55l27rjfK5weOgVkGaFknU69wV34PNjQGUauXIlbtHSUQQfm8b\nReJi5RaxYwTbvVCJbLpiIFIfaNUzP7UuK0uHdQNGfjzQ8SMADVVQocW/U7yyfsCp\nj2iLS8UfUDSm4zTgN3f//LgqH1DBY09xWlxZhha7Cp+NgtkRjIbIrqNQ1JP1idpr\nzPR6WX685kLc+DUD9QB+EAHmBdfR4RT5LxBD7rZXValzTxWjqU7pwnLlIu/oOrPk\nuyNn/0xYnh79AsquoTdHAodRuEnXFHGluGr3dm8v0ohSXZs5Nb2zRkNHIeipR4Ub\nALOveoOGP8eti+kAQTkndVe8+bFx42GgUcaf73o1/XggX5qc3S9Cd7/R9b629rjF\n+nMvVImQIc80oKY+ACTTfxlBOi1vGzkjblakwUNHDYVSdK4EF7rXYzXEUILetN4T\nvej5NWYvcz+Rjjvxa6kGOWSUGVTuL5eYPIF0djQrSIXBO0Z88rRGfE1NCvQDMa2T\nd0qRijvzjmQsFBg7msTeEniBcxGSMcYXZraG1SIhewJHwqBuSzxII36HKmu40u80\nAKLS7/26WHlMJ/SoBSDwwlaC9On3JyXjdeXvL66bSOjow2ndE44GX1lhOjZSIoXc\nH/JFR2tKGpOuyICC62ZKTkcCAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\nEFIjr64Q4+xPKAyiisxneITEBFKi\n-----END PRIVATE KEY-----\n'),(24,'kat','b146a357c57fddd450f6b5c446108672','waboq','    ','ertyhbvf','2011-01-10','qekosugo','9893018584','bexugapab@mailinator.com','655cd3a33a6e1_310744149_138849292227168_6277413707493345585_n.jpg','1',0,'1','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAurjHDzP3ObsXTSxynZFE\nbIAJy6RgneSw1oqexKOZENFSMM6+v1f44McZXPkqhevs9X4F2mHt9B4KHTGFeMVn\nAGpmp0MjceYFsGhx1hmpJJ9ocWC+oqPUm/DpdLMRpeUweiZtycmlqYYwbnI2fVOw\n6BnY+NaT5uMxqwZ3FOfgodb94WEkzkjXtRnpbXW0F2JAfK+HTPUyMIVH9OTtaXZa\nlHxCS2zn7lZlkbQFCtRC2zadCRE05c7+YCX1ZkGq+cr8bUIDIVIui68gRdy0TfoS\nfUzO8KLki81tgw3nyMnbCPROtlXQdiDIbXPibu7xb5c7NzTCmbDnJO8RajVCNnxm\nY9P77Whjs9M44Z0FLV6lIUPQZ2FmS8jgVRJUEoSrzZzesM85nl2d/Toz5uVJ+IJz\ndFpPcXMujuEVZoMYex8DyAvc3dGgMKg4qnTsxjhOj37OK8zfJM9zujo3matresMl\nsqCVbxndcw5Jj0rW3s5kbwO6KwGaN6yRq/fRqn9rGo0X/u4NIE5BtHqawys4vF9A\nPv6EMdtFwko2HGR1KQUo9IP/nsdV3Bqg7XBwUUGAinSel3n6vedFE3/eEGrPa/VV\nvcw2ZbiOtAiFWVg/rlmdgS40HapiXj5fZk4FquuReYsBHyIC6XLxj5laeQEEjwde\nhyE/t5jHyYHsrUwpEH83448CAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\n+mqByabxOl4SajITF15/C58+XvAro4YT\n-----END PRIVATE KEY-----\n'),(25,'test','098f6bcd4621d373cade4e832627b4f6','TEst','','User','2013-06-26','Nepal','9865321470','test@email.com','6562b21688437_320674858_1204555580144446_3150533558642790285_n.jpg','1',0,'0','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA6HWBOhjCw5cvZ4ThRbil\nOHDD7gkaV4nQ1Na85kkN6NLKKnhv38oW+kpDRhT15shrMdecsiY6X/HSd0sNGuo7\ntrATe7/gJvhG1qisQ8s4JNvfAHKSTmFNQUgMsv/DIcPF71lxPvweSU3kTReqOhg+\n9BuRUJhYMW8rHUQ53YjYWFhAx4KbdWfYWYNM+O39UZm3wJwKij0OFTW48MhQqf6T\nWeyB4VpMzJiTqW9/VNE5A8daiHak0pzHQOcTx7mWq/lwo3xAubddDuulwDqAWoXI\nCH9KGAWO7xihwU/K7zHrS6E7ipJ/5qBb28jcWt9ppOEKa19U7cFF7xHsyyEhgMFD\nw2ChZCtWoBf97UceMDg7aaSitBiMYljYFF/Y6yG0daesos79hFK1zGLbDspXTTsL\nM+TQ1yvr8HQxf4NV3jbnUJZH5bkESoxFC77NDq1VxrxJIfMkIZEXGmlVIxYhK23d\nwWYHK5vHAVq+iEffM3YkDlX7pFOocEnV1a9QgMMtdqZcl+AYwIYc9vGq34r8ivQR\n85v314vr/slOAFvGpM1+/+IMunm9zEehXT2FsWnA2Nz18UqpjhqwdbPMi/rkv85X\nuVwUl7nPCKBwlqQMBdfMzAu0Pb0/r3ElNdcLdVIR30KuxFTrSJE+j+1VZIeY9qkS\nlmydJe2JdbBhl5b45Tga/G8CAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\nm/16eHOmvmAiNMlgR/Iq79VRWwk8xnQ=\n-----END PRIVATE KEY-----\n'),(26,'sandhya','cb282719af10c31e4333aca533886f91','sandhya',' ','adhikari','2023-11-06','kavra','9814956931','sandhya@gmail.com','6562b611a295e_F6Z-Qc6XYAEeHTT.jpeg','1',0,'1','-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArYQqqX/ICh6iO9CDDos6\nAIj3TZkLiDvSzqaam1W5z1419zOJBXqajD7D+nkAO6d1oyscW70GWZeOkrunxld6\nVyfsalIj4TgjBaIin+rvs+20KYWJCvCbyzUntzBuotFo49NaIwi2ov5JGHCgIKXF\nNvWoFIINJMPxhpLkSuNmcCSZpzL7Fc02stgTqrC1BobDCzncSOHyaIXsG25Nuc3n\nxAiI2RsSE9FtfNO+4K4ARpcGwhDLveKaVxhAqUv2zFd4oQNTWpGqcjrombG0vk7q\nyambX9P7+TteRWs3+KbUgf4qQJho4MjIFuxAWhpLpFcHpkjdzNU4syqAY5i1OA4N\ny+fqTIkpNAHL2u2/usKB5fPsg552diW1ITK6ZdfTPev1BBE5HD3NLdUShgeyYQV7\n7gV89jthaeea4jLVRr6qQGgwqUWkf8AuuNnVBr8ko1CTrUR+s2hdyqGIzjNPm/N0\n5fw6O4r48zSUcbglELqzXBq90lJ+y6VaLB/RFiWpIMtPrcgNrpl2bY5U7amOTzzl\nf8b4jzzTuUGwe85H7UII7ksCHz8ajcaw2JLvQCYDO4tC4qsjB0CJbeR7tG3lgHRB\nlh5eoIYmwphH6mYTwk5/TZj/T38sC7LtyW6hAZCRI9d/v6LZV9ZnFAL8K84UcGzx\n3ZOCyCHycB/fzKL9tlz0DTsCAwEAAQ==\n-----END PUBLIC KEY-----\n','-----BEGIN PRIVATE KEY-----\n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\nKH+yEuWk59LJ9QNHwJ4Orl9Awqmjtnc=\n-----END PRIVATE KEY-----\n');
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
