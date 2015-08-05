-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2015 at 08:44 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlineexamination`
--

-- --------------------------------------------------------

--
-- Table structure for table `exam_list`
--

CREATE TABLE IF NOT EXISTS `exam_list` (
`ExamID` int(10) NOT NULL,
  `ExamName` varchar(50) NOT NULL,
  `ExamDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_bank`
--

CREATE TABLE IF NOT EXISTS `exam_question_bank` (
`ExamId` int(10) NOT NULL,
  `QuestionNo` varchar(50) NOT NULL,
  `Question` varchar(200) NOT NULL,
  `Answer` varchar(50) NOT NULL,
  `OptionA` varchar(80) NOT NULL,
  `OptionB` varchar(80) NOT NULL,
  `OptionC` varchar(80) NOT NULL,
  `OptionD` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE IF NOT EXISTS `exam_results` (
  `UEID` varchar(20) NOT NULL,
  `ExamId` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `ExamName` varchar(50) NOT NULL,
  `MarksScored` int(20) NOT NULL,
  `TimeStamp` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`uid` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `firstname`, `lastname`, `username`, `emailid`, `password`) VALUES
(1, 'khushi', 'malhi', 'khushi', 'khushi_malhi@yahoo.in', 'khushdeep');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exam_list`
--
ALTER TABLE `exam_list`
 ADD PRIMARY KEY (`ExamID`);

--
-- Indexes for table `exam_question_bank`
--
ALTER TABLE `exam_question_bank`
 ADD PRIMARY KEY (`ExamId`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
 ADD PRIMARY KEY (`UEID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam_list`
--
ALTER TABLE `exam_list`
MODIFY `ExamID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_question_bank`
--
ALTER TABLE `exam_question_bank`
MODIFY `ExamId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

