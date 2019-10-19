-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2018 at 02:16 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `air_ticket_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline_table`
--

CREATE TABLE `airline_table` (
  `airline_id` int(10) NOT NULL,
  `airline_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline_table`
--

INSERT INTO `airline_table` (`airline_id`, `airline_name`) VALUES
(1, 'Jet Airways'),
(2, 'SpiceJet'),
(3, 'Indigo'),
(4, 'Go Air'),
(5, 'Air India'),
(6, 'Vistara');

-- --------------------------------------------------------

--
-- Table structure for table `city_table`
--

CREATE TABLE `city_table` (
  `city_id` int(3) NOT NULL,
  `city_name` varchar(30) NOT NULL,
  `city_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city_table`
--

INSERT INTO `city_table` (`city_id`, `city_name`, `city_code`) VALUES
(1, 'Patna', 'PAT'),
(2, 'Chennai', 'MAA'),
(14, 'Bangalore', 'BLR'),
(15, 'Ranchi', 'IXR'),
(16, 'Mumbai', 'BOM'),
(17, 'Kolkata', 'CCU'),
(18, 'New Delhi', 'DEL'),
(19, 'Hyderabad', 'HYD'),
(20, 'Trivandrum', 'TRV'),
(21, 'Kochi', 'COK'),
(22, 'Lucknow', 'LKO'),
(23, 'Pune', 'PNQ');

-- --------------------------------------------------------

--
-- Table structure for table `flight_info_table`
--

CREATE TABLE `flight_info_table` (
  `flight_info_id` int(10) NOT NULL,
  `flight_id` int(10) NOT NULL,
  `dept_date` date NOT NULL,
  `available_seat` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_info_table`
--

INSERT INTO `flight_info_table` (`flight_info_id`, `flight_id`, `dept_date`, `available_seat`) VALUES
(1, 1, '2018-10-05', 142),
(2, 3, '2018-10-05', 199),
(3, 1, '2018-11-05', 149),
(4, 4, '2018-11-17', 221),
(5, 2, '2018-10-18', 99);

-- --------------------------------------------------------

--
-- Table structure for table `flight_table`
--

CREATE TABLE `flight_table` (
  `flight_id` int(10) NOT NULL,
  `flight_code` varchar(10) NOT NULL,
  `airline_id` int(10) NOT NULL,
  `from_location` varchar(30) NOT NULL,
  `to_location` varchar(30) NOT NULL,
  `dept_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `duration` double NOT NULL,
  `total_seat` int(100) NOT NULL,
  `frequency` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_table`
--

INSERT INTO `flight_table` (`flight_id`, `flight_code`, `airline_id`, `from_location`, `to_location`, `dept_time`, `arrival_time`, `duration`, `total_seat`, `frequency`, `price`, `status`) VALUES
(1, '6E024', 3, 'Trivandrum', 'Chennai', '11:11:13', '12:05:00', 1, 150, 'Monday-Tuesday-Wednesday-Friday-Saturday', 2500, 1),
(2, 'ast12', 6, 'Kolkata', 'Hyderabad', '12:03:00', '15:05:00', 3, 100, 'Tuesday-Thursday-Saturday', 5000, 1),
(3, 'G6 839', 4, 'Trivandrum', 'Lucknow', '23:30:00', '01:30:00', 2, 200, 'Monday-Wednesday-Friday-Saturday', 6491, 1),
(4, 'J765', 1, 'Chennai', 'Kolkata', '14:59:00', '16:58:00', 2, 222, 'Wednesday-Saturday', 4491, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_detail_table`
--

CREATE TABLE `ticket_detail_table` (
  `ticket_id` int(10) NOT NULL,
  `pnr` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `flight_id` int(10) NOT NULL,
  `dept_date` date NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_detail_table`
--

INSERT INTO `ticket_detail_table` (`ticket_id`, `pnr`, `username`, `name`, `age`, `gender`, `flight_id`, `dept_date`, `status`) VALUES
(1, '8TKTTF', 'rishabh', 'Rahul', 21, 'Male', 1, '2018-10-05', '0'),
(2, '8TKTTF', 'rishabh', 'Rishabh', 22, 'Male', 1, '2018-10-05', '0'),
(3, 'MYJHMG', 'jeevesh', 'Shubham', 21, 'Male', 3, '2018-10-05', '1'),
(4, 'MYJHMG', 'jeevesh', 'Jeevesh', 21, 'Male', 3, '2018-10-05', '1'),
(5, '5AXULB', 'rishabh', 'Rahul', 23, 'Male', 1, '2018-11-05', '1'),
(6, '1TQ953', 'rahul', 'Rahul', 22, 'Male', 4, '2018-11-17', '1'),
(7, '1TQ953', 'rahul', 'Rinki', 20, 'Female', 4, '2018-11-17', '1'),
(8, '1TQ953', 'rahul', 'Pinky', 2, 'Female', 4, '2018-11-17', '1'),
(9, 'EZ4NC0', 'rahul', 'Shubham', 22, 'Male', 2, '2018-10-18', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `city` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`name`, `username`, `password`, `email`, `mobile`, `city`, `role`, `gender`, `status`) VALUES
('Shubham Melvin Felix', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@airbook.com', '8473938485', 'Bettiah', 'admin', 'male', 1),
('Jeevesh', 'jeevesh', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'jeevesh@akf.co', '9876545678', 'lucknow', 'user', 'Male', 1),
('Nikhil Kumar', 'nikhil', '12e71ffdacb0c67dd9a8e56fc1b6f20e25742bf031b4eb80cb9e28d0377099e3', 'nikhil@gmail.com', '7656789765', 'Delhi', 'user', 'male', 1),
('Priya Jaiswal', 'priya', '44bcff24eb6751fdcc80626affe0ad38e91deadf89b4c1df821055688b96aa47', 'priya@af.com', '2728282828', 'Patna', 'user', 'Female', 1),
('Rahul', 'rahul', 'af4a400a2ceb7963a424d9cf3779175c8d258facf8a31ee8bc1949dc060e10e6', 'rahul@dhds.co', '3534246432', 'Dhanbad', 'user', 'Male', 1),
('Ram Patel', 'rampatel', '6aac876112ec901c00eb56b6068f6fe8d122f3e6f51931d695809fa04dcc7a6f', 'ram@patel.com', '1234123412', 'Delhi', 'user', 'Male', 0),
('Rishabh Dev Gupta', 'rishabh', '12e71ffdacb0c67dd9a8e56fc1b6f20e25742bf031b4eb80cb9e28d0377099e3', 'rish@hf.com', '7849392929', 'Patna', 'user', 'Male', 1),
('Ritesh Kumar', 'ritesh', '84696d86eb6abe2025ed83e54fd192202917fe6a305c989fff0a616e300680b1', 'ritesh@gmail.com', '7282929292', 'Kolkatta', 'user', 'Male', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline_table`
--
ALTER TABLE `airline_table`
  ADD PRIMARY KEY (`airline_id`);

--
-- Indexes for table `city_table`
--
ALTER TABLE `city_table`
  ADD PRIMARY KEY (`city_id`),
  ADD UNIQUE KEY `city_code` (`city_code`);

--
-- Indexes for table `flight_info_table`
--
ALTER TABLE `flight_info_table`
  ADD PRIMARY KEY (`flight_info_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `flight_table`
--
ALTER TABLE `flight_table`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `airline_id` (`airline_id`);

--
-- Indexes for table `ticket_detail_table`
--
ALTER TABLE `ticket_detail_table`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airline_table`
--
ALTER TABLE `airline_table`
  MODIFY `airline_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `city_table`
--
ALTER TABLE `city_table`
  MODIFY `city_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `flight_info_table`
--
ALTER TABLE `flight_info_table`
  MODIFY `flight_info_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `flight_table`
--
ALTER TABLE `flight_table`
  MODIFY `flight_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket_detail_table`
--
ALTER TABLE `ticket_detail_table`
  MODIFY `ticket_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_info_table`
--
ALTER TABLE `flight_info_table`
  ADD CONSTRAINT `flight_info_table_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight_table` (`flight_id`);

--
-- Constraints for table `flight_table`
--
ALTER TABLE `flight_table`
  ADD CONSTRAINT `flight_table_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline_table` (`airline_id`);

--
-- Constraints for table `ticket_detail_table`
--
ALTER TABLE `ticket_detail_table`
  ADD CONSTRAINT `ticket_detail_table_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user_table` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
