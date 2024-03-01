/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - practitioner
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`practitioner` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `practitioner`;

/*Table structure for table `api_list` */

DROP TABLE IF EXISTS `api_list`;

CREATE TABLE `api_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `credentials` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `api_list` */

insert  into `api_list`(`id`,`type`,`customer`,`credentials`) values 
(12,'heartCloud',5,'ee,aa');

/*Table structure for table `customer_list` */

DROP TABLE IF EXISTS `customer_list`;

CREATE TABLE `customer_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `practitioner` int(11) DEFAULT NULL,
  `apis` varchar(255) DEFAULT NULL,
  `credentials` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `customer_list` */

insert  into `customer_list`(`id`,`firstname`,`lastname`,`address`,`city`,`state`,`email`,`phone`,`sex`,`zipcode`,`country`,`password`,`practitioner`,`apis`,`credentials`) values 
(5,'DavidAA','Veselivoic','','','','topdeveloper0908@gmail.com','0123456789','Male','','RS','$2b$10$t3X32nYmtpaGmKcUl2zaH.Azp2pixWyqXjCGXvdDtqNoeDgZ41pPS',296,NULL,NULL);

/*Table structure for table `hide_info` */

DROP TABLE IF EXISTS `hide_info`;

CREATE TABLE `hide_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hide` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

/*Data for the table `hide_info` */

insert  into `hide_info`(`id`,`hide`) values 
(1,0);

/*Table structure for table `practitioner_list` */

DROP TABLE IF EXISTS `practitioner_list`;

