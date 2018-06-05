-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pragyapravah
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `filename` varchar(500) NOT NULL,
  `title` varchar(2000) DEFAULT NULL,
  `author` varchar(500) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `publishedAt` varchar(500) DEFAULT NULL,
  `imagefile` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES ('article1.html','Lokmanthan','J. Nandakumar, National Convenor (Prajna Pravah)','2016-11-07','http://samvada.org/?p=30799','article1.jpg'),('article2.html','Gyan Sangam','Press Trust of India (PTI)','2017-03-28','http://samvada.org/?p=32284','article2.jpg'),('article3.html','Their Villains are Vivekananda and Aurobindo, Not just Savarkar or Sangh Parivar','P Parameswaran','2018-05-20','http://www.organiser.org/Encyc/2018/5/20/Their-Villains-are-Vivekananda-and-Aurobindo.html','article3.jpg'),('article4.html','Lokmanthan 2016: Dialogue Leads to Clarity of Vision','Shri J Nandakumar','2016-11-07','http://www.organiser.org//Encyc/2016/11/7/Curtain-Raiser-Lokmanthan-2016-Dialogue-Leads-to-Clarity-of-Vision.html','article4.jpg'),('article5.html','#JusticeForThirumani Need Saudi-Model Punishment for Stone Pelters: Former Solicitor General of India','Ganesh Krishnan R','2018-05-11','http://www.organiser.org/Encyc/2018/5/11/Need-Saudi-Model-Punishment-for-Stone-Pelting.html','article5.jpg'),('article6.html','Eminent Physicist E C George Sudarshan Passes Away','Web Desk','2018-05-14','http://www.organiser.org/Encyc/2018/5/14/Eminent-Physicist-E-C-George-Sudarshan-Passes-Away.html','article6.jpg'),('article7.html','Lokmanthan 2018 to Discuss Bharatbodh','Web Desk','2018-05-14','http://www.organiser.org/Encyc/2018/5/14/Lokmanthan-to-Discuss-Bharatbodh.html','article7.jpg');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebooks`
--

DROP TABLE IF EXISTS `ebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebooks` (
  `filename` varchar(200) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `authors` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebooks`
--

