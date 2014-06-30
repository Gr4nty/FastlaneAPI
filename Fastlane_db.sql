-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jun 30, 2014 at 11:45 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `car_profile`
--

INSERT INTO `car_profile` (`car_profile_id`, `car_paintjob_id`, `car_make`, `car_model`, `car_hp`, `car_weight`, `car_torque`, `car_release_date`, `car_type`, `car_available`, `car_left`) VALUES
(1, 1, 'Nissan', 'GT-R', 1000, 100, 100, '2014-06-03', 'Limited', 300, 15),
(2, 2, 'Ferrari', 'FXX', 1345, 200, 200, '2014-06-30', 'Exotic', 7, 1),
(3, 5, 'Ferrari', 'Testarosa', 788, 120, 102, '2014-06-02', 'Regular', 50, 17),
(4, 2, 'Volkswagen', 'Jana', 100, 1008, 1969, '2021-07-15', 'Regular', 439, 18),
(5, 1, 'Volkswagen', 'Eugenia', 101, 1501, 186, '2017-09-24', 'Exotic', 982, 75),
(6, 4, 'Toyota', 'Alexa', 102, 3021, 2011, '2018-06-30', 'Exotic', 777, 21),
(7, 3, 'Nissan', 'Brenda', 103, 1799, 1787, '2021-12-24', 'Limited', 116, 15),
(8, 5, 'Audi', 'Hedwig', 104, 2564, 1338, '2018-11-22', 'Limited', 793, 43),
(9, 2, 'Ferrari', 'Geraldine', 105, 3307, 1309, '2019-03-16', 'Regular', 158, 48),
(10, 5, 'Ferrari', 'Belle', 106, 1799, 565, '2014-02-11', 'Exotic', 1000, 50),
(11, 1, 'Audi', 'Desirae', 107, 1251, 1296, '2020-02-02', 'Exotic', 655, 60),
(12, 5, 'Volkswagen', 'Bo', 108, 1837, 1351, '2019-02-16', 'Exotic', 569, 88),
(13, 3, 'Ferrari', 'Jaden', 109, 641, 464, '2021-03-14', 'Limited', 741, 76),
(14, 5, 'Ferrari', 'Leila', 110, 4534, 1238, '2016-12-30', 'Limited', 808, 63),
(15, 4, 'Audi', 'Erin', 111, 3169, 776, '2018-01-18', 'Exotic', 599, 77),
(16, 1, 'Nissan', 'Carolyn', 112, 1338, 1692, '2019-06-03', 'Exotic', 797, 33),
(17, 5, 'Nissan', 'Cynthia', 113, 912, 801, '2022-07-28', 'Limited', 225, 65),
(18, 5, 'Nissan', 'Vivian', 114, 3427, 714, '2019-09-09', 'Regular', 169, 64),
(19, 5, 'Volkswagen', 'Emily', 115, 287, 2065, '2015-05-17', 'Exotic', 198, 87),
(20, 1, 'Audi', 'Alyssa', 116, 356, 461, '2021-07-22', 'Limited', 443, 99),
(21, 2, 'Nissan', 'Meghan', 117, 3893, 1069, '2014-04-14', 'Limited', 709, 75),
(22, 2, 'Fiat', 'Iola', 118, 1037, 1378, '2021-09-16', 'Exotic', 943, 80),
(23, 2, 'Ferrari', 'Maisie', 119, 4163, 1276, '2020-11-03', 'Exotic', 917, 48),
(24, 3, 'Toyota', 'Leila', 120, 4764, 359, '2018-05-31', 'Limited', 811, 91),
(25, 3, 'Nissan', 'Karleigh', 121, 2963, 1898, '2022-02-23', 'Regular', 421, 6),
(26, 4, 'Fiat', 'Rinah', 122, 3776, 1266, '2015-03-10', 'Regular', 513, 85),
(27, 1, 'Ferrari', 'Bo', 123, 1209, 1902, '2020-11-10', 'Exotic', 695, 44),
(28, 2, 'Toyota', 'Fleur', 124, 4691, 119, '2014-12-15', 'Regular', 725, 98),
(29, 1, 'Nissan', 'Eleanor', 125, 4348, 1882, '2019-05-03', 'Exotic', 644, 9),
(30, 3, 'Fiat', 'Nora', 126, 3557, 546, '2015-10-09', 'Exotic', 175, 42),
(31, 5, 'Volkswagen', 'Karyn', 127, 4799, 2123, '2019-03-22', 'Regular', 690, 13),
(32, 5, 'Nissan', 'India', 128, 3460, 2039, '2021-03-28', 'Exotic', 416, 39),
(33, 5, 'Volkswagen', 'Isadora', 129, 4642, 1169, '2016-03-17', 'Limited', 778, 71),
(34, 3, 'Volkswagen', 'Irene', 130, 2468, 2084, '2016-01-25', 'Regular', 902, 48),
(35, 3, 'Ferrari', 'Ella', 131, 2809, 2151, '2014-12-21', 'Limited', 679, 37),
(36, 5, 'Toyota', 'Whilemina', 132, 3871, 1041, '2020-06-12', 'Regular', 237, 34),
(37, 4, 'Fiat', 'Quail', 133, 2714, 589, '2017-07-29', 'Limited', 309, 24),
(38, 4, 'Nissan', 'Darrel', 134, 2167, 1200, '2016-04-09', 'Limited', 580, 47),
(39, 5, 'Toyota', 'Mechelle', 135, 2141, 1240, '2022-03-29', 'Exotic', 394, 56),
(40, 4, 'Toyota', 'Charity', 136, 832, 2149, '2014-11-26', 'Regular', 773, 2),
(41, 1, 'Ferrari', 'Harriet', 137, 3922, 1333, '2017-12-07', 'Regular', 495, 3),
(42, 3, 'Toyota', 'Yoko', 138, 4173, 1537, '2021-09-02', 'Limited', 777, 53),
(43, 3, 'Audi', 'Mollie', 139, 268, 1045, '2015-05-19', 'Regular', 599, 76),
(44, 1, 'Fiat', 'Rose', 140, 553, 1384, '2017-12-04', 'Limited', 705, 6),
(45, 2, 'Volkswagen', 'Teagan', 141, 4884, 996, '2022-07-07', 'Regular', 846, 46),
(46, 5, 'Toyota', 'Gisela', 142, 893, 661, '2013-12-19', 'Exotic', 117, 31),
(47, 3, 'Audi', 'Jemima', 143, 4410, 403, '2013-11-27', 'Regular', 643, 19),
(48, 4, 'Fiat', 'Emerald', 144, 4912, 1360, '2018-07-01', 'Limited', 775, 43),
(49, 3, 'Fiat', 'Colleen', 145, 3986, 1530, '2014-08-25', 'Regular', 242, 78),
(50, 1, 'Nissan', 'Whitney', 146, 885, 1353, '2014-10-25', 'Exotic', 247, 53),
(51, 5, 'Toyota', 'Jana', 147, 4911, 1815, '2013-11-27', 'Exotic', 105, 98),
(52, 3, 'Audi', 'Quynn', 148, 4211, 866, '2015-10-14', 'Limited', 816, 17),
(53, 2, 'Fiat', 'Jamalia', 149, 298, 775, '2022-07-24', 'Limited', 498, 8),
(54, 2, 'Nissan', 'Adria', 150, 2134, 557, '2016-10-28', 'Limited', 713, 46),
(55, 5, 'Fiat', 'Catherine', 151, 2242, 619, '2016-09-24', 'Regular', 472, 70),
(56, 4, 'Audi', 'Aspen', 152, 2385, 1973, '2016-12-11', 'Exotic', 198, 12),
(57, 1, 'Nissan', 'Flavia', 153, 1481, 1842, '2017-04-16', 'Regular', 421, 2),
(58, 2, 'Audi', 'Lael', 154, 1251, 538, '2019-07-30', 'Exotic', 232, 6),
(59, 5, 'Volkswagen', 'Pandora', 155, 3008, 1351, '2020-07-11', 'Regular', 261, 49),
(60, 2, 'Fiat', 'Emi', 156, 4522, 1380, '2017-03-08', 'Limited', 726, 53),
(61, 2, 'Nissan', 'Angela', 157, 1467, 522, '2017-10-23', 'Limited', 533, 54),
(62, 4, 'Audi', 'Lillith', 158, 2822, 480, '2016-03-29', 'Regular', 294, 13),
(63, 4, 'Fiat', 'Cailin', 159, 3399, 329, '2019-05-30', 'Exotic', 770, 9),
(64, 1, 'Ferrari', 'Janna', 160, 4997, 882, '2017-08-01', 'Limited', 428, 56),
(65, 3, 'Ferrari', 'Farrah', 161, 781, 1563, '2018-12-05', 'Limited', 992, 62),
(66, 2, 'Nissan', 'Brenda', 162, 995, 2121, '2021-04-23', 'Limited', 755, 72),
(67, 5, 'Audi', 'Shelby', 163, 370, 1870, '2014-08-19', 'Limited', 685, 67),
(68, 1, 'Nissan', 'Jessica', 164, 2971, 1285, '2018-10-11', 'Regular', 982, 22),
(69, 5, 'Ferrari', 'Yeo', 165, 3008, 1742, '2016-11-23', 'Limited', 704, 69),
(70, 1, 'Toyota', 'Gillian', 166, 2981, 372, '2021-10-11', 'Regular', 180, 47),
(71, 1, 'Toyota', 'Taylor', 167, 2252, 380, '2018-01-28', 'Exotic', 678, 43),
(72, 2, 'Audi', 'Rinah', 168, 1088, 1375, '2013-12-03', 'Limited', 591, 77),
(73, 2, 'Nissan', 'Basia', 169, 3450, 807, '2021-02-07', 'Regular', 631, 78),
(74, 5, 'Volkswagen', 'Faith', 170, 680, 999, '2020-09-30', 'Regular', 982, 62),
(75, 2, 'Volkswagen', 'Caryn', 171, 2200, 1308, '2016-01-16', 'Regular', 182, 26),
(76, 3, 'Volkswagen', 'Jayme', 172, 1840, 1832, '2013-07-17', 'Regular', 208, 89),
(77, 2, 'Fiat', 'Noelle', 173, 1055, 1431, '2015-07-01', 'Exotic', 800, 35),
(78, 1, 'Volkswagen', 'Xena', 174, 1419, 2091, '2016-01-26', 'Limited', 111, 72),
(79, 3, 'Nissan', 'Jaquelyn', 175, 919, 1586, '2019-11-13', 'Limited', 537, 13),
(80, 5, 'Toyota', 'Lydia', 176, 2572, 1375, '2015-11-05', 'Limited', 206, 99),
(81, 4, 'Nissan', 'Courtney', 177, 2624, 609, '2013-09-12', 'Regular', 348, 15),
(82, 5, 'Ferrari', 'Uma', 178, 3770, 845, '2018-05-22', 'Exotic', 991, 65),
(83, 3, 'Ferrari', 'Maryam', 179, 4163, 1874, '2019-03-07', 'Limited', 592, 9),
(84, 3, 'Nissan', 'Tanya', 180, 1393, 1141, '2018-10-20', 'Limited', 623, 85),
(85, 4, 'Nissan', 'Jaquelyn', 181, 3284, 1241, '2021-02-23', 'Limited', 101, 71),
(86, 1, 'Audi', 'Joy', 182, 1292, 1080, '2019-06-01', 'Limited', 275, 67),
(87, 2, 'Audi', 'Scarlett', 183, 4727, 1395, '2019-04-04', 'Exotic', 410, 48),
(88, 4, 'Nissan', 'Carolyn', 184, 2390, 1926, '2022-08-11', 'Limited', 402, 33),
(89, 4, 'Fiat', 'Ori', 185, 2664, 417, '2022-08-30', 'Regular', 514, 80),
(90, 1, 'Ferrari', 'Reagan', 186, 4733, 1240, '2021-01-18', 'Exotic', 652, 33),
(91, 3, 'Fiat', 'Aurora', 187, 2564, 490, '2014-05-12', 'Regular', 829, 65),
(92, 5, 'Audi', 'Savannah', 188, 864, 1841, '2017-07-18', 'Limited', 378, 40),
(93, 2, 'Volkswagen', 'Ann', 189, 1960, 1404, '2015-11-03', 'Exotic', 189, 78),
(94, 2, 'Ferrari', 'Bianca', 190, 4539, 1174, '2021-05-22', 'Regular', 190, 10),
(95, 3, 'Toyota', 'Galena', 191, 4960, 1346, '2021-03-18', 'Limited', 671, 55),
(96, 5, 'Fiat', 'Darrel', 192, 3715, 869, '2022-04-14', 'Limited', 638, 94),
(97, 5, 'Toyota', 'Shea', 193, 1873, 175, '2014-07-09', 'Limited', 883, 61),
(98, 2, 'Toyota', 'Jayme', 194, 2091, 182, '2015-07-23', 'Exotic', 778, 61),
(99, 2, 'Fiat', 'Darryl', 195, 4874, 1874, '2018-08-31', 'Exotic', 225, 96),
(100, 4, 'Audi', 'Nell', 196, 2717, 588, '2013-07-13', 'Regular', 208, 6),
(101, 1, 'Volkswagen', 'Ayanna', 197, 720, 820, '2020-11-16', 'Exotic', 177, 68),
(102, 5, 'Audi', 'Hayley', 198, 3624, 1330, '2020-03-09', 'Regular', 996, 60),
(103, 4, 'Volkswagen', 'Rae', 199, 424, 640, '2020-04-13', 'Exotic', 680, 72);

