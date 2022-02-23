-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for qbcoredx
DROP DATABASE IF EXISTS `qbcoredx`;
CREATE DATABASE IF NOT EXISTS `qbcoredx` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `qbcoredx`;

-- Dumping structure for table qbcoredx.apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.apartments: ~9 rows (approximately)
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(127, 'apartment11401', 'apartment1', 'Alta Street (City) 1401', 'YAO29665'),
	(128, 'apartment17400', 'apartment1', 'Alta Street (City) 7400', 'NAH71280'),
	(129, 'apartment17065', 'apartment3', 'Paleto Bay', 'BDQ75670'),
	(130, 'apartment11757', 'apartment1', 'Alta Street (City) 1757', 'DLK40295'),
	(131, 'apartment25702', 'apartment2', 'Vinedoow Hotels 5702', 'RQS49084'),
	(132, 'apartment17556', 'apartment1', 'Alta Street (City) 7556', 'FFR58493'),
	(134, 'apartment16159', 'apartment1', 'Alta Street (City) 6159', 'YGT28836'),
	(135, 'apartment1226', 'apartment1', 'Alta Street (City) 226', 'DUY88641'),
	(136, 'apartment19869', 'apartment1', 'Alta Street (City) 9869', 'BVW07235'),
	(137, 'apartment12237', 'apartment1', 'Alta Street (City) 2237', 'SCB94284'),
	(138, 'apartment11570', 'apartment1', 'Alta Street (City) 1570', 'DAA99355');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.bank_accounts
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Buisness','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.bank_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.bank_statements
DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.bank_statements: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank_statements` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_statements` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.bans
DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.bans: ~1 rows (approximately)
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.bills
DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.bills: ~0 rows (approximately)
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.boost_queue
DROP TABLE IF EXISTS `boost_queue`;
CREATE TABLE IF NOT EXISTS `boost_queue` (
  `identifier` varchar(60) NOT NULL,
  `pSrc` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.boost_queue: ~0 rows (approximately)
/*!40000 ALTER TABLE `boost_queue` DISABLE KEYS */;
INSERT INTO `boost_queue` (`identifier`, `pSrc`) VALUES
	('DLK40295', 1);
/*!40000 ALTER TABLE `boost_queue` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.bropixel_boosting
DROP TABLE IF EXISTS `bropixel_boosting`;
CREATE TABLE IF NOT EXISTS `bropixel_boosting` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `BNE` text NOT NULL DEFAULT '0',
  `background` varchar(255) DEFAULT NULL,
  `vin` int(11) DEFAULT NULL,
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.bropixel_boosting: ~0 rows (approximately)
/*!40000 ALTER TABLE `bropixel_boosting` DISABLE KEYS */;
INSERT INTO `bropixel_boosting` (`#`, `citizenid`, `BNE`, `background`, `vin`) VALUES
	(11, 'DLK40295', '0', 'https://cdn.discordapp.com/attachments/930396278385422357/942598216900296805/unknown.png', NULL);
/*!40000 ALTER TABLE `bropixel_boosting` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.communityservice
DROP TABLE IF EXISTS `communityservice`;
CREATE TABLE IF NOT EXISTS `communityservice` (
  `citizenid` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.communityservice: ~1 rows (approximately)
/*!40000 ALTER TABLE `communityservice` DISABLE KEYS */;
INSERT INTO `communityservice` (`citizenid`, `actions_remaining`) VALUES
	('DLK40295', 0);
/*!40000 ALTER TABLE `communityservice` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.crypto
DROP TABLE IF EXISTS `crypto`;
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.crypto: ~0 rows (approximately)
/*!40000 ALTER TABLE `crypto` DISABLE KEYS */;
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 24, '[{"PreviousWorth":0,"NewWorth":7},{"PreviousWorth":7,"NewWorth":7},{"PreviousWorth":7,"NewWorth":16},{"PreviousWorth":16,"NewWorth":24},{"PreviousWorth":24,"NewWorth":24}]');
/*!40000 ALTER TABLE `crypto` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.crypto_transactions
DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.crypto_transactions: ~8 rows (approximately)
/*!40000 ALTER TABLE `crypto_transactions` DISABLE KEYS */;
INSERT INTO `crypto_transactions` (`id`, `citizenid`, `title`, `message`, `date`) VALUES
	(33, 'YAO29665', 'Credit', 'You have 583.333333 Qbit(\\\'s) purchased!', '2022-02-14 10:29:36'),
	(34, 'DLK40295', 'Credit', 'You have 100 Qbit(\\\'s) purchased!', '2022-02-17 05:29:32'),
	(35, 'DLK40295', 'Credit', 'There are 1.519634 Qbit(\\\'s) credited!', '2022-02-17 05:32:11'),
	(36, 'DLK40295', 'Depreciation', 'You have 100 Qbit(\\\'s) sold!', '2022-02-17 05:32:42'),
	(37, 'DLK40295', 'Credit', 'There are 1.04556 Qbit(\\\'s) credited!', '2022-02-17 05:33:04'),
	(38, 'DLK40295', 'Credit', 'There are 0.727117 Qbit(\\\'s) credited!', '2022-02-17 05:33:24'),
	(39, 'DLK40295', 'Credit', 'There are 1.580263 Qbit(\\\'s) credited!', '2022-02-17 05:33:40'),
	(40, 'DLK40295', 'Credit', 'There are 1.137695 Qbit(\\\'s) credited!', '2022-02-17 21:41:10');
/*!40000 ALTER TABLE `crypto_transactions` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.dealers: ~0 rows (approximately)
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.fine_types
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.fine_types: ~89 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
	(1, 'Murder', 25000, 0, 0),
	(2, 'Involuntary Manslaughter', 10000, 0, 120),
	(3, 'Vehicular Manslaughter', 7500, 0, 100),
	(4, 'Attempted Murder on LEO', 1500, 0, 60),
	(5, 'Attempted Murder', 1000, 0, 50),
	(6, 'Assault w/ Deadly Weapon on LEO', 700, 0, 45),
	(7, 'Assault w/ Deadly Weapon', 350, 0, 30),
	(8, 'Assault on LEO', 150, 0, 15),
	(9, 'Assault', 100, 0, 10),
	(10, 'Kidnapping of an LEO', 400, 0, 40),
	(11, 'Kidnapping / Hostage Taking', 200, 0, 20),
	(12, 'Bank Robbery', 800, 0, 50),
	(13, 'Armored Truck Robbery', 650, 0, 40),
	(14, 'Jewelery Store Robbery ', 500, 0, 30),
	(15, 'Store Robbery', 150, 0, 15),
	(16, 'House Robbery', 100, 0, 10),
	(17, 'Corruption', 10000, 0, 650),
	(18, 'Felony Driving Under the Influence', 300, 0, 30),
	(19, 'Grand Theft Auto', 300, 0, 20),
	(20, 'Evading Arrest', 200, 0, 20),
	(21, 'Driving Under the Influence', 150, 0, 15),
	(22, 'Hit and Run', 150, 0, 15),
	(23, 'Operating a Motor Vehicle without a License', 100, 0, 10),
	(24, 'Criminal Speeding', 300, 0, 10),
	(25, 'Excessive Speeding 4', 250, 0, 0),
	(26, 'Excessive Speeding 3', 200, 0, 0),
	(27, 'Excessive Speeding 2', 150, 0, 0),
	(28, 'Excessive Speeding', 100, 0, 0),
	(29, 'Operating an Unregisted Motor Vehicle', 100, 0, 5),
	(30, 'Reckless Endangerment', 150, 0, 5),
	(31, 'Careless Driving', 100, 0, 0),
	(32, 'Operating a Non-Street Legal Vehicle', 200, 0, 5),
	(33, 'Failure to Stop', 100, 0, 0),
	(34, 'Obstructing Traffic', 150, 0, 0),
	(35, 'Illegal Lane Change', 100, 0, 0),
	(36, 'Failure to Yield to an Emergency Vehicle', 150, 0, 0),
	(37, 'Illegal Parking', 100, 0, 0),
	(38, 'Excessive Vehicle Noise', 100, 0, 0),
	(39, 'Driving without Proper Use of Headlights', 100, 0, 0),
	(40, 'Illegal U-Turn', 100, 0, 0),
	(41, 'Drug Manufacturing/Cultivation', 550, 0, 40),
	(42, 'Possession of Schedule 1 Drug', 150, 0, 15),
	(43, 'Possession of Schedule 2 Drug', 250, 0, 20),
	(44, 'Sale/Distribution of Schedule 1 Drug', 250, 0, 20),
	(45, 'Sale/Distribution of Schedule 2 Drug', 400, 0, 30),
	(46, 'Drug Trafficking', 500, 0, 40),
	(47, 'Weapons Caching of Class 2s', 2500, 0, 120),
	(48, 'Weapons Caching of Class 1s', 1250, 0, 60),
	(49, 'Weapons Trafficking of Class 2s', 1700, 0, 80),
	(50, 'Weapons Trafficking of Class 1s', 800, 0, 45),
	(51, 'Possession of a Class 2 Firearm', 800, 0, 40),
	(52, 'Possession of a Class 1 Firearm', 150, 0, 15),
	(53, 'Brandishing a Firearm', 100, 0, 5),
	(54, 'Unlawful discharge of a firearm', 150, 0, 10),
	(55, 'Perjury', 1000, 0, 60),
	(56, 'Arson', 500, 0, 30),
	(57, 'False Impersonation of a Government Official', 200, 0, 25),
	(58, 'Possession of Dirty Money', 200, 0, 25),
	(59, 'Possession of Stolen Goods', 100, 0, 15),
	(60, 'Unlawful Solicitation', 150, 0, 20),
	(61, 'Larceny', 150, 0, 20),
	(62, 'Felony Attempted Commision of an Offence/Crime', 350, 0, 20),
	(63, 'Tampering With Evidence', 200, 0, 20),
	(64, 'Illegal Gambling', 200, 0, 20),
	(65, 'Bribery', 200, 0, 20),
	(66, 'Stalking', 350, 0, 20),
	(67, 'Organizing an illegal event', 150, 0, 15),
	(68, 'Participating in an illegal event', 50, 0, 5),
	(69, 'Criminal Mischief', 100, 0, 15),
	(70, 'Prostitution', 250, 0, 15),
	(71, 'Failure to Identify', 150, 0, 15),
	(72, 'Obstruction of Justice', 150, 0, 15),
	(73, 'Resisting Arrest', 100, 0, 10),
	(74, 'Disturbing the Peace', 100, 0, 10),
	(75, 'Threat to do Bodily Harm', 100, 0, 10),
	(76, 'Terroristic Threat', 150, 0, 10),
	(77, 'Damage to Government Property', 150, 0, 10),
	(78, 'Contempt of Court', 250, 0, 10),
	(79, 'Failure to Obey a Lawful Order', 150, 0, 10),
	(80, 'False Report', 100, 0, 10),
	(81, 'Trespassing', 100, 0, 10),
	(82, 'Loitering', 100, 0, 0),
	(83, 'Public Intoxication', 100, 0, 0),
	(84, 'Indecent Exposure', 100, 0, 0),
	(85, 'Verbal Harassment ', 100, 0, 0),
	(86, 'Aiding and Abetting', 100, 0, 0),
	(87, 'Incident Report', 0, 0, 0),
	(88, 'Written Citation', 0, 0, 0),
	(89, 'Verbal Warning', 0, 0, 0);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.gloveboxitems
DROP TABLE IF EXISTS `gloveboxitems`;
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.gloveboxitems: ~2 rows (approximately)
/*!40000 ALTER TABLE `gloveboxitems` DISABLE KEYS */;
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(484, '48UMG469', '[]'),
	(487, '68GCK483', '[]');
/*!40000 ALTER TABLE `gloveboxitems` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.houselocations
DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(2) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.houselocations: ~2 rows (approximately)
/*!40000 ALTER TABLE `houselocations` DISABLE KEYS */;
INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `tier`, `garage`) VALUES
	(22, 'buen vino rd1', 'Buen Vino Rd 1', '{"cam":{"z":167.49899291992188,"y":1911.4918212890626,"h":207.9871063232422,"x":-2587.77099609375,"yaw":-10.0},"enter":{"z":167.49899291992188,"y":1911.4918212890626,"h":207.9871063232422,"x":-2587.77099609375}}', 0, 1000000, 6, NULL),
	(23, 'banham canyon dr1', 'Banham Canyon Dr 1', '{"cam":{"z":100.92838287353516,"y":1431.9681396484376,"h":144.274658203125,"x":-2797.447509765625,"yaw":-10.0},"enter":{"z":100.92838287353516,"y":1431.9681396484376,"h":144.274658203125,"x":-2797.447509765625}}', 0, 25000, 6, NULL),
	(24, 'lake vinewood dr1', 'Lake Vinewood Dr 1', '{"cam":{"x":228.40269470214845,"y":765.975341796875,"z":204.78077697753907,"yaw":-10.0,"h":238.67633056640626},"enter":{"y":765.975341796875,"z":204.78077697753907,"h":238.67633056640626,"x":228.40269470214845}}', 1, 25000, 4, '{"y":756.16357421875,"z":204.7877655029297,"h":238.75289916992188,"x":219.76443481445313}');