LOCK TABLES `ebooks` WRITE;
/*!40000 ALTER TABLE `ebooks` DISABLE KEYS */;
INSERT INTO `ebooks` VALUES ('PrajnaPravahNewsletter.pdf','Prajna Pravah Newsletter May 2018','Shri J Nandakumar');
/*!40000 ALTER TABLE `ebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `email` varchar(500) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES ('shashankgupta1994@gmail.com');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` varchar(40) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES ('-4gwRA73akM','RSS Set To Retain Bhaiyaji Joshi As Sarkaryawah','2015-03-15'),('3gYcgJmhGec','RSS Sah Prachar Pramukh, J Nandakumar on political killings in Kerala by communists','2017-01-21'),('4F2tKz2M9Iw','Swami Vivekananda - The resurgence of India Part 3','2013-01-01'),('5qjy24AzqU0','NandaKumar   Wishes & Mensajes','2014-11-21'),('60SoZh9qdqE','Azad\'s remark on Sangh shows Cong\'s \'intellectual bankruptcy\': RSS','2016-03-12'),('7z7ODbj4xsQ','J Nandhakumar in pallimangalam','2011-11-30'),('A-CSWlfJBsY','RSS Sah Prachar Pramukh - J Nandakumar on Freedom of Expression','2016-12-23'),('aBv2JCwdgxU','#Left_Terror - Part I','2017-08-03'),('aEjw1IEKMc8','Nilapadu J Nandakumar | 18th February 2016 | Full Episode','2016-02-19'),('bqHePa6YTV8','The Idea of Nation | J Nand Kumar ji (Powerful Answer to Naxalites)','2017-05-10'),('bvPpqZhb4Vk','j nandakumar emergency','2017-08-18'),('cJPAW_H6mPE','rss irinjalakuda vijayadashami programme 3','2009-10-27'),('Con-Qh3D710','Report of LokManthan 2016 - Shri J. Nandkumar','2016-12-23'),('cq0t7kkkkI4','j nandakumar swami vivekananda','2017-08-21'),('d0KOyQy5SJc','Swami Vivekananda - The resurgence of India  Part 1','2012-12-15'),('EsU-oQzAMZA','Bharat (According to Vedas) By J Nand Kumar ji Powerfull Answer to anti-nationals','2017-05-10'),('EV_fHS_O2Co','J Nand Kumar ji full speech in JNU (05may2017)','2017-05-09'),('FidE0Q_HqXQ','J Nandakumar','2017-08-22'),('G3iQpgq1_9g','Swami Vivekananda - The resurgence of India  Part 2','2012-12-16'),('GEx0diGxyL0','SHREE NARAYANA GURUDEVAN Speech (Part 2) by Shri J Nandakumar','2016-10-07'),('greqQAQa39E','J.Nanda Kumar ji Speech-Part-1-Jantar Mantar Dharna-January 24, 2017','2017-02-24'),('gVFaAtAOjGQ','Narendra Modi Address Hindu Mahamela - Part 1','2007-07-08'),('HJ9xjSSxmOI','J Nanda Kumar (Convener- Pragya Pravah)','2017-08-17'),('hXHj2K494GM','Lance Naiks Sudheesh & Hanumanthappa Are Role Models To Many: J Nandakumar','2016-02-16'),('KVjdslkiwOU','SHREE NARAYANA GURUDEVAN Speech (part 1) by Shri J Nandakumar','2016-10-07'),('lmXCe9KEC9g','Ifne interaction with academicians with J nandakumar ji','2017-08-11'),('Nvw5P-CigxQ','Ifne interaction with academicians with J nandakumar','2017-08-11'),('oifVHVYHToo','RSS-ABPS 2017','2017-03-07'),('oks2R_Pytdw','J.Nanda Kumar ji Speech-Part-II- Kerala House Dharna-24-1-2017','2017-02-24'),('O_DGxCLB6kI','Speech of Shri J Nand Kumar ji','2016-05-29'),('p9ZFzx1m8sI','Intolerance Issue Is A Conspiracy: J Nandakumar','2015-12-01'),('rFJ1dLYONHA','Ifne interaction with academicians with J nandakumar ji','2017-08-11'),('rfyk5UXtp_Y','J Nanda Kumar (Convener- Pragya Pravah)','2017-08-17'),('sLFZKhqMFYs','Aamne Samne with J. Nand Kumar | Part 1  | First India news | Friday, 18 September 2015','2015-09-18'),('uR-0QC-7QNY','J Sisupalan Was A Perfect Role Model For RSS  Workers: J Nandakumar','2016-02-19'),('UtcJTIsH3og','J Nanda Kumar','2017-03-16'),('UWMh_XYBZVc','Nanda kumar r.i.p','2017-03-26'),('vBS_fOF5NYQ','What is that force that binds us together?','2016-11-08'),('vg1Chfnhrfo','Nilaayanam Hyderabad - Speech by Sri J Nandakumar','2015-04-02'),('vHdmcaQhWtI','Ifne interaction with academicians with J nandakumar ji','2017-08-11'),('VQne2c07U94','RSS seek intrevance of central government in Kerala issuesr | Manorama News','2017-01-24'),('x5gDK9neXZg','Communism Defective in Theory and Destructive in Practice ..','2017-05-09'),('x7D-hxImVE0','J.NANDAKUMAR [keseri] by RSS-Chathannoor','2012-04-25'),('xmxdxHnnVc0','J Nanda Kumar (Convener- Pragya Pravah)','2017-08-17'),('_M9EeRHmYC4','RSS Sah Prachar Pramukh J Nandakumar on Red Terror','2016-12-22'),('_OF347_Xhrg','Ifne interaction with academicians with J nandakumar ji','2017-08-11');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-03 17:33:07
