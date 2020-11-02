-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 02 Kas 2020, 18:47:50
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
-- Tablo için tablo yapısı `product_brands`
--

DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE IF NOT EXISTS `product_brands` (
  `BRAND_BARCODE` varchar(13) NOT NULL,
  `M_SYSCODE` int(11) NOT NULL,
  `BRAND_NAME` varchar(100) NOT NULL,
  `MANUFACTURER_ID` int(11) NOT NULL,
  PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `product_brands`
--
ALTER TABLE `product_brands` ADD FULLTEXT KEY `BRAND_BARCODE` (`BRAND_BARCODE`);
ALTER TABLE `product_brands` ADD FULLTEXT KEY `BRAND_BARCODE_2` (`BRAND_BARCODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