/*!40000 ALTER TABLE `houselocations` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.house_plants
DROP TABLE IF EXISTS `house_plants`;
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.house_plants: ~0 rows (approximately)
/*!40000 ALTER TABLE `house_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_plants` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.lapraces
DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.lapraces: ~1 rows (approximately)
/*!40000 ALTER TABLE `lapraces` DISABLE KEYS */;
INSERT INTO `lapraces` (`id`, `name`, `checkpoints`, `records`, `creator`, `distance`, `raceid`) VALUES
	(7, 'OG Battles', '[{"offset":{"right":{"z":29.09671974182129,"x":-347.63916015625,"y":-1446.6842041015626},"left":{"z":29.1265926361084,"x":-345.98809814453127,"y":-1416.7296142578126}},"coords":{"z":29.11165618896484,"x":-346.8136291503906,"y":-1431.7069091796876}},{"offset":{"right":{"z":30.80355453491211,"x":-232.43235778808595,"y":-1464.9046630859376},"left":{"z":30.78353118896484,"x":-211.0763397216797,"y":-1443.8353271484376}},"coords":{"z":30.79354286193847,"x":-221.7543487548828,"y":-1454.3699951171876}},{"offset":{"right":{"z":29.27310752868652,"x":-80.2972412109375,"y":-1596.568359375},"left":{"z":30.02523612976074,"x":-61.17055130004883,"y":-1573.468505859375}},"coords":{"z":29.64917182922363,"x":-70.73389434814453,"y":-1585.0184326171876}},{"offset":{"right":{"z":28.45777130126953,"x":81.0307846069336,"y":-1664.886474609375},"left":{"z":29.09913253784179,"x":69.43372344970703,"y":-1637.22607421875}},"coords":{"z":28.77845191955566,"x":75.23225402832031,"y":-1651.0562744140626}},{"offset":{"right":{"z":28.95624542236328,"x":189.11048889160157,"y":-1619.8111572265626},"left":{"z":28.29315948486328,"x":198.4096221923828,"y":-1591.2965087890626}},"coords":{"z":28.62470245361328,"x":193.7600555419922,"y":-1605.5538330078126}},{"offset":{"right":{"z":28.08209419250488,"x":303.8129577636719,"y":-1713.73046875},"left":{"z":29.41699028015136,"x":323.1117248535156,"y":-1690.80078125}},"coords":{"z":28.74954223632812,"x":313.46234130859377,"y":-1702.265625}},{"offset":{"right":{"z":27.79386329650879,"x":413.8319396972656,"y":-1804.3558349609376},"left":{"z":28.36186408996582,"x":433.5793762207031,"y":-1781.7789306640626}},"coords":{"z":28.0778636932373,"x":423.7056579589844,"y":-1793.0673828125}},{"offset":{"right":{"z":26.35135269165039,"x":493.7491760253906,"y":-1823.1951904296876},"left":{"z":28.41640090942382,"x":467.0899353027344,"y":-1809.5928955078126}},"coords":{"z":27.38387680053711,"x":480.4195556640625,"y":-1816.39404296875}},{"offset":{"right":{"z":28.01440811157226,"x":527.281494140625,"y":-1718.4517822265626},"left":{"z":29.26339721679687,"x":500.3993835449219,"y":-1705.1932373046876}},"coords":{"z":28.63890266418457,"x":513.8404541015625,"y":-1711.822509765625}},{"offset":{"right":{"z":27.8237075805664,"x":523.5684814453125,"y":-1652.2547607421876},"left":{"z":29.53614425659179,"x":504.487548828125,"y":-1675.3411865234376}},"coords":{"z":28.6799259185791,"x":514.0280151367188,"y":-1663.7979736328126}},{"offset":{"right":{"z":28.51900291442871,"x":376.2930603027344,"y":-1535.111328125},"left":{"z":28.91079902648925,"x":358.2544860839844,"y":-1559.0791015625}},"coords":{"z":28.71490097045898,"x":367.2737731933594,"y":-1547.09521484375}},{"offset":{"right":{"z":28.72421073913574,"x":273.6592102050781,"y":-1445.8306884765626},"left":{"z":28.75325965881347,"x":253.9170379638672,"y":-1468.4193115234376}},"coords":{"z":28.73873519897461,"x":263.7881164550781,"y":-1457.125}},{"offset":{"right":{"z":28.59392738342285,"x":269.03253173828127,"y":-1435.6259765625},"left":{"z":28.97860527038574,"x":244.2305908203125,"y":-1418.75244140625}},"coords":{"z":28.78626632690429,"x":256.6315612792969,"y":-1427.189208984375}},{"offset":{"right":{"z":30.73782348632812,"x":347.21978759765627,"y":-1319.8870849609376},"left":{"z":32.17632293701172,"x":318.12725830078127,"y":-1327.0675048828126}},"coords":{"z":31.45707321166992,"x":332.67352294921877,"y":-1323.477294921875}},{"offset":{"right":{"z":28.12413597106933,"x":210.56594848632813,"y":-1300.4346923828126},"left":{"z":29.32197761535644,"x":230.21783447265626,"y":-1323.0701904296876}},"coords":{"z":28.72305679321289,"x":220.3918914794922,"y":-1311.75244140625}},{"offset":{"right":{"z":28.72106170654297,"x":144.914306640625,"y":-1360.4769287109376},"left":{"z":28.62430191040039,"x":135.4796142578125,"y":-1388.9547119140626}},"coords":{"z":28.67268180847168,"x":140.19696044921876,"y":-1374.7158203125}},{"offset":{"right":{"z":28.77773666381836,"x":17.85193824768066,"y":-1350.017333984375},"left":{"z":28.72057723999023,"x":18.19851112365722,"y":-1380.015380859375}},"coords":{"z":28.74915695190429,"x":18.02522468566894,"y":-1365.016357421875}},{"offset":{"right":{"z":28.50184440612793,"x":-70.62904357910156,"y":-1340.654052734375},"left":{"z":28.73153114318847,"x":-90.68206787109375,"y":-1362.966064453125}},"coords":{"z":28.6166877746582,"x":-80.65555572509766,"y":-1351.81005859375}},{"offset":{"right":{"z":28.80722618103027,"x":-83.57366943359375,"y":-1252.76953125},"left":{"z":28.58331871032715,"x":-113.56520080566406,"y":-1252.0927734375}},"coords":{"z":28.69527244567871,"x":-98.5694351196289,"y":-1252.43115234375}},{"offset":{"right":{"z":24.68454551696777,"x":-124.32303619384766,"y":-1124.1446533203126},"left":{"z":25.45604133605957,"x":-128.317626953125,"y":-1153.8675537109376}},"coords":{"z":25.07029342651367,"x":-126.3203353881836,"y":-1139.006103515625}},{"offset":{"right":{"z":22.67268562316894,"x":-259.2828063964844,"y":-1125.816650390625},"left":{"z":22.28151893615722,"x":-259.9039611816406,"y":-1155.8076171875}},"coords":{"z":22.47710227966308,"x":-259.5933837890625,"y":-1140.8121337890626}},{"offset":{"right":{"z":28.66778755187988,"x":-421.785888671875,"y":-1097.369140625},"left":{"z":28.61516761779785,"x":-431.89605712890627,"y":-1125.6142578125}},"coords":{"z":28.64147758483886,"x":-426.8409729003906,"y":-1111.49169921875}},{"offset":{"right":{"z":22.33145523071289,"x":-517.2334594726563,"y":-1041.24560546875},"left":{"z":21.85103225708007,"x":-546.0396118164063,"y":-1049.610595703125}},"coords":{"z":22.09124374389648,"x":-531.6365356445313,"y":-1045.4281005859376}},{"offset":{"right":{"z":22.78548431396484,"x":-546.615966796875,"y":-950.7015991210938},"left":{"z":22.80083084106445,"x":-564.0645751953125,"y":-975.1054077148438}},"coords":{"z":22.79315757751465,"x":-555.3402709960938,"y":-962.9035034179688}},{"offset":{"right":{"z":20.96265411376953,"x":-662.5089111328125,"y":-941.7716064453125},"left":{"z":20.61857604980468,"x":-662.8499755859375,"y":-971.7677001953125}},"coords":{"z":20.79061508178711,"x":-662.679443359375,"y":-956.7696533203125}},{"offset":{"right":{"z":12.75205421447753,"x":-835.638671875,"y":-1018.8477783203125},"left":{"z":12.778902053833,"x":-805.8697509765625,"y":-1015.131591796875}},"coords":{"z":12.76547813415527,"x":-820.7542114257813,"y":-1016.9896850585938}},{"offset":{"right":{"z":10.21302509307861,"x":-785.0916748046875,"y":-1126.2528076171876},"left":{"z":9.96803760528564,"x":-757.557861328125,"y":-1114.3433837890626}},"coords":{"z":10.09053134918212,"x":-771.3247680664063,"y":-1120.298095703125}},{"offset":{"right":{"z":9.48836421966552,"x":-684.5315551757813,"y":-1289.414794921875},"left":{"z":10.49693393707275,"x":-656.6372680664063,"y":-1278.419921875}},"coords":{"z":9.99264907836914,"x":-670.5844116210938,"y":-1283.9173583984376}},{"offset":{"right":{"z":9.24218654632568,"x":-670.4364013671875,"y":-1418.3388671875},"left":{"z":10.80483531951904,"x":-640.4852294921875,"y":-1419.037353515625}},"coords":{"z":10.02351093292236,"x":-655.4608154296875,"y":-1418.6881103515626}},{"offset":{"right":{"z":14.62358951568603,"x":-702.1652221679688,"y":-1550.3931884765626},"left":{"z":17.03779220581054,"x":-677.1995239257813,"y":-1566.8516845703126}},"coords":{"z":15.83069133758545,"x":-689.682373046875,"y":-1558.6224365234376}},{"offset":{"right":{"z":23.21055221557617,"x":-705.7781372070313,"y":-1635.7633056640626},"left":{"z":22.89298248291015,"x":-682.6089477539063,"y":-1616.7083740234376}},"coords":{"z":23.05176734924316,"x":-694.1935424804688,"y":-1626.23583984375}},{"offset":{"right":{"z":22.44477272033691,"x":-609.9384155273438,"y":-1728.626953125},"left":{"z":23.45159339904785,"x":-592.7077026367188,"y":-1704.08935546875}},"coords":{"z":22.94818305969238,"x":-601.3230590820313,"y":-1716.358154296875}},{"offset":{"right":{"z":20.90146446228027,"x":-476.6414489746094,"y":-1791.6358642578126},"left":{"z":19.62331199645996,"x":-475.9482116699219,"y":-1761.6710205078126}},"coords":{"z":20.26238822937011,"x":-476.2948303222656,"y":-1776.6534423828126}},{"offset":{"right":{"z":19.34356498718261,"x":-393.5594482421875,"y":-1759.1378173828126},"left":{"z":19.85464668273925,"x":-417.70245361328127,"y":-1741.3375244140626}},"coords":{"z":19.59910583496093,"x":-405.6309509277344,"y":-1750.2376708984376}},{"offset":{"right":{"z":18.15361976623535,"x":-338.1510925292969,"y":-1662.25048828125},"left":{"z":18.1437931060791,"x":-364.8504333496094,"y":-1648.5703125}},"coords":{"z":18.14870643615722,"x":-351.5007629394531,"y":-1655.410400390625}},{"offset":{"right":{"z":26.67737579345703,"x":-276.4614562988281,"y":-1529.4549560546876},"left":{"z":27.56322479248047,"x":-306.3217468261719,"y":-1526.7022705078126}},"coords":{"z":27.12030029296875,"x":-291.3916015625,"y":-1528.07861328125}},{"offset":{"right":{"z":30.17550277709961,"x":-306.33734130859377,"y":-1410.3592529296876},"left":{"z":31.25088500976562,"x":-306.28515625,"y":-1440.3399658203126}},"coords":{"z":30.71319389343261,"x":-306.3112487792969,"y":-1425.349609375}}]', '{"Time":1922,"Holder":["Reece","Riggs"]}', 'BDQ75670', 4411, 'LR-2121'),
	(8, 'EasyDubs', '[{"coords":{"x":-87.01974487304688,"z":25.80834579467773,"y":-1095.23828125},"offset":{"left":{"x":-75.42617797851563,"z":25.85243415832519,"y":-1098.3345947265626},"right":{"x":-98.61331176757813,"z":25.76425743103027,"y":-1092.1419677734376}}},{"coords":{"x":-40.45156860351562,"z":28.86783027648925,"y":-972.6721801757813},"offset":{"left":{"x":-51.62612915039062,"z":28.89207458496093,"y":-968.2985229492188},"right":{"x":-29.27700996398925,"z":28.84358596801757,"y":-977.0458374023438}}},{"coords":{"x":-26.79925727844238,"z":28.88529396057129,"y":-951.5166625976563},"offset":{"left":{"x":-30.90767669677734,"z":28.8767147064209,"y":-940.2418823242188},"right":{"x":-22.69083786010742,"z":28.89387321472168,"y":-962.7914428710938}}},{"coords":{"x":-4.84194803237915,"z":28.88611793518066,"y":-955.1416015625},"offset":{"left":{"x":-1.38088130950927,"z":28.87153434753418,"y":-943.6515502929688},"right":{"x":-8.30301475524902,"z":28.90070152282715,"y":-966.6316528320313}}},{"coords":{"x":86.29369354248047,"z":28.88460159301757,"y":-992.1491088867188},"offset":{"left":{"x":89.02339172363281,"z":28.87509727478027,"y":-980.4636840820313},"right":{"x":83.56399536132813,"z":28.89410591125488,"y":-1003.8345336914063}}},{"coords":{"x":198.29815673828126,"z":28.84660339355468,"y":-1034.630126953125},"offset":{"left":{"x":202.40896606445313,"z":28.84766578674316,"y":-1023.356201171875},"right":{"x":194.18734741210938,"z":28.84554100036621,"y":-1045.904052734375}}},{"coords":{"x":231.91415405273438,"z":28.78769493103027,"y":-1015.6553955078125},"offset":{"left":{"x":220.02540588378907,"z":28.78550338745117,"y":-1014.025146484375},"right":{"x":243.8029022216797,"z":28.78988647460937,"y":-1017.28564453125}}},{"coords":{"x":282.3848571777344,"z":28.77896690368652,"y":-876.1400146484375},"offset":{"left":{"x":270.9048767089844,"z":28.79852867126465,"y":-872.645751953125},"right":{"x":293.8648376464844,"z":28.7594051361084,"y":-879.63427734375}}},{"coords":{"x":310.6758117675781,"z":28.81827354431152,"y":-857.0328979492188},"offset":{"left":{"x":310.533447265625,"z":29.22970199584961,"y":-845.040771484375},"right":{"x":310.81817626953127,"z":28.40684509277343,"y":-869.0250244140625}}},{"coords":{"x":391.5110778808594,"z":28.81910133361816,"y":-854.3927001953125},"offset":{"left":{"x":392.0606994628906,"z":28.82132720947265,"y":-842.4052734375},"right":{"x":390.9614562988281,"z":28.81687545776367,"y":-866.380126953125}}},{"coords":{"x":405.71502685546877,"z":28.87613296508789,"y":-877.9583129882813},"offset":{"left":{"x":412.6998596191406,"z":29.02410316467285,"y":-878.3945922851563},"right":{"x":398.7301940917969,"z":28.72816276550293,"y":-877.5220336914063}}},{"coords":{"x":401.4035339355469,"z":28.89825630187988,"y":-952.2818603515625},"offset":{"left":{"x":408.37738037109377,"z":29.02185821533203,"y":-952.8735961914063},"right":{"x":394.4296875,"z":28.77465438842773,"y":-951.6901245117188}}},{"coords":{"x":397.93109130859377,"z":28.94679832458496,"y":-1025.90478515625},"offset":{"left":{"x":404.9171142578125,"z":29.09694290161132,"y":-1026.3209228515626},"right":{"x":390.945068359375,"z":28.79665374755859,"y":-1025.4886474609376}}},{"coords":{"x":382.256591796875,"z":28.73539733886718,"y":-1051.6905517578126},"offset":{"left":{"x":380.5320129394531,"z":28.85440444946289,"y":-1064.5750732421876},"right":{"x":383.9811706542969,"z":28.61639022827148,"y":-1038.8060302734376}}},{"coords":{"x":250.04177856445313,"z":28.82041358947754,"y":-1048.9825439453126},"offset":{"left":{"x":247.078369140625,"z":28.8307933807373,"y":-1061.6402587890626},"right":{"x":253.00518798828126,"z":28.81003379821777,"y":-1036.3248291015626}}},{"coords":{"x":209.9600372314453,"z":28.89489555358886,"y":-1074.7008056640626},"offset":{"left":{"x":222.83255004882813,"z":30.46466064453125,"y":-1075.6141357421876},"right":{"x":197.0875244140625,"z":27.32513046264648,"y":-1073.7874755859376}}},{"coords":{"x":213.14447021484376,"z":28.85045433044433,"y":-1159.0535888671876},"offset":{"left":{"x":225.72030639648438,"z":28.16865158081054,"y":-1155.831298828125},"right":{"x":200.56863403320313,"z":29.53225708007812,"y":-1162.27587890625}}},{"coords":{"x":213.44729614257813,"z":28.81235122680664,"y":-1306.368896484375},"offset":{"left":{"x":226.25634765625,"z":28.82629203796386,"y":-1308.5888671875},"right":{"x":200.63824462890626,"z":28.79841041564941,"y":-1304.14892578125}}},{"coords":{"x":167.5503387451172,"z":28.79902839660644,"y":-1375.5303955078126},"offset":{"left":{"x":177.91653442382813,"z":28.79883575439453,"y":-1383.375244140625},"right":{"x":157.18414306640626,"z":28.79922103881836,"y":-1367.685546875}}},{"coords":{"x":129.46690368652345,"z":28.80614852905273,"y":-1381.3282470703126},"offset":{"left":{"x":122.18572235107422,"z":28.89857864379882,"y":-1392.097412109375},"right":{"x":136.7480926513672,"z":28.71371841430664,"y":-1370.55908203125}}},{"coords":{"x":90.71533203125,"z":28.80836486816406,"y":-1339.6829833984376},"offset":{"left":{"x":79.88504028320313,"z":28.99425506591797,"y":-1346.8712158203126},"right":{"x":101.54562377929688,"z":28.62247467041015,"y":-1332.4947509765626}}},{"coords":{"x":61.78144836425781,"z":28.79394340515136,"y":-1268.751220703125},"offset":{"left":{"x":48.81043243408203,"z":29.12071800231933,"y":-1269.554931640625},"right":{"x":74.7524642944336,"z":28.4671688079834,"y":-1267.947509765625}}},{"coords":{"x":62.31539154052734,"z":28.78239250183105,"y":-1162.8514404296876},"offset":{"left":{"x":49.31539154052734,"z":28.79028129577636,"y":-1162.8526611328126},"right":{"x":75.31539154052735,"z":28.77450370788574,"y":-1162.8502197265626}}},{"coords":{"x":26.88360023498535,"z":28.80015182495117,"y":-1135.1011962890626},"offset":{"left":{"x":27.13447380065918,"z":28.9495735168457,"y":-1148.097900390625},"right":{"x":26.63272666931152,"z":28.65073013305664,"y":-1122.1044921875}}},{"coords":{"x":-67.34613800048828,"z":25.29178428649902,"y":-1138.8284912109376},"offset":{"left":{"x":-67.69075775146485,"z":25.12678146362304,"y":-1151.8228759765626},"right":{"x":-67.00151824951172,"z":25.456787109375,"y":-1125.8341064453126}}}]', NULL, 'YAO29665', 1816, 'LR-7795');
