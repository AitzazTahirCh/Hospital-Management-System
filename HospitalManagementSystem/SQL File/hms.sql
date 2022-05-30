-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 27, 2021 at 07:01 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geekprofile`
--
CREATE DATABASE IF NOT EXISTS `geekprofile` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `geekprofile`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `email`, `city`, `country`) VALUES
('ahmed', 'ahmed', 'ahmed@yahoo.com', 'manchester', 'u'),
('ali', 'ali', 'ali@gmail.com', 'at', 'pk'),
('zaz', 'zaz', 'zaz@gmail.com', 'skt', 'pak');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE IF NOT EXISTS `car` (
  `price` varchar(100) NOT NULL,
  `model` varchar(50) NOT NULL,
  `make` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `username` varchar(50) NOT NULL,
  KEY `uk` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`price`, `model`, `make`, `year`, `description`, `username`) VALUES
('80000000000', 'vbtr', 'tebt', '808', 'bttrwbr', 'zaz'),
('80000000000', 'vbtr', 'tebt', '808', 'bttrwbr', 'zaz'),
('800', 'jb', 'jbhhk', '2020', 'jvhjv ', 'ali'),
('80', 'tbs', 'bta', '20', 'eaba', 'ahmed');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `uk` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`) ON DELETE CASCADE;
--
-- Database: `hms`
--
CREATE DATABASE IF NOT EXISTS `hms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hms`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'admin123', '12-12-2021 11:42:05 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(8, 'Psychiatrist', 12, 8, 1000, '2021-12-23', '11:15 PM', '2021-12-14 18:11:41', 1, 1, NULL),
(9, 'Nutritionist', 13, 9, 2000, '2021-12-14', '12:15 AM', '2021-12-14 19:12:31', 1, 0, '2021-12-14 19:21:56'),
(10, 'Nutritionist', 13, 9, 2000, '2021-12-15', '12:24 AM', '2021-12-14 19:23:03', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(12, 'Psychiatrist', 'ali', 'Lahore', '1000', 784121025452, 'ali@gmail.com', '984d8144fa08bfc637d2825463e184fa', '2021-12-14 18:07:00', NULL),
(13, 'Nutritionist', 'aleena', 'CMH Sialkot', '2000', 856202455, 'aleena@gmail.com', '20ce61319e3a050906e2323cedce34fa', '2021-12-14 19:10:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

DROP TABLE IF EXISTS `doctorslog`;
CREATE TABLE IF NOT EXISTS `doctorslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(29, NULL, 'ali', 0x3a3a3100000000000000000000000000, '2021-12-14 18:08:29', NULL, 0),
(30, NULL, 'ali', 0x3a3a3100000000000000000000000000, '2021-12-14 18:08:36', NULL, 0),
(31, 12, 'ali@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 18:09:03', '14-12-2021 11:40:07 PM', 1),
(32, NULL, 'ali', 0x3a3a3100000000000000000000000000, '2021-12-14 18:56:03', NULL, 0),
(33, 12, 'ali@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 18:56:13', NULL, 1),
(34, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:13:17', '15-12-2021 12:47:02 AM', 1),
(35, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:17:16', '15-12-2021 12:49:31 AM', 1),
(36, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:21:19', '15-12-2021 12:52:20 AM', 1),
(37, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:23:28', '27-12-2021 05:33:07 PM', 1),
(38, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-27 12:07:38', NULL, 1),
(39, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-27 15:15:10', '27-12-2021 08:46:21 PM', 1),
(40, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-27 16:04:49', '27-12-2021 09:53:12 PM', 1),
(41, 13, 'aleena@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-27 18:32:25', '28-12-2021 12:07:04 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

DROP TABLE IF EXISTS `doctorspecilization`;
CREATE TABLE IF NOT EXISTS `doctorspecilization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Psychiatrist', '2021-12-14 18:02:19', NULL),
(2, 'Neurologist', '2021-12-14 18:02:19', NULL),
(3, 'Gynecologist', '2021-12-14 18:02:57', NULL),
(4, 'Physiotherapist', '2021-12-14 18:02:57', NULL),
(5, 'General Practitioner', '2021-12-14 18:04:52', NULL),
(6, 'Nutritionist', '2021-12-14 18:06:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

DROP TABLE IF EXISTS `tblcontactus`;
CREATE TABLE IF NOT EXISTS `tblcontactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IsRead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(5, 'test', 'test@gmail.com', 924856484149845, ' just testing your service', '2021-12-14 18:15:54', 'oh okayy', '2021-12-14 18:16:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

DROP TABLE IF EXISTS `tblmedicalhistory`;
CREATE TABLE IF NOT EXISTS `tblmedicalhistory` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(8, 7, 'normal', 'good', '71', 'normal', 'take this diet for better health, otherwise u are fit', '2021-12-14 19:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

DROP TABLE IF EXISTS `tblpatient`;
CREATE TABLE IF NOT EXISTS `tblpatient` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(7, 13, 'zaz', 8645168151, 'zaz@gmail.com', 'male', 'Sialkot', 20, 'None', '2021-12-14 19:16:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(30, NULL, 'test', 0x3a3a3100000000000000000000000000, '2021-12-14 17:59:09', NULL, 0),
(31, NULL, 'test', 0x3a3a3100000000000000000000000000, '2021-12-14 17:59:18', NULL, 0),
(32, 8, 'test@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 18:10:57', '14-12-2021 11:41:57 PM', 1),
(33, 9, 'zaz@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:09:02', '15-12-2021 12:39:22 AM', 1),
(34, 9, 'zaz@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:12:03', '15-12-2021 12:42:52 AM', 1),
(35, 9, 'zaz@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-14 19:22:31', '15-12-2021 12:53:17 AM', 1),
(36, 9, 'zaz@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-27 12:06:25', '27-12-2021 05:37:25 PM', 1),
(37, 9, 'zaz@gmail.com', 0x3a3a3100000000000000000000000000, '2021-12-27 18:21:47', '28-12-2021 12:02:13 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(8, 'test', 'i am test', 'lahore', 'male', 'test@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', '2021-12-14 17:57:33', '2021-12-14 17:58:58'),
(9, 'zaz', 'zaz', 'Sialkot', 'male', 'zaz@gmail.com', 'ef779e4373fe8096099ea3380588326c', '2021-12-14 19:08:47', NULL);
--
-- Database: `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `school`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `roll_no` varchar(10) NOT NULL,
  `status` enum('P','A','L','-') NOT NULL DEFAULT '-',
  `date` date NOT NULL,
  PRIMARY KEY (`roll_no`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`roll_no`, `status`, `date`) VALUES
('St01', 'A', '2021-01-01'),
('St01', 'A', '2021-01-02'),
('St01', 'P', '2021-01-03'),
('St01', 'P', '2021-01-04'),
('St02', 'A', '2021-01-01'),
('St02', 'P', '2021-01-02'),
('St02', 'P', '2021-01-03'),
('St02', 'A', '2021-01-04'),
('St03', 'P', '2021-01-01'),
('St03', 'P', '2021-01-02'),
('St03', 'A', '2021-01-03'),
('St03', 'P', '2021-01-04'),
('St04', 'L', '2021-01-01'),
('St04', 'P', '2021-01-02'),
('St04', 'L', '2021-01-03'),
('St04', 'P', '2021-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
CREATE TABLE IF NOT EXISTS `logins` (
  `user_id` varchar(10) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `flag` enum('admin','student','teacher') NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`user_id`, `pass`, `flag`) VALUES
('1', 'fa6300480577d8ad30c7e23f2d69a5b2c53a75cf', 'admin'),
('St01', '9ba2f8bb2882577d9943ff819368d001e710cba3', 'student'),
('St02', '445a87c7021033af556f327fc7ed800dbb5e6835', 'student'),
('St03', '7209d531b7fd6147d9b3957f94c44d9a3eb6f0e6', 'student'),
('St04', '141761b737327f79694bab88e6581e0b7295f8c2', 'student'),
('Te01', '24ebbc832b732042448fe71e54261699b99e808b', 'teacher'),
('Te02', 'f9272825152a4f2b4b6a19541399f05a96d7fa49', 'teacher'),
('Te03', '26d4601baf96e45d86ee129190265a9b234b1077', 'teacher'),
('Te04', 'e454fd0362088513651f939c59f5be7208875aef', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `roll_no` varchar(10) NOT NULL,
  `f_name` varchar(10) NOT NULL,
  `l_name` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `city` varchar(10) NOT NULL,
  `CNIC` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `age` decimal(2,0) NOT NULL,
  `class_no` varchar(5) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `CNIC` (`CNIC`),
  KEY `users_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`roll_no`, `f_name`, `l_name`, `DOB`, `city`, `CNIC`, `gender`, `age`, `class_no`, `user_id`) VALUES
('St01', 'Muhammad', 'Ahmed', '2002-10-01', 'Islamabad', '17881-9345342-3', 'M', '18', '11', 'St01'),
('St02', 'Muhammad', 'Rashid', '2002-02-01', 'Islamabad', '17801-10003563-4', 'M', '18', '11', 'St02'),
('St03', 'Khurram', 'Manzoor', '2001-03-21', 'Islamabad', '17801-89303842-5', 'M', '18', '11', 'St03'),
('St04', 'Bilal', 'Ashraf', '1999-01-02', 'Islamabad', '17201-2200021-5', 'M', '21', '11', 'St04');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_id` varchar(10) NOT NULL,
  `subject_name` varchar(10) NOT NULL,
  `teacher_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `teacher_fk` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`, `teacher_id`) VALUES
('GS02', 'Physics', 'Te04'),
('HU1', 'English', 'Te03'),
('HU2', 'Urdu', 'Te02'),
('MT1', 'Calulus 1', 'Te01');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher_id` varchar(10) NOT NULL,
  `f_name` varchar(10) NOT NULL,
  `l_name` varchar(10) NOT NULL,
  `CNIC` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `age` decimal(2,0) NOT NULL,
  `phone_no` decimal(15,0) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `CNIC` (`CNIC`),
  KEY `user_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `f_name`, `l_name`, `CNIC`, `DOB`, `gender`, `age`, `phone_no`, `user_id`) VALUES
('Te01', 'Alam', 'Khan', '18821-993345-4', '1970-02-12', 'M', '51', '3045050325', 'Te01'),
('Te02', 'Mursaleen', 'Paracha', '19121-9324098-2', '1990-12-01', 'M', '30', '3001124675', 'Te02'),
('Te03', 'Saima', 'Ambreen', '20334-89302741-1', '1985-05-22', 'F', '35', '3129900882', 'Te03'),
('Te04', 'Haider', 'Haider', '34952-15199319-2', '1994-01-01', 'M', '26', '3334502987', 'Te04');

-- --------------------------------------------------------

--
-- Table structure for table `transcript`
--

DROP TABLE IF EXISTS `transcript`;
CREATE TABLE IF NOT EXISTS `transcript` (
  `obtained_marks` decimal(3,0) DEFAULT '0',
  `total_marks` decimal(3,0) DEFAULT '100',
  `subject_id` varchar(10) NOT NULL,
  `roll_no` varchar(10) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subject_id`,`roll_no`),
  KEY `rollno_fk` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcript`
--

INSERT INTO `transcript` (`obtained_marks`, `total_marks`, `subject_id`, `roll_no`, `remark`) VALUES
('80', '100', 'GS02', 'St01', 'keep it up.'),
('88', '100', 'GS02', 'St02', 'Excellent'),
('52', '100', 'GS02', 'St03', 'Work Hard!'),
('90', '100', 'GS02', 'St04', 'Very well done'),
('80', '100', 'HU1', 'St01', 'keep it up.'),
('72', '100', 'HU1', 'St02', 'Good'),
('76', '100', 'HU1', 'St03', 'Good'),
('93', '100', 'HU1', 'St04', 'Excellent'),
('80', '100', 'HU2', 'St01', 'keep it up.'),
('55', '100', 'HU2', 'St02', 'Satisfactory Effort'),
('52', '100', 'HU2', 'St03', 'Satisfactory Effort'),
('62', '100', 'HU2', 'St04', 'Average Performance'),
('80', '100', 'MT1', 'St01', 'keep it up.'),
('80', '100', 'MT1', 'St02', 'Good Job'),
('73', '100', 'MT1', 'St03', 'Good'),
('44', '100', 'MT1', 'St04', 'Poor Performance');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `roll_no_fk` FOREIGN KEY (`roll_no`) REFERENCES `students` (`roll_no`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `users_fk` FOREIGN KEY (`user_id`) REFERENCES `logins` (`user_id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `teacher_fk` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `logins` (`user_id`);

--
-- Constraints for table `transcript`
--
ALTER TABLE `transcript`
  ADD CONSTRAINT `rollno_fk` FOREIGN KEY (`roll_no`) REFERENCES `students` (`roll_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE;
--
-- Database: `temp`
--
CREATE DATABASE IF NOT EXISTS `temp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `temp`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `parent`) VALUES
(1, 'ELECTRONICS', NULL),
(2, 'TELEVISIONS', 1),
(3, 'TUBE', 2),
(4, 'LCD', 2),
(5, 'PLASMA', 2),
(6, 'PORTABLE ELECTRONICS', 1),
(7, 'MP3 PLAYERS', 6),
(8, 'FLASH', 7),
(9, 'CD PLAYERS', 6),
(10, '2 WAY RADIOS', 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `my`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `my`;
CREATE TABLE IF NOT EXISTS `my` (
`lev1` varchar(20)
,`lev2` varchar(20)
,`lev3` varchar(20)
,`lev4` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `my`
--
DROP TABLE IF EXISTS `my`;

DROP VIEW IF EXISTS `my`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `my`  AS  select `t1`.`name` AS `lev1`,`t2`.`name` AS `lev2`,`t3`.`name` AS `lev3`,`t4`.`name` AS `lev4` from (((`category` `t1` left join `category` `t2` on((`t2`.`parent` = `t1`.`category_id`))) left join `category` `t3` on((`t3`.`parent` = `t2`.`category_id`))) left join `category` `t4` on((`t4`.`parent` = `t3`.`category_id`))) where (`t1`.`name` = 'ELECTRONICS') ;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
CREATE TABLE IF NOT EXISTS `logins` (
  `user_id` varchar(10) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`user_id`, `pass`, `email`) VALUES
('zaz', '84d357b780a96b277a40a01df7778ef40001498c', 'zaz@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
