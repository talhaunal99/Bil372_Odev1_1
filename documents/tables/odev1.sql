-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 08 Kas 2020, 22:25:10
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
-- Veritabanı: `odev1`
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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brand_orgs`
--

DROP TABLE IF EXISTS `brand_orgs`;
CREATE TABLE IF NOT EXISTS `brand_orgs` (
  `LOT_ID` int NOT NULL AUTO_INCREMENT,
  `ORG_ID` int NOT NULL,
  `BRAND_BARCODE` char(13) NOT NULL,
  `QUANTITY` float NOT NULL,
  `UNIT` int NOT NULL,
  `EXPIRY_DATE` int NOT NULL,
  `BASEPRICE` int NOT NULL,
  `IN` int NOT NULL,
  `OUT` int NOT NULL,
  PRIMARY KEY (`LOT_ID`,`ORG_ID`,`BRAND_BARCODE`,`EXPIRY_DATE`),
  KEY `BRAND_BARCODE` (`BRAND_BARCODE`),
  KEY `ORG_ID` (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `COUNTRY_CODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `COUNTRY_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`COUNTRY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country_city`
--

DROP TABLE IF EXISTS `country_city`;
CREATE TABLE IF NOT EXISTS `country_city` (
  `CityID` int NOT NULL AUTO_INCREMENT,
  `City_Name` varchar(100) NOT NULL,
  `Country_Code` char(3) NOT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `features`
--

DROP TABLE IF EXISTS `features`;
CREATE TABLE IF NOT EXISTS `features` (
  `FEATURE_ID` int NOT NULL AUTO_INCREMENT,
  `FEATURE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `BRAND_BARCODE` int NOT NULL,
  `Quantity` int NOT NULL,
  `FlowDate` date NOT NULL,
  PRIMARY KEY (`Source_LOT_ID`,`Source_ORG_ID`,`Target_LOT_ID`,`Target_ORG_ID`,`BRAND_BARCODE`,`Quantity`,`FlowDate`),
  KEY `Source_ORG_ID` (`Source_ORG_ID`)
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
  PRIMARY KEY (`MANUFACTURER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `ORG_ID` int NOT NULL AUTO_INCREMENT,
  `ORG_NAME` varchar(200) NOT NULL,
  `PARENT_ORG` int NOT NULL,
  `ORG_ABSTRACT` binary(2) NOT NULL,
  `ORG_ADDRESS` varchar(200) NOT NULL,
  `ORG_CITY` int NOT NULL,
  `ORG_DISTRICT` varchar(50) NOT NULL,
  `ORG_TYPE` int NOT NULL,
  PRIMARY KEY (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `M_SYSCODE` int NOT NULL AUTO_INCREMENT,
  `M_CODE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `M_NAME` varchar(25) NOT NULL,
  `M_SHORTNAME` varchar(10) NOT NULL,
  `M_PARENTCODE` varchar(15) NOT NULL,
  `M_ABSTRACT` binary(1) NOT NULL,
  `M_CATEGORY` varchar(12) NOT NULL,
  `IS_ACTIVE` binary(1) NOT NULL,
  PRIMARY KEY (`M_SYSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` int NOT NULL,
  `fax` int NOT NULL,
  `address` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `alternative_brands`
--
ALTER TABLE `alternative_brands`
  ADD CONSTRAINT `alternative_brands_ibfk_1` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `alternative_brands_ibfk_2` FOREIGN KEY (`BRAND_BARCODE`) REFERENCES `product_brands` (`BRAND_BARCODE`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Tablo kısıtlamaları `brand_orgs`
--
ALTER TABLE `brand_orgs`
  ADD CONSTRAINT `brand_orgs_ibfk_1` FOREIGN KEY (`BRAND_BARCODE`) REFERENCES `product_brands` (`BRAND_BARCODE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `brand_orgs_ibfk_2` FOREIGN KEY (`ORG_ID`) REFERENCES `organisations` (`ORG_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Tablo kısıtlamaları `flow`
--
ALTER TABLE `flow`
  ADD CONSTRAINT `flow_ibfk_1` FOREIGN KEY (`Source_LOT_ID`) REFERENCES `brand_orgs` (`LOT_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `flow_ibfk_2` FOREIGN KEY (`Source_ORG_ID`) REFERENCES `organisations` (`ORG_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Tablo kısıtlamaları `product_brands`
--
ALTER TABLE `product_brands`
  ADD CONSTRAINT `product_brands_ibfk_1` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_brands_ibfk_2` FOREIGN KEY (`MANUFACTURER_ID`) REFERENCES `manufacturers` (`MANUFACTURER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Tablo kısıtlamaları `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`FEATURE_ID`) REFERENCES `features` (`FEATURE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_features_ibfk_2` FOREIGN KEY (`M_SYSCODE`) REFERENCES `product` (`M_SYSCODE`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
