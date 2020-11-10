-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 10 Kas 2020, 22:19:35
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.2.34

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

CREATE TABLE `alternative_brands` (
  `BRAND_BARCODE` char(13) NOT NULL,
  `M_SYSCODE` int(11) NOT NULL,
  `ALTERNATIVE_BRAND_BARCODE` char(13) NOT NULL,
  `ALTERNATIVE_M_SYSCODE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brand_orgs`
--

CREATE TABLE `brand_orgs` (
  `LOT_ID` int(11) NOT NULL,
  `ORG_ID` int(11) NOT NULL,
  `BRAND_BARCODE` char(13) NOT NULL,
  `QUANTITY` float NOT NULL,
  `UNIT` int(11) NOT NULL,
  `EXPIRY_DATE` date NOT NULL,
  `BASEPRICE` int(11) NOT NULL,
  `IN` int(11) NOT NULL,
  `OUT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country`
--

CREATE TABLE `country` (
  `COUNTRY_CODE` char(3) NOT NULL,
  `COUNTRY_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `country`
--

INSERT INTO `country` (`COUNTRY_CODE`, `COUNTRY_NAME`) VALUES
('1', 'ADANA'),
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

CREATE TABLE `country_city` (
  `CityID` int(11) NOT NULL,
  `City_Name` varchar(100) NOT NULL,
  `Country_Code` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `features` (
  `FEATURE_ID` int(11) NOT NULL,
  `FEATURE_NAME` varchar(200) DEFAULT NULL
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

CREATE TABLE `flow` (
  `Source_LOT_ID` int(11) NOT NULL,
  `Source_ORG_ID` int(11) NOT NULL,
  `Target_LOT_ID` int(11) NOT NULL,
  `Target_ORG_ID` int(11) NOT NULL,
  `BRAND_BARCODE` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `FlowDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `manufacturers`
--

CREATE TABLE `manufacturers` (
  `MANUFACTURER_ID` int(11) NOT NULL,
  `MANUFACTURER_NAME` varchar(200) NOT NULL,
  `MANUFACTURER_ADDRESS` varchar(200) NOT NULL,
  `COUNTRY_CODE` char(3) NOT NULL,
  `CITY_CODE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `manufacturers`
--

INSERT INTO `manufacturers` (`MANUFACTURER_ID`, `MANUFACTURER_NAME`, `MANUFACTURER_ADDRESS`, `COUNTRY_CODE`, `CITY_CODE`) VALUES
(171101031, 'Yozyoyovski_AS', 'Sogutozu Mah. No2 Cankaya/Ankara', '6', 106),
(171101036, 'IRRENIUM_as', 'Seeb, Oman', '4', 104),
(171101049, 'ENA_AS', 'Tverskaya St, 26/1, Moscow, Russia, 125009', '81', 182),
(171101054, 'YasuoJaponik_AS', 'Jend. Sudiman kav. 44–46, Jakarta 10210, Indonesia', '3', 103);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `organisations`
--

CREATE TABLE `organisations` (
  `ORG_ID` int(11) NOT NULL,
  `ORG_NAME` varchar(200) NOT NULL,
  `PARENT_ORG` int(11) NOT NULL,
  `ORG_ABSTRACT` binary(2) NOT NULL,
  `ORG_ADDRESS` varchar(200) NOT NULL,
  `ORG_CITY` int(11) NOT NULL,
  `ORG_DISTRICT` varchar(50) NOT NULL,
  `ORG_TYPE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `M_SYSCODE` int(11) NOT NULL,
  `M_CODE` varchar(15) NOT NULL,
  `M_NAME` varchar(25) NOT NULL,
  `M_SHORTNAME` varchar(10) NOT NULL,
  `M_PARENTCODE` varchar(15) DEFAULT NULL,
  `M_ABSTRACT` binary(1) NOT NULL,
  `M_CATEGORY` varchar(12) DEFAULT NULL,
  `IS_ACTIVE` binary(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `product_brands` (
  `BRAND_BARCODE` char(13) NOT NULL,
  `M_SYSCODE` int(11) NOT NULL,
  `BRAND_NAME` varchar(100) NOT NULL,
  `MANUFACTURER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_brands`
--

INSERT INTO `product_brands` (`BRAND_BARCODE`, `M_SYSCODE`, `BRAND_NAME`, `MANUFACTURER_ID`) VALUES
('6754trtrty', 8, 'Adidas', 171101031),
('eertrk6758', 10, 'Talhu', 171101031),
('hngvr34456', 13, 'BANTARA', 171101054),
('i1ii1i1i', 19, 'BUNGER', 171101036),
('mpr103runn', 4, 'ZAgiyim', 171101049),
('o0o01o0', 16, 'ARCELIK', 171101054),
('o1001OO1', 20, 'BANGER', 171101036),
('p0rt0r1c0', 22, 'HOTTIES', 171101036),
('umlkjd765', 14, 'BRANDOOR', 171101054),
('uvt7lvl7', 5, 'Burberry', 171101049),
('yure5454gmz', 6, 'Bershka', 171101049);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_features`
--

CREATE TABLE `product_features` (
  `M_SYSCODE` int(11) NOT NULL,
  `FEATURE_ID` int(11) NOT NULL,
  `MINVAL` float NOT NULL,
  `MAXVAL` float NOT NULL
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

CREATE TABLE `user` (
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alternative_brands`
--
ALTER TABLE `alternative_brands`
  ADD PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`,`ALTERNATIVE_BRAND_BARCODE`,`ALTERNATIVE_M_SYSCODE`),
  ADD KEY `M_SYSCODE` (`M_SYSCODE`);

--
-- Tablo için indeksler `brand_orgs`
--
ALTER TABLE `brand_orgs`
  ADD PRIMARY KEY (`LOT_ID`,`ORG_ID`,`BRAND_BARCODE`,`EXPIRY_DATE`),
  ADD KEY `BRAND_BARCODE` (`BRAND_BARCODE`),
  ADD KEY `ORG_ID` (`ORG_ID`);

--
-- Tablo için indeksler `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`COUNTRY_CODE`);

--
-- Tablo için indeksler `country_city`
--
ALTER TABLE `country_city`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `Country_Code` (`Country_Code`);

--
-- Tablo için indeksler `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`FEATURE_ID`);

--
-- Tablo için indeksler `flow`
--
ALTER TABLE `flow`
  ADD PRIMARY KEY (`Source_LOT_ID`,`Source_ORG_ID`,`Target_LOT_ID`,`Target_ORG_ID`,`BRAND_BARCODE`,`Quantity`,`FlowDate`),
  ADD KEY `Source_ORG_ID` (`Source_ORG_ID`);

--
-- Tablo için indeksler `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`MANUFACTURER_ID`),
  ADD KEY `CITY_CODE` (`CITY_CODE`),
  ADD KEY `COUNTRY_CODE` (`COUNTRY_CODE`);

--
-- Tablo için indeksler `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`ORG_ID`);

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`M_SYSCODE`);

--
-- Tablo için indeksler `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`),
  ADD KEY `M_SYSCODE` (`M_SYSCODE`),
  ADD KEY `MANUFACTURER_ID` (`MANUFACTURER_ID`);

--
-- Tablo için indeksler `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`M_SYSCODE`,`FEATURE_ID`),
  ADD KEY `FEATURE_ID` (`FEATURE_ID`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `brand_orgs`
--
ALTER TABLE `brand_orgs`
  MODIFY `LOT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `country_city`
--
ALTER TABLE `country_city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- Tablo için AUTO_INCREMENT değeri `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `MANUFACTURER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171101055;

--
-- Tablo için AUTO_INCREMENT değeri `organisations`
--
ALTER TABLE `organisations`
  MODIFY `ORG_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product`
--
ALTER TABLE `product`
  MODIFY `M_SYSCODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  ADD CONSTRAINT `flow_ibfk_2` FOREIGN KEY (`Source_ORG_ID`) REFERENCES `organisations` (`ORG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD CONSTRAINT `manufacturers_ibfk_1` FOREIGN KEY (`CITY_CODE`) REFERENCES `country_city` (`CityID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manufacturers_ibfk_2` FOREIGN KEY (`COUNTRY_CODE`) REFERENCES `country` (`COUNTRY_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;

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
