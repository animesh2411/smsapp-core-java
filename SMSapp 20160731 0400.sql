-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema smsdb
--

CREATE DATABASE IF NOT EXISTS smsdb;
USE smsdb;

--
-- Definition of table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `Gameid` varchar(20) NOT NULL default '',
  `gamename` varchar(50) NOT NULL,
  `charges` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Gameid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` (`Gameid`,`gamename`,`charges`) VALUES 
 ('c001','Cricket',1000),
 ('g001','Football',600);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `Userid` varchar(20) NOT NULL,
  `Userpass` varchar(30) NOT NULL,
  `Usertype` varchar(20) NOT NULL,
  PRIMARY KEY  (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`Userid`,`Userpass`,`Usertype`) VALUES 
 ('ANI','ani2411','Owner'),
 ('animax','2411','Clerk'),
 ('animesh','12345','Clerk');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `memberdetail`
--

DROP TABLE IF EXISTS `memberdetail`;
CREATE TABLE `memberdetail` (
  `memberid` varchar(20) NOT NULL,
  `Membername` varchar(50) NOT NULL,
  `Email` varchar(30) default NULL,
  `Address` varchar(100) NOT NULL,
  `phoneno` bigint(20) unsigned NOT NULL,
  `Dob` date NOT NULL,
  `Occupation` varchar(50) NOT NULL,
  `planid` varchar(20) NOT NULL,
  `dateofMembership` date NOT NULL,
  `dateofExpiry` date NOT NULL,
  `Gameid` varchar(20) NOT NULL,
  PRIMARY KEY  (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memberdetail`
--

/*!40000 ALTER TABLE `memberdetail` DISABLE KEYS */;
INSERT INTO `memberdetail` (`memberid`,`Membername`,`Email`,`Address`,`phoneno`,`Dob`,`Occupation`,`planid`,`dateofMembership`,`dateofExpiry`,`Gameid`) VALUES 
 ('hgh','hghgfh','ghgfhgfhh','gfhgfh5656',56565,'2002-01-07','ghgh','silver001','2002-01-03','2002-01-09','g001'),
 ('jhj','hjhj','jhgj','jghj',5656,'2000-07-07','hjh','silver001','2002-01-18','2002-01-03','g001'),
 ('M001','Animesh','animesh@gmail.com','Lucknow',226007,'2002-01-14','Student','silver001','2016-07-30','2016-07-31','s001'),
 ('M002','Akash','Akash@gmail.com','kolkata',55221,'2002-01-23','student','platinum001','2016-07-12','2016-08-12','p001'),
 ('M003','Deva','deva@yahoomail.com','Bengaluru',565656,'1995-07-14','Student','gold001','2002-01-03','2016-07-31','g001');
/*!40000 ALTER TABLE `memberdetail` ENABLE KEYS */;


--
-- Definition of table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `Planid` varchar(20) NOT NULL,
  `planname` varchar(50) NOT NULL,
  `Facilities` varchar(100) default NULL,
  `Charge` varchar(50) NOT NULL,
  `Duration` varchar(50) NOT NULL,
  PRIMARY KEY  (`Planid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plans`
--

/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` (`Planid`,`planname`,`Facilities`,`Charge`,`Duration`) VALUES 
 ('gold001','Gold','Gold','2500','70'),
 ('platinum001','Platinum','Platinum','3500','60'),
 ('silver001','Silver','Silver','2000','60');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;


--
-- Definition of table `renew`
--

DROP TABLE IF EXISTS `renew`;
CREATE TABLE `renew` (
  `memberid` varchar(20) NOT NULL,
  `planid` varchar(20) NOT NULL,
  `dateofMembership` date NOT NULL,
  `dateofExpiry` date NOT NULL,
  PRIMARY KEY  (`memberid`),
  CONSTRAINT `FK` FOREIGN KEY (`memberid`) REFERENCES `memberdetail` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `renew`
--

/*!40000 ALTER TABLE `renew` DISABLE KEYS */;
INSERT INTO `renew` (`memberid`,`planid`,`dateofMembership`,`dateofExpiry`) VALUES 
 ('M003','gold001','2016-01-02','2016-05-25');
/*!40000 ALTER TABLE `renew` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
