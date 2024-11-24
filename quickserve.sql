-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `quickserve`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eladók`
--

CREATE TABLE `eladók` (
  `Eladó_ID` int(11) NOT NULL,
  `Név` varchar(30) DEFAULT NULL,
  `Telefonszám` varchar(11) DEFAULT NULL,
  `Lakcím` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Jelszó` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `eladók`
--

INSERT INTO `eladók` (`Eladó_ID`, `Név`, `Telefonszám`, `Lakcím`, `Email`, `Jelszó`) VALUES
(1, 'Géza', NULL, '4900 Fehérgyarmat Május 14 tér 16.', 'gézaelado@gmail.com', 'Gezacska123');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendelések`
--

CREATE TABLE `megrendelések` (
  `Megrendelés_ID` int(11) NOT NULL,
  `Vásárló_ID` int(11) DEFAULT NULL,
  `Cikkszám` int(11) DEFAULT NULL,
  `Dátum` date DEFAULT NULL,
  `Mennyiség` int(11) DEFAULT NULL,
  `Összeg` int(11) DEFAULT NULL,
  `Idő` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `megrendelések`
--

INSERT INTO `megrendelések` (`Megrendelés_ID`, `Vásárló_ID`, `Cikkszám`, `Dátum`, `Mennyiség`, `Összeg`, `Idő`) VALUES
(1111, 1, 222, '2024-11-04', 2, 1800, '13:37:55'),
(2001, 1, 111, '2024-11-01', 2, 700, '14:30:00'),
(2002, 2, 222, '2024-11-02', 1, 900, '16:45:00'),
(2003, 3, 333, '2024-11-03', 3, 1350, '12:15:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelés_állapot`
--

CREATE TABLE `rendelés_állapot` (
  `Megrendelés_ID` int(11) NOT NULL,
  `Státusz` varchar(255) DEFAULT NULL,
  `Módosítás_dátuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelés_állapot`
--

INSERT INTO `rendelés_állapot` (`Megrendelés_ID`, `Státusz`, `Módosítás_dátuma`) VALUES
(1111, 'Teljesítve', '2024-11-14'),
(2001, 'Elutasítva', '2024-11-04'),
(2002, 'Teljesítve', '2024-11-23'),
(2003, 'Elkészült', '2024-11-06');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termékek`
--

CREATE TABLE `termékek` (
  `Cikkszám` int(11) NOT NULL,
  `Terméknév` varchar(255) DEFAULT NULL,
  `Kategória` varchar(255) DEFAULT NULL,
  `Egységár` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termékek`
--

INSERT INTO `termékek` (`Cikkszám`, `Terméknév`, `Kategória`, `Egységár`) VALUES
(111, 'Kávé', 'Forró italok', '350'),
(222, 'Suli szendvics', '1', '900'),
(333, 'Topjoy', '2', '450');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vásárlók`
--

CREATE TABLE `vásárlók` (
  `Vásárló_ID` int(11) NOT NULL,
  `Név` varchar(30) DEFAULT NULL,
  `Telefonszám` varchar(11) DEFAULT NULL,
  `Lakcím` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Jelszó` varchar(255) DEFAULT NULL,
  `Osztály` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vásárlók`
--

INSERT INTO `vásárlók` (`Vásárló_ID`, `Név`, `Telefonszám`, `Lakcím`, `Email`, `Jelszó`, `Osztály`) VALUES
(1, 'Péter', '06309869370', '4900 Fehérgyarmat Honvéd utca 4.', 'petermolnar0706@gmail.com', 'Jegesmaci123', '13.B'),
(2, 'Ádám', '06304300743', '4900 Fehérgyarmat Dózsa György utca 62.', 'adam001@gmail.com', 'Jegesmaci123', '12.B'),
(3, 'Kovács István', '06701234567', 'Budapest, Fő utca 12.', 'kovacs.istvan@example.com', 'password123', NULL),
(4, 'Szabó Anna', '06708901234', 'Debrecen, Nagyerdei krt. 8.', 'szabo.anna@example.com', 'passw0rd', NULL),
(5, 'Nagy Péter', '06703456789', 'Szeged, Kossuth Lajos sgt. 10.', 'nagy.peter@example.com', 'securepass', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vásárlók_kosarai`
--

CREATE TABLE `vásárlók_kosarai` (
  `Kosár_ID` int(11) NOT NULL,
  `Vásárló_ID` int(11) DEFAULT NULL,
  `Módosítás_dátuma` date DEFAULT NULL,
  `Cikkszám` int(11) DEFAULT NULL,
  `Mennyiség` int(11) DEFAULT NULL,
  `Kosár_összérték` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vásárlók_kosarai`
--

INSERT INTO `vásárlók_kosarai` (`Kosár_ID`, `Vásárló_ID`, `Módosítás_dátuma`, `Cikkszám`, `Mennyiség`, `Kosár_összérték`) VALUES
(1001, 1, '2024-11-01', 111, 2, 700),
(1002, 4, '2024-11-02', 222, 1, 900),
(1003, 3, '2024-11-03', 333, 3, 9000),
(1412, 2, '2024-11-14', 222, 1, 900);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `eladók`
--
ALTER TABLE `eladók`
  ADD PRIMARY KEY (`Eladó_ID`);

--
-- A tábla indexei `megrendelések`
--
ALTER TABLE `megrendelések`
  ADD PRIMARY KEY (`Megrendelés_ID`);

--
-- A tábla indexei `rendelés_állapot`
--
ALTER TABLE `rendelés_állapot`
  ADD PRIMARY KEY (`Megrendelés_ID`);

--
-- A tábla indexei `termékek`
--
ALTER TABLE `termékek`
  ADD PRIMARY KEY (`Cikkszám`);

--
-- A tábla indexei `vásárlók`
--
ALTER TABLE `vásárlók`
  ADD PRIMARY KEY (`Vásárló_ID`);

--
-- A tábla indexei `vásárlók_kosarai`
--
ALTER TABLE `vásárlók_kosarai`
  ADD PRIMARY KEY (`Kosár_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
