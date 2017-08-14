/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 5.5.50 : Database - yii2test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yii2test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yii2test`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `postcode` int(11) NOT NULL,
  `code` char(2) NOT NULL,
  `city` varchar(52) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house_number` varchar(15) DEFAULT NULL,
  `apartment_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`user_id`,`postcode`,`code`,`city`,`street`,`house_number`,`apartment_number`) values 
(2,1,544454,'BR','cityInBrazil','someStreet2','20572',2000),
(3,1,456,'CA','cityInCanada','someStreet3','3598',5751),
(4,1,524541,'CN','cityInChina','someStreet4','1375',210000),
(5,1,52155,'DE','cityInGermany','someStreet5','8145',9000),
(6,1,45454545,'FR','cityInFrance','someStreet6','64',513242),
(16,40,12589,'UA','Odessa','Deribasovska','145B',458),
(17,41,12589,'UA','Odessa','Deribasovska','',NULL),
(18,42,12589,'UA','Odessa','Deribasovska','',NULL),
(19,43,12589,'UA','Odessa','Deribasovska','',NULL),
(20,44,12589,'UA','Odessa','Deribasovska','',NULL),
(21,45,12589,'UA','Odessa','Deribasovska','',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(52) NOT NULL,
  `password` varchar(52) NOT NULL,
  `name` varchar(52) NOT NULL,
  `last_name` varchar(52) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`login`,`password`,`name`,`last_name`,`gender`,`created`) values 
(1,'admin','f379eaf3c831b04de153469d1bec345e','admin','admin','female','2017-08-14 18:31:16'),
(40,'qwerty1','e10adc3949ba59abbe56e057f20f883e','nam','last name','female','2017-08-15 02:41:02'),
(41,'qwerty12','e10adc3949ba59abbe56e057f20f883e','nam','last name','female','2017-08-15 02:41:34'),
(42,'qwerty3','e10adc3949ba59abbe56e057f20f883e','nam','last name','female','2017-08-15 02:42:05'),
(43,'qwerty5','e10adc3949ba59abbe56e057f20f883e','nam','last name','female','2017-08-15 02:42:12'),
(44,'qwerty7','9cf6f9edb58e7f3dadc1f65fdbe58b7a','nam','last name','female','2017-08-15 02:42:19'),
(45,'Alex','9cf6f9edb58e7f3dadc1f65fdbe58b7a','nam','last name','female','2017-08-15 02:42:31');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
