-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 07, 2019 at 01:42 PM
-- Server version: 5.7.22
-- PHP Version: 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SumberRejeki`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`id`, `name`, `password`, `state_id`) VALUES
(1, 'Citra', 'Citra', 2),
(2, 'Ajie', 'Ajie', 3),
(3, 'Fian', 'Fian', 2),
(5, 'Aulia', 'Aulia', 2),
(6, 'Lindaa', 'Linda', 3),
(7, 'Ega', 'Ega', 3),
(8, 'Wifdaa', 'Wifda', 3),
(9, 'Reza', 'Reza', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `name`, `total`) VALUES
(1, 'Minyak Goreng', 3),
(3, 'Beras', 2),
(4, 'Gula', 0),
(5, 'Garam', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Detail`
--

CREATE TABLE `Detail` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Detail`
--

INSERT INTO `Detail` (`id`, `transaction_id`, `item_id`, `total`, `price`) VALUES
(76, 83, 1, 3, 75000),
(78, 117, 1, 1, 25000),
(79, 118, 4, 1, 65000),
(80, 118, 2, 1, 32000),
(81, 122, 3, 2, 128000),
(82, 122, 2, 1, 32000),
(83, 123, 2, 2, 64000),
(85, 124, 1, 1, 25000),
(86, 125, 1, 1, 25000),
(87, 125, 3, 1, 64000),
(88, 126, 2, 1, 32000),
(89, 126, 4, 1, 65000),
(90, 127, 1, 2, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `buy` int(11) NOT NULL,
  `sell` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Item`
--

INSERT INTO `Item` (`id`, `name`, `buy`, `sell`, `stock`, `category_id`) VALUES
(1, 'Tropical 1L', 18000, 25000, 6, 1),
(2, 'Tropical 2L', 27000, 32000, 4, 1),
(3, 'Putri Biru 5KG', 60000, 64000, 6, 3),
(4, 'Pinpin 5 KG', 55000, 65000, 4, 3),
(5, 'Bimoli 2L', 21000, 23000, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `State`
--

CREATE TABLE `State` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `State`
--

INSERT INTO `State` (`id`, `name`, `total`) VALUES
(2, 'boss', 3),
(3, 'cashier', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE `Transaction` (
  `id` int(11) NOT NULL,
  `time` varchar(50) NOT NULL,
  `account_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `profit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Transaction`
--

INSERT INTO `Transaction` (`id`, `time`, `account_id`, `total`, `profit`) VALUES
(83, '06-06-2019 18:34:38', 2, 75000, 21000),
(117, '25-06-2019 12:53:43', 2, 25000, 7000),
(118, '25-06-2019 12:55:11', 2, 97000, 15000),
(122, '25-06-2019 13:22:17', 2, 160000, 13000),
(123, '25-06-2019 14:21:04', 2, 64000, 10000),
(124, '27-06-2019 01:55:34', 2, 25000, 7000),
(125, '27-06-2019 02:20:58', 2, 89000, 11000),
(126, '27-06-2019 05:24:16', 2, 97000, 15000),
(127, '01-07-2019 12:56:10', 2, 50000, 14000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_state` (`state_id`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Detail`
--
ALTER TABLE `Detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `good_id` (`item_id`);

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `State`
--
ALTER TABLE `State`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashier_id` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Detail`
--
ALTER TABLE `Detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `Item`
--
ALTER TABLE `Item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `State`
--
ALTER TABLE `State`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `State` (`id`);

--
-- Constraints for table `Detail`
--
ALTER TABLE `Detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `Transaction` (`id`),
  ADD CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Item` (`id`);

--
-- Constraints for table `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`);

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `Account` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
