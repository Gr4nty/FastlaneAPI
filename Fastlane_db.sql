-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jun 27, 2014 at 05:13 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `fastlane`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_profile`
--

CREATE TABLE `car_profile` (
  `car_id` int(11) NOT NULL,
  `car_type_id` int(11) NOT NULL,
  `car_image` text NOT NULL,
  `hp` int(11) NOT NULL,
  `torque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_profile`
--

INSERT INTO `car_profile` (`car_id`, `car_type_id`, `car_image`, `hp`, `torque`) VALUES
(1, 1, 'car_a.jpg', 1200, 101),
(2, 1, 'car_b.jpg', 1178, 99);

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE `car_type` (
  `car_type_id` bigint(11) NOT NULL,
  `car_image` text NOT NULL,
  `make` text NOT NULL,
  `model` text NOT NULL,
  `hp` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `torque` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `type` text NOT NULL,
  `available` int(11) NOT NULL,
  `left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`car_type_id`, `car_image`, `make`, `model`, `hp`, `weight`, `torque`, `release_date`, `type`, `available`, `left`) VALUES
(1, 'car.jpg', 'Nissan', 'GT-R', 1000, 100, 100, '2014-06-03', 'Limited', 300, 15),
(2, 'car2.jpg', 'Ferrari', 'FXX', 1345, 200, 200, '2014-06-30', 'Exotic', 7, 1),
(3, 'blabla.jpg', 'Ferrari', 'Testarosa', 788, 120, 102, '2014-06-02', 'Regular', 50, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_id` bigint(20) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  `mail_address` text NOT NULL,
  `profile_image` text NOT NULL,
  `registered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `first_name`, `last_name`, `facebook_id`, `mail_address`, `profile_image`, `registered`) VALUES
(1, 'Valaki', 'Valami', 1, 'm@m.hu', 'image1.jpg', '2014-06-03 00:00:00'),
(2, 'Geza', 'Imre', 2, 'a@a.hu', 'image2.jpg', '2014-06-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `user_id` bigint(20) NOT NULL,
  `cast` text NOT NULL,
  `level` bigint(20) NOT NULL,
  `experience` bigint(20) NOT NULL,
  `fuel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`user_id`, `cast`, `level`, `experience`, `fuel`) VALUES
(2, 'user', 23, 56458, 30),
(3, 'admin', 23, 56458, 30);

