-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 02 Kas 2020, 20:04:46
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
-- Veritabanı: `yozgoyovic`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alternative_brands`
--

CREATE TABLE `alternative_brands` (
  `BRAND_BARCODE` int(11) NOT NULL,
  `M_SYSCODE` int(11) NOT NULL,
  `ALTERNATIVE_BRAND_BARCODE` int(11) NOT NULL,
  `ALTERNATIVE_M_SYSCODE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alternative_brands`
--
ALTER TABLE `alternative_brands`
  ADD PRIMARY KEY (`BRAND_BARCODE`,`M_SYSCODE`,`ALTERNATIVE_BRAND_BARCODE`,`ALTERNATIVE_M_SYSCODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
