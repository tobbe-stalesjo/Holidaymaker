-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.32-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table holidaymaker.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `number_of_guest` int(11) NOT NULL,
  `room_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_booking_customer` (`customer_id`),
  KEY `FK_booking_rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table holidaymaker.booking: ~1 rows (approximately)
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`id`, `customer_id`, `check_in_date`, `check_out_date`, `number_of_guest`, `room_id`) VALUES
	(1, 1, '2020-07-20', '2020-07-27', 3, 73);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table holidaymaker.customer: ~3 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`, `name`, `email`) VALUES
	(1, 'Chaddie Maciejewski', 'cmaciejewski0@tmall.com'),
	(2, 'Tobbe Stalesjo', 'test@test.com'),
	(3, 'Emm Lind', 'lind.emm@test.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.facility
CREATE TABLE IF NOT EXISTS `facility` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant` enum('Y','N') NOT NULL DEFAULT 'N',
  `pool` enum('Y','N') NOT NULL DEFAULT 'N',
  `entertainment` enum('Y','N') NOT NULL DEFAULT 'N',
  `kids_club` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table holidaymaker.facility: ~5 rows (approximately)
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` (`id`, `restaurant`, `pool`, `entertainment`, `kids_club`) VALUES
	(1, 'Y', 'Y', 'Y', 'Y'),
	(2, 'Y', 'Y', 'Y', 'N'),
	(3, 'Y', 'N', 'Y', 'N'),
	(4, 'Y', 'Y', 'N', 'Y'),
	(5, 'Y', 'Y', 'N', 'Y');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `facillity_id` int(11) unsigned NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hotel_facillity` (`facillity_id`),
  CONSTRAINT `FK_hotel_facillity` FOREIGN KEY (`facillity_id`) REFERENCES `facility` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table holidaymaker.hotel: ~5 rows (approximately)
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` (`id`, `facillity_id`, `location`) VALUES
	(1, 1, 'Spain'),
	(2, 2, 'Italy'),
	(3, 3, 'France'),
	(4, 4, 'U.K'),
	(5, 5, 'Germany');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

-- Dumping structure for table holidaymaker.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) unsigned NOT NULL,
  `beds` int(11) NOT NULL,
  `balcony` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rooms_hotel` (`hotel_id`),
  CONSTRAINT `FK_rooms_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Dumping data for table holidaymaker.rooms: ~100 rows (approximately)
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`id`, `hotel_id`, `beds`, `balcony`) VALUES
	(1, 5, 1, 1),
	(2, 3, 2, 0),
	(3, 5, 2, 0),
	(4, 2, 1, 1),
	(5, 3, 1, 1),
	(6, 3, 1, 0),
	(7, 4, 4, 0),
	(8, 2, 4, 1),
	(9, 1, 3, 0),
	(10, 1, 1, 1),
	(11, 2, 2, 0),
	(12, 3, 4, 0),
	(13, 3, 1, 0),
	(14, 4, 2, 0),
	(15, 3, 4, 1),
	(16, 5, 4, 0),
	(17, 5, 4, 1),
	(18, 2, 4, 0),
	(19, 4, 4, 0),
	(20, 3, 1, 0),
	(21, 4, 2, 0),
	(22, 3, 2, 0),
	(23, 5, 3, 0),
	(24, 1, 2, 0),
	(25, 1, 2, 0),
	(26, 5, 1, 0),
	(27, 1, 4, 1),
	(28, 2, 4, 0),
	(29, 2, 4, 1),
	(30, 5, 2, 1),
	(31, 2, 4, 0),
	(32, 1, 2, 1),
	(33, 5, 1, 0),
	(34, 4, 4, 0),
	(35, 1, 2, 1),
	(36, 1, 4, 0),
	(37, 1, 3, 0),
	(38, 2, 3, 1),
	(39, 3, 1, 1),
	(40, 2, 2, 0),
	(41, 4, 1, 1),
	(42, 5, 1, 1),
	(43, 5, 3, 0),
	(44, 4, 1, 0),
	(45, 3, 2, 1),
	(46, 4, 2, 0),
	(47, 5, 1, 0),
	(48, 1, 3, 1),
	(49, 1, 3, 1),
	(50, 3, 4, 0),
	(51, 4, 3, 0),
	(52, 1, 2, 0),
	(53, 5, 4, 0),
	(54, 3, 1, 0),
	(55, 1, 2, 0),
	(56, 2, 1, 1),
	(57, 2, 4, 1),
	(58, 5, 3, 1),
	(59, 2, 4, 1),
	(60, 3, 1, 1),
	(61, 4, 1, 1),
	(62, 3, 4, 1),
	(63, 2, 1, 0),
	(64, 4, 2, 0),
	(65, 4, 3, 0),
	(66, 5, 4, 1),
	(67, 2, 2, 0),
	(68, 3, 2, 0),
	(69, 2, 4, 1),
	(70, 3, 1, 1),
	(71, 4, 2, 0),
	(72, 4, 2, 1),
	(73, 3, 3, 0),
	(74, 2, 1, 1),
	(75, 5, 4, 1),
	(76, 2, 1, 1),
	(77, 1, 4, 0),
	(78, 1, 2, 0),
	(79, 2, 4, 1),
	(80, 4, 1, 0),
	(81, 4, 3, 0),
	(82, 3, 3, 1),
	(83, 2, 3, 0),
	(84, 3, 1, 1),
	(85, 4, 3, 1),
	(86, 1, 2, 0),
	(87, 4, 4, 1),
	(88, 1, 1, 0),
	(89, 4, 2, 1),
	(90, 4, 2, 0),
	(91, 5, 3, 1),
	(92, 2, 1, 0),
	(93, 3, 3, 0),
	(94, 4, 4, 1),
	(95, 1, 4, 1),
	(96, 2, 2, 1),
	(97, 4, 1, 1),
	(98, 1, 4, 0),
	(99, 1, 2, 0),
	(100, 2, 2, 1);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
