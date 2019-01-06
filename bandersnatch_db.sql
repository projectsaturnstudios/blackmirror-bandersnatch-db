# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: bandersnatch
# Generation Time: 2019-01-06 00:09:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table chapter_variants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chapter_variants`;

CREATE TABLE `chapter_variants` (
  `variant_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) DEFAULT NULL,
  `variant_num` int(11) DEFAULT NULL,
  `playthrough` int(11) DEFAULT NULL,
  `variant_name` varchar(255) DEFAULT NULL,
  `choice_1_variant_id` int(11) DEFAULT NULL,
  `choice_2_variant_id` int(11) DEFAULT NULL,
  `choice_3_variant_id` int(11) DEFAULT NULL,
  `game_over_scenario` tinyint(1) DEFAULT '0',
  `ending_scenario` tinyint(1) DEFAULT '0',
  `edge_of_tomorrow` tinyint(1) DEFAULT '0',
  `variant_desc` text,
  PRIMARY KEY (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `chapter_variants` WRITE;
/*!40000 ALTER TABLE `chapter_variants` DISABLE KEYS */;

INSERT INTO `chapter_variants` (`variant_id`, `chapter_id`, `variant_num`, `playthrough`, `variant_name`, `choice_1_variant_id`, `choice_2_variant_id`, `choice_3_variant_id`, `game_over_scenario`, `ending_scenario`, `edge_of_tomorrow`, `variant_desc`)
VALUES
	(1,1,1,1,'Intro',2,NULL,NULL,0,0,0,'Eat Some Ceareal'),
	(2,2,1,1,'Sugar Puffs',4,5,NULL,0,0,0,'You Picked Sugar Puffs'),
	(3,2,2,1,'Frosties',6,7,NULL,0,0,0,'You Picked Frosties'),
	(4,3,1,1,'Thomson Twins',NULL,NULL,NULL,0,0,0,'You Picked Thompson Twins after eating some Sugar Puffs'),
	(5,3,2,1,'Now 2',NULL,NULL,NULL,0,0,0,'You Picked NOW2 after eating some Sugar Puffs'),
	(6,3,3,1,'Thomson Twins',NULL,NULL,NULL,0,0,0,'You Picked Thompson Twins after eating some Frosties'),
	(7,3,4,1,'Now 2',8,9,NULL,0,0,0,'You Picked Now 2 after eating some Frosties'),
	(8,4,1,1,'Accept',10,NULL,NULL,1,0,0,'A soft game over after eating Frosties and Listening to Now 2. Letting the studio help results in a garbage game. The scene restarts and the so does the second playthrough.'),
	(9,4,2,1,'Refuse',12,13,NULL,0,0,0,'You refused the game dev assistance after eating Frosties and Listening to Now 2'),
	(10,4,1,2,'Accept',NULL,NULL,NULL,1,0,0,'A soft game over after eating Frosties, Listening to Now 2 and losing the game once already.'),
	(11,4,1,2,'Refuse',NULL,NULL,NULL,0,0,0,'You refused the game dev assistance after eating Frosties, Listening to Now 2 and losing the game already'),
	(12,5,1,1,'(Mother) Yes',NULL,NULL,NULL,0,0,0,'You choose to talk about your mother after eating Frosties and Listening to Now 2.'),
	(13,5,2,1,'(Mother) No',14,15,NULL,0,0,0,'You refuse to talk about your mother after eating Frosties and Listening to Now 2'),
	(14,5,3,1,'(Mother Again) Yes',12,NULL,NULL,0,0,0,'You cave and talk about your mother after eating Frosties and Listening to Now 2.'),
	(15,5,4,1,'(Mother Again) No',NULL,NULL,NULL,0,0,0,'You stand your ground and refuse to talk about your mom after eating Frosties and Listening to Now 2, getting upset.');

/*!40000 ALTER TABLE `chapter_variants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table chapters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chapters`;

CREATE TABLE `chapters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `chapter_name` varchar(255) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;

INSERT INTO `chapters` (`id`, `chapter_name`, `desc`)
VALUES
	(1,'Intro','The Beginning of the Game. You choose a serial\n'),
	(2,'Cereal','Choose a Cereal to eat'),
	(3,'Bus','Choose the music to listen to on the bus'),
	(4,'Interview','Meet Tuckersoft Team. Accept or Refuse the Offer.'),
	(5,'Mother','Therapist wants to talk about your mother. Cuz she died and stuff and you don\'t like talking about it.');

/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table scene_choices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scene_choices`;

CREATE TABLE `scene_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scene_id` int(11) DEFAULT NULL,
  `choice_name` varchar(255) DEFAULT NULL,
  `sends_to_scene_id` int(11) DEFAULT NULL,
  `is_game_over` tinyint(1) DEFAULT '0',
  `is_game_ending` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `scene_choices` WRITE;
/*!40000 ALTER TABLE `scene_choices` DISABLE KEYS */;

INSERT INTO `scene_choices` (`choice_id`, `scene_id`, `choice_name`, `sends_to_scene_id`, `is_game_over`, `is_game_ending`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'Do Nothing',2,0,0,'2018-12-28 20:43:56','2018-12-28 20:44:03',NULL),
	(2,1,'Sugar Puffs',2,0,0,'2018-12-28 20:46:04','2018-12-28 20:46:04',NULL),
	(3,1,'Frosties',NULL,0,0,'2018-12-28 20:46:04','2018-12-28 20:46:04',NULL),
	(4,2,'Do Nothing',3,0,0,'2018-12-28 20:48:40','2018-12-28 20:48:40',NULL),
	(5,2,'Thompson Twins',3,0,0,'2018-12-28 20:48:40','2018-12-28 20:48:40',NULL),
	(6,2,'Now 2',NULL,0,0,'2018-12-28 20:48:40','2018-12-28 20:48:40',NULL),
	(7,3,'Do Nothing',4,1,0,'2018-12-28 20:53:22','2018-12-28 20:53:22',NULL),
	(8,3,'Accept',4,1,0,'2018-12-28 20:53:22','2018-12-28 20:53:22',NULL),
	(9,3,'Refuse',NULL,0,0,'2018-12-28 20:53:22','2018-12-28 20:53:22',NULL),
	(10,4,'Do Nothing',5,0,0,'2018-12-28 21:39:31','2018-12-28 21:39:31',NULL),
	(11,4,'Accept',4,1,0,'2018-12-28 21:39:31','2018-12-28 21:39:31',NULL),
	(12,4,'Refuse',5,0,0,'2018-12-28 21:39:31','2018-12-28 21:39:31',NULL),
	(13,5,'Do Nothing',6,0,0,'2018-12-28 21:43:03','2018-12-28 21:43:03',NULL),
	(14,5,'(Mother) Yes',6,0,0,'2018-12-28 21:43:03','2018-12-28 21:43:03',NULL),
	(15,5,'(Mother) No ',NULL,0,0,'2018-12-28 21:43:03','2018-12-28 21:43:03',NULL),
	(16,6,'Do Nothing',7,0,0,'2018-12-28 21:49:42','2018-12-28 21:49:42',NULL),
	(17,6,'(Coming) No',7,0,0,'2018-12-28 21:49:42','2018-12-28 21:49:42',NULL),
	(18,7,'Do Nothing',8,0,0,'2018-12-28 21:51:35','2018-12-28 21:51:35',NULL),
	(19,7,'Phaedra',8,0,0,'2018-12-28 21:51:35','2018-12-28 21:51:35',NULL),
	(20,7,'The Bermuda Triangle',NULL,0,0,'2018-12-28 21:51:35','2018-12-28 21:51:35',NULL),
	(21,8,'Do Nothing',9,1,0,'2018-12-28 21:57:06','2018-12-28 21:57:06',NULL),
	(22,8,'Throw Tea Over Computer',9,1,0,'2018-12-28 21:57:06','2018-12-28 21:57:06',NULL),
	(23,8,'Shout at Dad',10,0,0,'2018-12-28 21:57:06','2018-12-28 21:57:06',NULL),
	(24,9,'Do Nothing',8,0,0,'2018-12-28 21:57:06','2018-12-28 21:57:06',NULL),
	(25,9,'Go Back',8,0,0,'2018-12-28 21:57:06','2018-12-28 21:57:06',NULL),
	(26,10,'Do Nothing',11,0,0,'2018-12-28 22:05:38','2018-12-28 22:05:38',NULL),
	(27,10,'Visit Dr. Haynes',11,0,0,'2018-12-28 22:05:38','2018-12-28 22:05:38',NULL),
	(28,10,'Follow Colin',NULL,0,0,'2018-12-28 22:05:38','2018-12-28 23:30:35',NULL),
	(29,11,'Do Nothing',12,0,0,'2018-12-28 22:15:44','2018-12-28 22:15:44',NULL),
	(30,11,'Bite Nails',12,0,0,'2018-12-28 22:15:44','2018-12-28 22:15:44',NULL),
	(31,11,'Pull Earlobe',NULL,0,0,'2018-12-28 22:15:44','2018-12-28 22:15:44',NULL),
	(32,12,'Do Nothing',13,1,0,'2018-12-28 22:20:00','2018-12-28 22:20:00',NULL),
	(33,12,'Take Them',13,1,0,'2018-12-28 22:20:00','2018-12-28 22:20:00',NULL),
	(34,12,'Flush Them',14,0,0,'2018-12-28 22:20:00','2018-12-28 22:20:00',NULL),
	(35,13,'Do Nothing',12,0,0,'2018-12-28 22:23:12','2018-12-28 22:23:12',NULL),
	(36,13,'Follow Colin',NULL,0,0,'2018-12-28 22:23:12','2018-12-28 23:30:35',NULL),
	(37,13,'Go Back',12,0,0,'2018-12-28 22:23:12','2018-12-28 22:23:12',NULL),
	(38,14,'Do Nothing',15,1,0,'2018-12-28 22:26:55','2018-12-28 22:26:55',NULL),
	(39,14,'Destroy Computer',15,1,0,'2018-12-28 22:26:55','2018-12-28 22:26:55',NULL),
	(40,14,'Hit Desk',16,0,0,'2018-12-28 22:26:55','2018-12-28 22:26:55',NULL),
	(41,15,'Do Nothing',14,0,0,'2018-12-28 22:37:09','2018-12-28 22:37:09',NULL),
	(42,15,'Follow Colin',NULL,0,0,'2018-12-28 22:37:09','2018-12-28 23:30:35',NULL),
	(43,15,'Go Back',14,0,0,'2018-12-28 22:37:09','2018-12-28 22:37:09',NULL),
	(44,16,'Do Nothing',17,0,0,'2018-12-28 22:40:37','2018-12-28 22:40:37',NULL),
	(45,16,'Pick Up Family Photo',17,0,0,'2018-12-28 22:40:37','2018-12-28 22:40:37',NULL),
	(46,16,'Pick Up Book',NULL,0,0,'2018-12-28 22:40:37','2018-12-28 22:40:37',NULL),
	(47,17,'Do Nothing',18,0,0,'2018-12-28 22:46:56','2018-12-28 22:46:56',NULL),
	(48,17,'Throw Tea Over Computer',18,0,0,'2018-12-28 22:46:56','2018-12-28 22:46:56',NULL),
	(49,17,'Destroy Computer',NULL,0,0,'2018-12-28 22:46:56','2018-12-28 22:46:56',NULL),
	(50,18,'Do Nothing',19,0,0,'2018-12-28 22:52:10','2018-12-28 22:52:10',NULL),
	(51,18,'Netflix',19,0,0,'2018-12-28 22:52:10','2018-12-28 22:52:10',NULL),
	(52,18,'Glyph',NULL,0,0,'2018-12-28 22:52:10','2018-12-28 22:52:10',NULL),
	(53,19,'Do Nothing',20,0,0,'2018-12-28 22:54:02','2018-12-28 22:54:02',NULL),
	(54,19,'Tell Him More',20,0,0,'2018-12-28 22:54:02','2018-12-28 22:54:02',NULL),
	(55,19,'Try to Explain',NULL,0,0,'2018-12-28 22:54:02','2018-12-28 22:54:02',NULL),
	(56,20,'Do Nothing',21,0,0,'2018-12-28 22:55:30','2018-12-28 22:55:30',NULL),
	(57,20,'Tell Him More',21,0,0,'2018-12-28 22:55:30','2018-12-28 22:55:30',NULL),
	(58,20,'Stop the Conversation',NULL,0,0,'2018-12-28 22:55:30','2018-12-28 22:55:30',NULL),
	(59,21,'Do Nothing',22,0,0,'2018-12-28 22:57:18','2018-12-28 22:57:18',NULL),
	(60,21,'(A Little More Action) Yes',22,0,0,'2018-12-28 22:57:18','2018-12-28 22:57:18',NULL),
	(61,21,'(A Little More Action)  Fuck Yea',NULL,0,0,'2018-12-28 22:57:18','2018-12-28 22:57:18',NULL),
	(62,22,'Do Nothing',23,1,1,'2018-12-28 23:20:20','2018-12-28 23:20:20',NULL),
	(63,22,'Leap through the Window',23,1,1,'2018-12-28 23:20:20','2018-12-28 23:20:20',NULL),
	(64,22,'Fight Her',NULL,0,0,'2018-12-28 23:20:20','2018-12-28 23:20:20',NULL),
	(65,23,'Do Nothing',24,0,0,'2018-12-28 23:22:00','2018-12-28 23:22:00',NULL),
	(66,23,'Follow Colin',24,0,0,'2018-12-28 23:22:00','2018-12-28 23:22:00',NULL),
	(67,23,'(End Game) Credits',0,0,1,'2018-12-28 23:22:00','2018-12-28 23:22:00',NULL),
	(68,24,'Do Nothing',25,0,0,'2018-12-28 23:29:23','2018-12-28 23:29:23',NULL),
	(69,24,'(LSD) Yes',25,0,0,'2018-12-28 23:29:23','2018-12-28 23:29:23',NULL),
	(70,24,'(LSD) No',NULL,0,0,'2018-12-28 22:05:38','2018-12-28 22:05:38',NULL),
	(71,25,'Do Nothing',26,1,0,'2018-12-28 23:42:26','2018-12-28 23:42:26',NULL),
	(72,25,'Stefan',26,1,0,'2018-12-28 23:42:26','2018-12-28 23:42:26',NULL),
	(73,25,'Colin',27,0,0,'2018-12-28 23:42:26','2018-12-28 23:42:26',NULL),
	(74,26,'Do Nothing',25,0,0,'2018-12-28 23:53:22','2018-12-28 23:53:22',NULL),
	(75,26,'Visit Dr. Hayes',11,0,0,'2018-12-28 23:53:22','2018-12-28 23:53:22',NULL),
	(76,26,'Go Back',25,0,0,'2018-12-28 23:53:22','2018-12-28 23:53:22',NULL),
	(77,27,'Do Nothing',28,0,0,'2018-12-28 23:54:27','2018-12-28 23:54:27',NULL),
	(78,27,'Pick Up Family Photo',28,0,0,'2018-12-28 23:54:27','2018-12-28 23:54:27',NULL),
	(79,27,'Pick Up The Book',NULL,0,0,'2018-12-28 23:54:27','2018-12-28 23:54:27',NULL),
	(80,28,'Do Nothing',29,0,0,'2018-12-29 00:08:16','2018-12-29 00:08:16',NULL),
	(81,28,'Netflix',NULL,0,0,'2018-12-29 00:08:16','2018-12-29 00:08:16',NULL),
	(82,28,'Glyph',29,0,0,'2018-12-29 00:08:16','2018-12-29 00:08:16',NULL),
	(83,29,'Do Nothing',30,0,0,'2018-12-29 00:11:06','2018-12-29 00:11:06',NULL),
	(84,29,'Kill Dad',30,0,0,'2018-12-29 00:11:06','2018-12-29 00:11:06',NULL),
	(85,29,'Back Off',NULL,0,0,'2018-12-29 00:11:06','2018-12-29 00:11:06',NULL),
	(86,30,'Do Nothing',31,0,0,'2018-12-29 00:13:12','2018-12-29 00:13:12',NULL),
	(87,30,'Bury Body',31,0,0,'2018-12-29 00:13:12','2018-12-29 00:13:12',NULL),
	(88,30,'Chop Up Body',NULL,0,0,'2018-12-29 00:13:12','2018-12-29 00:13:12',NULL),
	(89,31,'Do Nothing',32,0,0,'2018-12-29 00:16:38','2018-12-29 00:16:38',NULL),
	(90,31,'(Phone Call) Yes',32,0,0,'2018-12-29 00:16:38','2018-12-29 00:16:38',NULL),
	(91,31,'(Phone Call) No',NULL,0,0,'2018-12-29 00:16:38','2018-12-29 00:16:38',NULL),
	(92,32,'Do Nothing',33,1,1,'2018-12-29 00:24:32','2018-12-29 00:24:32',NULL),
	(93,32,'(Where\'s Colin) No Idea',33,1,1,'2018-12-29 00:24:32','2018-12-29 00:24:32',NULL),
	(94,32,'(Where\'s Colin) He Jumped',NULL,0,0,'2018-12-29 00:24:32','2018-12-29 00:24:32',NULL),
	(95,33,'Do Nothing',34,0,0,'2018-12-29 00:27:35','2018-12-29 00:27:35',NULL),
	(96,33,'Chop or Bury?',34,0,0,'2018-12-29 00:27:35','2018-12-29 00:27:35',NULL),
	(97,34,'Do Nothing',35,0,0,'2018-12-29 00:27:35','2018-12-29 00:27:35',NULL),
	(98,34,'Bury Body',NULL,0,0,'2018-12-29 00:33:19','2018-12-29 00:33:19',NULL),
	(99,34,'Chop Up Body',35,0,1,'2018-12-29 00:33:19','2018-12-29 00:33:19',NULL),
	(100,35,'Do Nothing',36,1,1,'2018-12-29 00:37:37','2018-12-29 00:37:37',NULL),
	(101,35,'Throw Tea Over Computer',36,1,1,'2018-12-29 00:37:37','2018-12-29 00:37:37',NULL),
	(102,35,'Destroy Computer',NULL,0,1,'2018-12-29 00:37:37','2018-12-29 00:37:37',NULL),
	(103,36,'Do Nothing',37,0,1,'2018-12-29 00:57:58','2018-12-29 00:57:58',NULL),
	(104,36,'Get Rabbit From Dad',37,0,1,'2018-12-29 00:57:58','2018-12-29 00:57:58',NULL),
	(105,37,'Do Nothing',38,0,0,'2018-12-29 01:01:04','2018-12-29 01:01:04',NULL),
	(106,37,'TOY',38,0,0,'2018-12-29 01:01:04','2018-12-29 01:01:04',NULL),
	(107,37,'PAC',NULL,0,0,'2018-12-29 01:01:04','2018-12-29 01:01:04',NULL),
	(108,38,'(Coming 2) Yes',39,1,1,'2018-12-29 01:04:09','2018-12-29 01:04:09',NULL),
	(109,38,'Do Nothing',39,1,1,'2018-12-29 01:04:09','2018-12-29 01:04:09',NULL),
	(110,38,'(Coming 2) No',NULL,0,0,'2018-12-29 01:04:09','2018-12-29 01:04:09',NULL),
	(111,39,'Do Nothing',40,0,0,'2018-12-29 01:07:20','2018-12-29 01:07:20',NULL),
	(112,39,'Program & Control',40,0,0,'2018-12-29 01:07:20','2018-12-29 01:07:20',NULL),
	(113,40,'Do Nothing',41,0,0,'2018-12-29 01:11:45','2018-12-29 01:11:45',NULL),
	(114,40,'P.A.C.S',41,0,0,'2018-12-29 01:11:45','2018-12-29 01:11:45',NULL),
	(115,40,'Glyph',NULL,0,0,'2018-12-29 01:11:45','2018-12-29 01:11:45',NULL),
	(116,41,'Do Nothing',42,1,1,'2018-12-29 01:17:27','2018-12-29 01:17:27',NULL),
	(117,41,'The Wrong Combination',42,1,1,'2018-12-29 01:17:27','2018-12-29 01:17:27',NULL),
	(118,41,'The Correct Combination',NULL,0,0,'2018-12-29 01:17:27','2018-12-29 01:17:27',NULL),
	(124,43,'Do Nothing',NULL,0,0,'2018-12-29 01:44:22','2018-12-29 01:44:22',NULL),
	(125,43,'',NULL,0,0,'2018-12-29 01:44:22','2018-12-29 01:44:22',NULL),
	(126,43,'',NULL,0,0,'2018-12-29 01:44:22','2018-12-29 01:44:22',NULL);

/*!40000 ALTER TABLE `scene_choices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table scenes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scenes`;

CREATE TABLE `scenes` (
  `scene_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scene_name` varchar(255) DEFAULT NULL,
  `previous_scene_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `scenes` WRITE;
/*!40000 ALTER TABLE `scenes` DISABLE KEYS */;

INSERT INTO `scenes` (`scene_id`, `scene_name`, `previous_scene_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Opening',0,'2018-12-28 20:40:03','2018-12-28 20:40:15',NULL),
	(2,'Sugar Puffs',1,'2018-12-28 20:47:20','2018-12-28 20:47:20',NULL),
	(3,'Thompson Twins',2,'2018-12-28 20:51:22','2018-12-28 20:51:22',NULL),
	(4,'Accept',3,'2018-12-28 21:21:56','2018-12-28 21:21:56',NULL),
	(5,'Refuse',4,'2018-12-28 21:42:48','2018-12-28 21:42:48',NULL),
	(6,'(Mother) Yes',5,'2018-12-28 21:47:39','2018-12-28 21:47:39',NULL),
	(7,'(Coming) No',6,'2018-12-28 21:51:14','2018-12-28 21:51:14',NULL),
	(8,'Phaedra',7,'2018-12-28 21:56:29','2018-12-28 21:56:29',NULL),
	(9,'(Game Over) Throw Tea Over Computer',8,'2018-12-28 22:03:30','2018-12-28 22:03:30',NULL),
	(10,'Shout at Dad',8,'2018-12-28 22:05:06','2018-12-28 22:05:06',NULL),
	(11,'Visit Dr. Haynes',10,'2018-12-28 22:08:32','2018-12-28 22:08:32',NULL),
	(12,'Bite Nails',11,'2018-12-28 22:19:38','2018-12-28 22:19:38',NULL),
	(13,'(Game Over) Take Them',12,'2018-12-28 22:22:15','2018-12-28 22:22:15',NULL),
	(14,'Flush Them',12,'2018-12-28 22:26:32','2018-12-28 22:26:32',NULL),
	(15,'(Game Over) Destroy Computer',14,'2018-12-28 22:36:34','2018-12-28 22:36:34',NULL),
	(16,'Hit Desk',14,'2018-12-28 22:40:06','2018-12-28 22:40:06',NULL),
	(17,'Pick Up Family Photo',16,'2018-12-28 22:46:24','2018-12-28 22:46:24',NULL),
	(18,'Throw Tea Over Computer',17,'2018-12-28 22:51:54','2018-12-28 22:51:54',NULL),
	(19,'Netflix',18,'2018-12-28 22:53:04','2018-12-28 22:53:04',NULL),
	(20,'Tell Him More',19,'2018-12-28 22:55:01','2018-12-28 22:55:01',NULL),
	(21,'(Second TIme) Tell Him More',20,'2018-12-28 22:57:03','2018-12-28 22:57:03',NULL),
	(22,'(A Little More Action) Yes',21,'2018-12-28 23:19:47','2018-12-28 23:19:47',NULL),
	(23,'(Game Over) Ending 1 - Leap through the Window',22,'2018-12-28 23:21:23','2018-12-28 23:21:23',NULL),
	(24,'Follow Colin',10,'2018-12-28 23:27:47','2018-12-28 23:27:47',NULL),
	(25,'(LSD) Yes',24,'2018-12-28 23:41:57','2018-12-28 23:41:57',NULL),
	(26,'(Game Over) Stefan',25,'2018-12-28 23:52:40','2018-12-28 23:52:40',NULL),
	(27,'Colin',25,'2018-12-28 23:52:40','2018-12-28 23:52:40',NULL),
	(28,'(Version 2) Pick Up Family Photo',27,'2018-12-29 00:08:01','2018-12-29 00:08:01',NULL),
	(29,'Glyph',28,'2018-12-29 00:10:43','2018-12-29 00:10:43',NULL),
	(30,'Kill Dad',29,'2018-12-29 00:12:58','2018-12-29 00:12:58',NULL),
	(31,'Bury Body',30,'2018-12-29 00:16:23','2018-12-29 00:16:23',NULL),
	(32,'(Phone Call) Yes',31,'2018-12-29 00:24:02','2018-12-29 00:24:02',NULL),
	(33,'(Game Over) Ending 2 - (Where\'s Colin) No Idea',32,'2018-12-29 00:27:06','2018-12-29 00:27:06',NULL),
	(34,'Chop or Bury?',33,'2018-12-29 00:38:18','2018-12-29 00:38:18',NULL),
	(35,'(Game Over) (Glitch) Ending 3.1.0 - Chop Up Body',34,'2018-12-29 00:41:13','2018-12-29 00:41:13',NULL),
	(36,'(Game Over) (Glitch) Ending 3.2.1 - Throw Tea Over Computer',35,'2018-12-29 00:57:33','2018-12-29 00:57:33',NULL),
	(37,'Get Rabbit From Dad',36,'2018-12-29 00:57:33','2018-12-29 00:57:33',NULL),
	(38,'TOY',37,'2018-12-29 01:03:37','2018-12-29 01:03:37',NULL),
	(39,'(Game Over) Ending 4 - (Coming 2) Yes',38,'2018-12-29 01:07:05','2018-12-29 01:07:05',NULL),
	(40,'Program & Control',39,'2018-12-29 01:11:20','2018-12-29 01:11:20',NULL),
	(41,'P.A.C.S',40,'2018-12-29 01:17:09','2018-12-29 01:17:09',NULL),
	(42,'(Game Over) - Ending 5- The Wrong Combination',41,'2018-12-29 01:21:03','2018-12-29 01:21:03',NULL),
	(43,'(Version 2) Refuse',3,'2018-12-29 01:43:57','2018-12-29 01:43:57',NULL);

/*!40000 ALTER TABLE `scenes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