CREATE TABLE `practitioner_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `upload` int(11) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `meetinglink` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT '',
  `phone` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `review` int(11) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `role` int(11) DEFAULT 1,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(50) DEFAULT 'Male',
  `hide` int(11) DEFAULT 1,
  `profileLink` varchar(255) DEFAULT NULL,
  `availability` varbinary(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=latin1;

/*Data for the table `practitioner_list` */

insert  into `practitioner_list`(`id`,`firstname`,`lastname`,`specialty`,`imageURL`,`upload`,`tags`,`meetinglink`,`address`,`city`,`zipcode`,`state`,`phone`,`rank`,`review`,`email`,`country`,`status`,`role`,`password`,`sex`,`hide`,`profileLink`,`availability`,`type`) values 
(248,'Nima','Farshid','Bio-Well practitioner, Reiki Master, Sound Healer, Meditation Coach','https://biohackingcongress.com/storage/users/June2023/9Q67Ebbs5rPLWWmWGZET.png',0,'Reiki, biowell, soundhealer, meditation',NULL,'11532 Via Lucerna Cir','Windermere','34786','FL','407-230-8179',3,3,'nima02@yahoo.com','US','active',0,'$2b$10$WZ9pp7nsSEcgglZD8W8oueFvDfSDKKY1VJ.wVWRGRKubqDlowH2UG','Male',1,'',NULL,NULL),
(249,'Christy','Kojak','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','565 Pioneer Road','Rexburg','83440','Idaho','(409)429-0150',NULL,NULL,'christykojak97@icloud.com','United States','active',1,NULL,'Female',1,'https://youtube.com',NULL,NULL),
(250,'Annete','Kozel','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','1237 Cherese Lane','BINGHAMTON','13905','New York','(607) 768-9066',NULL,NULL,'balanceannette@yahoo.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(251,'samah','alothman','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'540 N central aveune','Glendale','91203','California','(505) 971-225',0,0,'samah.tft@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(252,'Colleen','Vissa','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'27 Myles Standish Drive','Carver','2330','Massachusetts','(508) 479-6235',0,0,'cvissa84@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(253,'Carolina','Williams','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/53716167/IMG_7732__1_.JPG?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','https://api.leadconnectorhq.com/widget/booking/WpS0qMApyc1AUsH6KiEx','50 menores ave','coral gables','33134','Florida','(305) 590-1894',NULL,NULL,'maitrifulness@gmail.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(254,'Anne','Fenwick','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/53587376/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','1 woodlands park villas','North Gosforth','NE13 6PR','England','07950 110497',NULL,NULL,'annefenwick24@yahoo.com','United Kingdom','active',1,NULL,'Female',1,NULL,NULL,NULL),
(255,'Vanessa','Realpe','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/b4dc282d-94ee-4fbc-a6af-5016934be2e3/480d0571b2c06eff.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'11657 Southwest 12th Place','Davie','33325','Florida','(954) 931-9773',0,0,'vanessarealpe@hotmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(256,'Daniela','Bartelli','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/48171710/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','1764 Malvern Hill Circle','Celebration','34747','Florida','(561) 235-1047',NULL,NULL,'daniela_bartelli@icloud.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(257,'Jami','Byrne','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34a0dbca137ef4f425e.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'2509 Maylin Drive','Trinity','34655','Florida','(727) 967-6381',0,0,'jvlahakis80@yahoo.com','United States','pending',1,NULL,'Male',1,NULL,NULL,NULL),
(258,'Shannan','Victorino','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/41689605/self_pic_1.7.22.JPG?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'299 NW 52nd Terrace, PHT','Boca Raton','33487','Florida','(774) 365-9192',0,0,'svictorino17@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(259,'Jahnvi','Patel','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'5710 Ternpark Dr','Lithia','33547','Florida','(813) 435-0031',0,0,'jahnvi.pa@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(260,'Zel','Rau','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/53334439/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','230 Legacy Ct','Naples','34110','Florida','(219) 381-9777',NULL,NULL,'bekind111@yahoo.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(261,'Rachel','Stackpole','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'12072 72nd way','Largo','33773','Florida','(304) 692-9455',0,0,'rjstackpole@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(262,'Noxtak','Corp','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/35627578/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','2555 Northwest 102nd Avenue Suite 112','Doral','33172','Florida','(786) 405-2140',NULL,NULL,'jjml@noxtak.com','United States','active',1,NULL,'Male',1,NULL,NULL,NULL),
(263,'Angela','Russo','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/47279620/unnamed.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','4817 North East 5th St Rd','Ocala','34470','Florida','(352) 875-3063',NULL,NULL,'centeredbeautyllc@gmail.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(264,'Carla','Chandler','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','4464 middlebrook','Orlando','32811','Florida','(407) 401-1004',NULL,NULL,'vipwht@gmail.com','United States','pending',1,NULL,NULL,1,NULL,NULL,NULL),
(265,'Lisa','Piper','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/566cade8-8daa-4b97-9a4d-d398461d8b0c/a68fff1d88cd41c8.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'16210 Dew Drop Ln','Tampa','33625','Florida','(813) 390-2090',0,0,'lisa@thesacredstylist.com','United States','pending',1,NULL,'Feamle',1,NULL,NULL,NULL),
(266,'Sahara','Rose','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'17001 Collins Avenue 4308','Sunny Isles Beach','33160','Florida','(617) 319-5903',0,0,'sr@iamsahararose.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(267,'Luis','Diaz','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34a0dbca137ef4f425e.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'223 Sandlewood Trail Unit 2','Winter Park','32789','Florida','(813) 409-8566',0,0,'ladiaz18@gmail.com','United States','pending',1,NULL,'Male',1,NULL,NULL,NULL),
(268,'Alex','Dr','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34a0dbca137ef4f425e.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','16425 Collins Avenue Apt 1416','Sunny Isles Beach','33160','Florida','',NULL,NULL,'alexd4884@gmail.com','United States','pending',1,NULL,'Male',1,NULL,NULL,NULL),
(269,'Claudia','Eusse','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'12725 IXORA ROAD','North Miami','33181','Florida','(786) 443-0017',0,0,NULL,'United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(270,'Marta','Cuervo de Espinal','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'10275 Collins Avenue','BallHouse','33532','Florida','(202) 230-6922',0,0,'martaluciac15@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(271,'Romina','Pederzoli','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'120 Salamanca Avenue','Coral Gables','33134','Florida','(786) 300-7799',0,0,'romipederzoli@hotmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(272,'Charles','Meyers','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','1704 East Jersey Avenue','Orlando','32806','Florida','(586) 899-4197',NULL,NULL,'s.ocampo.usa@gmail.com','United States','active',1,NULL,'Male',1,NULL,NULL,NULL),
(273,'Julia','Constantine','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/61076720/PHOTO_OF_ME_FOR_GOOGLE_ACCOUNT__2_.PNG?ixlib=rails-4.2.0&auto=format&w=196&h=196&fit=crop&impolicy=Avatar&crop=faces',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','14 Wright Parkway Apt# 3','Fort Walton Beach','33548','Florida','(850) 865-4219',NULL,NULL,'juliaconstantine0958@gmail.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(274,'Mary','Fisher','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/42375719/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','940 Sandlebury Ct','Port Orange','32127','Florida','(419) 410-6434',NULL,NULL,'mhmocha@aol.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(275,'Jennifer','Vincent','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/46474474/263A0E62-5E02-4214-8035-DAF0C3CDC3E2.jpeg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','98 Narvarez Ave','St Augustine','32084','Florida','(801) 673-8520',NULL,NULL,'jaigern@yahoo.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(276,'Joe','Woodstock','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34a0dbca137ef4f425e.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'2424 West Tampa Bay Boulevard','Tampa','33607','Florida','(516) 849-3782',0,0,'jwoodstock0617@gmail.com','United States','pending',1,NULL,'Male',1,NULL,NULL,NULL),
(277,'Amber','Embers','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/50954834/Screenshot_20221228_234248_Gallery.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','190 Westhampton Drive','Palm Coast','32164','Florida','(904) 878-3893',NULL,NULL,'partners@thecosmichippie.rocks','United States','active',1,NULL,'Female',0,NULL,NULL,NULL),
(278,'Eugenio','Carvajal Alban','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'6910 NW 50TH ST','MIami','33195','Florida','(305) 592-0755',0,0,'eugecarv@icloud.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(279,'Vicki','Fairleigh','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/46059449/photo_vicki.png?ixlib=rails-4.2.0&auto=format&w=196&h=196&fit=crop&impolicy=Avatar&crop=faces',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'721 Pensacola Beach Boulevard','Pensacola Beach','32561','Florida','(850) 291-3613',0,0,'pranichealingrn@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(280,'Nicole','Pavich','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'2333 Brickell Avenue Suite A-1','Miami','33137','Florida','(516) 524-1342',0,0,'nicole@nextwaveholistichealth.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(281,'Kendra','Turner','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/51271523/305840589_10166954314815722_7548907820637819925_n.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','551 Quail Drive','Punta Gorda','33982','Florida','(240) 533-2669',NULL,NULL,'kendra@energyhugs.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(282,'Michael','Gumiela','Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/47391043/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=196&h=196&fit=crop&crop=faces&impolicy=Avatar',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence',NULL,'8351 Southeast Magnolia Avenue','Hobe Sound','33455','Florida','(772) 215-7946',0,0,'mgumiela.biowell@gmail.com','United States','pending',1,NULL,'Female',1,NULL,NULL,NULL),
(283,'Andrea','Dretal','Bio-Well Certified Practitioner','https://storage.googleapis.com/msgsndr/WkKl1K5RuZNQ60xR48k6/media/65b5b34ab7ea181193716085.png',0,'biofield, chakra, sound, frequency, biorhythms, meridians, ANS, coherence','','1008 Trailmore Lane','Weston','33326','Florida','(234) 568-899',NULL,NULL,'info@westondiet.com','United States','active',1,NULL,'Female',1,NULL,NULL,NULL),
(285,'Sherran','Ajula','Bio-Well practitioner,Reiki Master,Sound Healer,Meditation Coach,Bio-Well Certified Practitioner','',0,'Reiki,biowell,soundhealer,meditation,biofield,chakra,sound,frequency,biorhythms,meridians,ANS,coherence','','25 Darnick Road ','Bermingham','B73 6PE','Sutton','+447891871351',NULL,5,'sherran.aujla@googlemail.com','GB','active',1,NULL,'Female',1,NULL,NULL,NULL),
(286,'Corey','Perez','Bio-Well practitioner,Reiki Master,Sound Healer,Meditation Coach,Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/59982841/c1b8d723a11349ca.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=2004&h=2004&fit=crop&crop=faces&impolicy=Avatar&mask=ellipse',0,'Reiki,biowell,soundhealer,meditation,biofield,chakra,sound,frequency,biorhythms,meridians,ANS,coherence','','2701 Red Sage Rd','Lewisville','75067','TX','7163907770',NULL,5,'coreyus@yahoo.com','US','active',1,NULL,'Male',1,NULL,NULL,NULL),
(287,'Dr. Caroline ','Williams','Bio-Well practitioner,Reiki Master,Sound Healer,Meditation Coach,Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/44285703/asset.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=2004&h=2004&fit=crop&crop=faces&impolicy=Avatar&mask=ellipse',0,'Reiki,biowell,soundhealer,meditation,biofield,chakra,sound,frequency,biorhythms,meridians,ANS,coherence',NULL,'100 Sunrise Ranch Rd  ','Loveland','80538','CO','7026833647',NULL,5,'info@nativesunnutrition.com','US','active',1,NULL,'Female',1,NULL,NULL,NULL),
(288,'Brandi','Reisinger','Bio-Well practitioner,Reiki Master,Sound Healer,Meditation Coach,Bio-Well Certified Practitioner','https://media1-production-mightynetworks.imgix.net/asset/bc0a1d8e-74e8-4061-ac8b-6693e1b9519b/a2d3b647cf2c25c0.jpg?ixlib=rails-4.2.0&fm=jpg&q=100&auto=format&w=2004&h=2004&fit=crop&crop=faces&impolicy=Avatar&mask=ellipse',0,'Reiki,biowell,soundhealer,meditation,biofield,chakra,sound,frequency,biorhythms,meridians,ANS,coherence',NULL,'1355 Lacroix Lane','Conway','72034','AK','(541) 217-8413',NULL,NULL,'brandistone66@gmail.com','US','active',1,NULL,'Female',1,NULL,NULL,NULL),
(294,'new','new','Bio-Well practitioner,Reiki Master,Sound Healer,Meditation Coach,Bio-Well Certified Practitioner','https://youtube.com',0,'Reiki,biowell,soundhealer,meditation,biofield,chakra,sound,frequency,biorhythms,meridians,ANS,coherence','https://youtube.com','new','new','','new','0899',NULL,NULL,'new@gmail.com','US','active',1,NULL,'Male',1,'https://youtube.com',NULL,NULL),
(296,'David','Veselinvoic','Bio-Well practitioner,Sound Healer','image-1706739350882.jpg',1,'meditation,sound',NULL,'Radovana Simića Cige 9','Belgrade','11000','','0123456789',3,3,'topdeveloper0908@gmail.com','RS','active',1,NULL,'Male',1,'https://david-portfolio2.vercel.app/',NULL,NULL),
(297,'belix','belix','Bio-Well practitioner,Reiki Master,Sound Healer,Meditation Coach,Bio-Well Certified Practitioner','image-1706739484378.jpg',1,'Reiki,biowell,soundhealer,meditation,biofield,chakra,sound,frequency,biorhythms,meridians,ANS,coherence',NULL,'kigali','kigali','0000','kigali','0788400336',NULL,NULL,'belix@gmail.com','US','active',1,NULL,'Male',1,'sd','Remote',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
