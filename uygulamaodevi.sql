-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 17 Kas 2020, 11:13:56
-- Sunucu sürümü: 8.0.22
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `uygulamaodevi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alternative_brands`
--

DROP TABLE IF EXISTS `alternative_brands`;
CREATE TABLE IF NOT EXISTS `alternative_brands` (
  `BRAND_BARCODE` char(13) NOT NULL,
  `M_SYSCODE` int NOT NULL,
  `ALTERNATIVE_BRAND_BARCODE` char(13) NOT NULL,
  `ALTERNATIVE_M_SYSCODE` int NOT NULL,
  PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`,`ALTERNATIVE_BRAND_BARCODE`,`ALTERNATIVE_M_SYSCODE`),
  KEY `M_SYSCODE` (`M_SYSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `alternative_brands`
--

INSERT INTO `alternative_brands` (`BRAND_BARCODE`, `M_SYSCODE`, `ALTERNATIVE_BRAND_BARCODE`, `ALTERNATIVE_M_SYSCODE`) VALUES
('k@z@k', 4, 'k@zk1', 4),
('k@zk1', 4, 'k@z@k', 4),
('atki23', 5, 'atki234', 5),
('atki234', 5, 'atki23', 5),
('bl3k5', 6, 'blkcskp', 6),
('blkcspk', 6, 'bl3k5', 6),
('pntl23', 8, 'pntl4', 8),
('pntl4', 8, 'pntl23', 8),
('bl45', 13, 'bzd356', 13),
('bzd356', 13, 'bl45', 13),
('cm4678', 14, 'CMSR4', 14),
('CMSR4', 14, 'cm4678', 14),
('bl459', 16, 'bln57', 16),
('bln57', 16, 'bl459', 16),
('biru', 19, 'biru05', 19),
('biru05', 19, 'biru', 19),
('kol678', 20, 'kol8a', 20),
('kol8a', 20, 'kol678', 20),
('kho49', 22, 'koffi', 22),
('koffi', 22, 'kho49', 22);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brand_orgs`
--

DROP TABLE IF EXISTS `brand_orgs`;
CREATE TABLE IF NOT EXISTS `brand_orgs` (
  `LOT_ID` int NOT NULL AUTO_INCREMENT,
  `ORG_ID` int NOT NULL,
  `BRAND_BARCODE` char(13) NOT NULL,
  `UNIT` int NOT NULL,
  `EXPIRY_DATE` date NOT NULL DEFAULT '2120-01-14',
  `BASEPRICE` int NOT NULL,
  `IN` int NOT NULL,
  `OUT` int NOT NULL,
  `QUANTITY` float GENERATED ALWAYS AS ((`IN` + `OUT`)) VIRTUAL,
  PRIMARY KEY (`LOT_ID`,`ORG_ID`,`BRAND_BARCODE`,`EXPIRY_DATE`),
  KEY `BRAND_BARCODE` (`BRAND_BARCODE`),
  KEY `ORG_ID` (`ORG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `brand_orgs`
--

INSERT INTO `brand_orgs` (`LOT_ID`, `ORG_ID`, `BRAND_BARCODE`, `UNIT`, `EXPIRY_DATE`, `BASEPRICE`, `IN`, `OUT`) VALUES
(1, 3, 'kho49', 20, '2021-01-14', 15, 10, 20),
(1, 6, 'koffi', 20, '2021-01-14', 13, 20, 30),
(1, 9, 'bl459', 60, '2120-01-14', 80, 300, 4500),
(1, 9, 'bzd356', 100, '2120-01-14', 4500, 50, 400),
(1, 9, 'cm4678', 60, '2120-01-14', 25000, 20, 300),
(1, 12, 'bl45', 50, '2120-01-14', 75, 3000, 250),
(1, 12, 'bln57', 50, '2120-01-14', 100, 2000, 300),
(1, 12, 'CMSR4', 100, '2120-01-14', 2000, 1500, 40),
(1, 15, 'biru', 500, '2021-02-14', 15, 500, 1000),
(1, 15, 'kol678', 2500, '2021-02-14', 8, 2000, 3000),
(1, 18, 'biru05', 330, '2021-02-25', 10, 3000, 5000),
(1, 18, 'kol8a', 2500, '2021-03-14', 7, 3000, 4500),
(1, 21, 'atki23', 20, '2120-01-14', 20, 100, 200),
(1, 21, 'blkcspk', 20, '2120-01-14', 25, 2500, 3000),
(1, 21, 'k@z@k', 20, '2120-01-14', 30, 2000, 2500),
(1, 21, 'pntl4', 20, '2120-01-14', 250, 3000, 5000),
(1, 24, 'atki234', 20, '2120-01-14', 40, 2500, 3000),
(1, 24, 'k@zk1', 20, '2120-01-14', 100, 2000, 3000),
(1, 24, 'pntl23', 20, '2120-01-14', 180, 2000, 3000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `COUNTRY_CODE` char(3) NOT NULL,
  `COUNTRY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `country`
--

INSERT INTO `country` (`COUNTRY_CODE`, `COUNTRY_NAME`) VALUES
('10', 'ESTONYA'),
('11', 'KAMERUN'),
('2', 'NAMIBYA'),
('3', 'MADAGASKAR'),
('4', 'OMAN'),
('5', 'ERITRE'),
('6', 'BURUNDI'),
('7', 'LEONE'),
('8', 'BENIN'),
('81', 'BURKINAFASO'),
('82', 'RUSYA'),
('9', 'BRUNEI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country_city`
--

DROP TABLE IF EXISTS `country_city`;
CREATE TABLE IF NOT EXISTS `country_city` (
  `CityID` int NOT NULL AUTO_INCREMENT,
  `City_Name` varchar(100) NOT NULL,
  `Country_Code` char(3) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `Country_Code` (`Country_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `country_city`
--

INSERT INTO `country_city` (`CityID`, `City_Name`, `Country_Code`) VALUES
(102, 'WINDHOEK', '2'),
(103, 'Antananarivo', '3'),
(104, 'MUSCAT', '4'),
(105, 'ASMARA', '5'),
(106, 'BUJUMBURA', '6'),
(107, 'FREETOWN', '7'),
(108, 'PORTONOVO', '8'),
(109, 'KUTCHING', '9'),
(110, 'TALLINN', '10'),
(111, 'YAOUNDE', '11'),
(181, 'OUGADOUGOU', '81'),
(182, 'MOSCOW', '82'),
(211, 'DOUALA', '11'),
(282, 'ST_PETERSBURG', '82');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `features`
--

DROP TABLE IF EXISTS `features`;
CREATE TABLE IF NOT EXISTS `features` (
  `FEATURE_ID` int NOT NULL AUTO_INCREMENT,
  `FEATURE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`FEATURE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `features`
--

INSERT INTO `features` (`FEATURE_ID`, `FEATURE_NAME`) VALUES
(1, 'boy'),
(2, 'en'),
(3, 'litre'),
(4, 'derece'),
(5, 'beden'),
(6, 'agirlik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `flow`
--

DROP TABLE IF EXISTS `flow`;
CREATE TABLE IF NOT EXISTS `flow` (
  `Source_LOT_ID` int NOT NULL,
  `Source_ORG_ID` int NOT NULL,
  `Target_LOT_ID` int NOT NULL,
  `Target_ORG_ID` int NOT NULL,
  `BRAND_BARCODE` char(13) NOT NULL,
  `Quantity` int NOT NULL,
  `FlowDate` date NOT NULL,
  PRIMARY KEY (`Source_LOT_ID`,`Source_ORG_ID`,`Target_LOT_ID`,`Target_ORG_ID`,`BRAND_BARCODE`) USING BTREE,
  KEY `Source_ORG_ID` (`Source_ORG_ID`),
  KEY `flow_ibfk_3` (`Target_LOT_ID`),
  KEY `flow_ibfk_4` (`Target_ORG_ID`),
  KEY `flow_ibfk_5` (`BRAND_BARCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `MANUFACTURER_ID` int NOT NULL AUTO_INCREMENT,
  `MANUFACTURER_NAME` varchar(200) NOT NULL,
  `MANUFACTURER_ADDRESS` varchar(200) NOT NULL,
  `COUNTRY_CODE` char(3) NOT NULL,
  `CITY_CODE` int NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`),
  KEY `CITY_CODE` (`CITY_CODE`),
  KEY `COUNTRY_CODE` (`COUNTRY_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `manufacturers`
--

INSERT INTO `manufacturers` (`MANUFACTURER_ID`, `MANUFACTURER_NAME`, `MANUFACTURER_ADDRESS`, `COUNTRY_CODE`, `CITY_CODE`) VALUES
(1, 'Talha Unal', 'Sogutozu Mah', '6', 106),
(2, 'Irem Kilinc', '123 Seet Street', '4', 104),
(3, 'Elif Nur Afsar', 'Tverskaya Street', '81', 182),
(4, 'Yasemin Demirtas', 'Jend. Sudiman Street', '3', 103),
(5, 'Batikan Sumluludan', '651  Five Points', '8', 108),
(6, 'Larry N Valdez', '744  Murry Street', '7', 108),
(7, 'Juanita D Robertson', '682  Mapleview Drive', '82', 282),
(8, 'Stephen V Nakamura', '602  Better Street', '10', 110),
(9, 'John K Edgerton', '3202  Frum Street', '82', 182),
(10, 'Marie P Quinn', '4193  Musgrave Street', '5', 105),
(11, 'William A Yerby', '1420  Ben Street', '3', 103),
(12, 'John E Moon', '273  Crestview Manor', '4', 104),
(13, 'Mary R Watford', '3710  Birch  Street', '10', 110),
(14, 'Frances M Browning', '1228  Lunetta Street', '81', 181),
(15, 'Allan B Hutchinson', '2638  Woodside Circle', '7', 107),
(16, 'Joshua A Powell', '3436  Margaret Street', '7', 107),
(17, 'Sally T Jenkins', '4333  Sycamore Road', '4', 104),
(18, 'Vera S Stewart', '4011  Callison Lane', '6', 106),
(19, 'Diane A Toledo', '1742  Green Hill Road', '8', 108),
(20, 'Carmen W Means', '3918  Ashton Lane', '9', 109);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `ORG_ID` int NOT NULL AUTO_INCREMENT,
  `ORG_NAME` varchar(200) NOT NULL,
  `PARENT_ORG` int DEFAULT NULL,
  `ORG_ABSTRACT` tinyint(1) NOT NULL,
  `ORG_ADDRESS` varchar(200) NOT NULL,
  `ORG_CITY` int NOT NULL,
  `ORG_DISTRICT` varchar(50) NOT NULL,
  `ORG_TYPE` int NOT NULL,
  PRIMARY KEY (`ORG_ID`),
  KEY `ORG_CITY` (`ORG_CITY`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `organisations`
--

INSERT INTO `organisations` (`ORG_ID`, `ORG_NAME`, `PARENT_ORG`, `ORG_ABSTRACT`, `ORG_ADDRESS`, `ORG_CITY`, `ORG_DISTRICT`, `ORG_TYPE`) VALUES
(1, 'STARBUCKS - Head Office', NULL, 1, '1106  Hickory Lane', 105, 'ALOHOM', 2),
(2, 'STARBUCKS - Depository', 1, 1, '3149  Morningview Lane', 103, 'BREK', 2),
(3, 'STARBUCKS SHOP', 2, 0, '2245  Harter Street', 105, 'BREK', 2),
(4, 'CARIBOU - Head Office', NULL, 1, '4031  Hartway Street', 211, 'TRED', 2),
(5, 'CARIBOU - Depository', 4, 1, '2782  Wolf Pen Road', 106, 'DRESTUE', 2),
(6, 'CARIBOU SHOP', 5, 0, '1291  Finwood Road', 107, 'OREKMN', 2),
(7, 'ARCELIK - Head Office', NULL, 1, '4157  Flinderation Road', 109, 'KRESTULE', 0),
(8, 'ARCELIK - Factory', 7, 1, '567  Drainer Avenue', 182, 'TOKIPO', 0),
(9, 'ARCELIK SHOP', 8, 0, '4569  Roane Avenue', 102, 'TESOR', 0),
(10, 'VESTEL - Head Office', NULL, 1, '1655  Armory Road', 181, 'TEOPOPO', 1),
(11, 'VESTEL - Depository', 10, 1, '2168  Cambridge Court', 109, 'TEOR', 1),
(12, 'VESTEL SHOP', 11, 0, '4555  Crestview Manor', 110, 'TALI', 1),
(13, 'DEMİRİTASU - Head Office', NULL, 1, '896  Mattson Street', 106, 'AKSARAY', 2),
(14, 'DEMİRİTASU - Factory', 13, 1, '2444  Michigan Avenue', 102, 'UASO', 2),
(15, 'DEMİRİTASU SHOP', 14, 0, '2260  Jerry Dove Drive', 108, 'PORTNOVONO', 2),
(16, 'AFSAR - Head Office', NULL, 1, '1652  Deercove Drive', 182, 'CENGU', 2),
(17, 'AFSAR - Factory', 16, 1, '1652  Deercove Drive', 182, 'KIEV', 2),
(18, 'AFSAR SHOP', 17, 0, '1652  Deercove Drive', 182, 'PEZUVE', 2),
(19, 'XRL - Head Office', NULL, 1, '4771  Oakwood Circle', 181, 'OUGA', 0),
(20, 'XRL - Factory', 19, 1, '2528  Raccoon Run', 181, 'DREO', 0),
(21, 'XRL SHOP', 20, 0, '3667  Williams Mine Road', 182, 'DEOM', 1),
(22, 'BERSHKA - Head Office', NULL, 1, '237  Hiddenview Drive', 102, 'BREKO', 2),
(23, 'BERSHKA - Factory', 22, 1, '1171  Philadelphia Avenue', 104, 'TELR', 2),
(24, 'BERSHKA SHOP', 23, 0, '1171  Philadelphia Avenue', 104, 'TELR', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `M_SYSCODE` int NOT NULL AUTO_INCREMENT,
  `M_CODE` varchar(15) NOT NULL,
  `M_NAME` varchar(25) NOT NULL,
  `M_SHORTNAME` varchar(10) NOT NULL,
  `M_PARENTCODE` varchar(15) DEFAULT NULL,
  `M_ABSTRACT` tinyint(1) DEFAULT NULL,
  `M_CATEGORY` varchar(12) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`M_SYSCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`M_SYSCODE`, `M_CODE`, `M_NAME`, `M_SHORTNAME`, `M_PARENTCODE`, `M_ABSTRACT`, `M_CATEGORY`, `IS_ACTIVE`) VALUES
(1, '3syha', 'esya', 'esya', NULL, 1, '', 0),
(2, '3gicek', 'Giyecek', 'giyecek', '3syha', 1, '', 0),
(3, 'ust_g1y1m', 'ust_giyim', 'ustgym', '3gicek', 1, 'Giyecek', 0),
(4, 'KAZAK', 'kazak_kırmızı', 'krmzkzk', '3gicek', 0, 'ust_giyim', 0),
(5, 'atki_#', 'kareli_atkı', 'krlatk', 'ust_g1y1m', 0, 'ust_giyim', 0),
(6, 'sapka_bal1kc1', 'balikci_sapka', 'blkcspk', 'ust_g1y1m', 0, 'ust_giyim', 0),
(7, '3agi', 'Alt Giyim', 'altgiyim', '3gicek', 1, 'Giyecek', 0),
(8, '3plon', 'Pantolon', 'ptlon', '3agi', 0, 'Alt Giyim', 0),
(9, '3akabi', 'Ayakkabı', 'aykb', '3agi', 0, 'Alt Giyim', 0),
(10, '3crp', 'Çorap', 'crp', '3agi', 0, 'Alt Giyim', 0),
(11, 'mtfk1', 'Mutfak Arac Gerec', 'mtfkesya', '3syha', 1, 'esya', 0),
(12, 'byzesya1', 'Beyaz Esya', 'byzesy', '11', 1, 'Arac Gerec', 0),
(13, 'bzdlb2', 'Buzdolabi', 'bzdlb', 'byzesya1', 0, 'Beyaz Esya', 0),
(14, 'cmsrmkns1', 'Camasir Makinesi', 'cmsrmkns', 'byzesya1', 0, 'Beyaz Esya', 0),
(15, 'elektrkli23', 'Elektrikli Mutfak Gereci', 'emg', 'mtfk1', 1, 'Mutfak Esya', 0),
(16, 'blndr12', 'Blender', 'blndr', 'elektrkli23', 0, 'Elektrikli', 0),
(17, 'icck2', 'İcecek', 'icck', NULL, 1, NULL, 0),
(18, 'gzliick', 'Gazli İcecek', 'gzliicck', 'icck2', 1, 'GazliIcecek', 0),
(19, 'bira4', 'Bira', 'bira', 'gzliick', 0, 'GazliIcecek', 0),
(20, 'kola2', 'Kola', 'kola', 'gzliick', 0, 'GazliIcecek', 0),
(21, 'sckicck5', 'Sicak Icecek', 'sckicck', 'icck2', 1, 'Icecek', 0),
(22, 'coffee4', 'Kahve', 'kahve12', 'sckicck5', 0, 'Icecek', 0),
(23, 'a', 'sdaf', 'sefa', '1', 1, '34', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_brands`
--

DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE IF NOT EXISTS `product_brands` (
  `BRAND_BARCODE` char(13) NOT NULL,
  `M_SYSCODE` int NOT NULL,
  `BRAND_NAME` varchar(100) NOT NULL,
  `MANUFACTURER_ID` int NOT NULL,
  PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`),
  KEY `M_SYSCODE` (`M_SYSCODE`),
  KEY `MANUFACTURER_ID` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `product_brands`
--

INSERT INTO `product_brands` (`BRAND_BARCODE`, `M_SYSCODE`, `BRAND_NAME`, `MANUFACTURER_ID`) VALUES
('atki23', 5, 'XRL', 1),
('atki234', 5, 'BERSHKA', 2),
('biru', 19, 'DEMİRİTASU ', 3),
('biru05', 19, 'AFSAR ', 4),
('bl3k5', 6, 'BERSHKA', 5),
('bl45', 13, 'VESTEL', 6),
('bl459', 16, 'ARCELİK', 7),
('blkcspk', 6, 'XRL', 8),
('bln57', 16, 'VESTEL', 9),
('bzd356', 13, 'ARCELİK', 10),
('cm4678', 14, 'ARCELİK', 11),
('CMSR4', 14, 'VESTEL', 12),
('k@z@k', 4, 'XRL', 13),
('k@zk1', 4, 'BERSHKA', 14),
('kho49', 22, 'STARBUCKS', 15),
('koffi', 22, 'CARIBOU', 16),
('kol678', 20, 'DEMİRİTASU', 17),
('kol8a', 20, 'AFSAR', 18),
('pntl23', 8, 'BERSHKA', 19),
('pntl4', 8, 'XRL', 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_features`
--

DROP TABLE IF EXISTS `product_features`;
CREATE TABLE IF NOT EXISTS `product_features` (
  `M_SYSCODE` int NOT NULL,
  `FEATURE_ID` int NOT NULL,
  `MINVAL` float NOT NULL,
  `MAXVAL` float NOT NULL,
  PRIMARY KEY (`M_SYSCODE`,`FEATURE_ID`),
  KEY `FEATURE_ID` (`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `product_features`
--

INSERT INTO `product_features` (`M_SYSCODE`, `FEATURE_ID`, `MINVAL`, `MAXVAL`) VALUES
(4, 5, 34, 48),
(5, 1, 100, 150),
(6, 2, 30, 45),
(10, 4, 23, 24),
(13, 6, 90, 200),
(14, 6, 90, 150),
(16, 6, 5, 10),
(19, 4, 10, 15),
(20, 4, 15, 20),
(22, 4, 25, 29);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`name`, `surname`, `email`, `tel`, `fax`, `address`, `password`, `org_name`, `user_id`, `username`) VALUES
('Talha Unal', 'as', 't.unal@etu.edu.tr', '05557778488', '23513', 'Sogutozu Mahallesi, Sogutozu Cd. No:43, 06510 Cankaya/Ankara', '123456', 'TOBB ETU', 1, 'talha'),
('yasemin', 'demirtas', 'ysmn@gmail.com', '05557778448', '24513', 'Sogutozu Mahallesi, Sogutozu Cd. No:43, 06610 Cankaya/Ankara', '123', 'TOBB ETU', 2, 'yasemin'),
('Yasemin', 'Demir', 'ysmndmrn@gmail.com', '0573946283903', '-', '1737 street', '123456', 'A', 3, 'ysmndmrts'),
('Talha', 'Unal', 'tunal@mail.com', '023428329218', '-', '28493 Feat Street', '123', 'B', 4, 'tnal'),
('yasemin', 'demirtas', 'y1@gmail.com', '0534521532', '-', '3739 Stoa Street', '1234', 'A', 5, 'ysmn'),
('İrem', 'Kılınç', 'iremtos19@gmail.com', '056323829432', '-', '1987 Treo Street', '1234', 'ik AŞ', 6, 'iremtos19');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `alternative_brands`
--
ALTER TABLE `alternative_brands`
  ADD CONSTRAINT `alternative_brands_ibfk_1` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alternative_brands_ibfk_2` FOREIGN KEY (`BRAND_BARCODE`) REFERENCES `product_brands` (`BRAND_BARCODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `brand_orgs`
--
ALTER TABLE `brand_orgs`
  ADD CONSTRAINT `brand_orgs_ibfk_1` FOREIGN KEY (`BRAND_BARCODE`) REFERENCES `product_brands` (`BRAND_BARCODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brand_orgs_ibfk_2` FOREIGN KEY (`ORG_ID`) REFERENCES `organisations` (`ORG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `country_city`
--
ALTER TABLE `country_city`
  ADD CONSTRAINT `country_city_ibfk_1` FOREIGN KEY (`Country_Code`) REFERENCES `country` (`COUNTRY_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `flow`
--
ALTER TABLE `flow`
  ADD CONSTRAINT `flow_ibfk_1` FOREIGN KEY (`Source_LOT_ID`) REFERENCES `brand_orgs` (`LOT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flow_ibfk_2` FOREIGN KEY (`Source_ORG_ID`) REFERENCES `organisations` (`ORG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flow_ibfk_3` FOREIGN KEY (`Target_LOT_ID`) REFERENCES `brand_orgs` (`LOT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flow_ibfk_4` FOREIGN KEY (`Target_ORG_ID`) REFERENCES `organisations` (`ORG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flow_ibfk_5` FOREIGN KEY (`BRAND_BARCODE`) REFERENCES `product_brands` (`BRAND_BARCODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD CONSTRAINT `manufacturers_ibfk_1` FOREIGN KEY (`CITY_CODE`) REFERENCES `country_city` (`CityID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manufacturers_ibfk_2` FOREIGN KEY (`COUNTRY_CODE`) REFERENCES `country` (`COUNTRY_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `organisations`
--
ALTER TABLE `organisations`
  ADD CONSTRAINT `organisations_ibfk_1` FOREIGN KEY (`ORG_CITY`) REFERENCES `country_city` (`CityID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `product_brands`
--
ALTER TABLE `product_brands`
  ADD CONSTRAINT `product_brands_ibfk_1` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_brands_ibfk_2` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturers` (`MANUFACTURER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `product_features_ibfk_2` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_features_ibfk_3` FOREIGN KEY (`FEATURE_ID`) REFERENCES `features` (`FEATURE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
