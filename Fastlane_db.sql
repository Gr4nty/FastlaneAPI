-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jun 30, 2014 at 06:39 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `fastlane`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_profile_id` bigint(20) DEFAULT NULL,
  `owner_user_id` bigint(20) DEFAULT NULL,
  `car_paintjob_id` bigint(20) DEFAULT NULL,
  `car_hp` int(11) DEFAULT NULL,
  `car_weight` int(11) DEFAULT NULL,
  `car_torque` int(11) DEFAULT NULL,
  `car_created` datetime DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `CarProfileID_idx` (`car_profile_id`),
  KEY `UserID_idx` (`owner_user_id`),
  KEY `CarPaintjobID_cars_idx` (`car_paintjob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cars_history`
--

CREATE TABLE `cars_history` (
  `car_history_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_id` bigint(20) NOT NULL,
  `owner_user_id` bigint(20) DEFAULT NULL,
  `previous_owner_user_id` bigint(20) DEFAULT NULL,
  `cars_price` bigint(20) DEFAULT NULL,
  `cars_history_change_date` datetime DEFAULT NULL,
  PRIMARY KEY (`car_history_id`),
  UNIQUE KEY `car_id_UNIQUE` (`car_id`),
  UNIQUE KEY `car_history_id_UNIQUE` (`car_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `car_paintjob`
--

CREATE TABLE `car_paintjob` (
  `car_paintjob_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_profile_id` bigint(20) NOT NULL,
  `car_paintjob_url` text,
  `car_paintjob_price` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`car_paintjob_id`),
  UNIQUE KEY `car_paintjob_id_UNIQUE` (`car_paintjob_id`),
  KEY `CarProfileID_idx` (`car_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `car_profile`
--

CREATE TABLE `car_profile` (
  `car_profile_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `car_paintjob_id` bigint(20) NOT NULL,
  `car_make` text NOT NULL,
  `car_model` text NOT NULL,
  `car_hp` int(11) NOT NULL,
  `car_weight` int(11) NOT NULL,
  `car_torque` int(11) NOT NULL,
  `car_release_date` date NOT NULL,
  `car_type` text NOT NULL,
  `car_available` int(11) NOT NULL,
  `car_left` int(11) NOT NULL,
  PRIMARY KEY (`car_profile_id`),
  KEY `CarPaintjobID_car_profile_idx` (`car_paintjob_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `car_profile`
--

INSERT INTO `car_profile` (`car_profile_id`, `car_paintjob_id`, `car_make`, `car_model`, `car_hp`, `car_weight`, `car_torque`, `car_release_date`, `car_type`, `car_available`, `car_left`) VALUES
(1, 0, 'Nissan', 'GT-R', 1000, 100, 100, '2014-06-03', 'Limited', 300, 15),
(2, 0, 'Ferrari', 'FXX', 1345, 200, 200, '2014-06-30', 'Exotic', 7, 1),
(3, 0, 'Ferrari', 'Testarosa', 788, 120, 102, '2014-06-02', 'Regular', 50, 17);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_rank` enum('Newby','Rookie','Street Racer','King') NOT NULL DEFAULT 'Newby',
  `user_level` int(11) NOT NULL DEFAULT '1',
  `user_experience` bigint(20) NOT NULL DEFAULT '1',
  `user_fuel` bigint(20) NOT NULL DEFAULT '30',
  `user_fuel_max` bigint(20) NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `UserID_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_first_name` text NOT NULL,
  `user_last_name` text NOT NULL,
  `user_facebook_id` bigint(20) NOT NULL,
  `user_mail_address` text NOT NULL,
  `user_profile_image` text NOT NULL,
  `user_registered` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_facebook_id_UNIQUE` (`user_facebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `user_profile`
--
DROP TRIGGER IF EXISTS `user_profile_AINS`;
DELIMITER //
CREATE TRIGGER `user_profile_AINS` AFTER INSERT ON `user_profile`
 FOR EACH ROW BEGIN
INSERT INTO users(user_id) VALUE(NEW.user_id);
END
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `CarPaintjobID_cars` FOREIGN KEY (`car_paintjob_id`) REFERENCES `car_paintjob` (`car_paintjob_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `CarProfileID_cars` FOREIGN KEY (`car_profile_id`) REFERENCES `car_profile` (`car_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `UserID_cars` FOREIGN KEY (`owner_user_id`) REFERENCES `user_profile` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cars_history`
--
ALTER TABLE `cars_history`
  ADD CONSTRAINT `CarID_cars_history` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `car_paintjob`
--
ALTER TABLE `car_paintjob`
  ADD CONSTRAINT `CarProfileID_paintjob` FOREIGN KEY (`car_profile_id`) REFERENCES `car_profile` (`car_profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `UserID_users` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