/*!40000 ALTER TABLE `lapraces` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.mdt_reports
DROP TABLE IF EXISTS `mdt_reports`;
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.mdt_reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
INSERT INTO `mdt_reports` (`id`, `char_id`, `title`, `incident`, `charges`, `author`, `name`, `date`) VALUES
	(1, 137, 'Leslie BATES | Danger towards public.', 'Drinking while driving, needs be taught a lesson!', '{"Felony Driving Under the Influence":1}', 'Reece', 'Leslie Bates', '02-18-2022 19:31:44');
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.mdt_warrants
DROP TABLE IF EXISTS `mdt_warrants`;
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.mdt_warrants: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_warrants` DISABLE KEYS */;
INSERT INTO `mdt_warrants` (`id`, `name`, `char_id`, `report_id`, `report_title`, `charges`, `date`, `expire`, `notes`, `author`) VALUES
	(1, 'Leslie Bates', 137, 1, 'Leslie BATES | Danger towards public.', '{"Felony Driving Under the Influence":1}', '02-18-2022 19:38:16', '2022-02-25T19:38:16.208Z', NULL, 'Reece');
/*!40000 ALTER TABLE `mdt_warrants` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.mosley_vehicles
DROP TABLE IF EXISTS `mosley_vehicles`;
CREATE TABLE IF NOT EXISTS `mosley_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `mosleyid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosleyId` (`mosleyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.mosley_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `mosley_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mosley_vehicles` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.occasion_vehicles
DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.occasion_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `occasion_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `occasion_vehicles` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.osmplaytime
DROP TABLE IF EXISTS `osmplaytime`;
CREATE TABLE IF NOT EXISTS `osmplaytime` (
  `steam` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mins` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.osmplaytime: ~0 rows (approximately)
/*!40000 ALTER TABLE `osmplaytime` DISABLE KEYS */;
/*!40000 ALTER TABLE `osmplaytime` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.permissions: ~7 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `license`, `permission`) VALUES
	(1, 'Reece', 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'god'),
	(14, 'T Goobs', 'license:74200796acfc1dc75a138cf103bb1af8c3e9710b', 'admin'),
	(16, 'Gmartinez', 'license:72bcee3c1ce42752bd9cb7540d7e1e23278101e4', 'admin'),
	(17, 'BERKZZ', 'license:0f48c0dd5580e42df60ae4b7bced26337f88bab9', 'admin'),
	(18, 'Big Lesser Shagger', 'license:3d0504f9ed84d2f8c0e1d6cfdf9dda12d5acb29a', 'god'),
	(19, '?SkrrKuro?', 'license:6798bfbee86c8ea7defd2a7cb59c17f0c98b30f2', 'admin'),
	(23, 'n0xious', 'license:93517d26094ae7be37da61995ebb4a56805eeba5', 'god'),
	(25, 'Randy', 'license:9b68498e41001d0be6d4bb0a792189339ebb2ce6', 'admin');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.phone_invoices
DROP TABLE IF EXISTS `phone_invoices`;
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.phone_invoices: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_invoices` DISABLE KEYS */;
INSERT INTO `phone_invoices` (`id`, `citizenid`, `amount`, `society`, `sender`) VALUES
	(13, 'DLK40295', 1000, 'burgershot', 'Leslie');