-- --------------------------------------------------------

--
-- Table structure for table `users_fuel`
--

CREATE TABLE `users_fuel` (
  `fuel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_fuel` bigint(20) NOT NULL DEFAULT '30',
  `user_fuel_max` bigint(20) NOT NULL DEFAULT '30',
  PRIMARY KEY (`fuel_id`),
  UNIQUE KEY `fuel_id_UNIQUE` (`fuel_id`),
  KEY `UserID_users_fuel_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`user_id`, `user_first_name`, `user_last_name`, `user_facebook_id`, `user_mail_address`, `user_profile_image`, `user_registered`) VALUES
(1, 'Aladdin', 'Hermione', 1, 'eu.ultrices.sit@eteuismod.net', '4', '2015-10-24 00:00:00'),
(2, 'Howard', 'Naida', 2, 'id@ultrices.com', '2', '2015-01-11 00:00:00'),
(3, 'Reese', 'Maggie', 3, 'in@arcuetpede.edu', '5', '2022-07-17 00:00:00'),
(4, 'Channing', 'Ebony', 4, 'egestas.rhoncus.Proin@adipiscingligulaAenean.org', '10', '2021-03-12 00:00:00'),
(5, 'Seth', 'MacKenzie', 5, 'non@Quisque.ca', '6', '2016-11-03 00:00:00'),
(6, 'Elijah', 'Carla', 6, 'et@luctusutpellentesque.ca', '7', '2019-02-20 00:00:00'),
(7, 'Cyrus', 'Emi', 7, 'Sed.molestie.Sed@dapibus.edu', '8', '2015-09-23 00:00:00'),
(8, 'Lars', 'Eugenia', 8, 'ligula@acorci.edu', '1', '2015-08-11 00:00:00'),
(9, 'Hilel', 'Violet', 9, 'orci@dolornonummyac.ca', '8', '2019-06-03 00:00:00'),
(10, 'Samuel', 'Calista', 10, 'lacus.varius@massaVestibulumaccumsan.co.uk', '7', '2018-04-08 00:00:00'),
(11, 'Emery', 'Cally', 11, 'Nunc@justofaucibuslectus.com', '9', '2016-10-15 00:00:00'),
(12, 'Garrison', 'Quon', 12, 'imperdiet.ornare.In@vehiculaaliquet.net', '10', '2019-02-18 00:00:00'),
(13, 'Castor', 'Macy', 13, 'imperdiet.ullamcorper.Duis@etipsumcursus.edu', '3', '2016-01-14 00:00:00'),
(14, 'Amir', 'Gisela', 14, 'aliquet.odio.Etiam@pharetraQuisque.org', '6', '2019-02-10 00:00:00'),
(15, 'Jermaine', 'Shelley', 15, 'non.nisi@Proinvelit.net', '6', '2017-02-27 00:00:00'),
(16, 'Alexander', 'Kiona', 16, 'nulla.Cras.eu@Maurisblandit.com', '1', '2019-01-14 00:00:00'),
(17, 'Lyle', 'Aurelia', 17, 'turpis.nec.mauris@acmieleifend.com', '8', '2017-01-01 00:00:00'),
(18, 'Buckminster', 'Alea', 18, 'Quisque@accumsanconvallisante.net', '1', '2020-01-31 00:00:00'),
(19, 'Plato', 'Lael', 19, 'turpis.vitae.purus@tinciduntnibh.edu', '1', '2015-02-07 00:00:00'),
(20, 'Mannix', 'Uma', 20, 'non.luctus@pedemalesuadavel.ca', '8', '2014-06-05 00:00:00'),
(21, 'Gareth', 'Lael', 21, 'tristique.senectus.et@antedictummi.edu', '6', '2018-10-27 00:00:00'),
(22, 'Judah', 'Priscilla', 22, 'Aliquam.rutrum@Nullam.edu', '9', '2016-09-24 00:00:00'),
(23, 'Cooper', 'Adria', 23, 'interdum.libero@Curabiturdictum.net', '2', '2020-03-09 00:00:00'),
(24, 'Shad', 'Robin', 24, 'Integer.vitae.nibh@mollisIntegertincidunt.com', '8', '2016-11-25 00:00:00'),
(25, 'Isaac', 'Alyssa', 25, 'nibh@necenim.edu', '10', '2017-06-26 00:00:00'),
(26, 'Aristotle', 'May', 26, 'vitae.aliquam.eros@netuset.co.uk', '10', '2015-12-04 00:00:00'),
(27, 'Hasad', 'Alea', 27, 'arcu.Curabitur@CraspellentesqueSed.ca', '2', '2021-02-28 00:00:00'),
(28, 'Malcolm', 'Meghan', 28, 'adipiscing@mauris.net', '7', '2017-09-15 00:00:00'),
(29, 'Ethan', 'Stephanie', 29, 'Donec.vitae.erat@perinceptos.co.uk', '3', '2020-02-24 00:00:00'),
(30, 'Paul', 'Grace', 30, 'nunc.ullamcorper@diamPellentesque.org', '2', '2020-08-18 00:00:00'),
(31, 'Cade', 'Kiayada', 31, 'elit.pellentesque@vitaemaurissit.edu', '6', '2016-06-15 00:00:00'),
(32, 'Macaulay', 'Mallory', 32, 'erat.nonummy.ultricies@In.edu', '1', '2021-11-14 00:00:00'),
(33, 'Phelan', 'Keelie', 33, 'sodales.purus@Donecporttitortellus.org', '8', '2016-11-03 00:00:00'),
(34, 'Sylvester', 'Zenia', 34, 'risus@Integeraliquam.org', '7', '2014-10-09 00:00:00'),
(35, 'Hashim', 'Hilda', 35, 'sem.mollis@Proinnon.org', '1', '2016-10-16 00:00:00'),
(36, 'Jacob', 'Sybil', 36, 'ipsum@nonsollicitudin.edu', '1', '2018-06-10 00:00:00'),
(37, 'Jack', 'Eleanor', 37, 'imperdiet.ullamcorper.Duis@ante.org', '7', '2016-02-08 00:00:00'),
(38, 'Price', 'Nevada', 38, 'placerat@feugiatLoremipsum.net', '10', '2017-08-31 00:00:00'),
(39, 'Jared', 'Quintessa', 39, 'sem.semper@bibendumullamcorper.com', '4', '2016-10-18 00:00:00'),
(40, 'Leroy', 'Leah', 40, 'purus.Maecenas.libero@mattisvelitjusto.com', '5', '2019-07-01 00:00:00'),
(41, 'Alden', 'Leah', 41, 'pellentesque.massa@cubiliaCuraeDonec.com', '7', '2021-09-02 00:00:00'),
(42, 'Thaddeus', 'Shelly', 42, 'orci.quis@adipiscingenim.edu', '6', '2014-04-14 00:00:00'),
(43, 'Sawyer', 'Velma', 43, 'non@lobortistellus.net', '8', '2014-02-22 00:00:00'),
(44, 'Mufutau', 'Ivana', 44, 'metus.In.lorem@quis.edu', '7', '2020-12-11 00:00:00'),
(45, 'Kaseem', 'Hadley', 45, 'Quisque.tincidunt@Proinvelit.net', '4', '2020-07-10 00:00:00'),
(46, 'Stone', 'Carissa', 46, 'erat.neque@nislsemconsequat.ca', '3', '2016-04-25 00:00:00'),
(47, 'Dustin', 'Meghan', 47, 'in.faucibus@eu.com', '4', '2014-11-22 00:00:00'),
(48, 'Gage', 'Lilah', 48, 'ipsum.leo@luctusaliquetodio.ca', '10', '2018-04-07 00:00:00'),
(49, 'Yoshio', 'Flavia', 49, 'et.magna.Praesent@arcuVestibulumante.co.uk', '9', '2019-01-15 00:00:00'),
(50, 'Elliott', 'Venus', 50, 'pede.Nunc@ultricies.co.uk', '1', '2021-03-01 00:00:00'),
(51, 'Lamar', 'Hyacinth', 51, 'mi@et.com', '10', '2019-10-22 00:00:00'),
(52, 'Sylvester', 'Naida', 52, 'turpis.Nulla.aliquet@vitaerisusDuis.net', '6', '2016-12-29 00:00:00'),
(53, 'Joel', 'Ciara', 53, 'velit.Sed@enimsit.co.uk', '8', '2016-02-11 00:00:00'),
(54, 'Darius', 'Freya', 54, 'ipsum.dolor@sed.ca', '6', '2019-08-20 00:00:00'),
(55, 'Tate', 'Ariana', 55, 'elementum.at.egestas@pulvinararcu.com', '1', '2021-10-03 00:00:00'),
(56, 'Adrian', 'Destiny', 56, 'placerat.eget@MorbivehiculaPellentesque.org', '2', '2021-11-07 00:00:00'),
(57, 'Mohammad', 'Abra', 57, 'pellentesque.eget@et.org', '2', '2013-10-16 00:00:00'),
(58, 'Gil', 'Katell', 58, 'est.Mauris.eu@vitae.edu', '3', '2020-12-17 00:00:00'),
(59, 'Reece', 'Destiny', 59, 'euismod.mauris.eu@nonsapienmolestie.ca', '4', '2017-04-27 00:00:00'),
(60, 'Malcolm', 'Clementine', 60, 'accumsan.laoreet.ipsum@maurisaliquameu.com', '10', '2020-05-03 00:00:00'),
(61, 'Amal', 'Cecilia', 61, 'tincidunt.congue@Quisque.edu', '9', '2015-09-17 00:00:00'),
(62, 'Jonas', 'Cathleen', 62, 'Cum.sociis.natoque@nonante.ca', '4', '2014-10-21 00:00:00'),
(63, 'Rajah', 'Alice', 63, 'ad@euismodacfermentum.ca', '10', '2021-05-10 00:00:00'),
(64, 'Gannon', 'Ramona', 64, 'in.hendrerit.consectetuer@a.com', '2', '2019-11-14 00:00:00'),
(65, 'Jarrod', 'Sonya', 65, 'diam.nunc.ullamcorper@etmalesuada.net', '8', '2022-01-06 00:00:00'),
(66, 'Clayton', 'Penelope', 66, 'eget.laoreet@Craseget.co.uk', '9', '2019-02-09 00:00:00'),
(67, 'Bernard', 'Sybil', 67, 'elementum.lorem@arcuacorci.net', '4', '2014-09-17 00:00:00'),
(68, 'Bradley', 'Emerald', 68, 'arcu.imperdiet.ullamcorper@Sed.net', '2', '2019-02-07 00:00:00'),
(69, 'Connor', 'Illiana', 69, 'sit.amet.risus@eu.org', '9', '2017-06-27 00:00:00'),
(70, 'Gil', 'Madaline', 70, 'ligula.Aenean.euismod@pharetrafelis.ca', '8', '2018-01-19 00:00:00'),
(71, 'Wallace', 'Germane', 71, 'luctus@lectusa.org', '8', '2013-12-04 00:00:00'),
(72, 'Fritz', 'Liberty', 72, 'nisi.Cum@velitegetlaoreet.ca', '6', '2014-08-16 00:00:00'),
(73, 'Porter', 'Nola', 73, 'dolor.dolor.tempus@etmalesuadafames.com', '6', '2014-01-15 00:00:00'),
(74, 'Wayne', 'Savannah', 74, 'Nullam@amet.org', '8', '2017-04-14 00:00:00'),
(75, 'Martin', 'Heather', 75, 'iaculis@sitametfaucibus.net', '10', '2016-08-31 00:00:00'),
(76, 'Ray', 'Anne', 76, 'blandit@primisinfaucibus.ca', '1', '2018-11-24 00:00:00'),
(77, 'Jack', 'Eliana', 77, 'fringilla.euismod.enim@amet.ca', '5', '2014-11-07 00:00:00'),
(78, 'Tucker', 'Emily', 78, 'venenatis@consequatauctornunc.ca', '2', '2018-06-24 00:00:00'),
(79, 'Dorian', 'Quin', 79, 'id.nunc.interdum@amet.com', '5', '2015-07-02 00:00:00'),
(80, 'Leo', 'Olga', 80, 'accumsan@eget.org', '8', '2014-02-21 00:00:00'),
(81, 'Kenyon', 'Jeanette', 81, 'Sed@mauriselitdictum.edu', '5', '2021-03-23 00:00:00'),
(82, 'Oleg', 'Erica', 82, 'rutrum.justo.Praesent@euismodacfermentum.co.uk', '1', '2016-07-18 00:00:00'),
(83, 'Byron', 'Florence', 83, 'urna.Ut@porttitortellus.com', '9', '2019-09-02 00:00:00'),
(84, 'Ronan', 'Heidi', 84, 'amet@vulputatelacus.co.uk', '4', '2014-04-01 00:00:00'),
(85, 'Quamar', 'Eugenia', 85, 'Donec@magnaSuspendissetristique.net', '10', '2016-07-29 00:00:00'),
(86, 'Hyatt', 'Eden', 86, 'amet@ultriciesornareelit.co.uk', '2', '2015-08-20 00:00:00'),
(87, 'Odysseus', 'Carolyn', 87, 'sed.pede@nec.co.uk', '1', '2019-08-18 00:00:00'),
(88, 'Dorian', 'Kylynn', 88, 'quam.dignissim@utpharetra.com', '8', '2020-05-27 00:00:00'),
(89, 'Judah', 'Larissa', 89, 'Pellentesque.tincidunt@quis.co.uk', '8', '2015-05-05 00:00:00'),
(90, 'Branden', 'Rama', 90, 'lobortis@lectusasollicitudin.org', '10', '2022-06-25 00:00:00'),
(91, 'Tobias', 'Leah', 91, 'fringilla.Donec.feugiat@Pellentesque.edu', '8', '2014-10-05 00:00:00'),
(92, 'Valentine', 'Celeste', 92, 'lorem@facilisisSuspendissecommodo.com', '8', '2021-06-16 00:00:00'),
(93, 'Hoyt', 'Carol', 93, 'ornare.egestas@at.ca', '2', '2019-01-04 00:00:00'),
(94, 'Brennan', 'Jada', 94, 'ut@afelis.com', '8', '2020-05-25 00:00:00'),
(95, 'Eaton', 'Regan', 95, 'parturient@lectus.net', '5', '2015-11-24 00:00:00'),
(96, 'Rashad', 'Faith', 96, 'netus.et.malesuada@nuncInat.co.uk', '10', '2018-02-25 00:00:00'),
(97, 'Reuben', 'Ivory', 97, 'Sed.eu.eros@Loremipsumdolor.org', '2', '2020-06-25 00:00:00'),
(98, 'Ciaran', 'Lani', 98, 'eu.enim.Etiam@Craseu.org', '2', '2019-10-25 00:00:00'),
(99, 'Marshall', 'Tamekah', 99, 'facilisis.Suspendisse@malesuada.net', '1', '2019-12-11 00:00:00'),
(100, 'Erich', 'Fay', 100, 'Fusce.mi.lorem@mauriserateget.com', '2', '2019-08-15 00:00:00');

--
-- Triggers `users_profile`
--
DROP TRIGGER IF EXISTS `user_profile_AINS`;
DELIMITER //
CREATE TRIGGER `user_profile_AINS` AFTER INSERT ON `users_profile`
 FOR EACH ROW BEGIN
INSERT INTO users(user_id) VALUE(NEW.user_id);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_status`
--

CREATE TABLE `users_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_rank` enum('Newby','Rookie','Street Racer','Street King') NOT NULL DEFAULT 'Newby',
  `user_level` int(11) NOT NULL DEFAULT '1',
  `user_experience` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `UserID_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `users_status`
--

INSERT INTO `users_status` (`id`, `user_id`, `user_rank`, `user_level`, `user_experience`) VALUES
(1, 1, 'Newby', 1, 1),
(2, 2, 'Newby', 1, 1),
(3, 3, 'Newby', 1, 1),
(4, 4, 'Newby', 1, 1),
(5, 5, 'Newby', 1, 1),
(6, 6, 'Newby', 1, 1),
(7, 7, 'Newby', 1, 1),
(8, 8, 'Newby', 1, 1),
(9, 9, 'Newby', 1, 1),
(10, 10, 'Newby', 1, 1),
(11, 11, 'Newby', 1, 1),
(12, 12, 'Newby', 1, 1),
(13, 13, 'Newby', 1, 1),
(14, 14, 'Newby', 1, 1),
(15, 15, 'Newby', 1, 1),
(16, 16, 'Newby', 1, 1),
(17, 17, 'Newby', 1, 1),
(18, 18, 'Newby', 1, 1),
(19, 19, 'Newby', 1, 1),
(20, 20, 'Newby', 1, 1),
(21, 21, 'Newby', 1, 1),
(22, 22, 'Newby', 1, 1),
(23, 23, 'Newby', 1, 1),
(24, 24, 'Newby', 1, 1),
(25, 25, 'Newby', 1, 1),
(26, 26, 'Newby', 1, 1),
(27, 27, 'Newby', 1, 1),
(28, 28, 'Newby', 1, 1),
(29, 29, 'Newby', 1, 1),
(30, 30, 'Newby', 1, 1),
(31, 31, 'Newby', 1, 1),
(32, 32, 'Newby', 1, 1),
(33, 33, 'Newby', 1, 1),
(34, 34, 'Newby', 1, 1),
(35, 35, 'Newby', 1, 1),
(36, 36, 'Newby', 1, 1),
(37, 37, 'Newby', 1, 1),
(38, 38, 'Newby', 1, 1),
(39, 39, 'Newby', 1, 1),
(40, 40, 'Newby', 1, 1),
(41, 41, 'Newby', 1, 1),
(42, 42, 'Newby', 1, 1),
(43, 43, 'Newby', 1, 1),
(44, 44, 'Newby', 1, 1),
(45, 45, 'Newby', 1, 1),
(46, 46, 'Newby', 1, 1),
(47, 47, 'Newby', 1, 1),
(48, 48, 'Newby', 1, 1),
(49, 49, 'Newby', 1, 1),
(50, 50, 'Newby', 1, 1),
(51, 51, 'Newby', 1, 1),
(52, 52, 'Newby', 1, 1),
(53, 53, 'Newby', 1, 1),
(54, 54, 'Newby', 1, 1),
(55, 55, 'Newby', 1, 1),
(56, 56, 'Newby', 1, 1),
(57, 57, 'Newby', 1, 1),
(58, 58, 'Newby', 1, 1),
(59, 59, 'Newby', 1, 1),
(60, 60, 'Newby', 1, 1),
(61, 61, 'Newby', 1, 1),
(62, 62, 'Newby', 1, 1),
(63, 63, 'Newby', 1, 1),
(64, 64, 'Newby', 1, 1),
(65, 65, 'Newby', 1, 1),
(66, 66, 'Newby', 1, 1),
(67, 67, 'Newby', 1, 1),
(68, 68, 'Newby', 1, 1),
(69, 69, 'Newby', 1, 1),
(70, 70, 'Newby', 1, 1),
(71, 71, 'Newby', 1, 1),
(72, 72, 'Newby', 1, 1),
(73, 73, 'Newby', 1, 1),
(74, 74, 'Newby', 1, 1),
(75, 75, 'Newby', 1, 1),
(76, 76, 'Newby', 1, 1),
(77, 77, 'Newby', 1, 1),
(78, 78, 'Newby', 1, 1),
(79, 79, 'Newby', 1, 1),
(80, 80, 'Newby', 1, 1),
(81, 81, 'Newby', 1, 1),
(82, 82, 'Newby', 1, 1),
(83, 83, 'Newby', 1, 1),
(84, 84, 'Newby', 1, 1),
(85, 85, 'Newby', 1, 1),
(86, 86, 'Newby', 1, 1),
(87, 87, 'Newby', 1, 1),
(88, 88, 'Newby', 1, 1),
(89, 89, 'Newby', 1, 1),
(90, 90, 'Newby', 1, 1),
(91, 91, 'Newby', 1, 1),
(92, 92, 'Newby', 1, 1),
(93, 93, 'Newby', 1, 1),
(94, 94, 'Newby', 1, 1),
(95, 95, 'Newby', 1, 1),
(96, 96, 'Newby', 1, 1),
(97, 97, 'Newby', 1, 1),
(98, 98, 'Newby', 1, 1),
(99, 99, 'Newby', 1, 1),
(100, 100, 'Newby', 1, 1);

--
-- Triggers `users_status`
--
DROP TRIGGER IF EXISTS `user_BUPD`;
DELIMITER //
CREATE TRIGGER `user_BUPD` BEFORE UPDATE ON `users_status`
 FOR EACH ROW BEGIN
DECLARE x float;
SET x = POW(new.user_experience, (1/3));
SET NEW.user_level=floor(x);
CASE
	  WHEN NEW.user_level >= 1 AND NEW.user_level < 15  THEN SET NEW.user_rank = 'Newby';
      WHEN NEW.user_level >= 15 AND NEW.user_level < 30  THEN SET NEW.user_rank = 'Rookie';
      WHEN NEW.user_level >= 30 AND NEW.user_level < 80  THEN SET NEW.user_rank = 'Street Racer';
	  WHEN NEW.user_level >= 80  THEN SET NEW.user_rank = 'Street King';
END CASE;
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
  ADD CONSTRAINT `UserID_cars` FOREIGN KEY (`owner_user_id`) REFERENCES `users_profile` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `users_fuel`
--
ALTER TABLE `users_fuel`
  ADD CONSTRAINT `UserID_users_fuel` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_status`
--
ALTER TABLE `users_status`
  ADD CONSTRAINT `UserID_users` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
