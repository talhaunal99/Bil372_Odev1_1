-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 02 Kas 2020, 18:52:28
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
-- Tablo için tablo yapısı `flow`
--

DROP TABLE IF EXISTS `flow`;
CREATE TABLE IF NOT EXISTS `flow` (
  `Source_LOT_ID` int(11) NOT NULL,
  `Source_ORG_ID` int(11) NOT NULL,
  `Target_LOT_ID` int(11) NOT NULL,
  `Target_ORG_ID` int(11) NOT NULL,
  `BRAND_BARCODE` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `FlowDate` date NOT NULL,
  PRIMARY KEY (`Source_LOT_ID`,`Source_ORG_ID`,`Target_LOT_ID`,`Target_ORG_ID`,`BRAND_BARCODE`,`Quantity`,`FlowDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