/*!40000 ALTER TABLE `phone_invoices` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.phone_messages: ~2 rows (approximately)
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
INSERT INTO `phone_messages` (`id`, `citizenid`, `number`, `messages`) VALUES
	(11, 'FFR58493', '1907042313', '[{"date":"16-1-2022","messages":[{"message":"yo wagwan b ","data":[],"sender":"FFR58493","time":"02:58","type":"message"},{"message":"hello","data":[],"sender":"DLK40295","time":"02:58","type":"message"}]},{"date":"18-1-2022","messages":[{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Photo","data":{"url":"\\"https://media.discordapp.net/attachments/944265970757795891/944302809891881007/screenshot.jpg\\""},"sender":"DLK40295","time":"18:42","type":"picture"},{"message":"Photo","type":"picture","sender":"FFR58493","time":"22:16","data":{"url":"\\"https://media.discordapp.net/attachments/944265970757795891/944356667070488596/screenshot.jpg\\""}},{"message":"you nigga ","type":"message","sender":"FFR58493","time":"22:16","data":[]},{"message":"Shared Location","type":"location","sender":"FFR58493","time":"22:16","data":{"y":-642.58349609375,"x":-519.2341918945313}}]}]'),
	(12, 'DLK40295', '1488067006', '[{"date":"16-1-2022","messages":[{"message":"yo wagwan b ","data":[],"sender":"FFR58493","time":"02:58","type":"message"},{"message":"hello","data":[],"sender":"DLK40295","time":"02:58","type":"message"}]},{"date":"18-1-2022","messages":[{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Shared Location","data":{"y":763.4498291015625,"x":210.4907684326172},"sender":"DLK40295","time":"18:17","type":"location"},{"message":"Photo","data":{"url":"\\"https://media.discordapp.net/attachments/944265970757795891/944302809891881007/screenshot.jpg\\""},"sender":"DLK40295","time":"18:42","type":"picture"},{"message":"Photo","type":"picture","sender":"FFR58493","time":"22:16","data":{"url":"\\"https://media.discordapp.net/attachments/944265970757795891/944356667070488596/screenshot.jpg\\""}},{"message":"you nigga ","type":"message","sender":"FFR58493","time":"22:16","data":[]},{"message":"Shared Location","type":"location","sender":"FFR58493","time":"22:16","data":{"y":-642.58349609375,"x":-519.2341918945313}}]}]');
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.phone_tweets
DROP TABLE IF EXISTS `phone_tweets`;
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.phone_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_tweets` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.plants
DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `water` double NOT NULL,
  `food` double NOT NULL,
  `growth` double NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.plants: ~0 rows (approximately)
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pending_finance` int(255) DEFAULT 0,
  `phone` longtext DEFAULT NULL,
  `profilepicture` longtext DEFAULT NULL,
  `background` longtext DEFAULT NULL,
  `iban` longtext DEFAULT NULL,
  `mdw_image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdw_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdw_alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mdw_staffdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pp` longtext DEFAULT '',
  `policemdtinfo` longtext DEFAULT '',
  `tags` longtext DEFAULT '',
  `gallery` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.players: ~11 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `pending_finance`, `phone`, `profilepicture`, `background`, `iban`, `mdw_image`, `mdw_description`, `mdw_alias`, `mdw_staffdata`, `pp`, `policemdtinfo`, `tags`, `gallery`) VALUES
	(136, 'NAH71280', 1, 'license:72bcee3c1ce42752bd9cb7540d7e1e23278101e4', 'Gmartinez', '{"crypto":0,"4500":2000,"bank":4420,"cash":500}', '{"cid":"1","nationality":"Black","gender":0,"backstory":"placeholder backstory","lastname":"Martinez","firstname":"Michael","birthdate":"1996-05-12","phone":"1181160540","account":"US07QBCore4542977711"}', '{"label":"Mechanic","payment":300,"onduty":false,"name":"mechanic","isboss":true,"grade":{"name":"Manager","level":4}}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"z":33.6479377746582,"y":-361.2479248046875,"x":-700.1119384765625,"w":259.9513854980469}', '{"licences":{"business":false,"driver":true,"weapon":false},"inside":{"apartment":[]},"tracker":false,"stress":11,"callsign":"NO CALLSIGN","inlaststand":false,"jailitems":[],"attachmentcraftingrep":0,"ishandcuffed":false,"commandbinds":[],"phone":[],"incarry":false,"currentapartment":"apartment17400","fingerprint":"gK634T90QUQ0782","phonedata":{"SerialNumber":17120038,"InstalledApps":[]},"craftingrep":0,"hunger":94.8,"status":[],"walletid":"qb-66297938","injail":0,"thirst":95.2,"dealerrep":0,"isdead":false,"bloodtype":"A+","armor":0,"jobrep":{"taxi":0,"trucker":0,"hotdog":0,"tow":0},"fitbit":[],"criminalrecord":{"hasRecord":false}}', '[{"info":{"ammo":0,"serie":"69zCa8Qz724YQfe"},"type":"weapon","name":"weapon_snspistol_mk2","amount":1,"slot":1},{"info":"","type":"item","name":"paintball-ammo","amount":12,"slot":2}]', '2022-02-22 18:14:14', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(137, 'BDQ75670', 1, 'license:3d0504f9ed84d2f8c0e1d6cfdf9dda12d5acb29a', 'Big Lesser Shagger', '{"crypto":0,"4500":2000,"bank":2201160.0,"cash":1996810851.5}', '{"nationality":"british","phone":"1259328771","gender":0,"backstory":"placeholder backstory","lastname":"Bates","firstname":"Leslie","cid":"1","account":"US03QBCore5214995698","birthdate":"1990-01-01"}', '{"label":"Law Enforcement","payment":600,"onduty":false,"name":"police","isboss":false,"grade":{"level":5,"name":"CID"}}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"z":55.34688949584961,"y":2621.08642578125,"x":1611.49169921875,"w":272.1538391113281}', '{"licences":{"business":false,"driver":true,"weapon":false},"thirst":95.2,"inlaststand":false,"stress":0,"isdead":false,"armor":0,"jailitems":[],"attachmentcraftingrep":0,"ishandcuffed":false,"phonedata":{"SerialNumber":71156239,"InstalledApps":[]},"phone":[],"incarry":false,"currentapartment":"apartment17065","fingerprint":"Wh627c35cPG7176","jobrep":{"taxi":0,"trucker":0,"hotdog":0,"tow":0},"craftingrep":0,"callsign":"NO CALLSIGN","bloodtype":"O+","walletid":"qb-74081747","injail":0,"hunger":94.8,"dealerrep":0,"inside":{"apartment":[]},"commandbinds":[],"criminalrecord":{"hasRecord":false},"status":[],"fitbit":[],"tracker":false}', '[{"info":{"cash":10098692796.0},"type":"item","name":"moneybag","amount":1,"slot":1}]', '2022-02-22 14:53:17', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(138, 'YAO29665', 1, 'license:93517d26094ae7be37da61995ebb4a56805eeba5', 'n0xious', '{"4500":2000,"crypto":583.333333,"bank":1e43,"cash":1e43}', '{"lastname":"Kawecki","birthdate":"1999-03-14","backstory":"placeholder backstory","firstname":"Wiktor","phone":"1797781038","cid":"1","nationality":"Polish","account":"US06QBCore6334482833","gender":0,"card":6830169677734375}', '{"name":"mechanic","onduty":true,"grade":{"name":"Advanced","level":3},"label":"Mechanic","isboss":false,"payment":190}', '{"name":"ballas","isboss":false,"label":"Ballas","grade":{"level":2,"name":"Shot Caller"}}', '{"w":134.11367797851563,"x":-111.16612243652344,"y":-1727.5360107421876,"z":29.46767997741699}', '{"injail":0,"hunger":73.99999999999999,"walletid":"qb-15455973","inlaststand":false,"avatar":"https://i.imgur.com/Ipv41TG.jpg","licences":{"business":false,"driver":false},"incarry":false,"inside":{"apartment":[]},"stress":0,"isdead":false,"bloodtype":"O-","dealerrep":0,"status":[],"phone":{"background":"https://i.imgur.com/dLKq3IM.jpeg","profilepicture":"https://i.imgur.com/gYt0mfc.jpg"},"armor":0,"tracker":false,"phonedata":{"SerialNumber":52187158,"InstalledApps":[]},"ishandcuffed":false,"currentapartment":"apartment11401","craftingrep":0,"callsign":"NO CALLSIGN","thirst":76.00000000000002,"jailitems":[],"attachmentcraftingrep":0,"fingerprint":"sJ803V52Tam0183","fitbit":[],"commandbinds":{"F9":{"argument":"","command":""},"F10":{"argument":"","command":""},"F7":{"argument":"","command":""},"F5":{"argument":"police","command":"police"},"F6":{"argument":"","command":""},"F3":{"argument":"admin","command":"admin"},"F2":{"argument":"PHONE","command":"phone"}},"jobrep":{"trucker":0,"hotdog":0,"taxi":0,"tow":0},"criminalrecord":{"hasRecord":true,"date":{"isdst":false,"hour":14,"month":2,"day":22,"yday":53,"year":2022,"min":48,"wday":3,"sec":6}}}', '[{"name":"weapon_pistol","slot":1,"amount":1,"info":{"ammo":0,"serie":"65req3GZ341nzfZ"},"type":"weapon"},{"name":"weapon_pistol","slot":2,"amount":1,"info":{"ammo":0,"serie":"03fzQ6xJ525pHXL"},"type":"weapon"},{"name":"harness","slot":3,"amount":1,"info":{"uses":15},"type":"item"},{"name":"phone","slot":4,"amount":1,"info":[],"type":"item"}]', '2022-02-23 04:58:57', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(139, 'DLK40295', 1, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'Reece', '{"cash":6661870.205718782,"bank":9831,"4500":2000,"crypto":6.01026899999999}', '{"gender":0,"cid":"1","lastname":"Riggs","firstname":"Reece","nationality":"English","birthdate":"1999-05-07","account":"US09QBCore7241574426","phone":"1907042313","backstory":"placeholder backstory"}', '{"onduty":false,"payment":300,"name":"mechanic","label":"Mechanic","grade":{"name":"Manager","level":4},"isboss":true}', '{"grade":{"name":"Boss","level":3},"label":"Ballas","name":"ballas","isboss":true}', '{"y":-1332.729248046875,"x":57.49939727783203,"w":13.06914329528808,"z":29.3144416809082}', '{"licences":{"weapon":false,"driver":true,"business":false},"phone":[],"thirst":90.4,"ishandcuffed":false,"inlaststand":false,"jailitems":[],"armor":0,"stress":3,"fitbit":[],"fingerprint":"eN131j79lQz6639","tracker":false,"hunger":89.6,"currentapartment":"apartment11757","inside":{"apartment":[]},"walletid":"qb-81720083","injail":0,"attachmentcraftingrep":0,"callsign":"T1","isdead":false,"dealerrep":0,"criminalrecord":{"hasRecord":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"status":[],"incarry":false,"craftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":15424942},"bloodtype":"A-","commandbinds":{"F10":{"argument":"","command":""},"F2":{"argument":"","command":"inventory"},"F3":{"argument":"","command":""},"F5":{"argument":"","command":"admin"},"F6":{"argument":"","command":""},"F7":{"argument":"","command":""},"F9":{"argument":"","command":""}}}', '[{"slot":1,"amount":1,"name":"weapon_pistol","info":{"ammo":169,"quality":82.44999999999935,"serie":"66VYA4Cb515VkZZ"},"type":"weapon"},{"slot":2,"amount":1,"name":"tunerlaptop","info":[],"type":"item"},{"slot":3,"amount":1,"name":"nitrous","info":[],"type":"item"},{"slot":4,"amount":1,"name":"repairkit","info":[],"type":"item"},{"slot":6,"amount":1,"name":"weapon_carbinerifle","info":{"attachments":[{"item":"rifle_flashlight","label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"},{"item":"carbinerifle_scope","label":"Scope","component":"COMPONENT_AT_SCOPE_MEDIUM"}],"serie":"69fII4Qa836OhmN","quality":24.09999999999902,"ammo":0},"type":"weapon"},{"slot":7,"amount":1,"name":"phone","info":[],"type":"item"},{"slot":8,"amount":1,"name":"visa","info":[],"type":"item"},{"slot":9,"amount":1,"name":"safecracker","info":[],"type":"item"},{"slot":10,"amount":1,"name":"weapon_knife","info":{"serie":"61HRi7XY658eqTG"},"type":"weapon"},{"slot":12,"amount":1,"name":"weapon_minigun","info":{"ammo":63,"quality":0,"serie":"23Pgl8nh113inXY"},"type":"weapon"},{"slot":14,"amount":1,"name":"pixellaptop","info":[],"type":"item"}]', '2022-02-23 21:22:44', 0, NULL, NULL, NULL, NULL, '', '', '', '', 'https://i.imgur.com/vgzwN68.png', '', '', ''),
	(140, 'RQS49084', 1, 'license:74200796acfc1dc75a138cf103bb1af8c3e9710b', 'T Goobs', '{"bank":100015120,"4500":2000,"crypto":0,"cash":100000000}', '{"cid":"1","gender":0,"birthdate":"1990-04-11","backstory":"placeholder backstory","lastname":"Goobs","firstname":"Tyler","nationality":"ENG","phone":"1458539264","account":"US02QBCore7497120740"}', '{"label":"Law Enforcement","payment":1500,"onduty":true,"name":"police","isboss":true,"grade":{"name":"Command","level":6}}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"z":45.55279541015625,"y":2623.377685546875,"x":1637.9654541015626,"w":149.33546447753907}', '{"licences":{"business":false,"driver":true,"weapon":false},"thirst":76.00000000000002,"tracker":false,"stress":18,"callsign":"NO CALLSIGN","currentapartment":"apartment25702","jailitems":[],"hunger":73.99999999999999,"ishandcuffed":false,"attachmentcraftingrep":0,"phone":[],"incarry":false,"phonedata":{"SerialNumber":33956940,"InstalledApps":[]},"fingerprint":"vO245d68PTv6071","status":[],"craftingrep":0,"walletid":"qb-22257856","commandbinds":[],"criminalrecord":{"hasRecord":true,"date":{"wday":2,"min":50,"month":2,"sec":19,"hour":22,"yday":45,"day":14,"year":2022,"isdst":false}},"injail":0,"isdead":false,"inlaststand":false,"dealerrep":0,"bloodtype":"A-","armor":0,"jobrep":{"taxi":0,"trucker":0,"hotdog":0,"tow":0},"fitbit":[],"inside":{"apartment":[]}}', '[{"info":{"ammo":0,"serie":"24WHy9sC752UImJ","quality":0},"type":"weapon","name":"weapon_combatpistol","amount":1,"slot":1},{"info":{"ammo":1,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"serie":"69jGf4VY400CYBl","quality":4.14999999999905},"type":"weapon","name":"weapon_carbinerifle","amount":1,"slot":2},{"info":{"ammo":0,"serie":"90iJY3qI396Sxlv","quality":84.99999999999943},"type":"weapon","name":"weapon_heavypistol","amount":1,"slot":3},{"info":{"ammo":1,"serie":"16lNk1Cu494fQer","quality":87.84999999999954},"type":"weapon","name":"weapon_pistol50","amount":1,"slot":4},{"info":[],"type":"item","name":"radio","amount":1,"slot":5},{"info":{"ammo":0,"serie":"54TnH0SC473pjof"},"type":"weapon","name":"weapon_snspistol","amount":1,"slot":6},{"info":[],"type":"item","name":"rifle_ammo","amount":35,"slot":8},{"info":[],"type":"item","name":"phone","amount":1,"slot":9},{"info":[],"type":"item","name":"pistol_ammo","amount":31,"slot":10}]', '2022-02-22 14:55:05', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(141, 'FFR58493', 1, 'license:0f48c0dd5580e42df60ae4b7bced26337f88bab9', 'BERKZZ', '{"cash":249705.0,"crypto":0,"4500":2000,"bank":123160}', '{"firstname":"Manlike","birthdate":"2000-09-01","cid":"1","lastname":"Berkzino","phone":"1488067006","gender":0,"backstory":"placeholder backstory","card":2548248291015625,"nationality":"Turkish","account":"US01QBCore1217455832"}', '{"label":"Law Enforcement","name":"police","payment":1500,"grade":{"level":6,"name":"Command"},"isboss":true,"onduty":true}', '{"grade":{"level":0,"name":"none"},"isboss":false,"name":"none","label":"No Gang Affiliaton"}', '{"x":415.5281677246094,"y":-972.089111328125,"z":29.44496726989746,"w":302.79071044921877}', '{"licences":{"weapon":false,"driver":true,"business":false},"dealerrep":0,"inlaststand":false,"injail":0,"craftingrep":0,"armor":0,"ishandcuffed":false,"inside":{"apartment":[]},"bloodtype":"A+","walletid":"qb-55544456","thirst":95.2,"callsign":"COMM-528","hunger":94.8,"criminalrecord":{"date":{"month":2,"wday":5,"year":2022,"isdst":false,"hour":19,"sec":3,"day":17,"yday":48,"min":14},"hasRecord":true},"jailitems":[],"fingerprint":"wH122w70oJI7215","fitbit":[],"status":[],"tracker":false,"jobrep":{"tow":0,"trucker":0,"hotdog":0,"taxi":0},"incarry":false,"phonedata":{"InstalledApps":[],"SerialNumber":61132004},"phone":{"profilepicture":"default"},"isdead":false,"currentapartment":"apartment17556","commandbinds":[],"attachmentcraftingrep":0,"stress":0}', '[{"name":"weapon_glock","slot":1,"type":"weapon","amount":1,"info":{"quality":100,"ammo":123,"serie":"31ZsY3IL471phKT"}},{"name":"pistol_ammo","slot":2,"type":"item","amount":5,"info":[]},{"name":"smg_ammo","slot":3,"type":"item","amount":9,"info":[]},{"name":"weapon_smg","slot":4,"type":"weapon","amount":1,"info":{"ammo":1,"quality":81.84999999999931,"serie":"78Sfb1IV357VDsp","attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}]}},{"name":"weapon_stungun","slot":5,"type":"weapon","amount":1,"info":{"ammo":0,"serie":"92myS0hc101biGJ"}},{"name":"weapon_pumpshotgun","slot":6,"type":"weapon","amount":1,"info":{"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"serie":"07Jtv3WR705mMtU"}},{"name":"hunting-ammo","slot":7,"type":"item","amount":2,"info":""},{"name":"weapon_nightstick","slot":8,"type":"weapon","amount":1,"info":[]},{"name":"radio","slot":9,"type":"item","amount":1,"info":[]},{"name":"weapon_sniperrifle2","slot":10,"type":"weapon","amount":1,"info":{"ammo":6,"serie":"20qan2Mn682fuuP"}},{"name":"weapon_flashlight","slot":11,"type":"weapon","amount":1,"info":[]},{"name":"bowlingball","slot":12,"type":"item","amount":1,"info":""},{"name":"walkstick","slot":13,"type":"item","amount":1,"info":["made in china"]},{"name":"heavyarmor","slot":14,"type":"item","amount":3,"info":[]},{"name":"visa","slot":15,"type":"item","amount":1,"info":{"citizenid":"FFR58493","cardType":"visa","cardPin":1905,"cardNumber":2548248291015625,"name":"Manlike Berkzino","cardActive":true}},{"name":"phone","slot":16,"type":"item","amount":1,"info":[]},{"name":"weapon_heavypistol","slot":17,"type":"weapon","amount":1,"info":{"ammo":12,"quality":65.49999999999868,"serie":"74cBl3hk768HGSl","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}]}},{"name":"handcuffs","slot":18,"type":"item","amount":1,"info":[]},{"name":"huntingbait","slot":19,"type":"item","amount":1,"info":""},{"name":"police_stormram","slot":20,"type":"item","amount":1,"info":[]},{"name":"bowlingball","slot":21,"type":"item","amount":1,"info":""},{"name":"rifle_ammo","slot":22,"type":"item","amount":10,"info":[]},{"name":"bowlingball","slot":23,"type":"item","amount":1,"info":""}]', '2022-02-18 23:16:10', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(143, 'YGT28836', 1, 'license:5e49a4de0824f835289ca142fa0f30dbe18b749b', 'bangerrr', '{"bank":2000,"crypto":0,"cash":500}', '{"phone":"1383763178","backstory":"placeholder backstory","firstname":"Benny","account":"US03QBCore9025359047","birthdate":"1995-09-01","cid":"1","nationality":"english","lastname":"Junior","gender":0}', '{"payment":10,"onduty":true,"label":"Civilian","name":"unemployed","grade":{"level":0,"name":"Freelancer"},"isboss":false}', '{"label":"No Gang Affiliaton","name":"none","grade":{"level":0,"name":"none"},"isboss":false}', '{"y":-961.2498168945313,"x":-274.6006164550781,"w":2.25118732452392,"z":2.07416057586669}', '{"fitbit":[],"inlaststand":false,"ishandcuffed":false,"injail":0,"inside":{"apartment":{"apartmentId":"apartment16159","apartmentType":"apartment1"}},"commandbinds":[],"jailitems":[],"currentapartment":"apartment16159","phonedata":{"InstalledApps":[],"SerialNumber":94110062},"craftingrep":0,"licences":{"driver":true,"business":false,"weapon":false},"criminalrecord":{"hasRecord":false},"callsign":"NO CALLSIGN","phone":[],"dealerrep":0,"fingerprint":"NN199L39TDo5413","hunger":94.8,"isdead":false,"status":[],"jobrep":{"taxi":0,"hotdog":0,"trucker":0,"tow":0},"walletid":"qb-14983160","armor":0,"attachmentcraftingrep":0,"thirst":95.2,"bloodtype":"A+","stress":0,"tracker":false}', '[{"type":"item","slot":1,"name":"id_card","amount":1,"info":{"birthdate":"1995-09-01","citizenid":"YGT28836","gender":0,"nationality":"english","lastname":"Junior","firstname":"Benny"}},{"type":"item","slot":2,"name":"starter_gift","amount":1,"info":[]}]', '2022-02-15 22:44:00', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(144, 'DUY88641', 1, 'license:6798bfbee86c8ea7defd2a7cb59c17f0c98b30f2', '?SkrrKuro?', '{"4500":2000,"bank":10015660,"cash":580,"crypto":0}', '{"backstory":"placeholder backstory","nationality":"WhiteBritish","gender":0,"birthdate":"2000-02-02","cid":"1","account":"US02QBCore7050730825","lastname":"Drilla","firstname":"Skrr","phone":"1358541001"}', '{"payment":1500,"name":"police","onduty":true,"isboss":true,"label":"Law Enforcement","grade":{"level":6,"name":"Command"}}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"level":0,"name":"none"}}', '{"z":31.59593200683593,"y":-797.89208984375,"x":73.1334228515625,"w":304.22882080078127}', '{"fingerprint":"DO808z41aNu9162","inside":{"apartment":[]},"currentapartment":"apartment1226","bloodtype":"A-","callsign":"NO CALLSIGN","tracker":false,"status":[],"fitbit":[],"dealerrep":0,"incarry":false,"armor":0,"walletid":"qb-23806542","criminalrecord":{"hasRecord":false},"ishandcuffed":false,"craftingrep":0,"jobrep":{"taxi":0,"hotdog":0,"trucker":0,"tow":0},"hunger":42.79999999999997,"licences":{"weapon":false,"business":false,"driver":true},"injail":0,"thirst":47.20000000000003,"attachmentcraftingrep":0,"isdead":false,"phone":[],"commandbinds":[],"inlaststand":false,"phonedata":{"InstalledApps":[],"SerialNumber":36484649},"stress":14,"jailitems":[]}', '[{"info":["made in china"],"amount":1,"name":"walkstick","slot":1,"type":"item"},{"info":[],"amount":1,"name":"phone","slot":2,"type":"item"},{"info":[],"amount":1,"name":"radio","slot":3,"type":"item"},{"info":"","amount":1,"name":"joint","slot":21,"type":"item"}]', '2022-02-17 23:44:28', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(145, 'BVW07235', 1, 'license:9b68498e41001d0be6d4bb0a792189339ebb2ce6', 'Randy', '{"cash":0.0,"4500":2000,"crypto":0}', '{"birthdate":"1995-06-05","firstname":"Randy","nationality":"Welsh","cid":"1","phone":"1151842719","lastname":"Bullet","backstory":"placeholder backstory","account":"US04QBCore5128792228","gender":0}', '{"isboss":true,"name":"police","grade":{"level":6,"name":"Command"},"label":"Law Enforcement","payment":1500,"onduty":true}', '{"grade":{"name":"none","level":0},"isboss":false,"label":"No Gang Affiliaton","name":"none"}', '{"z":70.78954315185547,"w":265.1324462890625,"x":448.16192626953127,"y":-1000.9979858398438}', '{"commandbinds":[],"inside":{"apartment":[]},"ishandcuffed":false,"dealerrep":0,"fingerprint":"SH906O83tcn9084","armor":0,"criminalrecord":{"hasRecord":false},"incarry":false,"jobrep":{"taxi":0,"trucker":0,"tow":0,"hotdog":0},"phonedata":{"InstalledApps":[],"SerialNumber":41031163},"inlaststand":false,"attachmentcraftingrep":0,"callsign":"NO CALLSIGN","stress":30,"hunger":94.8,"bloodtype":"B-","injail":0,"tracker":false,"licences":{"driver":false,"business":false},"thirst":95.2,"fitbit":[],"isdead":false,"currentapartment":"apartment19869","phone":[],"craftingrep":0,"walletid":"qb-59914655","jailitems":[],"status":[]}', '[{"type":"weapon","name":"weapon_stungun","amount":1,"info":{"serie":"76Jlc5Lz459NCaS","ammo":0},"slot":1},{"type":"weapon","name":"weapon_heavypistol","amount":1,"info":{"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}],"ammo":1,"quality":72.54999999999896,"serie":"94aaS7ao781IhHv"},"slot":2},{"type":"weapon","name":"weapon_carbinerifle","amount":1,"info":{"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"ammo":1,"quality":33.54999999999893,"serie":"64suR3GB343ihVz"},"slot":4},{"type":"weapon","name":"weapon_smg","amount":1,"info":{"attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"ammo":0,"quality":63.39999999999865,"serie":"83MiX1uy013kQOH"},"slot":5},{"type":"item","name":"pistol_ammo","amount":11,"info":[],"slot":6},{"type":"item","name":"rifle_ammo","amount":8,"info":[],"slot":7},{"type":"item","name":"radio","amount":1,"info":[],"slot":8},{"type":"item","name":"phone","amount":1,"info":[],"slot":9},{"type":"item","name":"advancedlockpick","amount":1,"info":"","slot":10},{"type":"item","name":"shotgun_ammo","amount":10,"info":[],"slot":12},{"type":"item","name":"handcuffs","amount":3,"info":[],"slot":14},{"type":"weapon","name":"weapon_flashlight","amount":1,"info":[],"slot":15},{"type":"item","name":"police_stormram","amount":1,"info":[],"slot":16},{"type":"item","name":"radio","amount":1,"info":[],"slot":17},{"type":"weapon","name":"weapon_fireextinguisher","amount":1,"info":[],"slot":18},{"type":"item","name":"firstaid","amount":20,"info":[],"slot":19},{"type":"item","name":"bandage","amount":19,"info":[],"slot":20},{"type":"item","name":"painkillers","amount":18,"info":[],"slot":25},{"type":"item","name":"id_card","amount":1,"info":{"birthdate":"1995-06-05","firstname":"Randy","nationality":"Welsh","lastname":"Bullet","citizenid":"BVW07235","gender":0},"slot":36}]', '2022-02-19 15:02:11', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(146, 'SCB94284', 2, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'Reece', '{"4500":2000,"crypto":0,"cash":500}', '{"cid":"2","firstname":"Kate","nationality":"British","phone":"1263647256","gender":1,"birthdate":"1999-05-07","backstory":"placeholder backstory","account":"US06QBCore9177580977","lastname":"Bishop"}', '{"label":"Law Enforcement","name":"police","grade":{"level":6,"name":"Command"},"isboss":true,"onduty":false,"payment":1500}', '{"label":"No Gang Affiliaton","name":"none","isboss":false,"grade":{"level":0,"name":"none"}}', '{"y":631.1239624023438,"z":80.05946350097656,"w":319.808349609375,"x":1358.2734375}', '{"craftingrep":0,"tracker":false,"phonedata":{"SerialNumber":59188423,"InstalledApps":[]},"licences":{"weapon":false,"business":false,"driver":true},"dealerrep":0,"jobrep":{"taxi":0,"hotdog":0,"tow":0,"trucker":0},"inlaststand":false,"ishandcuffed":false,"currentapartment":"apartment12237","commandbinds":[],"walletid":"qb-33544383","stress":0,"fingerprint":"jq344y06aZc1764","fitbit":{"food":1},"callsign":"NO CALLSIGN","injail":0,"status":[],"thirst":95.2,"inside":{"apartment":[]},"bloodtype":"B+","isdead":false,"phone":[],"hunger":94.8,"jailitems":[],"criminalrecord":{"hasRecord":false},"armor":0,"attachmentcraftingrep":0}', '[{"slot":2,"name":"id_card","info":{"nationality":"British","gender":1,"birthdate":"1999-05-07","firstname":"Kate","citizenid":"SCB94284","lastname":"Bishop"},"type":"item","amount":1},{"slot":3,"name":"sandwich","info":"","type":"item","amount":1}]', '2022-02-18 01:24:17', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', ''),
	(147, 'DAA99355', 1, 'license:aae5d94a2c7953deeb4b87a6e2a2c50f18c506f4', 'Splxt', '{"cash":500,"4500":2000,"crypto":0}', '{"lastname":"Huntsman","phone":"1312318167","birthdate":"2000-11-11","cid":"1","firstname":"Jacob","account":"US05QBCore2642631459","gender":0,"backstory":"placeholder backstory","nationality":"Scottish"}', '{"name":"unemployed","label":"Civilian","onduty":true,"payment":10,"isboss":false,"grade":{"name":"Freelancer","level":0}}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"y":-1063.8829345703126,"x":380.58050537109377,"w":14.9721508026123,"z":29.25158882141113}', '{"stress":0,"status":[],"walletid":"qb-91200060","hunger":89.6,"phone":[],"fitbit":[],"criminalrecord":{"hasRecord":false},"bloodtype":"B+","attachmentcraftingrep":0,"fingerprint":"Fn858Q41CDf4929","injail":0,"commandbinds":[],"currentapartment":"apartment11570","phonedata":{"SerialNumber":52986366,"InstalledApps":[]},"jailitems":[],"inlaststand":true,"craftingrep":0,"isdead":false,"dealerrep":0,"ishandcuffed":false,"inside":{"apartment":[]},"jobrep":{"taxi":0,"hotdog":0,"trucker":0,"tow":0},"thirst":90.4,"licences":{"weapon":false,"business":false,"driver":true},"callsign":"NO CALLSIGN","armor":0,"tracker":false}', '[{"name":"id_card","type":"item","amount":1,"slot":1,"info":{"lastname":"Huntsman","nationality":"Scottish","firstname":"Jacob","citizenid":"DAA99355","gender":0,"birthdate":"2000-11-11"}},{"name":"starter_gift","type":"item","amount":1,"slot":2,"info":[]}]', '2022-02-23 18:11:05', 0, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.playerskins
DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.playerskins: ~10 rows (approximately)
/*!40000 ALTER TABLE `playerskins` DISABLE KEYS */;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(583, 'NAH71280', '1885233650', '{"blush":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"moles":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"makeup":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"nose_4":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_1":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_3":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"torso2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_5":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"face":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrows":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"t-shirt":{"texture":0,"item":1,"defaultItem":1,"defaultTexture":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"watch":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eye_opening":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"glass":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"beard":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"ageing":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"bracelet":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"pants":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"shoes":{"texture":0,"item":1,"defaultItem":1,"defaultTexture":0},"nose_2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_3":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_0":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"ear":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"hat":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"chimp_hole":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"lipstick":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1}}', 1),
	(657, 'FFR58493', '1885233650', '{"vest":{"item":2,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"decals":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"arms":{"item":37,"texture":0,"defaultTexture":0,"defaultItem":0},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":25,"texture":0,"defaultTexture":0,"defaultItem":1},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"mask":{"item":121,"texture":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"accessory":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":14,"texture":2,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"beard":{"item":10,"texture":1,"defaultTexture":1,"defaultItem":-1},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":30,"texture":1,"defaultTexture":1,"defaultItem":-1},"hair":{"item":59,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"pants":{"item":42,"texture":2,"defaultTexture":0,"defaultItem":0},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"face":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":17,"texture":0,"defaultTexture":0,"defaultItem":1},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"watch":{"item":10,"texture":0,"defaultTexture":0,"defaultItem":-1},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_color":{"item":2,"texture":0,"defaultTexture":0,"defaultItem":-1},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":5,"texture":0,"defaultTexture":0,"defaultItem":0}}', 1),
	(661, 'DUY88641', '1885233650', '{"pants":{"texture":2,"defaultTexture":0,"item":42,"defaultItem":0},"accessory":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":0},"cheek_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrown_forward":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"torso2":{"texture":2,"defaultTexture":0,"item":14,"defaultItem":0},"eye_color":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"cheek_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lipstick":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"chimp_bone_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"vest":{"texture":0,"defaultTexture":0,"item":2,"defaultItem":0},"chimp_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_hole":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"face":{"texture":5,"defaultTexture":0,"item":4,"defaultItem":0},"decals":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"t-shirt":{"texture":0,"defaultTexture":0,"item":17,"defaultItem":1},"shoes":{"texture":0,"defaultTexture":0,"item":25,"defaultItem":1},"arms":{"texture":0,"defaultTexture":0,"item":37,"defaultItem":0},"jaw_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lips_thickness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"beard":{"texture":1,"defaultTexture":1,"item":10,"defaultItem":-1},"neck_thikness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrows":{"texture":1,"defaultTexture":1,"item":2,"defaultItem":-1},"bracelet":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"ear":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"glass":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrown_high":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_opening":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"cheek_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_5":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hair":{"texture":0,"defaultTexture":0,"item":12,"defaultItem":0},"blush":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"watch":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"nose_4":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"moles":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"nose_0":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"bag":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_lowering":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"jaw_bone_back_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hat":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"mask":{"texture":0,"defaultTexture":0,"item":121,"defaultItem":0},"makeup":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"ageing":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1}}', 1),
	(662, 'YAO29665', '1885233650', '{"eyebrows":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"eye_opening":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"hair":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_1":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eyebrown_high":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"accessory":{"defaultItem":0,"item":1,"defaultTexture":0,"texture":0},"ear":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"jaw_bone_back_lenght":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"chimp_bone_lenght":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"chimp_bone_lowering":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"makeup":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"lipstick":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"nose_5":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_3":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"nose_4":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"face":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"glass":{"defaultItem":0,"item":25,"defaultTexture":0,"texture":4},"nose_2":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"mask":{"defaultItem":0,"item":121,"defaultTexture":0,"texture":0},"lips_thickness":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"watch":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"moles":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"jaw_bone_width":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"blush":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"nose_0":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"shoes":{"defaultItem":1,"item":25,"defaultTexture":0,"texture":0},"cheek_3":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"cheek_2":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"cheek_1":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"beard":{"defaultItem":-1,"item":-1,"defaultTexture":1,"texture":1},"torso2":{"defaultItem":0,"item":14,"defaultTexture":0,"texture":2},"bracelet":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"t-shirt":{"defaultItem":1,"item":17,"defaultTexture":0,"texture":0},"ageing":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"pants":{"defaultItem":0,"item":42,"defaultTexture":0,"texture":2},"hat":{"defaultItem":-1,"item":35,"defaultTexture":0,"texture":0},"chimp_hole":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"arms":{"defaultItem":0,"item":37,"defaultTexture":0,"texture":0},"bag":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"vest":{"defaultItem":0,"item":2,"defaultTexture":0,"texture":0},"neck_thikness":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"decals":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0},"eye_color":{"defaultItem":-1,"item":-1,"defaultTexture":0,"texture":0},"chimp_bone_width":{"defaultItem":0,"item":0,"defaultTexture":0,"texture":0}}', 1),
	(667, 'RQS49084', '1885233650', '{"eyebrown_forward":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"accessory":{"item":1,"defaultItem":0,"texture":0,"defaultTexture":0},"mask":{"item":121,"defaultItem":0,"texture":0,"defaultTexture":0},"beard":{"item":3,"defaultItem":-1,"texture":1,"defaultTexture":1},"chimp_bone_lenght":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"torso2":{"item":14,"defaultItem":0,"texture":2,"defaultTexture":0},"face":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lipstick":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"eyebrown_high":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"hat":{"item":35,"defaultItem":-1,"texture":2,"defaultTexture":0},"cheek_2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_2":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"t-shirt":{"item":17,"defaultItem":1,"texture":0,"defaultTexture":0},"arms":{"item":37,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_5":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_0":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_width":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"cheek_3":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"blush":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"cheek_1":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"shoes":{"item":25,"defaultItem":1,"texture":0,"defaultTexture":0},"glass":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eyebrows":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"eye_color":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"nose_3":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"watch":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"jaw_bone_back_lenght":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"lips_thickness":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"ageing":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"vest":{"item":2,"defaultItem":0,"texture":0,"defaultTexture":0},"neck_thikness":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"pants":{"item":42,"defaultItem":0,"texture":2,"defaultTexture":0},"bracelet":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"makeup":{"item":-1,"defaultItem":-1,"texture":1,"defaultTexture":1},"hair":{"item":1,"defaultItem":0,"texture":0,"defaultTexture":0},"bag":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"jaw_bone_width":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"chimp_bone_lowering":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"moles":{"item":0,"defaultItem":-1,"texture":0,"defaultTexture":0},"nose_1":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"ear":{"item":-1,"defaultItem":-1,"texture":0,"defaultTexture":0},"chimp_hole":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"decals":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"nose_4":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0},"eye_opening":{"item":0,"defaultItem":0,"texture":0,"defaultTexture":0}}', 1),
	(672, 'SCB94284', '-1667301416', '{"torso2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"beard":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"accessory":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"pants":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"arms":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"vest":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hair":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"mask":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_color":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"watch":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"t-shirt":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1}}', 1),
	(680, 'BDQ75670', '1885233650', '{"eye_color":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"mask":{"item":121,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":35,"texture":0,"defaultTexture":0,"defaultItem":-1},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"pants":{"item":42,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"beard":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"vest":{"item":69,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hair":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"face":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":25,"texture":0,"defaultTexture":0,"defaultItem":1},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"t-shirt":{"item":17,"texture":0,"defaultTexture":0,"defaultItem":1},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"arms":{"item":34,"texture":0,"defaultTexture":0,"defaultItem":0},"ear":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":-1},"watch":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":253,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0}}', 1),
	(682, 'BVW07235', '1885233650', '{"nose_0":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"eye_color":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":3},"chimp_bone_lowering":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"bag":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"chimp_bone_width":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"eye_opening":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"hat":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":-1},"ageing":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":-1},"torso2":{"defaultItem":0,"texture":2,"defaultTexture":0,"item":253},"chimp_hole":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"face":{"defaultItem":0,"texture":4,"defaultTexture":0,"item":0},"bracelet":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":-1},"hair":{"defaultItem":0,"texture":29,"defaultTexture":0,"item":3},"lipstick":{"defaultItem":-1,"texture":1,"defaultTexture":1,"item":-1},"jaw_bone_back_lenght":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"shoes":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":25},"cheek_3":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"cheek_1":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"eyebrown_high":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"nose_4":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"glass":{"defaultItem":0,"texture":1,"defaultTexture":0,"item":5},"eyebrown_forward":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"neck_thikness":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"arms":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":87},"decals":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"makeup":{"defaultItem":-1,"texture":1,"defaultTexture":1,"item":-1},"blush":{"defaultItem":-1,"texture":1,"defaultTexture":1,"item":-1},"lips_thickness":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"nose_1":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"watch":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":-1},"eyebrows":{"defaultItem":-1,"texture":1,"defaultTexture":1,"item":-1},"pants":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":42},"jaw_bone_width":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"mask":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":121},"nose_3":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"t-shirt":{"defaultItem":1,"texture":0,"defaultTexture":0,"item":18},"nose_5":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"beard":{"defaultItem":-1,"texture":1,"defaultTexture":1,"item":11},"moles":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":-1},"ear":{"defaultItem":-1,"texture":0,"defaultTexture":0,"item":-1},"nose_2":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"vest":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":69},"chimp_bone_lenght":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0},"accessory":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":19},"cheek_2":{"defaultItem":0,"texture":0,"defaultTexture":0,"item":0}}', 1),
	(684, 'DLK40295', '1885233650', '{"makeup":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"accessory":{"defaultTexture":0,"texture":0,"item":1,"defaultItem":0},"moles":{"defaultTexture":0,"texture":0,"item":4,"defaultItem":-1},"vest":{"defaultTexture":0,"texture":0,"item":2,"defaultItem":0},"cheek_2":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"blush":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"eyebrown_forward":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"shoes":{"defaultTexture":0,"texture":0,"item":25,"defaultItem":1},"eyebrown_high":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"lips_thickness":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"arms":{"defaultTexture":0,"texture":0,"item":37,"defaultItem":0},"lipstick":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"cheek_1":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"torso2":{"defaultTexture":0,"texture":2,"item":14,"defaultItem":0},"jaw_bone_width":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eye_color":{"defaultTexture":0,"texture":0,"item":4,"defaultItem":-1},"decals":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"glass":{"defaultTexture":0,"texture":1,"item":4,"defaultItem":0},"chimp_hole":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"t-shirt":{"defaultTexture":0,"texture":0,"item":17,"defaultItem":1},"bag":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_2":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"hair":{"defaultTexture":0,"texture":2,"item":2,"defaultItem":0},"nose_5":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"hat":{"defaultTexture":0,"texture":1,"item":89,"defaultItem":-1},"nose_1":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"beard":{"defaultTexture":1,"texture":1,"item":11,"defaultItem":-1},"nose_3":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eye_opening":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"pants":{"defaultTexture":0,"texture":2,"item":42,"defaultItem":0},"chimp_bone_lenght":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"ear":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":-1},"watch":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"cheek_3":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_0":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"ageing":{"defaultTexture":0,"texture":0,"item":4,"defaultItem":-1},"mask":{"defaultTexture":0,"texture":0,"item":121,"defaultItem":0},"nose_4":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eyebrows":{"defaultTexture":1,"texture":1,"item":30,"defaultItem":-1},"bracelet":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"face":{"defaultTexture":0,"texture":10,"item":0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0}}', 1),
	(685, 'DAA99355', '1885233650', '{"eye_color":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"eyebrown_forward":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"watch":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"ear":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"arms":{"texture":0,"item":20,"defaultTexture":0,"defaultItem":0},"face":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"beard":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"moles":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lowering":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"chimp_bone_width":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"hat":{"texture":0,"item":2,"defaultTexture":0,"defaultItem":-1},"eye_opening":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"ageing":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"eyebrown_high":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":15,"defaultTexture":0,"defaultItem":1},"makeup":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"cheek_3":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":0,"item":50,"defaultTexture":0,"defaultItem":0},"hair":{"texture":1,"item":49,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"glass":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_5":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"shoes":{"texture":0,"item":15,"defaultTexture":0,"defaultItem":1},"blush":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"accessory":{"texture":0,"item":2,"defaultTexture":0,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"pants":{"texture":0,"item":20,"defaultTexture":0,"defaultItem":0},"nose_0":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0}}', 1);
