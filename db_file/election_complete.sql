-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 11, 2014 at 06:02 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `election`
--

-- --------------------------------------------------------

--
-- Table structure for table `con_batch`
--

CREATE TABLE IF NOT EXISTS `con_batch` (
  `post_id` int(11) NOT NULL,
  `batches_allowed` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `con_batch`
--

INSERT INTO `con_batch` (`post_id`, `batches_allowed`) VALUES
(31, 'd'),
(6, 'd'),
(24, 'b'),
(25, 'b'),
(26, 'b'),
(32, 'd'),
(33, 'd'),
(1, 'b|m'),
(27, 'm'),
(28, 'm'),
(29, 'b');

-- --------------------------------------------------------

--
-- Table structure for table `con_branch`
--

CREATE TABLE IF NOT EXISTS `con_branch` (
  `post_id` int(11) NOT NULL,
  `branches_allowed` varchar(100) NOT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `con_branch`
--

INSERT INTO `con_branch` (`post_id`, `branches_allowed`) VALUES
(24, 'coe'),
(25, 'edm'),
(26, 'mdm');

-- --------------------------------------------------------

--
-- Table structure for table `con_gender`
--

CREATE TABLE IF NOT EXISTS `con_gender` (
  `post_id` int(11) NOT NULL,
  `gender_allowed` varchar(1) NOT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `con_gender`
--

INSERT INTO `con_gender` (`post_id`, `gender_allowed`) VALUES
(2, 'm'),
(8, 'f'),
(10, 'f'),
(7, 'm'),
(22, 'f'),
(11, 'm'),
(12, 'm'),
(13, 'f'),
(14, 'm'),
(15, 'f'),
(16, 'm'),
(17, 'f'),
(18, 'm'),
(19, 'f'),
(20, 'm'),
(21, 'f');

-- --------------------------------------------------------

--
-- Table structure for table `con_year`
--

CREATE TABLE IF NOT EXISTS `con_year` (
  `post_id` int(11) NOT NULL,
  `years_allowed` varchar(100) NOT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `con_year`
--

INSERT INTO `con_year` (`post_id`, `years_allowed`) VALUES
(27, '13'),
(28, '12'),
(29, '13');

-- --------------------------------------------------------

--
-- Table structure for table `nominees`
--

CREATE TABLE IF NOT EXISTS `nominees` (
  `rollnumber` varchar(9) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `post_id` int(11) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `activate` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rollnumber`),
  UNIQUE KEY `rollnumber` (`rollnumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='this table contains nominees and their details';

--
-- Dumping data for table `nominees`
--

INSERT INTO `nominees` (`rollnumber`, `fullname`, `post_id`, `counter`, `activate`) VALUES
('MDM11B020', 'Vamsi', 3, 179, 1),
('EDM11B022', 'Lokesh Kumar Soma', 2, 143, 1),
('COE11B023', 'Siddhartha Agarwal', 2, 169, 1),
('EDM11B015', 'Nikhil Sharma', 1, 103, 1),
('COE11B005', 'Battinoju Sai Kumar', 1, 281, 1),
('MDS13M001', 'Abhinav Kumar Sharma', 3, 132, 1),
('MDM11B009', 'Durgam Goutham Raj', 3, 91, 1),
('EDS13M007', 'G V Murali Krishna Reddy', 4, 75, 1),
('COE11B025', 'Swaresh Uttam Sankpal', 4, 329, 1),
('MDM11B025', 'Sagar Dolas', 5, 125, 1),
('MDM11B002', 'Vineel Chandra', 5, 83, 1),
('COE11B018', 'M Azhaku Sakthi Vel', 5, 36, 1),
('EDM11B021', 'S Mahesh Varma', 5, 160, 1),
('MDM11B016', 'M Karthik', 7, 204, 1),
('MDM11B023', 'R Akhil', 7, 110, 1),
('EDM11B012', 'M Ashwini', 8, 65, 1),
('EDM11B003', 'Bodi Reddi Sanjusha Reddi', 8, 22, 1),
('MDS13M006', 'Gaurav Pandey', 11, 147, 1),
('MDM11B005', 'Chengala Sudhakar', 11, 168, 1),
('MDM11B026', 'Saurav Varma', 16, 191, 1),
('EDM11B007', 'Gubbala Anil', 16, 120, 1),
('EDM11B011', 'M Abhishravan', 23, 213, 1),
('MDM11B028', 'Abhishek Yevalkar', 23, 189, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(50) NOT NULL,
  `nominees` int(5) NOT NULL DEFAULT '0',
  `valid` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_id` (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post`, `nominees`, `valid`) VALUES
(1, 'Academic Affairs Secretary', 2, 1),
(2, 'Boys Hostel Mess Secretary', 2, 1),
(3, 'Cultural Affairs Secretary', 2, 1),
(4, 'Institute Sports Secretary', 2, 1),
(5, 'Student General Secretary', 2, 1),
(6, 'Research Affairs Secretary', 0, 0),
(7, 'Boys Hostel General Secretary', 0, 1),
(8, 'Girls Hostel General Secretary', 0, 1),
(22, 'Girls Hostel Mess Secretary', 0, 0),
(10, 'Girls Hostel Sports Secretary', 0, 0),
(11, 'Boys Hostel Sports Secretary', 0, 1),
(12, 'Boys Hostel Literary Secretary', 0, 0),
(13, 'Girls Hostel Literary Secretary', 0, 0),
(14, 'Boys Hostel Social Secretary', 0, 0),
(15, 'Girls Hostel Social Secretary', 0, 0),
(16, 'Boys Hostel Technical Affairs Secretary', 0, 1),
(17, 'Girls Hostel Technical Affairs Secretary', 0, 0),
(18, 'Boys Hostel Garden Secretary', 0, 0),
(19, 'Girls Hostel Garden Secretary', 0, 0),
(20, 'Boys Hostel Alumni Affairs Secretary', 0, 0),
(21, 'Girls Hostel Alumni Affairs Secretary', 0, 0),
(23, 'Co-Curricular Affairs Secretary', 0, 1),
(24, 'Coe Branch Councillor', 0, 0),
(25, 'Edm Branch Councillor', 0, 0),
(26, 'Mdm Branch Councillor', 0, 0),
(27, '1st year M.Des Class Councillor', 0, 0),
(28, '2nd year M.Des Class Councillor', 0, 0),
(29, '1st year B.Tech Class Councillor', 0, 0),
(30, 'MS Class Councillor', 0, 0),
(31, 'Phd Class Councillor', 0, 0),
(32, 'Phd Science Class Councillor', 0, 0),
(33, 'Phd Humanities Class Councillor', 0, 0),
(34, 'Day Scholars Councillor', 0, 0),
(35, 'Hostel Affairs Secretary', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `rollnumber` varchar(9) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `password` varchar(100) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `date_voted` varchar(100) DEFAULT NULL,
  `date_created` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`rollnumber`, `fullname`, `gender`, `password`, `counter`, `date_voted`, `date_created`) VALUES
('CDS12M001', 'HARSHIT SRIVASTAVA', 'm', 'ZQMHDDY9uq', 1, '11,April,2014, 16:17:54', NULL),
('CDS12M002', 'KANNIYAPPAN. C', 'm', '0087755Jj2', 1, '11,April,2014, 16:29:31', NULL),
('CDS12M004', 'NALLAPANENI NAGA RAJU', 'm', 'WWRNIIe1zz', 1, '11,April,2014, 16:51:18', NULL),
('CDS12M005', 'PRABHU. T', 'm', 'm221199U76', 1, '11,April,2014, 16:30:49', NULL),
('CDS12M006', 'RAHUL SINHA', 'm', 'PKKGGCC9xT', 1, '11,April,2014, 16:07:44', NULL),
('CDS12M007', 'SAGARIKA MOHANTY', 'f', 'fawwssn5Jj', 0, '', NULL),
('CDS13M001', 'C. PHALGUNA', 'm', '664433DdZZ', 1, '11,April,2014, 16:48:29', NULL),
('CDS13M002', 'DOMINIC ANTONY', 'm', 'PPLLggc0yy', 1, '11,April,2014, 16:40:13', NULL),
('CDS13M003', 'IQRAM HAIDER', 'm', '3322008Ws7', 0, '', NULL),
('CDS13M004', 'MOHAMMAD ISHTIYAQ QURESHI', 'm', 'JJJEAAV8lR', 1, '11,April,2014, 16:38:24', NULL),
('CDS13M005', 'NAGMANI KUMAR', 'm', 'hhddzzu7Qq', 1, '11,April,2014, 16:51:24', NULL),
('CDS13M006', 'PRADYUMNA KUMAR BISHOYI', 'm', '9977554KgG', 1, '11,April,2014, 16:35:30', NULL),
('CDS13M007', 'PURUSHOTHAMAN. B', 'm', 'BWWWSSN5jj', 1, '11,April,2014, 16:32:54', NULL),
('CDS13M008', 'RAHEEM SHAIK', 'm', '6443311Zz8', 0, '', NULL),
('CDS13M009', 'RANANAVARE ATUL SUBRAO', 'm', 'QQLLHHC1yY', 1, '11,April,2014, 16:35:57', NULL),
('CDS13M010', 'RUSAN KR BARIK', 'm', 'kkggbbx8Xs', 1, '11,April,2014, 16:38:17', NULL),
('CDS13M011', 'SALIL SHARMA', 'm', '1008866NnI', 1, '11,April,2014, 16:34:40', NULL),
('CDS13M012', 'SHASHANK NAMDEO', 'm', 'DDZZUUq6mm', 1, '11,April,2014, 16:33:56', NULL),
('CDS13M013', 'SHINDE SWAPNIL SADASHIV ', 'm', 'yy77554K22', 1, '11,April,2014, 16:34:50', NULL),
('CDS13M014', 'SHYAM BHARAT PATHIVADA', 'm', '0XXSSOOjJF', 1, '11,April,2014, 16:40:35', NULL),
('CDS13M015', 'VINEETH MOHAN K K', 'm', 'vvllnni3Ee', 1, '11,April,2014, 16:48:43', NULL),
('COE10B001', 'ANAND. V', 'm', '4422119Yu7', 1, '11,April,2014, 15:35:36', NULL),
('COE10B002', 'ANIL KUMAR. M', 'm', 'PPKKGGB0xX', 1, '11,April,2014, 16:01:12', NULL),
('COE10B003', 'BODAPATI SHALINI SALOMI', 'f', 'jjjf886R55', 1, '11,April,2014, 16:46:28', NULL),
('COE10B004', 'CHARUGULLA RANJITH KUMAR', 'm', 'EZZZVVQ6mM', 1, '11,April,2014, 17:02:49', NULL),
('COE10B005', 'GANGASANI SHRAVYA', 'f', 'yyuuppl4Lg', 1, '11,April,2014, 16:45:32', NULL),
('COE10B006', 'GIRISH. K. V. S', 'm', '5533220Bw8', 1, '11,April,2014, 16:02:32', NULL),
('COE10B007', 'LOKESWARA YADAV . M', 'm', 'RRNNIIE1aA', 1, '11,April,2014, 16:03:43', NULL),
('COE10B008', 'MALE DEEPTHI', 'f', 'qqmmhh1D99', 1, '11,April,2014, 15:47:17', NULL),
('COE10B009', 'NAVEEN. C', 'm', 'OOOKGGG0bX', 1, '11,April,2014, 16:11:17', NULL),
('COE10B010', 'N.Sowmiya', 'f', 'nnjjeea0Ww', 1, '11,April,2014, 15:43:49', NULL),
('COE10B011', 'PAVAN KUMAR. V', 'm', '1199UUQqMM', 1, '11,April,2014, 16:33:02', NULL),
('COE10B012', 'PRIYANKA BHANDARE', 'f', 'ccyyttp5Kk', 1, '11,April,2014, 15:41:31', NULL),
('COE10B013', 'RAMESH KRISHNAN P S', 'm', '7555332Fa0', 1, '11,April,2014, 17:06:36', NULL),
('COE10B014', 'SHAILAJA. K', 'f', 'VRRNNII1eZ', 1, '11,April,2014, 16:43:37', NULL),
('COE10B015', 'SOWMYA JAIN', 'f', 'qqllhhd1Yy', 1, '11,April,2014, 15:44:26', NULL),
('COE10B016', 'SPANDAN. M', 'm', '2200XXTtOO', 1, '11,April,2014, 15:58:34', NULL),
('COE10B017', 'SURESH NAIK. J', 'm', 'ffaawww6Rn', 1, '11,April,2014, 16:03:38', NULL),
('COE10B018', 'TRIPURANENI RAGHAVENDRA', 'm', '9886644Hh1', 1, '11,April,2014, 16:06:45', NULL),
('COE10B019', 'VARUN CHANDRA. J', 'm', 'CYYUUPP4lG', 0, '', NULL),
('COE10B020', 'NIMMALA LEELA MANOJ', 'm', 'xxssook3Ff', 1, '11,April,2014, 16:01:55', NULL),
('COE10D001', 'KANJAR DE', 'm', '5533EAAaVR', 1, '11,April,2014, 17:04:45', NULL),
('COE11B001', 'ACHANTA MOUNIKA', 'f', 'MMhhddy9uu', 1, '11,April,2014, 16:36:21', NULL),
('COE11B002', 'ANTHONY VIJAY KUMAR MEKALA', 'm', '0009777Oo4', 1, '11,April,2014, 15:41:15', NULL),
('COE11B003', 'ASHISH', 'm', 'FFBBWWS6nN', 1, '11,April,2014, 15:56:03', NULL),
('COE11B004', 'AVULA SANDEEP', 'm', 'ezzvlll4Mi', 1, '11,April,2014, 16:03:26', NULL),
('COE11B005', 'BATTINOJU SAI KUMAR', 'm', '76644HHcYY', 1, '11,April,2014, 17:27:30', NULL),
('COE11B008', 'DASARI ROBERTKIRAN', 'm', 'TOOkkff0bx', 1, '11,April,2014, 15:51:13', NULL),
('COE11B009', 'DEETI SUNIL KUMAR', 'm', '3311008Vl6', 1, '11,April,2014, 15:44:33', NULL),
('COE11B011', 'GOLLA AJAYA TEJASWI', 'm', 'MIIDDZZ9uQ', 1, '11,April,2014, 15:44:30', NULL),
('COE11B012', 'ILLURI MADHULAHARI', 'f', 'lggccyy7Tp', 1, '11,April,2014, 15:34:11', NULL),
('COE11B013', 'KAMLESH CHOUDHARY', 'm', '0887755OjF', 1, '11,April,2014, 15:48:49', NULL),
('COE11B014', 'KATHA KRISHNA MOHAN REDDY', 'm', 'EAAVVll4mi', 1, '11,April,2014, 16:24:44', NULL),
('COE11B015', 'KAVYA P', 'f', 'z776644H21', 1, '11,April,2014, 15:36:16', NULL),
('COE11B016', 'KRISHNA CHAURASIA', 'm', '0XXTTPPkKG', 1, '11,April,2014, 15:49:17', NULL),
('COE11B017', 'LAKAVATH RAM NAIK', 'm', 'wwssnnj3Ff', 1, '11,April,2014, 16:26:28', NULL),
('COE11B018', 'M AZHAKU SAKTHI VEL', 'm', '4433119Zv8', 1, '11,April,2014, 16:24:36', NULL),
('COE11B019', 'MOHIT SINGHANIYA', 'm', 'QLLLHHC1yt', 1, '11,April,2014, 16:28:28', NULL),
('COE11B020', 'PENDYALA SUDHEER BABU', 'm', 'kkggbbb8X7', 1, '11,April,2014, 16:05:29', NULL),
('COE11B022', 'SHASHWAT SHIVAM', 'm', 'EEAAWWR6nN', 1, '11,April,2014, 16:43:30', NULL),
('COE11B023', 'SIDDHARTHA AGARWAL', 'm', 'ddzzuuq6Mm', 1, '11,April,2014, 16:24:33', NULL),
('COE11B024', 'SRI SAI KUMAR R', 'm', '0009TTOoKK', 1, '11,April,2014, 16:24:24', NULL),
('COE11B025', 'SWARESH UTTAM SANKPAL', 'm', 'AAwwssn5jj', 1, '11,April,2014, 16:20:52', NULL),
('COE11B026', 'TUMMALA NAGA KULADEEP', 'm', '8664433Dd9', 1, '11,April,2014, 16:36:18', NULL),
('COE11B027', 'VENNAMANENI MANOGNA', 'f', 'UUPPLLG2gC', 1, '11,April,2014, 16:36:50', NULL),
('COE12B001', 'ANITA SEERVI', 'f', 'ttookkf2Bb', 1, '11,April,2014, 16:03:48', NULL),
('COE12B002', 'BODDETI V J SOWJANYA', 'f', '3311000VlR', 1, '11,April,2014, 16:03:21', NULL),
('COE12B004', 'DEEPANSHU  GAUTAM', 'm', 'MMHHDDz9uu', 1, '11,April,2014, 16:19:03', NULL),
('COE12B005', 'GANTASALA SAI HEMANTH', 'm', '2200999Tt5', 1, '11,April,2014, 16:29:16', NULL),
('COE12B006', 'GUDDETI VENKAT SHIVA', 'm', 'KKFFBBB8wS', 1, '11,April,2014, 16:09:05', NULL),
('COE12B007', 'INIYAI T', 'f', 'iieeaav8Rl', 1, '11,April,2014, 15:45:08', NULL),
('COE12B008', 'JUNOOTHULA RASHMITHA REDDY', 'f', '1997766Ll2', 1, '11,April,2014, 15:47:05', NULL),
('COE12B009', 'KADIMISETTY AVINASH', 'm', 'CCXXTTO5kK', 1, '11,April,2014, 16:04:06', NULL),
('COE12B010', 'KAPIL GUPTA', 'm', 'bwwssnn3J1', 1, '11,April,2014, 16:47:41', NULL),
('COE12B011', 'KOMARAGIRI GOWTHAMI', 'f', '6MMMIIDdZU', 1, '11,April,2014, 15:41:52', NULL),
('COE12B012', 'KULDEEP GUNTA', 'm', 'pllhhcc9Yt', 1, '11,April,2014, 15:40:11', NULL),
('COE12B013', 'MAJETY HARI KRISHNA', 'm', '2008877So3', 1, '11,April,2014, 16:01:26', NULL),
('COE12B014', 'MEDHA VASISHTH', 'f', 'JEEAAVV6lN', 1, '11,April,2014, 16:26:30', NULL),
('COE12B015', 'NADA ABDUL MAJEED PULATH', 'f', 'idzzuuq6Q4', 1, '11,April,2014, 16:24:50', NULL),
('COE12B016', 'NAGALLA PRUTHVI', 'm', '9TTPPKKgGB', 0, '', NULL),
('COE12B017', 'NITHIN SHAMSUDHIN', 'm', 'ssoojjf1Aa', 1, '11,April,2014, 16:36:39', NULL),
('COE12B018', 'NITIN VIVEK BHARTI', 'm', '3311998Vq6', 1, '11,April,2014, 16:21:07', NULL),
('COE12B019', 'NOONE RAMYA', 'f', 'LHHCCYY9uP', 1, '11,April,2014, 15:44:16', NULL),
('COE12B020', 'OGURI SRI SIVA KRISHNA TEJA', 'm', 'kggbbxx7S5', 1, '11,April,2014, 16:10:57', NULL),
('COE12B021', 'PIDUGU SAI KISHORE', 'm', '0WWWRRNnIE', 1, '11,April,2014, 16:15:45', NULL),
('COE12B022', 'PONNEKANTI PRANEETH', 'm', 'zvvqqmm2Hd', 1, '11,April,2014, 16:14:48', NULL),
('COE12B023', 'POTHULABOGUDA  MADHURI', 'f', '5442200Xx7', 1, '11,April,2014, 15:45:44', NULL),
('COE12B024', 'PRANJAL CHOUBEY', 'm', 'SOOJJFF0bW', 1, '11,April,2014, 15:57:18', NULL),
('COE12B025', 'ROOPESH  REDDY K', 'm', 'lniieez9Z8', 1, '11,April,2014, 16:27:09', NULL),
('COE12B026', 'SAJJA BALASUBRAMANYAM', 'm', '2111YUUpPL', 1, '11,April,2014, 16:15:25', NULL),
('COE12B027', 'SHUBHAM KUMAR SINGH', 'm', 'gccxxtt5Ok', 1, '11,April,2014, 15:39:35', NULL),
('COE12B028', 'SIMMASETTY SOWMITH', 'm', '8665533Je0', 0, '', NULL),
('COE12B029', 'TOKALA AVINASH RAJ', 'm', 'ZVVQQMM3iD', 1, '11,April,2014, 16:13:40', NULL),
('COE12B030', 'VADYALA SAI PRAVEEN REDDY', 'm', 'uupplll2Gc', 1, '11,April,2014, 16:04:44', NULL),
('COE12D001', 'M.MOHAMED ASAN BASIN', 'm', '53322BBwWS', 1, '11,April,2014, 17:09:37', NULL),
('COE13B001', 'A NIRMAL KUMAR', 'm', 'Njjeeaa8vl', 1, '11,April,2014, 15:59:02', NULL),
('COE13B002', 'ABINAYA J L', 'f', '1997766Ll2', 1, '11,April,2014, 16:50:14', NULL),
('COE13B003', 'ADARSH SHRIVASTAVA', 'm', 'CCXXTTP5kK', 1, '11,April,2014, 16:35:14', NULL),
('COE13B004', 'CHAGAM YAMUNA', 'f', 'bbwwsnn5Jj', 1, '11,April,2014, 15:37:52', NULL),
('COE13B005', 'CHAKSHU JAIN', 'm', '6644IIDdZV', 1, '11,April,2014, 16:35:06', NULL),
('COE13B006', 'DHAYALAN B', 'm', 'YQLHCCC9tp', 1, '11,April,2014, 15:38:51', NULL),
('COE13B007', 'GANDHI SHUBHAM SUNIL', 'm', '2088775Nj3', 1, '11,April,2014, 16:34:38', NULL),
('COE13B008', 'GANIPAKA VAMSHI', 'm', 'ZVVRMMI3dd', 0, '', NULL),
('COE13B009', 'GANTA HARIKA', 'f', 'pp44221C99', 1, '11,April,2014, 16:39:51', NULL),
('COE13B011', 'KIRAN KUMAR K V', 'm', '7OOKKFFbBX', 1, '11,April,2014, 15:53:16', NULL),
('COE13B012', 'KOMMU LAKSHMI BHANU MOORTHY', 'm', 'jeaavvl6Nn', 1, '11,April,2014, 16:32:39', NULL),
('COE13B013', 'KORSA SANDHYA', 'f', '7766442HdD', 1, '11,April,2014, 15:42:09', NULL),
('COE13B014', 'L VIJAY SRI', 'f', 'YTTTPPk4gg', 1, '11,April,2014, 15:38:00', NULL),
('COE13B015', 'LOKESH KUMAR V', 'm', 'ss55332F00', 1, '11,April,2014, 15:39:38', NULL),
('COE13B016', 'M V SAI TEJA', 'm', 'RRMMIIE1zV', 1, '11,April,2014, 16:30:51', NULL),
('COE13B017', 'MOODE TAGORE NAIK', 'm', 'llhhccc9Yu', 0, '', NULL),
('COE13B018', 'MOOLAM HIMA SWETHA', 'f', '2008877OoK', 1, '11,April,2014, 15:37:58', NULL),
('COE13B019', 'NADIMPALLI KRUTHI MANOJNA', 'f', 'FFAAWWR6nn', 1, '11,April,2014, 15:48:26', NULL),
('COE13B020', 'NALLAGATLA PRAVEENA', 'f', 'vv66442H11', 1, '11,April,2014, 15:51:00', NULL),
('COE13B021', 'NUNAVATH MAHENDAR', 'm', 'YTTPPLL2gC', 1, '11,April,2014, 15:54:09', NULL),
('COE13B022', 'PRAVEEN KUMAR', 'm', 'sooojjf2Bb', 1, '11,April,2014, 16:31:23', NULL),
('COE13B023', 'R AVINASH', 'm', '3311999Vl6', 1, '11,April,2014, 15:36:32', NULL),
('COE13B024', 'RAMANADHAM HEMANTH KUMAR', 'm', 'MMMHHDD9yU', 1, '11,April,2014, 16:41:17', NULL),
('COE13B025', 'S. NEERAJ', 'm', 'kkggcc9X77', 1, '11,April,2014, 16:21:51', NULL),
('COE13B026', 'S.SESHURAM', 'm', '22AAWWSsNN', 1, '11,April,2014, 15:39:18', NULL),
('COE13B027', 'SAGGURTHI SUHAS', 'm', 'eezzvvq6Mm', 1, '11,April,2014, 15:46:45', NULL),
('COE13B028', 'SARATHI K', 'm', '7766442Gc0', 0, '', NULL),
('COE13B029', 'SHANTANU KARNWAL', 'm', 'XXXTOOO3kF', 1, '11,April,2014, 16:29:56', NULL),
('COE13B030', 'SHRUTI C SARASWATI', 'f', 'wllnnjj1E0', 1, '11,April,2014, 15:40:14', NULL),
('COE13B031', 'SRIPATHI ANASUYA SAI SRUTHI', 'f', '4433DDZzUU', 1, '11,April,2014, 15:50:24', NULL),
('COE13B032', 'SUDHEER SURENDRAN', 'm', 'llggccx9Tt', 1, '11,April,2014, 15:39:22', NULL),
('COE13B033', 'SUMA SODAGUDI', 'f', '0008777Nn3', 1, '11,April,2014, 15:39:46', NULL),
('COE13B034', 'SUSHMA', 'f', 'EEEAVVV6lM', 1, '11,April,2014, 15:49:28', NULL),
('COE13B035', 'THATIKONDA CHETANA ROHIT', 'm', 'ddyyuuu6Ql', 1, '11,April,2014, 16:32:55', NULL),
('COE13B036', 'THOKALA PRATHYUSHA.', 'f', 'GGBBXXS7oO', 1, '11,April,2014, 15:40:14', NULL),
('COE13D003', 'OSWALD. C', 'm', 'eaawwll5Ni', 1, '11,April,2014, 15:42:37', NULL),
('COE13D004', 'SHANMUGAKUMAR. M', 'm', '8866442Hd1', 0, '', NULL),
('EDM09B003', 'GHANSHYAM', 'm', 'YYTTPPK4gG', 1, '11,April,2014, 16:29:16', NULL),
('EDM09D001', 'B. MADHEVAN', 'm', 'ssoojj2F00', 1, '11,April,2014, 17:13:41', NULL),
('EDM09D002', 'E. PAPANASAM', 'm', 'NNIIEEZ9vV', 1, '11,April,2014, 17:11:27', NULL),
('EDM10B001', 'ANVITHA NANDIGAM ', 'f', 'lhhhyuu7Pp', 1, '11,April,2014, 17:10:20', NULL),
('EDM10B002', 'AVINASH CHANDRA KAUSHIK', 'm', '9977553Kf2', 1, '11,April,2014, 16:42:13', NULL),
('EDM10B003', 'CHAGALAMARRI HARI KRISHNA', 'm', 'AAWWRRN5jJ', 0, '', NULL),
('EDM10B004', 'CHANDRA KANTH. A ', 'm', 'zvvqq44H31', 1, '11,April,2014, 16:02:17', NULL),
('EDM10B005', 'GANDAM KUMAR RAJA', 'm', '7PPLLGGgCX', 1, '11,April,2014, 16:02:58', NULL),
('EDM10B006', 'KANNA VENKATESH', 'm', 'sookkff0Bw', 1, '11,April,2014, 16:03:42', NULL),
('EDM10B007', 'KEERTHI VIGNESH KUMAR.  J', 'm', '3110088Rl4', 1, '11,April,2014, 15:56:55', NULL),
('EDM10B008', 'LAXMAN RAM PRASAD REDDY. M', 'm', 'MHHDDYY7uQ', 1, '11,April,2014, 16:01:38', NULL),
('EDM10B009', 'NANDITA BHASKHAR', 'f', 'ggccxxt7T5', 1, '11,April,2014, 17:10:50', NULL),
('EDM10B010', 'PRANITHA BODLA ', 'f', '0088SSNnJE', 1, '11,April,2014, 16:07:22', NULL),
('EDM10B011', 'RAJ KUMAR. P ', 'm', 'zzvvlmm3Id', 1, '11,April,2014, 15:44:15', NULL),
('EDM10B012', 'RAVITEJA. J ', 'm', '6444211Cy7', 1, '11,April,2014, 16:01:49', NULL),
('EDM10B013', 'SAIBABA VEMURI', 'm', 'TOOKKFF0bX', 1, '11,April,2014, 16:03:48', NULL),
('EDM10B014', 'SANGEETHA. J', 'f', 'snnjjee0Av', 1, '11,April,2014, 17:12:05', NULL),
('EDM10B015', 'SREE CHANDRA TEJA INTURI', 'm', '311ZZUUqQL', 1, '11,April,2014, 15:56:26', NULL),
('EDM10B016', 'SRINIVAS. G', 'm', 'Gccyttt5pk', 1, '11,April,2014, 16:11:06', NULL),
('EDM10B017', 'V G SAI PHANI RAJA SEKHAR', 'm', '8775533Ff0', 1, '11,April,2014, 16:12:07', NULL),
('EDM10B018', 'VINEET. S ', 'm', 'AVVRRMM4iI', 1, '11,April,2014, 16:39:58', NULL),
('EDM10B019', 'MACHERLA SPOORTHY', 'f', 'zuuqqll2Hc', 1, '11,April,2014, 16:25:32', NULL),
('EDM10D001', 'K. ARUN', 'm', '544422BbXS', 1, '11,April,2014, 17:22:58', NULL),
('EDM10D002', 'RAJIN M LINUS', 'm', 'NNNJJff0aw', 0, '', NULL),
('EDM11B001', 'ADITYA NARAYANAN', 'm', '4331199Vv6', 1, '11,April,2014, 15:46:41', NULL),
('EDM11B002', 'B ASHOK BABU', 'm', 'LLHHCCC9yT', 1, '11,April,2014, 15:43:25', NULL),
('EDM11B003', 'BODDI REDDI SANJUSHA REDDY', 'f', 'kkggbbb8Xs', 1, '11,April,2014, 16:03:34', NULL),
('EDM11B004', 'CHUNDURI VENKATA DHEERAJ KUMAR', 'm', '1008866Rn3', 1, '11,April,2014, 15:34:54', NULL),
('EDM11B005', 'DAMMU SAICHARAN REDDY', 'm', 'IDDDZZU8qQ', 1, '11,April,2014, 16:00:59', NULL),
('EDM11B007', 'GUBBALA ANIL', 'm', 'tt55442G00', 1, '11,April,2014, 15:51:32', NULL),
('EDM11B008', 'JANASWAMY SRAVAN', 'm', '8SSOOJJfFA', 1, '11,April,2014, 15:47:59', NULL),
('EDM11B009', 'KATTUPALLI NAVYA', 'f', 'vllnnii1Ez', 0, '', NULL),
('EDM11B010', 'KORLABANDI SISIRSIMHA', 'm', '4221199Uu6', 1, '11,April,2014, 15:51:38', NULL),
('EDM11B011', 'M ABHISHRAVAN', 'm', 'PKKGGBB0xT', 1, '11,April,2014, 15:58:24', NULL),
('EDM11B012', 'M ASHWINI', 'f', 'ojjffaa8W6', 1, '11,April,2014, 15:34:53', NULL),
('EDM11B013', 'MORA RAJ KUMAR', 'm', '1119VVVqMM', 1, '11,April,2014, 17:11:19', NULL),
('EDM11B014', 'NANDAMURI SOWMIKA', 'f', 'Hccyyuu6pl', 1, '11,April,2014, 15:34:29', NULL),
('EDM11B015', 'NIKHIL SHARMA', 'm', '8775533Kf0', 1, '11,April,2014, 16:21:55', NULL),
('EDM11B016', 'P L N THANOJ KUMAR', 'm', 'AWWWRNN5iI', 1, '11,April,2014, 15:47:58', NULL),
('EDM11B017', 'PAPANABOYINA SRIKANTH', 'm', 'zvvqqmm4Hd', 1, '11,April,2014, 15:36:53', NULL),
('EDM11B018', 'PARMAR DHRUV CHETAN', 'm', '554422CcXX', 1, '11,April,2014, 15:50:57', NULL),
('EDM11B019', 'PUJARI KRISHNA SAGAR', 'm', 'OOO4433d19', 1, '11,April,2014, 15:58:58', NULL),
('EDM11B020', 'RATOD NAVEEN NAIK', 'm', 'UPPPLLH2cC', 1, '11,April,2014, 16:27:50', NULL),
('EDM11B021', 'S MAHESH VARMA', 'm', 'ookkff0B88', 1, '11,April,2014, 15:48:18', NULL),
('EDM11B022', 'SOMA LOKESH KUMAR NAGA MANIKANTA', 'm', '33EEAAVvRR', 1, '11,April,2014, 15:35:42', NULL),
('EDM11B023', 'SONTI AUROBINDO MALLESWAR', 'm', 'iiddzuu7Ql', 1, '11,April,2014, 16:00:15', NULL),
('EDM11B024', 'SORNAPUDI LAKSHMI NARESH', 'm', '9977554Kg2', 1, '11,April,2014, 15:48:24', NULL),
('EDM11B025', 'SWETHA M MANUR', 'f', 'BWWWSSO5jJ', 1, '11,April,2014, 15:34:45', NULL),
('EDM11B026', 'TUMMALA NIKHILA', 'f', 'avvllmm3I1', 1, '11,April,2014, 15:36:03', NULL),
('EDM11B027', 'UPPADA BALAKRISHNA', 'm', '6644HHCcYY', 1, '11,April,2014, 15:54:05', NULL),
('EDM12B001', 'AAQUILA ARUL ARZELA', 'f', 'ppkkggb0Xx', 1, '11,April,2014, 16:05:59', NULL),
('EDM12B002', 'AARTHI M SUNDARAM', 'f', '1000886Rn3', 1, '11,April,2014, 16:03:49', NULL),
('EDM12B003', 'ALLU ASHA KUMARI', 'f', 'IDDZZVV8qM', 1, '11,April,2014, 16:06:09', NULL),
('EDM12B004', 'AMBATI PRAVALLIKA', 'f', 'hccyytt5Pl', 1, '11,April,2014, 16:10:01', NULL),
('EDM12B005', 'ANKITH V', 'm', '877OJFFbBW', 1, '11,April,2014, 15:37:30', NULL),
('EDM12B006', 'ANUMULA TEJASWI', 'f', 'lnniiee9Zv', 1, '11,April,2014, 16:06:07', NULL),
('EDM12B007', 'AVULA VENKATA  SAI BHARGAV KUMAR ', 'm', '2211977Up4', 1, '11,April,2014, 16:17:28', NULL),
('EDM12B008', 'BANDHAMRAVURI UTTEJ', 'm', 'KGGCCXX7tO', 1, '11,April,2014, 16:04:31', NULL),
('EDM12B009', 'DASARI NAVEEN BABU', 'm', 'fffawws6Sn', 1, '11,April,2014, 16:16:58', NULL),
('EDM12B010', 'DEVARLA AVINASH ', 'm', '88QQMMIiDD', 1, '11,April,2014, 16:12:51', NULL),
('EDM12B012', 'GIRIDHARAN K', 'm', 'uupplll2Gc', 1, '11,April,2014, 15:37:01', NULL),
('EDM12B013', 'JACOB VAIDIAN P T', 'm', '5332200Bw7', 1, '11,April,2014, 15:58:53', NULL),
('EDM12B014', 'KALVAPALLI SRAVANA CHANDRA', 'f', 'RNNJJEE0aV', 1, '11,April,2014, 16:04:02', NULL),
('EDM12B015', 'KAVIYA R', 'f', 'qmmhhdd9Zu', 1, '11,April,2014, 16:04:41', NULL),
('EDM12B016', 'KOMARAVOLU KRISHNA KAUSHIK', 'm', '20099TTpPK', 1, '11,April,2014, 16:25:45', NULL),
('EDM12B017', 'KORLAPATI PRANEETH', 'm', 'FBBwwss5nj', 1, '11,April,2014, 15:44:46', NULL),
('EDM12B018', 'MASANAM SIVA SAI AKASH DEEP', 'm', '8866443Id1', 1, '11,April,2014, 16:17:43', NULL),
('EDM12B019', 'MOHAMMED AFROZE', 'm', 'YUUQQLL4hC', 1, '11,April,2014, 16:18:19', NULL),
('EDM12B020', 'MUDDADA AKHIL GANDHI', 'm', 'plccytt7Pk', 1, '11,April,2014, 16:14:29', NULL),
('EDM12B021', 'PANYALA SURYA KIRAN REDDY', 'm', 'AWWSSNN3jE', 1, '11,April,2014, 15:46:46', NULL),
('EDM12B022', 'PREETAM NAIK A', 'm', 'vqqmmii3Dd', 1, '11,April,2014, 16:24:43', NULL),
('EDM12B023', 'RAM KUMAR Y', 'm', '6442200CyY', 1, '11,April,2014, 15:37:44', NULL),
('EDM12B024', 'RANGU GOUTHAM', 'm', 'TTOOKKf2bb', 1, '11,April,2014, 16:15:15', NULL),
('EDM12B025', 'RAVIKANTI VIKRAM', 'm', 'n333110A88', 1, '11,April,2014, 15:50:56', NULL),
('EDM12B026', 'SALE MANOJ KUMAR', 'm', '8QQQMMHhDD', 1, '11,April,2014, 15:57:26', NULL),
('EDM12B027', 'SHASHIDHAR D', 'm', 'Yuupppl4gg', 1, '11,April,2014, 15:49:01', NULL),
('EDM12B028', 'SOUMYA S VASTRAD', 'f', '7755333Ff0', 1, '11,April,2014, 16:06:24', NULL),
('EDM12B029', 'VANGALA SUSMITHA REDDY', 'f', 'AWWRRRN5iI', 1, '11,April,2014, 15:46:34', NULL),
('EDM12B030', 'VIGNESH N', 'm', 'dzzzvvq6Mm', 1, '11,April,2014, 15:47:25', NULL),
('EDM12B031', 'VUYYURU ANUSHA', 'f', '9977555Ll2', 1, '11,April,2014, 16:15:12', NULL),
('EDM13B001', 'ALAJANGI V V S S L P TEJASRI', 'f', 'GGGBBXX7sS', 1, '11,April,2014, 15:51:48', NULL),
('EDM13B002', 'AMGOTH SWAMINATH', 'm', 'eaaawwl6Nn', 1, '11,April,2014, 15:42:46', NULL),
('EDM13B003', 'B TEJ KIRAN', 'm', '1998866Qm4', 1, '11,April,2014, 15:43:02', NULL),
('EDM13B004', 'BODEMPUDI VINEETHA', 'f', 'HHHCCYY7tT', 0, '', NULL),
('EDM13B005', 'CHUNDURU SHIVA KAUSHIK', 'm', 'okkffbb0Xx', 1, '11,April,2014, 15:42:08', NULL),
('EDM13B006', 'D.RAVALI', 'f', '3331100VvR', 1, '11,April,2014, 15:52:49', NULL),
('EDM13B007', 'GANJI JAYASREE', 'f', 'QQMMMII1dz', 0, '', NULL),
('EDM13B008', 'GANTLA SAI ASRITHA', 'f', 'uuuppll2G0', 1, '11,April,2014, 15:57:19', NULL),
('EDM13B009', 'GEDI HARISH', 'm', '77755KKfFB', 1, '11,April,2014, 15:41:24', NULL),
('EDM13B010', 'JAJJARA SANDEEP', 'm', 'AWWWlln5jj', 1, '11,April,2014, 15:46:18', NULL),
('EDM13B011', 'JUNOOTHULA HARSHITHA REDDY', 'f', 'zz88666M43', 1, '11,April,2014, 15:56:22', NULL),
('EDM13B012', 'KANDUKURI PHALGUNI AISHWARYA', 'f', '111YYUUpPL', 1, '11,April,2014, 16:02:12', NULL),
('EDM13B013', 'KANIMOZHI S', 'f', 'gggbbxx7So', 1, '11,April,2014, 15:56:27', NULL),
('EDM13B014', 'KUDUPUDI RAJESH', 'm', '1000886Rn5', 1, '11,April,2014, 15:55:01', NULL),
('EDM13B015', 'M S ADARSH', 'm', 'MIIIDDZ9vV', 0, '', NULL),
('EDM13B016', 'MALLIKARJUN AKKENAPALLY', 'm', 'qqllhhc1Cy', 1, '11,April,2014, 16:16:57', NULL),
('EDM13B017', 'MANDAVA POOJITHA', 'f', '5444220Bx8', 1, '11,April,2014, 15:54:27', NULL),
('EDM13B018', 'MANNE SAI SRAVAN', 'm', 'JEEAAWW8IR', 1, '11,April,2014, 15:49:51', NULL),
('EDM13B019', 'MUKKALA AVINASH REDDY', 'm', 'miiddzz9Uu', 1, '11,April,2014, 15:54:43', NULL),
('EDM13B020', 'NAVULURI MADHURI KRISHNA', 'f', '2211999TtP', 1, '11,April,2014, 15:53:43', NULL),
('EDM13B021', 'P.K.ASHREYA', 'm', 'OOKKFFF0bx', 1, '11,April,2014, 15:38:12', NULL),
('EDM13B022', 'PILLALAMARRIKRISHNA CHANDRA', 'm', 'snnjjje1A0', 0, '', NULL),
('EDM13B023', 'POOJA MAHESH', 'f', '6444IIDdZZ', 1, '11,April,2014, 15:59:39', NULL),
('EDM13B024', 'PREETIKA MURALIDHARAN', 'f', 'UUPPlll2gc', 1, '11,April,2014, 15:58:46', NULL),
('EDM13B025', 'RAJA SRAVYA TANMAYEE', 'f', '7775533Ff0', 1, '11,April,2014, 16:00:39', NULL),
('EDM13B026', 'RATHOD RAJENDER', 'm', '100WWRRlNJ', 1, '11,April,2014, 16:20:12', NULL),
('EDM13B027', 'S MURALI KRISHNA NAIK', 'm', 'IEEEvvq6mm', 1, '11,April,2014, 15:44:51', NULL),
('EDM13B028', 'SALAVADI ANUSHA', 'f', '1199776Pp4', 1, '11,April,2014, 15:55:55', NULL),
('EDM13B029', 'SAMALA AKHILA', 'f', 'KKGGBBB8xS', 1, '11,April,2014, 16:01:55', NULL),
('EDM13B030', 'SHANIGARAPU MANISHA', 'f', 'njjjffa0Aw', 1, '11,April,2014, 15:55:19', NULL),
('EDM13B031', 'SIVAPRASAD SANTHOSH LIKITH NARAYAN', 'm', '4333119Zv8', 1, '11,April,2014, 15:55:33', NULL),
('EDM13B033', 'TARIGOPULA HOMA PRIYA', 'f', 'UQQQLLH2hC', 1, '11,April,2014, 15:53:14', NULL),
('EDM13B034', 'VANI MRUDULA MAGAPATI', 'f', 'xxttook4Kg', 1, '11,April,2014, 15:53:41', NULL),
('EDM13B035', 'VANUKURU LAKSHMI SOWJANYA', 'f', '6665533Ee0', 1, '11,April,2014, 16:00:12', NULL),
('EDM13B036', 'VAYILATI DURGA BHAVANI', 'f', 'EZZVVRR6mM', 0, '', NULL),
('EDM13B037', 'VISHNUBHOTLA RUKMINI DEVI', 'f', 'hddyyuu7Pp', 1, '11,April,2014, 15:55:02', NULL),
('EDM13B038', 'SYED RUKSHANA', 'f', '0099777Oo3', 1, '11,April,2014, 15:39:48', NULL),
('EDM13D001', 'KANAPARTHI V PHANI KUMAR', 'm', 'JJFFAAW8sS', 1, '11,April,2014, 17:04:45', NULL),
('EDS12M001', 'NARAYANAN P.P.', 'm', 'nniieez9Zv', 0, '', NULL),
('EDS12M003', 'NIRUPAM PAUL', 'm', '4221199YuU', 1, '11,April,2014, 17:03:29', NULL),
('EDS12M004', 'RAJMOHAN.S', 'm', 'TPPKKGG2bB', 1, '11,April,2014, 16:17:14', NULL),
('EDS12M006', 'SAMARESH CHANDRA NAYAK', 'm', 'wsssooj3Jf', 1, '11,April,2014, 17:01:24', NULL),
('EDS12M007', 'SANTHOSHKUMAR. M', 'm', '86644IIeEZ', 0, '', NULL),
('EDS12M008', 'SIKHARAM UDAY KIRAN', 'm', 'ZZUUQQl4lh', 0, '', NULL),
('EDS12M009', 'SIVAKUMAR ELANGOVAN', 'm', 'cxx7755P44', 1, '11,April,2014, 16:13:02', NULL),
('EDS12M010', 'VIPIN MUKUNDAN', 'm', '200WWSSnNJ', 1, '11,April,2014, 16:12:34', NULL),
('EDS12M011', 'VIPPIN CHANDHAR. S', 'm', 'IEEaavv8ll', 1, '11,April,2014, 16:14:31', NULL),
('EDS12M012', 'VORUGANTY RAKESH', 'm', '2119997Uq6', 1, '11,April,2014, 16:33:21', NULL),
('EDS13M001', 'ABHAY KUMAR', 'm', '5LLLGGCcXX', 1, '11,April,2014, 16:30:31', NULL),
('EDS13M002', 'ABHIJIT BALA', 'm', 'fffbbww6Sn', 1, '11,April,2014, 16:37:12', NULL),
('EDS13M003', 'ADDANKI SAI CHARAN', 'm', '1999886Rm4', 1, '11,April,2014, 16:37:52', NULL),
('EDS13M004', 'AMITABH', 'm', 'MHHHDDY9uU', 1, '11,April,2014, 16:32:05', NULL),
('EDS13M005', 'ANKUR AGARWAL. P', 'm', 'ppkkggc0Cx', 1, '11,April,2014, 16:36:35', NULL),
('EDS13M006', 'BALAKRISHNAN. N', 'm', '5332200Aw8', 1, '11,April,2014, 16:52:32', NULL),
('EDS13M007', 'GANDRA V MURALI KRISHNA REDDY', 'm', 'VRRRNNI3eE', 1, '11,April,2014, 16:36:59', NULL),
('EDS13M008', 'LAWANYA. R', 'f', 'zuuuqql4Lh', 1, '11,April,2014, 16:53:47', NULL),
('EDS13M009', 'MANO RAJASIMHAN. N', 'm', '7775544KgB', 1, '11,April,2014, 16:30:42', NULL),
('EDS13M010', 'NISHANTH. P. V', 'm', 'BBBWWSS5oO', 1, '11,April,2014, 17:02:53', NULL),
('EDS13M011', 'RAMDINESH P.C', 'm', 'jeeaavv8Rl', 1, '11,April,2014, 16:49:39', NULL),
('EDS13M012', 'S. DINESH KUMAR', 'm', '11199UUqQL', 1, '11,April,2014, 16:34:56', NULL),
('EDS13M013', 'S. KRISHNAKARTHIK', 'm', 'LGGGCCx9tt', 1, '11,April,2014, 16:35:32', NULL),
('EDS13M014', 'SARATHI KANNAN. R. S', 'm', 'kkkff00B87', 1, '11,April,2014, 16:35:28', NULL),
('EDS13M015', 'SATYA RAO TAMADAPU', 'm', '55IIEEEaAV', 1, '11,April,2014, 16:33:35', NULL),
('EDS13M016', 'VAKA BABU', 'm', 'QQQmmhh1dy', 1, '11,April,2014, 16:35:56', NULL),
('EDS13M017', 'VEGESNA S.M. SRINIVASAVARMA', 'm', 't554422C09', 1, '11,April,2014, 15:49:24', NULL),
('EDS13M018', 'VENKATESAN. K.T', 'm', 'XXSSOOJ3jF', 1, '11,April,2014, 16:49:19', NULL),
('MAT10D001', 'S. DEVI YAMINI', 'f', 'awwwlln5Ni', 1, '11,April,2014, 16:44:33', NULL),
('MAT11D001', 'T.P.SANDHYA', 'f', '8886644Hh1', 1, '11,April,2014, 16:46:13', NULL),
('MAT12D001', 'DHANALAKSHIMI', 'f', 'CCCYYTT7pP', 1, '11,April,2014, 15:58:18', NULL),
('MDM10B001', 'ANUJA KANTAREDDY?', 'f', 'kffbbxx8Ss', 1, '11,April,2014, 16:03:15', NULL),
('MDM10B002', 'AVINASH REDDY. K ', 'm', '1110088Rl5', 1, '11,April,2014, 15:50:59', NULL),
('MDM10B003', 'CHAITANYA. C. S ', 'm', 'MMMIIDD9zU', 1, '11,April,2014, 15:34:43', NULL),
('MDM10B004', 'C. CHINGMAK LACHUMONG ', 'm', 'pppllgg2Cc', 1, '11,April,2014, 17:26:01', NULL),
('MDM10B005', 'JAYANTH GOUTHAM. V ', 'm', '5333220Bw8', 1, '11,April,2014, 16:51:57', NULL),
('MDM10B006', 'JOSHI RAM. V ', 'm', 'WRRRNNJ3jE', 1, '11,April,2014, 16:09:00', NULL),
('MDM10B007', 'KARANTOTH SAI KUMAR?', 'm', 'zzvvqqq4Mh', 0, '', NULL),
('MDM10B008', 'NAVEEN. B ', 'm', '9775544Lg2', 0, '', NULL),
('MDM10B009', 'PRAKASH VARMA?Y. E ', 'm', 'GBBXSSO5kk', 1, '11,April,2014, 16:01:21', NULL),
('MDM10B010', 'SAIHAREESH. B ', 'm', 'faaawwl6N5', 0, '', NULL),
('MDM10B011', 'SATHISH KUMAR. S ', 'm', '199988QqMM', 1, '11,April,2014, 16:19:37', NULL),
('MDM10B012', 'SATHYANARAYANAN. N ', 'm', 'HHHCCyy7tp', 1, '11,April,2014, 16:39:10', NULL),
('MDM10B013', 'SHASHWAT JAIN?', 'm', 'kggg008X77', 1, '11,April,2014, 16:41:38', NULL),
('MDM10B014', ' SIDDHARTH. M ', 'm', '5JJJEEAaWW', 1, '11,April,2014, 17:04:15', NULL),
('MDM10B015', 'UTKARSH SHARMA?', 'm', 'Rmmmiid1zz', 1, '11,April,2014, 16:42:11', NULL),
('MDM10B016', 'VASANTH KUMAR. G ', 'm', '4422009Yy7', 1, '11,April,2014, 15:34:43', NULL),
('MDM10B017', 'G.V.S. SASANKA', 'm', 'TTOOKKK2fB', 1, '11,April,2014, 17:01:46', NULL),
('MDM10B018', 'N. HEMA RAJESH', 'm', 'wwwssnn3Je', 1, '11,April,2014, 17:03:45', NULL),
('MDM10B019', 'B. VINEELA DEVI', 'f', '8866443Id1', 1, '11,April,2014, 16:06:03', NULL),
('MDM11B001', 'ADITYA KULKARNI', 'm', 'ypkgcc9X75', 1, '11,April,2014, 16:26:43', NULL),
('MDM11B002', 'AMRUTALURI VINEEL CHANDRA', 'm', 'AVRNNii1ez', 1, '11,April,2014, 15:56:24', NULL),
('MDM11B003', 'ASHISH KUMAR', 'm', '2119776Pl4', 1, '11,April,2014, 16:55:11', NULL),
('MDM11B005', 'CHENGALA SUDHAKAR', 'm', 'BBBXTTO5kK', 1, '11,April,2014, 15:50:59', NULL),
('MDM11B007', 'DAKA PAVAN KUMAR REDDY', 'm', 'awllnjj1E0', 1, '11,April,2014, 15:34:44', NULL),
('MDM11B008', 'DIGALA LALIT KUMAR', 'm', 'DDZZUUQ6lL', 1, '11,April,2014, 15:54:17', NULL),
('MDM11B009', 'DURGAM GOUTHAM RAJ', 'm', 'xxttppk4Kg', 1, '11,April,2014, 16:25:09', NULL),
('MDM11B010', 'GUTTI NIKHILESH', 'm', '5553110AwW', 1, '11,April,2014, 16:04:10', NULL),
('MDM11B011', 'K S MANJUNATH', 'm', 'RMIIDDz9vv', 1, '11,April,2014, 16:31:27', NULL),
('MDM11B012', 'KUMAR ABHIMANYU', 'm', '2119977Pp4', 1, '11,April,2014, 16:29:49', NULL),
('MDM11B013', 'KUMBHAR PRAMOD YALLAPPA', 'm', 'KGGBXXX7sO', 1, '11,April,2014, 15:40:57', NULL),
('MDM11B014', 'MADALA RAJASEKHAR', 'm', 'eaawwll5Ni', 1, '11,April,2014, 15:59:52', NULL),
('MDM11B016', 'MAKULA KARTHIK', 'm', '8664422Hd1', 1, '11,April,2014, 15:48:06', NULL),
('MDM11B017', 'MOHIT VERMA', 'm', 'PPKKgcc9xt', 1, '11,April,2014, 16:45:46', NULL),
('MDM11B018', 'MULLAPUDI JOSHI', 'm', '2200866Sn3', 1, '11,April,2014, 15:45:55', NULL),
('MDM11B019', 'MUNIRAM MEENA', 'm', 'EEZZVVQ6qM', 1, '11,April,2014, 15:44:19', NULL),
('MDM11B020', 'NUKALAVAMSIKRISHNA', 'm', 'dyyuupp4Lg', 1, '11,April,2014, 15:59:48', NULL),
('MDM11B021', 'POLUR SAI SANKEERTH RAO', 'm', '553322BbWW', 1, '11,April,2014, 15:34:48', NULL),
('MDM11B022', 'PULIVARTHI NAGARJUNA', 'm', 'NNjjeea0av', 1, '11,April,2014, 15:45:52', NULL),
('MDM11B023', 'R AKHIL ABHILASH', 'm', '3319977Uq4', 1, '11,April,2014, 15:57:46', NULL),
('MDM11B024', 'RATHLA BALAJI NAIK', 'm', 'GGCCXXT7pP', 1, '11,April,2014, 16:24:50', NULL),
('MDM11B025', 'SAGAR DOLAS', 'm', 'fbbbwws7Nn', 1, '11,April,2014, 16:21:21', NULL),
('MDM11B026', 'SAURAV VERMA', 'm', '886644IiDD', 1, '11,April,2014, 16:27:59', NULL),
('MDM11B027', 'YASHESWI BOCHA', 'm', 'UQQllhh1cy', 1, '11,April,2014, 15:47:23', NULL),
('MDM11B028', 'YEVALKAR ABHISHEK ARUN', 'm', '4422008Xs7', 1, '11,April,2014, 16:21:26', NULL),
('MDM11D001', 'K. BALAJI', 'm', 'NNJJEAA0vV', 1, '11,April,2014, 17:07:32', NULL),
('MDM12B001', 'ABHILASH JOSEPH ABRAHAM', 'm', 'middzzu8Qq', 1, '11,April,2014, 16:15:37', NULL),
('MDM12B002', 'ADITYA CHILUKURI', 'm', '997755KkGG', 1, '11,April,2014, 15:53:29', NULL),
('MDM12B003', 'ANANTH B', 'm', 'BWWSooj3ff', 1, '11,April,2014, 15:57:51', NULL),
('MDM12B004', 'ANUJ AGRAWAL', 'm', '9986644Hh1', 1, '11,April,2014, 16:22:21', NULL),
('MDM12B005', 'ASHISH AMERICA', 'm', 'CYYUUPP4lG', 1, '11,April,2014, 16:22:24', NULL),
('MDM12B006', 'CHAVALI KAMESWARA PAVAN SAIGOPAL', 'm', 'xxssoo3K22', 1, '11,April,2014, 15:53:52', NULL),
('MDM12B007', 'GANESH S', 'm', '6NIIEEAaVV', 1, '11,April,2014, 16:06:24', NULL),
('MDM12B008', 'GOLI SAI KRISHNA', 'm', 'mhhhdyy7Uq', 1, '11,April,2014, 16:28:39', NULL),
('MDM12B009', 'GUTLA AKHILA', 'f', '0997755Kk2', 1, '11,April,2014, 15:36:20', NULL),
('MDM12B010', 'IRUKUVAJJALA SUJITH', 'm', 'BWWSSNN3je', 1, '11,April,2014, 16:27:49', NULL),
('MDM12B011', 'JUBIN ANTONY J', 'm', 'vlll443I19', 1, '11,April,2014, 16:23:00', NULL),
('MDM12B012', 'KOMMANABOINA MEGHANA SARAT', 'f', 'UPPLHHH1cY', 1, '11,April,2014, 15:36:05', NULL),
('MDM12B013', 'KUNDAN KUMAR', 'm', 'okkffbb8Xs', 1, '11,April,2014, 16:20:00', NULL),
('MDM12B014', 'MALLAMPATI TARAKESH', 'm', '1000886Rn5', 1, '11,April,2014, 15:55:54', NULL),
('MDM12B015', 'NENAVATH RAVI CHANDRA', 'm', 'IDDZZUU6ql', 1, '11,April,2014, 15:45:14', NULL),
('MDM12B016', 'PERLI RAVI TEJA', 'm', 'cyytt55K42', 1, '11,April,2014, 15:54:24', NULL),
('MDM12B017', 'POGULA SHIVA SHANKAR', 'm', 'WSSOOJJ3fA', 1, '11,April,2014, 15:42:58', NULL),
('MDM12B018', 'RAVI CHANDRA GOLI', 'm', 'llmmezz8Vq', 1, '11,April,2014, 15:54:33', NULL),
('MDM12B019', 'RINEETHA CHARLES', 'f', '99766LLgGC', 1, '11,April,2014, 16:01:42', NULL),
('MDM12B020', 'RITESH MEENA', 'm', 'XSSookf2fb', 1, '11,April,2014, 16:23:34', NULL),
('MDM12B021', 'SADHIQUE K KUNHAHAMED', 'm', '5533100Vv6', 1, '11,April,2014, 16:15:49', NULL),
('MDM12B022', 'SAI KRISHNA INENI', 'm', 'MMHHDDY9uU', 1, '11,April,2014, 16:17:28', NULL),
('MDM12B023', 'SAI MOULI MANOHAR RAO Y', 'm', 'lgggcxx7To', 1, '11,April,2014, 16:23:09', NULL),
('MDM12B024', 'SHREYA K', 'f', '008877NnJE', 1, '11,April,2014, 15:37:44', NULL),
('MDM12B025', 'VIKAS TIWARI', 'm', 'ZZvllmm3id', 1, '11,April,2014, 16:29:46', NULL),
('MDM12B026', 'VINOD M', 'm', '6442211Yy7', 1, '11,April,2014, 15:41:51', NULL),
('MDM12B027', 'VITHAL RAO V H R K', 'm', 'OOOKFFB0xX', 1, '11,April,2014, 15:57:04', NULL),
('MDM12B028', 'VYAS ADITYA KISHOR', 'm', 'njjeaav8Rl', 1, '11,April,2014, 16:23:39', NULL),
('MDM12B029', 'YEDDU CHAITANYA PRAKASH', 'm', '9998QQLlHH', 0, '', NULL),
('MDM13B001', 'ADITTYA', 'm', 'yytppkk2Gb', 1, '11,April,2014, 16:23:20', NULL),
('MDM13B002', 'C.PRITHVI', 'm', '5322008Wl6', 1, '11,April,2014, 17:01:20', NULL),
('MDM13B003', 'CHIRINELLI NAVEEN KUMAR', 'm', 'MMIIEEZ9vV', 1, '11,April,2014, 16:03:10', NULL),
('MDM13B004', 'DEEPAK', 'm', 'lhhccyy7U6', 1, '11,April,2014, 16:21:38', NULL),
('MDM13B005', 'DEWARLA SAI ANOOP', 'm', 'XXSOOKK2fB', 1, '11,April,2014, 16:29:49', NULL),
('MDM13B006', 'DIVYA SRI MAHANTHI', 'f', 'wlnniie1Aa', 1, '11,April,2014, 15:57:42', NULL),
('MDM13B007', 'G V BALAKRISHNA', 'm', '7766LHHcCY', 1, '11,April,2014, 16:22:10', NULL),
('MDM13B008', 'GOLLAPALLI ARUN TEJA', 'm', 'Tookggb0xx', 1, '11,April,2014, 17:07:11', NULL),
('MDM13B009', 'HERWADE SANKET KRISHNA', 'm', '1100886Rn5', 1, '11,April,2014, 16:35:12', NULL),
('MDM13B010', 'K RAMTHEERTH', 'm', 'IIDZZUU8qM', 1, '11,April,2014, 15:55:51', NULL),
('MDM13B011', 'K S KHARTHICKEYEN', 'm', 'ccyyttp5K4', 1, '11,April,2014, 15:34:00', NULL),
('MDM13B012', 'K.SAICHARAN', 'm', '77OOJJFfAA', 1, '11,April,2014, 16:22:00', NULL),
('MDM13B013', 'KOTHAPALLI SATYA DURGA PRASAD', 'm', 'llnniie1Zz', 1, '11,April,2014, 15:40:32', NULL),
('MDM13B014', 'MOGILI ADARSH', 'm', '2119977Pp4', 1, '11,April,2014, 15:45:12', NULL),
('MDM13B015', 'MRIDUL GANDHI', 'm', 'GGGBXXX7tO', 1, '11,April,2014, 16:32:35', NULL),
('MDM13B016', 'N PRAMODH', 'm', 'ffaawll5N3', 1, '11,April,2014, 16:24:00', NULL),
('MDM13B017', 'NARAYAN MURMU', 'm', '88QMMHHhDZ', 1, '11,April,2014, 16:32:56', NULL),
('MDM13B018', 'PARTHA SARADHI REDDY PERLA', 'm', 'uppllgg0Cx', 1, '11,April,2014, 15:43:05', NULL),
('MDM13B019', 'POLAVAINA RAJENDAR', 'm', '3320088Ws5', 1, '11,April,2014, 15:48:44', NULL),
('MDM13B020', 'RAMESH S', 'm', 'MDM13B020', 1, '11,April,2014, 15:55:06', NULL),
('MDM13B021', 'ROHIT RAJ', 'm', 'hhddyyu7Q6', 1, '11,April,2014, 16:32:52', NULL),
('MDM13B022', 'S CHANDRASEKAR', 'm', '0XXTOOOkKG', 1, '11,April,2014, 16:21:56', NULL),
('MDM13B023', 'S SARAVANAN', 'm', 'wssnjjj1Ea', 0, '', NULL),
('MDM13B024', 'SAI GURUPRASAD JAKKALA', 'm', '4331199Uu6', 1, '11,April,2014, 16:19:43', NULL),
('MDM13B025', 'SAMANTHULA RAHUL', 'm', 'LLHCCYY9tp', 1, '11,April,2014, 15:53:01', NULL),
('MDM13B026', 'SAMPATH KUMAR R S', 'm', 'fbb8877O53', 1, '11,April,2014, 16:20:06', NULL),
('MDM13B027', 'SNEHIL WANKHEDE', 'm', '1AAVVRRnNI', 1, '11,April,2014, 16:34:55', NULL),
('MDM13B028', 'SOUMYA ROKKAM', 'f', 'zzuuqql4Hh', 1, '11,April,2014, 15:51:44', NULL),
('MDM13B029', 'SUDDARSI SANDEEP', 'm', '5442200Xx7', 1, '11,April,2014, 15:34:01', NULL),
('MDM13B030', 'SUMIT RANJAN KUMAR', 'm', 'OOJJFFA0wW', 1, '11,April,2014, 16:30:44', NULL),
('MDM13B031', 'TALUPULA BALA NAGA YESWANTH', 'm', 'miiee99V86', 1, '11,April,2014, 15:55:01', NULL),
('MDM13B032', 'TEKUMATLA SHIVAKUMAR', 'm', '2CCYUUPpLL', 1, '11,April,2014, 15:52:48', NULL),
('MDM13B033', 'TUPILI SAI MANOJ REDDY', 'm', 'bxxssoo3Kf', 1, '11,April,2014, 15:41:12', NULL),
('MDM13B034', 'U VIVEK', 'm', '6553311Aa8', 1, '11,April,2014, 15:33:54', NULL),
('MDM13B035', 'UDA SAI KUMAR', 'm', 'VQMMHHD1yy', 1, '11,April,2014, 15:56:22', NULL),
('MDM13B036', 'V.JANESHWARAN', 'm', 'pllg000X97', 1, '11,April,2014, 16:19:51', NULL),
('MDM13B037', 'VIKAS SRIVASTAVA', 'm', '33FFBBWwSS', 1, '11,April,2014, 16:17:31', NULL),
('MDM13B038', 'VILLURI VENKATARAMANA', 'm', 'ieezzvv6Rm', 1, '11,April,2014, 15:33:43', NULL),
('MDM13D001', 'SANTHOSH', 'm', '7776444Hh1', 1, '11,April,2014, 15:35:56', NULL),
('MDM13D002', 'DEEPAKKUMAR. R', 'm', 'XXXTKKF2bb', 1, '11,April,2014, 16:45:00', NULL),
('MDM13D003', 'VINAYAGA MURUGA PANDY. N', 'm', 'nnjj100V86', 1, '11,April,2014, 15:58:13', NULL),
('MDS12M001', 'AMIT KUMAR BEDAKA', 'm', 'IIDDZZU8qQ', 1, '11,April,2014, 16:12:20', NULL),
('MDS12M002', 'ASHISH KUMAR', 'm', 'gccyytt5Pk', 1, '11,April,2014, 16:00:25', NULL),
('MDS12M003', 'NARENDRAN. G', 'm', '7753322FaW', 0, '', NULL),
('MDS12M004', 'NIRGUDE VISHAL VASANTRAO', 'm', 'RRMMIII1ez', 0, '', NULL),
('MDS12M006', 'SANAS MAYUR MOHAN', 'm', 'Duqlhcc1yu', 1, '11,April,2014, 16:14:14', NULL),
('MDS12M007', 'SHASHANK UKADLEY', 'm', 'BWWSSNN3fF', 1, '11,April,2014, 16:19:36', NULL),
('MDS12M008', 'SRINIVASAN G', 'm', 'lmmiddz9V8', 1, '11,April,2014, 16:33:18', NULL),
('MDS12M009', 'THIRUMAVALVAN. S', 'm', '211YTTPpLL', 0, '', NULL),
('MDS12M010', 'USHA. Y', 'f', 'bxxssoo3Jf', 1, '11,April,2014, 16:45:55', NULL),
('MDS12M011', 'UZWAL KIRAN ROKKALA', 'm', '3119886RmM', 1, '11,April,2014, 16:06:57', NULL),
('MDS12M012', 'VENKATARAMAN SAHOO', 'm', 'HDDYuuu6ll', 1, '11,April,2014, 16:14:52', NULL),
('MDS12M013', 'VIMAL . K.M', 'm', '9977553Kf2', 1, '11,April,2014, 16:00:00', NULL),
('MDS13M001', 'ABHINAV KUMAR SHARMA', 'm', 'AAWWSSN5jJ', 1, '11,April,2014, 16:25:53', NULL),
('MDS13M002', 'A.AJAY BABU', 'm', 'vvqqmmm3Id', 1, '11,April,2014, 15:37:08', NULL),
('MDS13M003', 'ARUNRAJ. R.S', 'm', '6442200YyT', 1, '11,April,2014, 15:40:20', NULL),
('MDS13M004', 'BANDIKE MANOHAR', 'm', 'OOKKFFF0bw', 1, '11,April,2014, 16:51:58', NULL),
('MDS13M005', 'BHEMISHETTY GAUTHAM', 'm', 'nnjjee0A88', 1, '11,April,2014, 15:51:14', NULL),
('MDS13M006', 'GOURAV PANDEY', 'm', 'ZZUUQQL4hH', 1, '11,April,2014, 15:49:27', NULL),
('MDS13M007', 'JAISWAL SANKET VIJAY ', 'm', 'xtttppk4Gg', 1, '11,April,2014, 16:26:02', NULL),
('MDS13M008', 'KARTHICK. K', 'm', '5331100WwR', 1, '11,April,2014, 15:39:06', NULL),
('MDS13M009', 'NITHIN S', 'm', 'MMIIDDz9vv', 1, '11,April,2014, 15:40:43', NULL),
('MDS13M010', 'P. GOHETH', 'm', 'l221199T75', 1, '11,April,2014, 15:42:03', NULL),
('MDS13M011', 'POYAREKAR SAIPRASAD SANJAY ', 'm', '5KKGGBBxXS', 1, '11,April,2014, 15:36:25', NULL),
('MDS13M012', 'PUNITH REDDY. V', 'm', 'jjjeeaa8Wl', 1, '11,April,2014, 16:30:05', NULL),
('MDS13M013', 'RAJ RAUJI DESAI', 'm', '1999866Qm2', 1, '11,April,2014, 16:33:48', NULL),
('MDS13M014', 'RAVI TIWARI', 'm', 'HCCCYYT7pP', 1, '11,April,2014, 15:48:51', NULL),
('MDS13M015', 'RICKEY RECON DALBEHERA', 'm', 'fbbxxss5O3', 1, '11,April,2014, 16:33:45', NULL),
('MDS13M016', 'RINKU KUMAR GOUDA', 'm', '8666NIIiEZ', 1, '11,April,2014, 15:50:57', NULL),
('MDS13M017', 'SIVACHITHAMBARAM. V', 'm', 'uuqqllh2Dy', 1, '11,April,2014, 15:37:48', NULL),
('PHY10D001', 'K. RAMACHANDRAN', 'm', '4422009Xt7', 1, '11,April,2014, 16:25:15', NULL),
('PHY13D001', 'ASHISH KUMAR', 'm', 'OJJJFAA0wW', 1, '11,April,2014, 15:50:55', NULL),
('EDM13D002', '', 'm', 'zxcdsa917', 1, '11,April,2014, 16:25:30', NULL),
('COE13B037', '', 'f', 'avtmeq333', 1, '11,April,2014, 16:15:08', NULL),
('COE14D001', '', 'm', 'COE14D001', 1, '11,April,2014, 16:36:40', NULL),
('COE14D002', '', 'm', 'COE14D002', 1, '11,April,2014, 16:49:41', NULL),
('COE13D002', '', 'f', 'kj61b8l22', 1, '11,April,2014, 16:24:14', NULL),
('COE13B010', '', 'm', 'mf83nxo99', 1, '11,April,2014, 16:15:06', NULL),
('COE13D001', '', 'm', 'zvv644433D19', 1, '11,April,2014, 16:07:01', NULL),
('PHY12D001', 'MANIMEGALAI', 'f', 'PHY12D001', 1, '11,April,2014, 16:53:15', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
