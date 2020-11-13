-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 13 Kas 2020, 07:52:43
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `odev1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alternative_brands`
--

DROP TABLE IF EXISTS `alternative_brands`;
CREATE TABLE IF NOT EXISTS `alternative_brands` (
  `BRAND_BARCODE` char(13) NOT NULL,
  `M_SYSCODE` int(11) NOT NULL,
  `ALTERNATIVE_BRAND_BARCODE` char(13) NOT NULL,
  `ALTERNATIVE_M_SYSCODE` int(11) NOT NULL,
  PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`,`ALTERNATIVE_BRAND_BARCODE`,`ALTERNATIVE_M_SYSCODE`),
  KEY `M_SYSCODE` (`M_SYSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `LOT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORG_ID` int(11) NOT NULL,
  `BRAND_BARCODE` char(13) NOT NULL,
  `UNIT` int(11) NOT NULL,
  `EXPIRY_DATE` date NOT NULL DEFAULT '2120-01-14',
  `BASEPRICE` int(11) NOT NULL,
  `IN` int(11) NOT NULL,
  `OUT` int(11) NOT NULL,
  `QUANTITY` float GENERATED ALWAYS AS ((`IN` + `OUT`)) VIRTUAL,
  PRIMARY KEY (`LOT_ID`,`ORG_ID`,`BRAND_BARCODE`,`EXPIRY_DATE`),
  KEY `BRAND_BARCODE` (`BRAND_BARCODE`),
  KEY `ORG_ID` (`ORG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `City_Name` varchar(100) NOT NULL,
  `Country_Code` char(3) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `Country_Code` (`Country_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4;

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
  `FEATURE_ID` int(11) NOT NULL,
  `FEATURE_NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `features`
--

INSERT INTO `features` (`FEATURE_ID`, `FEATURE_NAME`) VALUES
(0, 'boy'),
(1, 'en'),
(2, 'litre'),
(3, 'derece'),
(4, 'beden'),
(10, 'agirlik');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `flow`
--

DROP TABLE IF EXISTS `flow`;
CREATE TABLE IF NOT EXISTS `flow` (
  `Source_LOT_ID` int(11) NOT NULL,
  `Source_ORG_ID` int(11) NOT NULL,
  `Target_LOT_ID` int(11) NOT NULL,
  `Target_ORG_ID` int(11) NOT NULL,
  `BRAND_BARCODE` char(13) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `FlowDate` date NOT NULL,
  PRIMARY KEY (`Source_LOT_ID`,`Source_ORG_ID`,`Target_LOT_ID`,`Target_ORG_ID`,`BRAND_BARCODE`) USING BTREE,
  KEY `Source_ORG_ID` (`Source_ORG_ID`),
  KEY `flow_ibfk_3` (`Target_LOT_ID`),
  KEY `flow_ibfk_4` (`Target_ORG_ID`),
  KEY `flow_ibfk_5` (`BRAND_BARCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `MANUFACTURER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MANUFACTURER_NAME` varchar(200) NOT NULL,
  `MANUFACTURER_ADDRESS` varchar(200) NOT NULL,
  `COUNTRY_CODE` char(3) NOT NULL,
  `CITY_CODE` int(11) NOT NULL,
  PRIMARY KEY (`MANUFACTURER_ID`),
  KEY `CITY_CODE` (`CITY_CODE`),
  KEY `COUNTRY_CODE` (`COUNTRY_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `manufacturers`
--

INSERT INTO `manufacturers` (`MANUFACTURER_ID`, `MANUFACTURER_NAME`, `MANUFACTURER_ADDRESS`, `COUNTRY_CODE`, `CITY_CODE`) VALUES
(1, 'Talha Unal', 'Sogutozu Mah. No2 Cankaya/Ankara', '6', 106),
(2, 'Irem Kilinc', 'Seeb, Oman', '4', 104),
(3, 'Elif Nur Afsar', 'Tverskaya St, 26/1, Moscow, Russia, 125009', '81', 182),
(4, 'Yasemin Demirtas', 'Jend. Sudiman kav. 44–46, Jakarta 10210, Indonesia', '3', 103),
(5, 'Batikan Sumluludan', '651  Five Points', '8', 108),
(6, 'Larry N Valdez', '744  Murry Street', '7', 108),
(7, 'Juanita D Robertson', '682  Mapleview Drive', '82', 282),
(8, 'Stephen V Nakamura', '602  Better Street', '10', 110),
(9, 'John K Edgerton', '3202  Frum Street', '82', 182),
(10, 'Marie P Quinn', '4193  Musgrave Street', '5', 105);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `ORG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORG_NAME` varchar(200) NOT NULL,
  `PARENT_ORG` int(11) DEFAULT NULL,
  `ORG_ABSTRACT` binary(1) NOT NULL,
  `ORG_ADDRESS` varchar(200) NOT NULL,
  `ORG_CITY` int(11) NOT NULL,
  `ORG_DISTRICT` varchar(50) NOT NULL,
  `ORG_TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ORG_ID`),
  KEY `ORG_CITY` (`ORG_CITY`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `organisations`
--

INSERT INTO `organisations` (`ORG_ID`, `ORG_NAME`, `PARENT_ORG`, `ORG_ABSTRACT`, `ORG_ADDRESS`, `ORG_CITY`, `ORG_DISTRICT`, `ORG_TYPE`) VALUES
(1, 'STARBUCKS - Head Office', NULL, 0x01, '1106  Hickory Lane', 105, 'ALOHOM', 2),
(2, 'STARBUCKS - Depository', 1, 0x01, '3149  Morningview Lane', 103, 'BREK', 2),
(3, 'STARBUCKS SHOP', 2, 0x00, '2245  Harter Street', 105, 'BREK', 2),
(4, 'CARIBOU - Head Office', NULL, 0x01, '4031  Hartway Street', 211, 'TRED', 2),
(5, 'CARIBOU - Depository', 4, 0x01, '2782  Wolf Pen Road', 106, 'DRESTUE', 2),
(6, 'CARIBOU SHOP', 5, 0x00, '1291  Finwood Road', 107, 'OREKMN', 2),
(7, 'ARCELIK - Head Office', NULL, 0x01, '4157  Flinderation Road', 109, 'KRESTULE', 0),
(8, 'ARCELIK - Factory', 7, 0x00, '567  Drainer Avenue', 182, 'TOKIPO', 0),
(9, 'ARCELIK SHOP', 8, 0x00, '4569  Roane Avenue', 102, 'TESOR', 0),
(10, 'VESTEL - Head Office', NULL, 0x01, '1655  Armory Road', 181, 'TEOPOPO', 1),
(11, 'VESTEL - Depository', 10, 0x01, '2168  Cambridge Court', 109, 'TEOR', 1),
(12, 'VESTEL SHOP', 11, 0x00, '4555  Crestview Manor', 110, 'TALI', 1),
(13, 'DEMİRİTASU - Head Office', NULL, 0x01, '896  Mattson Street', 106, 'AKSARAY', 2),
(14, 'DEMİRİTASU - Factory', 13, 0x01, '2444  Michigan Avenue', 102, 'UASO', 2),
(15, 'DEMİRİTASU SHOP', 14, 0x00, '2260  Jerry Dove Drive', 108, 'PORTNOVONO', 2),
(16, 'AFSAR - Head Office', NULL, 0x01, '1652  Deercove Drive', 182, 'CENGU', 2),
(17, 'AFSAR - Factory', 16, 0x01, '1652  Deercove Drive', 182, 'KIEV', 2),
(18, 'AFSAR SHOP', 17, 0x00, '1652  Deercove Drive', 182, 'PEZUVE', 2),
(19, 'XRL - Head Office', NULL, 0x01, '4771  Oakwood Circle', 181, 'OUGA', 0),
(20, 'XRL - Factory', 19, 0x00, '2528  Raccoon Run', 181, 'DREO', 0),
(21, 'XRL SHOP', 20, 0x00, '3667  Williams Mine Road', 182, 'DEOM', 1),
(22, 'BERSHKA - Head Office', NULL, 0x01, '237  Hiddenview Drive', 102, 'BREKO', 2),
(23, 'BERSHKA - Factory', 22, 0x00, '1171  Philadelphia Avenue', 104, 'TELR', 2),
(24, 'BERSHKA SHOP', 23, 0x00, '1171  Philadelphia Avenue', 104, 'TELR', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `M_SYSCODE` int(11) NOT NULL AUTO_INCREMENT,
  `M_CODE` varchar(15) NOT NULL,
  `M_NAME` varchar(25) NOT NULL,
  `M_SHORTNAME` varchar(10) NOT NULL,
  `M_PARENTCODE` varchar(15) DEFAULT NULL,
  `M_ABSTRACT` binary(1) NOT NULL,
  `M_CATEGORY` varchar(12) DEFAULT NULL,
  `IS_ACTIVE` binary(1) NOT NULL,
  PRIMARY KEY (`M_SYSCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`M_SYSCODE`, `M_CODE`, `M_NAME`, `M_SHORTNAME`, `M_PARENTCODE`, `M_ABSTRACT`, `M_CATEGORY`, `IS_ACTIVE`) VALUES
(1, '3syha', 'esya', 'esya', NULL, 0x01, '', 0x01),
(2, '3gicek', 'Giyecek', 'giyecek', '3syha', 0x01, '', 0x01),
(3, 'ust_g1y1m', 'ust_giyim', 'ustgym', '3gicek', 0x00, NULL, 0x01),
(4, 'KAZAK', 'kazak_kırmızı', 'krmzkzk', '3gicek', 0x00, 'ust_giyim', 0x01),
(5, 'atki_#', 'kareli_atkı', 'krlatk', 'ust_g1y1m', 0x01, 'ust_giyim', 0x01),
(6, 'sapka_bal1kc1', 'balikci_sapka', 'blkcspk', 'ust_g1y1m', 0x01, 'ust_giyim', 0x01),
(7, '3agi', 'Alt Giyim', 'altgiyim', '3gicek', 0x01, 'Giyecek', 0x01),
(8, '3plon', 'Pantolon', 'ptlon', '3agi', 0x00, 'Alt Giyim', 0x01),
(9, '3akabi', 'Ayakkabı', 'aykb', '3agi', 0x00, 'Alt Giyim', 0x01),
(10, '3crp', 'Çorap', 'crp', '3agi', 0x00, 'Alt Giyim', 0x01),
(11, 'mtfk1', 'Mutfak Arac Gerec', 'mtfkesya', '3syha', 0x00, 'esya', 0x01),
(12, 'byzesya1', 'Beyaz Esya', 'byzesy', '', 0x01, '', 0x01),
(13, 'bzdlb2', 'Buzdolabi', 'bzdlb', 'byzesya1', 0x00, 'Beyaz Esya', 0x01),
(14, 'cmsrmkns1', 'Camasir Makinesi', 'cmsrmkns', 'byzesya1', 0x00, 'Beyaz Esya', 0x01),
(15, 'elektrkli23', 'Elektrikli Mutfak Gereci', 'emg', 'mtfk1', 0x01, 'Mutfak Esya', 0x01),
(16, 'blndr12', 'Blender', 'blndr', 'elektrkli23', 0x00, 'Elektrikli', 0x01),
(17, 'icck2', 'İcecek', 'icck', NULL, 0x01, NULL, 0x01),
(18, 'gzliick', 'Gazli İcecek', 'gzliicck', 'icck2', 0x01, 'GazliIcecek', 0x01),
(19, 'bira4', 'Bira', 'bira', 'gzliick', 0x00, 'GazliIcecek', 0x01),
(20, 'kola2', 'Kola', 'kola', 'gzliick', 0x00, 'GazliIcecek', 0x01),
(21, 'sckicck5', 'Sicak Icecek', 'sckicck', 'icck2', 0x01, 'Icecek', 0x01),
(22, 'coffee4', 'Kahve', 'kahve', 'sckicck5', 0x00, 'Icecek', 0x01);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_brands`
--

DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE IF NOT EXISTS `product_brands` (
  `BRAND_BARCODE` char(13) NOT NULL,
  `M_SYSCODE` int(11) NOT NULL,
  `BRAND_NAME` varchar(100) NOT NULL,
  `MANUFACTURER_ID` int(11) NOT NULL,
  PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`),
  KEY `M_SYSCODE` (`M_SYSCODE`),
  KEY `MANUFACTURER_ID` (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_brands`
--

INSERT INTO `product_brands` (`BRAND_BARCODE`, `M_SYSCODE`, `BRAND_NAME`, `MANUFACTURER_ID`) VALUES
('atki23', 5, 'XRL', 1),
('atki234', 5, 'BERSHKA', 6),
('biru', 19, 'DEMİRİTASU ', 10),
('biru05', 19, 'AFSAR ', 4),
('bl3k5', 6, 'BERSHKA', 8),
('bl45', 13, 'VESTEL', 1),
('bl459', 16, 'ARCELİK', 1),
('blkcspk', 6, 'XRL', 6),
('bln57', 16, 'VESTEL', 5),
('bzd356', 13, 'ARCELİK', 6),
('cm4678', 14, 'ARCELİK', 2),
('CMSR4', 14, 'VESTEL', 5),
('k@z@k', 4, 'XRL', 4),
('k@zk1', 4, 'BERSHKA', 2),
('kho49', 22, 'STARBUCKS', 10),
('koffi', 22, 'CARIBOU', 5),
('kol678', 20, 'DEMİRİTASU', 10),
('kol8a', 20, 'AFSAR', 3),
('pntl23', 8, 'BERSHKA', 8),
('pntl4', 8, 'XRL', 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_features`
--

DROP TABLE IF EXISTS `product_features`;
CREATE TABLE IF NOT EXISTS `product_features` (
  `M_SYSCODE` int(11) NOT NULL,
  `FEATURE_ID` int(11) NOT NULL,
  `MINVAL` float NOT NULL,
  `MAXVAL` float NOT NULL,
  PRIMARY KEY (`M_SYSCODE`,`FEATURE_ID`),
  KEY `FEATURE_ID` (`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_features`
--

INSERT INTO `product_features` (`M_SYSCODE`, `FEATURE_ID`, `MINVAL`, `MAXVAL`) VALUES
(4, 4, 0, 4),
(5, 0, 20, 50),
(6, 4, 0, 4),
(13, 2, 12, 25),
(14, 2, 5, 7),
(16, 10, 1, 2),
(19, 2, 0, 2),
(20, 2, 1, 2),
(22, 2, 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`FEATURE_ID`) REFERENCES `features` (`FEATURE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_features_ibfk_2` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