/*!40000 ALTER TABLE `playerskins` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_boats
DROP TABLE IF EXISTS `player_boats`;
CREATE TABLE IF NOT EXISTS `player_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_boats: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_boats` DISABLE KEYS */;
INSERT INTO `player_boats` (`id`, `citizenid`, `model`, `plate`, `boathouse`, `fuel`, `state`) VALUES
	(3, 'DLK40295', 'marquis', 'QB5773', NULL, 100, 0);
/*!40000 ALTER TABLE `player_boats` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_contacts
DROP TABLE IF EXISTS `player_contacts`;
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_contacts: ~2 rows (approximately)
/*!40000 ALTER TABLE `player_contacts` DISABLE KEYS */;
INSERT INTO `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`) VALUES
	(75, 'DLK40295', 'Wiktor Kawecki', '1797781038', 'US06QBCore6334482833'),
	(76, 'DLK40295', 'Manlike Berkzino', '1488067006', 'US01QBCore1217455832'),
	(77, 'FFR58493', 'Reece Riggs', '1907042313', 'US09QBCore7241574426');
/*!40000 ALTER TABLE `player_contacts` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_houses
DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_houses: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_houses` DISABLE KEYS */;
INSERT INTO `player_houses` (`id`, `house`, `identifier`, `citizenid`, `keyholders`, `decorations`, `stash`, `outfit`, `logout`) VALUES
	(9, 'lake vinewood dr1', 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', '["DLK40295"]', NULL, '{"x":232.59104919433595,"z":177.80279541015626,"y":771.5105590820313}', '{"x":228.57569885253907,"z":177.78150939941407,"y":762.738037109375}', '{"x":221.71546936035157,"z":177.78012084960938,"y":766.2839965820313}');
/*!40000 ALTER TABLE `player_houses` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_mails
DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_mails: ~12 rows (approximately)
/*!40000 ALTER TABLE `player_mails` DISABLE KEYS */;
INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(384, 'DLK40295', 'Pillbox', 'Hospital Costs', 'Dear Mr. Riggs,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 118489, '2022-02-13 21:24:21', ''),
	(386, 'DLK40295', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Reece Riggs In The Amount Of $1000', 0, 982910, '2022-02-14 01:02:32', NULL),
	(389, 'DLK40295', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Reece Riggs In The Amount Of $1000', 0, 414794, '2022-02-14 01:02:35', NULL),
	(390, 'DLK40295', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Reece Riggs In The Amount Of $1000', 0, 206922, '2022-02-14 01:02:37', NULL),
	(393, 'DLK40295', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Reece Riggs In The Amount Of $1000', 0, 658284, '2022-02-14 01:03:23', NULL),
	(394, 'DLK40295', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Reece Riggs In The Amount Of $1000', 0, 738064, '2022-02-14 01:03:25', NULL),
	(396, 'YAO29665', 'Pillbox', 'Hospital Costs', 'Dear Mr. Kawecki,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 256320, '2022-02-14 13:27:07', ''),
	(397, 'DLK40295', 'Pillbox', 'Hospital Costs', 'Dear Mr. Riggs,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 395751, '2022-02-14 13:27:33', '[]'),
	(398, 'YAO29665', 'Pillbox', 'Hospital Costs', 'Dear Mr. Kawecki,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 500542, '2022-02-15 23:33:32', '[]'),
	(400, 'DLK40295', 'Pillbox', 'Hospital Costs', 'Dear Mr. Riggs,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 666937, '2022-02-18 18:43:30', '[]'),
	(401, 'DLK40295', 'Pillbox', 'Hospital Costs', 'Dear Mr. Riggs,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 977620, '2022-02-18 18:43:34', '[]'),
	(402, 'BDQ75670', 'Pillbox', 'Hospital Costs', 'Dear Mr. Bates,<br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$500</strong><br /><br />We wish you a quick recovery!', 0, 982910, '2022-02-19 14:21:50', '[]');
/*!40000 ALTER TABLE `player_mails` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_outfits
DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_outfits: ~6 rows (approximately)
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
	(172, 'FFR58493', 'Swag', '1885233650', '{"torso2":{"texture":0,"item":151,"defaultItem":0,"defaultTexture":0},"eyebrows":{"texture":1,"item":30,"defaultItem":-1,"defaultTexture":1},"eyebrown_high":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"mask":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"blush":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"ageing":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"nose_3":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"vest":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"lipstick":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"ear":{"texture":0,"item":16,"defaultItem":-1,"defaultTexture":0},"cheek_3":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"neck_thikness":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_5":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"glass":{"texture":0,"item":5,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hair":{"texture":0,"item":76,"defaultItem":0,"defaultTexture":0},"eye_opening":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"texture":0,"item":2,"defaultItem":-1,"defaultTexture":0},"jaw_bone_back_lenght":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_width":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"item":61,"defaultItem":0,"defaultTexture":0},"cheek_2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hat":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"nose_0":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"beard":{"texture":1,"item":10,"defaultItem":-1,"defaultTexture":1},"makeup":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"t-shirt":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"bracelet":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"lips_thickness":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"pants":{"texture":0,"item":1,"defaultItem":0,"defaultTexture":0},"nose_1":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"face":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_4":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"watch":{"texture":0,"item":10,"defaultItem":-1,"defaultTexture":0},"shoes":{"texture":0,"item":15,"defaultItem":1,"defaultTexture":0},"moles":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"chimp_hole":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0}}', 'outfit-6-3268'),
	(173, 'YAO29665', 'SO19', '1885233650', '{"ear":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"pants":{"texture":0,"item":42,"defaultItem":0,"defaultTexture":0},"beard":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"hair":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"ageing":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"face":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eye_color":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"cheek_3":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"hat":{"texture":0,"item":35,"defaultItem":-1,"defaultTexture":0},"shoes":{"texture":0,"item":25,"defaultItem":1,"defaultTexture":0},"mask":{"texture":0,"item":121,"defaultItem":0,"defaultTexture":0},"eyebrown_high":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrown_forward":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_3":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lowering":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"glass":{"texture":4,"item":25,"defaultItem":0,"defaultTexture":0},"bracelet":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"chimp_bone_width":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eye_opening":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_width":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"arms":{"texture":0,"item":34,"defaultItem":0,"defaultTexture":0},"decals":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_1":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_1":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"torso2":{"texture":0,"item":253,"defaultItem":0,"defaultTexture":0},"lips_thickness":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_hole":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"cheek_2":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"moles":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0},"blush":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"t-shirt":{"texture":0,"item":17,"defaultItem":1,"defaultTexture":0},"nose_5":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"vest":{"texture":0,"item":69,"defaultItem":0,"defaultTexture":0},"nose_4":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"chimp_bone_lenght":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"nose_0":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"jaw_bone_back_lenght":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"makeup":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"neck_thikness":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"accessory":{"texture":0,"item":1,"defaultItem":0,"defaultTexture":0},"lipstick":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"bag":{"texture":0,"item":0,"defaultItem":0,"defaultTexture":0},"eyebrows":{"texture":1,"item":-1,"defaultItem":-1,"defaultTexture":1},"watch":{"texture":0,"item":-1,"defaultItem":-1,"defaultTexture":0}}', 'outfit-3-6669'),
	(174, 'FFR58493', 'Command', '1885233650', '{"chimp_bone_lowering":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"vest":{"texture":0,"defaultTexture":0,"item":23,"defaultItem":0},"bag":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"blush":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"mask":{"texture":0,"defaultTexture":0,"item":121,"defaultItem":0},"eyebrown_high":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lipstick":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"ageing":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"cheek_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hair":{"texture":0,"defaultTexture":0,"item":75,"defaultItem":0},"face":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"bracelet":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"cheek_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_5":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrows":{"texture":1,"defaultTexture":1,"item":30,"defaultItem":-1},"nose_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"neck_thikness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"accessory":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":0},"shoes":{"texture":4,"defaultTexture":0,"item":57,"defaultItem":1},"nose_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"torso2":{"texture":0,"defaultTexture":0,"item":28,"defaultItem":0},"jaw_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lips_thickness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"makeup":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"eye_opening":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"decals":{"texture":0,"defaultTexture":0,"item":7,"defaultItem":0},"arms":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":0},"glass":{"texture":0,"defaultTexture":0,"item":5,"defaultItem":0},"cheek_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hat":{"texture":2,"defaultTexture":0,"item":35,"defaultItem":-1},"watch":{"texture":0,"defaultTexture":0,"item":10,"defaultItem":-1},"jaw_bone_back_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"beard":{"texture":1,"defaultTexture":1,"item":10,"defaultItem":-1},"chimp_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_4":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"pants":{"texture":0,"defaultTexture":0,"item":26,"defaultItem":0},"chimp_hole":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"moles":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"nose_0":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"t-shirt":{"texture":0,"defaultTexture":0,"item":24,"defaultItem":1},"eyebrown_forward":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_color":{"texture":0,"defaultTexture":0,"item":2,"defaultItem":-1},"ear":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1}}', 'outfit-8-6561'),
	(175, 'DUY88641', 'ygm', '1885233650', '{"nose_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"torso2":{"defaultItem":0,"texture":3,"item":201,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hat":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"beard":{"defaultItem":-1,"texture":1,"item":10,"defaultTexture":1},"nose_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"arms":{"defaultItem":0,"texture":0,"item":18,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"t-shirt":{"defaultItem":1,"texture":0,"item":9,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hair":{"defaultItem":0,"texture":0,"item":12,"defaultTexture":0},"lipstick":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"eye_opening":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"watch":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"eye_color":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"bag":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"pants":{"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"vest":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"blush":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"ageing":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"makeup":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"mask":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"decals":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_0":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ear":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"texture":1,"item":2,"defaultTexture":1},"accessory":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"bracelet":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"moles":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"glass":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"face":{"defaultItem":0,"texture":5,"item":4,"defaultTexture":0},"cheek_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"shoes":{"defaultItem":1,"texture":0,"item":6,"defaultTexture":0}}', 'outfit-9-2608'),
	(176, 'DUY88641', 'fed', '1885233650', '{"nose_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"torso2":{"defaultItem":0,"texture":2,"item":14,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hat":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"beard":{"defaultItem":-1,"texture":1,"item":10,"defaultTexture":1},"nose_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"arms":{"defaultItem":0,"texture":0,"item":37,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"t-shirt":{"defaultItem":1,"texture":0,"item":17,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hair":{"defaultItem":0,"texture":0,"item":12,"defaultTexture":0},"lipstick":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"eye_opening":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"watch":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"eye_color":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"bag":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"pants":{"defaultItem":0,"texture":2,"item":42,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"vest":{"defaultItem":0,"texture":0,"item":2,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"blush":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"ageing":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"makeup":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"mask":{"defaultItem":0,"texture":0,"item":121,"defaultTexture":0},"decals":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_0":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ear":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"texture":1,"item":2,"defaultTexture":1},"accessory":{"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"bracelet":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"moles":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"glass":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"face":{"defaultItem":0,"texture":5,"item":4,"defaultTexture":0},"cheek_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"shoes":{"defaultItem":1,"texture":0,"item":25,"defaultTexture":0}}', 'outfit-9-6876'),
	(177, 'BVW07235', 'a', '1885233650', '{"eye_color":{"item":3,"defaultItem":-1,"defaultTexture":0,"texture":0},"t-shirt":{"item":15,"defaultItem":1,"defaultTexture":0,"texture":0},"accessory":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"eye_opening":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"blush":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"moles":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"bag":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"chimp_hole":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"face":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":4},"eyebrown_high":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_4":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"jaw_bone_back_lenght":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_2":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"mask":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"neck_thikness":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"makeup":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"cheek_3":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrown_forward":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_0":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"vest":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_3":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"watch":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"arms":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"decals":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_2":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"chimp_bone_lowering":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"cheek_1":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"hat":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"shoes":{"item":1,"defaultItem":1,"defaultTexture":0,"texture":0},"bracelet":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"hair":{"item":3,"defaultItem":0,"defaultTexture":0,"texture":29},"beard":{"item":11,"defaultItem":-1,"defaultTexture":1,"texture":1},"ear":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"pants":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"chimp_bone_lenght":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"eyebrows":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"jaw_bone_width":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"torso2":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"glass":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"nose_1":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"ageing":{"item":-1,"defaultItem":-1,"defaultTexture":0,"texture":0},"chimp_bone_width":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"lipstick":{"item":-1,"defaultItem":-1,"defaultTexture":1,"texture":1},"nose_5":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0},"lips_thickness":{"item":0,"defaultItem":0,"defaultTexture":0,"texture":0}}', 'outfit-10-3377'),
	(178, 'DAA99355', 'casual', '1885233650', '{"eyebrown_high":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"moles":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"glass":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lipstick":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"eye_color":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"neck_thikness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"torso2":{"item":50,"defaultTexture":0,"defaultItem":0,"texture":0},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"arms":{"item":20,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lips_thickness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_hole":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"shoes":{"item":15,"defaultTexture":0,"defaultItem":1,"texture":0},"hair":{"item":49,"defaultTexture":0,"defaultItem":0,"texture":1},"hat":{"item":2,"defaultTexture":0,"defaultItem":-1,"texture":0},"nose_0":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"t-shirt":{"item":15,"defaultTexture":0,"defaultItem":1,"texture":0},"blush":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"nose_5":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"pants":{"item":20,"defaultTexture":0,"defaultItem":0,"texture":0},"accessory":{"item":2,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_4":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"cheek_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"beard":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"eye_opening":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"jaw_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrows":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"cheek_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"ageing":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"makeup":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"chimp_bone_lowering":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"face":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"jaw_bone_back_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0}}', 'outfit-6-6285');
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_vehicles
DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `finance_owed` int(255) DEFAULT 0,
  `finperc` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_vehicles: ~10 rows (approximately)
/*!40000 ALTER TABLE `player_vehicles` DISABLE KEYS */;
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `finance_owed`, `finperc`) VALUES
	(111, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'intruder', '886934177', '{"plateIndex":0,"modBackWheels":-1,"modHorns":-1,"modGrille":-1,"modTrimB":-1,"modDial":-1,"modCustomTiresF":false,"modFender":-1,"plate":"4XL125AM","modAerials":-1,"modWindows":-1,"modRearBumper":-1,"wheelColor":156,"color2":0,"modSteeringWheel":-1,"modSeats":-1,"fuelLevel":100.0,"modEngine":-1,"modRightFender":-1,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"engineHealth":1000.0,"modPlateHolder":-1,"modTransmission":-1,"modFrontBumper":-1,"modArchCover":-1,"modHydrolic":-1,"modOrnaments":-1,"modLivery":-1,"modTank":-1,"model":886934177,"neonEnabled":[false,false,false,false],"xenonColor":255,"dirtLevel":7.0,"modDashboard":-1,"modSuspension":-1,"tankHealth":1000.0,"interiorColor":0,"modArmor":-1,"modTrimA":-1,"windowTint":-1,"dashboardColor":0,"modSpeakers":-1,"modFrontWheels":-1,"modEngineBlock":-1,"bodyHealth":1000.0,"modTurbo":false,"modRoof":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modTrunk":-1,"modExhaust":-1,"modSpoilers":-1,"modBrakes":-1,"modVanityPlate":-1,"modXenon":false,"modShifterLeavers":-1,"extras":{"11":false,"10":false},"modStruts":-1,"color1":4,"modAPlate":-1,"modCustomTiresR":false,"pearlescentColor":111,"wheels":0,"modSmokeEnabled":false,"modHood":-1,"modSideSkirt":-1}', '4XL125AM', NULL, 'dumbogarage', 100, 1000, 1000, 1, 0, 12969, NULL, 0, NULL),
	(112, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'rr14', '1839602789', '{"plateIndex":0,"modBackWheels":-1,"modHorns":-1,"modGrille":-1,"modTrimB":-1,"modDial":-1,"modCustomTiresF":false,"modFender":-1,"plate":"2FL971ZP","modAerials":-1,"modWindows":-1,"modRearBumper":-1,"wheelColor":120,"color2":112,"modSteeringWheel":-1,"modSeats":-1,"fuelLevel":100.0,"modEngine":-1,"modRightFender":-1,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"engineHealth":1000.0,"modPlateHolder":-1,"modTransmission":-1,"modFrontBumper":-1,"modArchCover":-1,"modHydrolic":-1,"modOrnaments":-1,"modLivery":-1,"modTank":-1,"model":1839602789,"neonEnabled":[false,false,false,false],"xenonColor":255,"dirtLevel":0.0,"modDashboard":-1,"modSuspension":-1,"tankHealth":1000.0,"interiorColor":0,"modArmor":-1,"modTrimA":-1,"windowTint":-1,"dashboardColor":0,"modSpeakers":-1,"modFrontWheels":-1,"modEngineBlock":-1,"bodyHealth":1000.0,"modTurbo":false,"modRoof":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modTrunk":-1,"modExhaust":-1,"modSpoilers":-1,"modBrakes":-1,"modVanityPlate":-1,"modXenon":false,"modShifterLeavers":-1,"extras":{"3":true},"modStruts":-1,"color1":38,"modAPlate":-1,"modCustomTiresR":false,"pearlescentColor":37,"wheels":3,"modSmokeEnabled":false,"modHood":-1,"modSideSkirt":-1}', '2FL971ZP', NULL, NULL, 100, 1000, 1000, 0, 0, 66, NULL, 0, NULL),
	(113, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'r8h', '1126386594', '{"plateIndex":0,"modBackWheels":-1,"modHorns":-1,"modGrille":-1,"modTrimB":-1,"modDial":-1,"modCustomTiresF":false,"modFender":-1,"plate":"9GC052AZ","modAerials":-1,"modWindows":-1,"modRearBumper":-1,"wheelColor":0,"color2":143,"modSteeringWheel":-1,"modSeats":-1,"fuelLevel":100.0,"modEngine":-1,"modRightFender":-1,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"engineHealth":1000.0,"modPlateHolder":-1,"modTransmission":-1,"modFrontBumper":-1,"modArchCover":-1,"modHydrolic":-1,"modOrnaments":-1,"modLivery":-1,"modTank":-1,"model":1126386594,"neonEnabled":[false,false,false,false],"xenonColor":255,"dirtLevel":8.0,"modDashboard":-1,"modSuspension":-1,"tankHealth":1000.0,"interiorColor":0,"modArmor":-1,"modTrimA":-1,"windowTint":-1,"dashboardColor":0,"modSpeakers":-1,"modFrontWheels":-1,"modEngineBlock":-1,"bodyHealth":1000.0,"modTurbo":false,"modRoof":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modTrunk":-1,"modExhaust":-1,"modSpoilers":-1,"modBrakes":-1,"modVanityPlate":-1,"modXenon":false,"modShifterLeavers":-1,"extras":[],"modStruts":-1,"color1":143,"modAPlate":-1,"modCustomTiresR":false,"pearlescentColor":150,"wheels":7,"modSmokeEnabled":false,"modHood":-1,"modSideSkirt":-1}', '9GC052AZ', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, NULL),
	(114, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'm4', '-711938045', '{"plateIndex":0,"modBackWheels":-1,"modHorns":-1,"modGrille":-1,"modTrimB":-1,"modDial":-1,"modCustomTiresF":false,"modFender":-1,"plate":"2PF607JC","modAerials":-1,"modWindows":-1,"modRearBumper":-1,"wheelColor":142,"color2":70,"modSteeringWheel":-1,"modSeats":-1,"fuelLevel":100.0,"modEngine":-1,"modRightFender":-1,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"engineHealth":1000.0,"modPlateHolder":-1,"modTransmission":-1,"modFrontBumper":-1,"modArchCover":-1,"modHydrolic":-1,"modOrnaments":-1,"modLivery":-1,"modTank":-1,"model":-711938045,"neonEnabled":[false,false,false,false],"xenonColor":255,"dirtLevel":5.0,"modDashboard":-1,"modSuspension":-1,"tankHealth":1000.0,"interiorColor":0,"modArmor":-1,"modTrimA":-1,"windowTint":-1,"dashboardColor":0,"modSpeakers":-1,"modFrontWheels":-1,"modEngineBlock":-1,"bodyHealth":1000.0,"modTurbo":false,"modRoof":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modTrunk":-1,"modExhaust":-1,"modSpoilers":-1,"modBrakes":-1,"modVanityPlate":-1,"modXenon":false,"modShifterLeavers":-1,"extras":{"1":false},"modStruts":-1,"color1":62,"modAPlate":-1,"modCustomTiresR":false,"pearlescentColor":70,"wheels":0,"modSmokeEnabled":false,"modHood":-1,"modSideSkirt":-1}', '2PF607JC', NULL, NULL, 100, 1000, 1000, 0, 0, 180, NULL, 0, NULL),
	(115, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'r32', '-1942693832', '{"plateIndex":0,"modBackWheels":-1,"modHorns":-1,"modGrille":-1,"modTrimB":-1,"modDial":-1,"modCustomTiresF":false,"modFender":-1,"plate":"7WD456EE","modAerials":-1,"modWindows":-1,"modRearBumper":-1,"wheelColor":2,"color2":154,"modSteeringWheel":-1,"modSeats":-1,"fuelLevel":100.0,"modEngine":-1,"modRightFender":-1,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"engineHealth":1000.0,"modPlateHolder":-1,"modTransmission":-1,"modFrontBumper":-1,"modArchCover":-1,"modHydrolic":-1,"modOrnaments":-1,"modLivery":-1,"modTank":-1,"model":-1942693832,"neonEnabled":[false,false,false,false],"xenonColor":255,"dirtLevel":1.0,"modDashboard":-1,"modSuspension":-1,"tankHealth":1000.0,"interiorColor":0,"modArmor":-1,"modTrimA":-1,"windowTint":-1,"dashboardColor":0,"modSpeakers":-1,"modFrontWheels":-1,"modEngineBlock":-1,"bodyHealth":1000.0,"modTurbo":false,"modRoof":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modTrunk":-1,"modExhaust":-1,"modSpoilers":-1,"modBrakes":-1,"modVanityPlate":-1,"modXenon":false,"modShifterLeavers":-1,"extras":[],"modStruts":-1,"color1":0,"modAPlate":-1,"modCustomTiresR":false,"pearlescentColor":10,"wheels":0,"modSmokeEnabled":false,"modHood":-1,"modSideSkirt":-1}', '7WD456EE', NULL, NULL, 100, 1000, 1000, 0, 0, 125, NULL, 0, NULL),
	(116, 'license:93517d26094ae7be37da61995ebb4a56805eeba5', 'YAO29665', 'slamvan', '729783779', '{"dashboardColor":0,"color2":111,"modHorns":-1,"modFender":-1,"modEngine":3,"wheelColor":12,"modAirFilter":-1,"modPlateHolder":-1,"modExhaust":-1,"modLivery":-1,"wheels":4,"modArmor":4,"fuelLevel":65.0,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modFrontWheels":6,"modTrimB":-1,"modRoof":-1,"modTrimA":-1,"modSmokeEnabled":false,"plate":"82HPB176","modSeats":-1,"modBrakes":2,"modStruts":-1,"interiorColor":0,"modWindows":-1,"pearlescentColor":20,"modHood":-1,"modTrunk":-1,"modDashboard":-1,"modSteeringWheel":-1,"modRearBumper":-1,"modShifterLeavers":-1,"xenonColor":8,"modSuspension":3,"dirtLevel":0.0,"modBackWheels":-1,"modFrame":-1,"windowTint":1,"modDoorSpeaker":-1,"neonColor":[255,1,1],"modXenon":1,"bodyHealth":1000.0,"modCustomTiresR":false,"modHydrolic":-1,"modVanityPlate":-1,"plateIndex":1,"extras":[],"color1":143,"modEngineBlock":-1,"modSideSkirt":-1,"neonEnabled":[1,1,1,1],"tankHealth":1000.0,"modGrille":-1,"engineHealth":1000.0,"modFrontBumper":-1,"modCustomTiresF":false,"modAerials":-1,"model":729783779,"modTank":-1,"modDial":-1,"modTurbo":1,"modAPlate":-1,"modRightFender":-1,"modSpeakers":-1,"modArchCover":-1,"modTransmission":2}', '82HPB176', NULL, 'maingarage', 58, 1000, 1000, 0, 0, 1136, NULL, 0, NULL),
	(117, 'license:3d0504f9ed84d2f8c0e1d6cfdf9dda12d5acb29a', 'BDQ75670', 'r32', '-1942693832', '{"neonColor":[35,1,255],"tankHealth":1000.0,"modFrame":1,"wheels":0,"modRearBumper":-1,"modSeats":1,"extras":[],"modTurbo":1,"modSpeakers":-1,"modExhaust":2,"modXenon":1,"modHydrolic":-1,"modEngineBlock":-1,"modEngine":4,"modAerials":-1,"modFrontBumper":-1,"xenonColor":11,"modTransmission":3,"plateIndex":5,"engineHealth":1000.0,"dirtLevel":6.5,"modArmor":4,"modStruts":-1,"color1":111,"modSuspension":3,"modBackWheels":-1,"modArchCover":-1,"modAirFilter":-1,"modHood":-1,"modSpoilers":3,"interiorColor":0,"modTrimB":-1,"modSideSkirt":1,"modBrakes":2,"color2":154,"modDoorSpeaker":-1,"wheelColor":0,"modTrunk":-1,"modGrille":-1,"modTank":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modDial":-1,"modCustomTiresR":false,"modAPlate":1,"modTrimA":-1,"bodyHealth":1000.0,"modWindows":-1,"fuelLevel":29.2,"modFrontWheels":23,"plate":"49FPK873","windowTint":3,"modVanityPlate":-1,"dashboardColor":0,"modHorns":31,"modLivery":-1,"modCustomTiresF":false,"modPlateHolder":-1,"modOrnaments":-1,"modFender":-1,"neonEnabled":[1,1,1,1],"modShifterLeavers":-1,"modRightFender":-1,"modSteeringWheel":0,"modDashboard":-1,"modRoof":-1,"pearlescentColor":64,"model":-1942693832}', '49FPK873', NULL, NULL, 100, 1000, 1000, 0, 0, 740414, NULL, 0, NULL),
	(118, 'license:93517d26094ae7be37da61995ebb4a56805eeba5', 'YAO29665', 'futo', '2016857647', '{"interiorColor":0,"neonEnabled":[1,1,1,1],"modSideSkirt":0,"modExhaust":2,"wheels":5,"modSpeakers":-1,"modTrunk":-1,"modArmor":4,"pearlescentColor":26,"modTrimB":-1,"color1":112,"modWindows":-1,"modDoorSpeaker":-1,"color2":112,"tyreSmokeColor":[255,255,255],"modTrimA":-1,"modRightFender":-1,"modSteeringWheel":-1,"dashboardColor":0,"extras":{"1":true},"modArchCover":-1,"modRearBumper":2,"modBrakes":2,"modStruts":-1,"modRoof":0,"modHorns":-1,"wheelColor":12,"modHood":1,"modTurbo":1,"modLivery":7,"modDashboard":-1,"modSeats":-1,"fuelLevel":65.0,"modCustomTiresR":false,"xenonColor":11,"modOrnaments":-1,"modFrontBumper":2,"modVanityPlate":-1,"modFrontWheels":2,"modTank":-1,"bodyHealth":1000.0,"neonColor":[35,1,255],"modFrame":0,"modSmokeEnabled":false,"modDial":-1,"modFender":-1,"modBackWheels":-1,"modXenon":1,"modSuspension":3,"model":2016857647,"modHydrolic":-1,"modShifterLeavers":-1,"plate":"48UMG469","modGrille":0,"modPlateHolder":-1,"modEngine":3,"windowTint":1,"modCustomTiresF":false,"tankHealth":4000.0,"modSpoilers":3,"modAirFilter":-1,"engineHealth":1000.0,"modAPlate":-1,"modAerials":-1,"dirtLevel":0.0,"modEngineBlock":-1,"plateIndex":1,"modTransmission":2}', '48UMG469', NULL, 'maingarage', 63, 646, 942, 1, 0, 68202, NULL, 0, NULL),
	(119, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'sultanrs', '-295689028', '{"modOrnaments":-1,"neonEnabled":[false,false,false,false],"modTransmission":-1,"modLivery":-1,"modSideSkirt":-1,"modHood":-1,"modTrimA":-1,"modRearBumper":-1,"modVanityPlate":-1,"modArchCover":-1,"modCustomTiresR":false,"extras":[],"modWindows":-1,"modFrame":-1,"modSpeakers":-1,"xenonColor":255,"engineHealth":1000.0,"modFrontWheels":-1,"modRightFender":-1,"modSmokeEnabled":false,"dirtLevel":9.0,"modFrontBumper":-1,"modSteeringWheel":-1,"modStruts":-1,"modDoorSpeaker":-1,"modAerials":-1,"color2":64,"plateIndex":0,"modExhaust":-1,"modEngineBlock":-1,"dashboardColor":134,"model":-295689028,"plate":"01MMH801","wheelColor":158,"modBrakes":-1,"modShifterLeavers":-1,"tankHealth":1000.0,"windowTint":-1,"modHorns":-1,"interiorColor":31,"modSpoilers":-1,"bodyHealth":1000.0,"modArmor":-1,"color1":64,"wheels":0,"modDashboard":-1,"modBackWheels":-1,"modXenon":false,"modSuspension":-1,"modCustomTiresF":false,"modTrunk":-1,"modGrille":-1,"modFender":-1,"tyreSmokeColor":[255,255,255],"modDial":-1,"pearlescentColor":70,"fuelLevel":40.4,"modTank":-1,"modHydrolic":-1,"modTrimB":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modEngine":-1,"modSeats":-1,"modAPlate":-1,"modAirFilter":-1,"modTurbo":false,"modRoof":-1}', '01MMH801', NULL, NULL, 100, 1000, 1000, 0, 0, 617922, NULL, 0, NULL),
	(120, 'license:9f716c1063835ec48d868e564c0ceaf4717692a4', 'DLK40295', 'sultan', '970598228', '{"modPlateHolder":-1,"modTrimB":-1,"modCustomTiresR":false,"modEngine":3,"modDial":-1,"model":970598228,"modGrille":-1,"dirtLevel":7.0,"modWindows":-1,"modBackWheels":-1,"modHorns":-1,"modDoorSpeaker":-1,"modVanityPlate":-1,"interiorColor":0,"modHydrolic":-1,"tyreSmokeColor":[255,255,255],"color2":1,"wheelColor":156,"modAPlate":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modTrunk":-1,"modFrontBumper":1,"modStruts":-1,"engineHealth":1000.0,"bodyHealth":1000.0,"modBrakes":2,"modExhaust":0,"modTank":-1,"modSteeringWheel":-1,"modOrnaments":-1,"modFender":-1,"plate":"68GCK483","modFrame":0,"modSpeakers":-1,"modSpoilers":1,"extras":{"12":true,"10":false},"modHood":2,"modRightFender":-1,"modTurbo":1,"modSideSkirt":0,"tankHealth":4000.0,"plateIndex":5,"modSmokeEnabled":false,"modShifterLeavers":-1,"pearlescentColor":5,"dashboardColor":0,"modFrontWheels":-1,"xenonColor":255,"modRearBumper":0,"fuelLevel":65.0,"modTrimA":-1,"color1":28,"modAerials":-1,"modArchCover":-1,"modSuspension":3,"wheels":0,"modXenon":false,"modArmor":-1,"modTransmission":2,"modDashboard":-1,"modSeats":-1,"neonColor":[255,0,255],"modRoof":0,"modCustomTiresF":false,"modLivery":-1,"modAirFilter":-1,"windowTint":1}', '68GCK483', NULL, NULL, 100, 1000, 1000, 0, 0, 660310, NULL, 0, NULL);
/*!40000 ALTER TABLE `player_vehicles` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.player_warns
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.player_warns: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_warns` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_warns` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.processing
DROP TABLE IF EXISTS `processing`;
CREATE TABLE IF NOT EXISTS `processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `item` longtext DEFAULT NULL,
  `time` int(11) NOT NULL,
  `coords` longtext DEFAULT NULL,
  `rot` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.processing: ~0 rows (approximately)
/*!40000 ALTER TABLE `processing` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.society
DROP TABLE IF EXISTS `society`;
CREATE TABLE IF NOT EXISTS `society` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `money` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.society: ~2 rows (approximately)
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` (`id`, `name`, `money`) VALUES
	(1, 'police', '0'),
	(2, 'lostmc', '0');
/*!40000 ALTER TABLE `society` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.stashitems
DROP TABLE IF EXISTS `stashitems`;
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1214 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.stashitems: ~11 rows (approximately)
/*!40000 ALTER TABLE `stashitems` DISABLE KEYS */;
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(1209, 'apartment12237', '[]'),
	(1199, 'apartment16253', '[]'),
	(1190, 'apartment17065', '[{"name":"weed_amnesia_seed","weight":0,"info":"","amount":1,"label":"Amnesia Seed","slot":1,"image":"weed-plant-seed.png","useable":true,"type":"item","unique":false}]'),
	(1192, 'boss_burgershot', '[{"amount":5,"name":"paintball-ammo","weight":150,"type":"item","label":"Paintball Ammo","useable":true,"unique":false,"slot":1,"image":"np_paintball_ammo.png","info":""}]'),
	(1189, 'boss_police', '[]'),
	(1194, 'burgertray1', '[]'),
	(1208, 'ems_BVW07235', '[]'),
	(1198, 'ems_DLK40295', '[null,{"weight":200,"useable":true,"label":"Pistol ammo","type":"item","amount":1,"info":[],"image":"pistol_ammo.png","name":"pistol_ammo","slot":2,"unique":false}]'),
	(1202, 'ems_FFR58493', '[]'),
	(1203, 'lake vinewood dr1', '[]'),
	(1195, 'mechanicstash', '[]'),
	(1201, 'policeevidence3', '[]');
/*!40000 ALTER TABLE `stashitems` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.transaction_history
DROP TABLE IF EXISTS `transaction_history`;
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.transaction_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.trunkitems
DROP TABLE IF EXISTS `trunkitems`;
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.trunkitems: ~0 rows (approximately)
/*!40000 ALTER TABLE `trunkitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunkitems` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.twitter_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.user_convictions
DROP TABLE IF EXISTS `user_convictions`;
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.user_convictions: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_convictions` DISABLE KEYS */;
INSERT INTO `user_convictions` (`id`, `char_id`, `offense`, `count`) VALUES
	(1, 137, 'Vehicular Manslaughter', 1),
	(2, 137, 'Felony Driving Under the Influence', 1);
/*!40000 ALTER TABLE `user_convictions` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.user_mdt
DROP TABLE IF EXISTS `user_mdt`;
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.user_mdt: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mdt` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table qbcoredx.vehicles: 1 rows
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nissan GTR R32', 'r32', 7500000, 'sport');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.vehicle_categories
DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.vehicle_categories: ~9 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('bike', 'Motorcycles'),
	('donor', 'Supporters'),
	('drift', 'Drift'),
	('luxury', 'Luxury'),
	('offroad', 'Off-Road'),
	('sport', 'Sport Cars'),
	('starter', 'Starter Cars'),
	('super', 'Super Cars'),
	('suv', 'SUV');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.vehicle_mdt
DROP TABLE IF EXISTS `vehicle_mdt`;
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table qbcoredx.vehicle_mdt: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_mdt` ENABLE KEYS */;

-- Dumping structure for table qbcoredx.vehicle_parts
DROP TABLE IF EXISTS `vehicle_parts`;
CREATE TABLE IF NOT EXISTS `vehicle_parts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plate` varchar(100) NOT NULL,
  `parts` longtext NOT NULL,
  `mileage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qbcoredx.vehicle_parts: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_parts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
