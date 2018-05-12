-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: localhost
-- Čas nastanka: 12. maj 2018 ob 12.50
-- Različica strežnika: 10.1.29-MariaDB-6
-- Različica PHP: 7.2.3-1ubuntu1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `ife`
--

-- --------------------------------------------------------

--
-- Struktura tabele `clanilaboratorija`
--

CREATE TABLE `clanilaboratorija` (
  `IDLab` tinyint(3) UNSIGNED NOT NULL,
  `IDZaposlenega` int(11) NOT NULL,
  `VlogaZaposlenega` varchar(10) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `clanilaboratorija`
--

INSERT INTO `clanilaboratorija` (`IDLab`, `IDZaposlenega`, `VlogaZaposlenega`) VALUES
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan'),
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan'),
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan'),
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan'),
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan'),
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan'),
(14, 6, 'clan'),
(14, 7, 'clan'),
(14, 8, 'clan'),
(14, 10, 'clan'),
(14, 11, 'clan'),
(14, 12, 'clan'),
(14, 13, 'clan');

-- --------------------------------------------------------

--
-- Struktura tabele `dogodek`
--

CREATE TABLE `dogodek` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Datum` date NOT NULL,
  `OpisDogodka` longtext NOT NULL,
  `Lokacija` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Link` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Ura` time NOT NULL,
  `IDProstora` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `dogodek`
--

INSERT INTO `dogodek` (`ID`, `Ime`, `Datum`, `OpisDogodka`, `Lokacija`, `Link`, `Ura`, `IDProstora`) VALUES
(23, 'Festival inovativnih idej', '2017-06-26', 'Lorem Ipsum', 'Fakulteta za elektrotehniko, avla', 'https:\\Lorem Ipsum', '15:00:00', 1),
(24, 'Karierfest', '2018-05-03', 'Lorem Ipsum', 'Fakulteta za elektrotehniko, avla', 'https:\\Lorem Ipsum', '06:00:00', 1),
(25, 'Zakljucna zabava', '2017-12-31', 'Lorem Ipsum', 'Fakulteta za elektrotehniko, avla', 'https:\\Lorem Ipsum', '07:30:00', 1),
(26, 'Sprejem Brucev', '2017-08-07', 'Lorem Ipsum', 'Fakulteta za elektrotehniko, avla', 'https:\\Lorem Ipsum', '09:40:00', 1),
(27, 'Novoletna proslava', '2018-12-31', 'Lorem Ipsum', 'Fakulteta za elektrotehniko, avla', 'https:\\Lorem Ipsum', '23:59:59', 0);

-- --------------------------------------------------------

--
-- Struktura tabele `govorilneure`
--

CREATE TABLE `govorilneure` (
  `ID` smallint(6) NOT NULL,
  `Besedilo` longtext NOT NULL,
  `IDZaposlenega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `govorilneure`
--

INSERT INTO `govorilneure` (`ID`, `Besedilo`, `IDZaposlenega`) VALUES
(3, 'Po dogovoru', 6),
(4, 'Po dogovoru', 7),
(6, 'Po dogovoru', 8),
(7, 'Po dogovoru', 10),
(8, 'Po dogovoru', 11),
(9, 'Po dogovoru', 12),
(10, 'Po dogovoru', 13);

-- --------------------------------------------------------

--
-- Struktura tabele `izpit`
--

CREATE TABLE `izpit` (
  `ID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Ura` time DEFAULT NULL,
  `IDTipIzpita` tinyint(3) UNSIGNED NOT NULL,
  `Polaganje` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `izpitstudent`
--

CREATE TABLE `izpitstudent` (
  `IDStudent` int(11) NOT NULL,
  `IDIzpit` int(11) NOT NULL,
  `Tocke` tinyint(3) UNSIGNED DEFAULT NULL,
  `Ocena` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `katedra`
--

CREATE TABLE `katedra` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(65) CHARACTER SET utf8mb4 NOT NULL,
  `Opis` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `katedra`
--

INSERT INTO `katedra` (`ID`, `Ime`, `Opis`) VALUES
(1, 'Katedra za osnove elektrotehnike, matematiko in fiziko', 'Lorem Ipsum'),
(2, 'Katedra za elektroenergetske sisteme in naprave', 'Lorem Ipsum'),
(3, 'Katedra za elektroniko', 'Lorem Ipsum'),
(4, 'Katedra za merjenja in robotiko', 'Lorem Ipsum'),
(5, 'Katedra za mikroelektronske tehnologije', 'Lorem Ipsum'),
(6, 'Katedra za mehatroniko', 'Lorem Ipsum'),
(7, 'Katedra za sisteme, avtomatiko in kibernetiko', 'Lorem Ipsum'),
(8, 'Katedra za informacijske in komunikacijske tehnologije', 'Lorem Ipsum'),
(9, 'Katedra za biomedicinsko tehniko', 'Lorem Ipsum');

-- --------------------------------------------------------

--
-- Struktura tabele `laboratorij`
--

CREATE TABLE `laboratorij` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `LabIme` varchar(85) CHARACTER SET utf8mb4 NOT NULL,
  `Akronim` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Opis` longtext NOT NULL,
  `IDKatedre` int(11) NOT NULL,
  `Tajnica` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `laboratorij`
--

INSERT INTO `laboratorij` (`ID`, `LabIme`, `Akronim`, `Opis`, `IDKatedre`, `Tajnica`) VALUES
(1, 'Laboratorij za preskrbo z elektricno energijo', 'LPEE', 'Lorem Ipsum', 2, NULL),
(3, 'Laboratorij za bioelektromagnetiko', 'LBEM', 'LoremIpsum', 1, NULL),
(4, 'Laboratorij za biofiziko', 'LBF', 'LoremIpsum', 1, NULL),
(5, 'Laboratorij za fiziko', 'LF', 'LoremIpsum', 1, NULL),
(6, 'Laboratorij za razsvetljavo in fotometrijo', 'LRF', 'LoremIpsum', 2, NULL),
(7, 'Laboratorij za merjenje in kakovost', 'LMK', 'LoremIpsum', 4, NULL),
(8, 'Laboratorij za robotiko', 'LR', 'LoremIpsum', 4, NULL),
(9, 'Laboratorij za mikroelektroniko', 'LME', 'LoremIpsum', 5, NULL),
(10, 'Laboratorij za biokibernetiko', 'LBK', 'LoremIpsum', 9, NULL),
(11, 'Laboratorij za multimedijo', 'LMM', 'LoremIpsum', 8, NULL),
(12, 'Laboratorij za sevanje in optiko', 'LSO', 'LoremIpsum', 8, NULL),
(13, 'Laboratorij za informacijske tehnologije', 'LaIT', 'LoremIpsum', 8, NULL),
(14, 'Laboratorij za telekomunikacije', 'LT', 'LoremIpsum', 8, '284'),
(15, 'Laboratorij za uporabniku prilagojene komunikacije in ambientno inteligenco', 'LUPKAI', 'LoremIpsum', 8, NULL);

-- --------------------------------------------------------

--
-- Struktura tabele `ltnazivi`
--

CREATE TABLE `ltnazivi` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `Naziv` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `ltnazivi`
--

INSERT INTO `ltnazivi` (`ID`, `Naziv`) VALUES
(1, 'uni. dipl. inĹľ. el.');

-- --------------------------------------------------------

--
-- Struktura tabele `ltprogram`
--

CREATE TABLE `ltprogram` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Stopnja` tinyint(3) UNSIGNED NOT NULL,
  `Tip` varchar(15) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `ltprogram`
--

INSERT INTO `ltprogram` (`ID`, `Ime`, `Stopnja`, `Tip`) VALUES
(10530613, 'Elektroteh', 3, 'doktorat'),
(11420613, 'Elektroteh', 2, 'magisterij'),
(11421414, 'Multimedij', 2, 'magisterij'),
(12210613, 'Elektroteh', 1, 'univerzitetni'),
(12211414, 'Multimedij', 1, 'univerziteni'),
(12310106, 'Aplikativn', 1, 'visokoĹˇolski'),
(12311412, 'Multimedij', 1, 'visokoĹˇolski');

-- --------------------------------------------------------

--
-- Struktura tabele `ltprostor`
--

CREATE TABLE `ltprostor` (
  `ID` smallint(6) NOT NULL,
  `Ime` char(10) NOT NULL,
  `Stavba` char(1) NOT NULL,
  `Nadstropje` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `ltprostor`
--

INSERT INTO `ltprostor` (`ID`, `Ime`, `Stavba`, `Nadstropje`) VALUES
(1, 'AZ104-KAB', 'A', '4'),
(4, 'BN510-KAB', 'B', '5'),
(5, 'BN513-LTI', 'B', '5'),
(6, 'BN513A/1-L', 'B', '5'),
(7, 'BN513B-LT1', 'B', '5'),
(8, 'DN006B-MMC', 'A', '2'),
(9, 'BN210-KAB', 'B', '2'),
(10, 'BN512-KAB', 'B', '5'),
(11, 'BN414/1-LT', 'B', '4');

-- --------------------------------------------------------

--
-- Struktura tabele `ltsemester`
--

CREATE TABLE `ltsemester` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `SemesterIzvajanja` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Zacetek` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `Konec` varchar(30) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `ltsemester`
--

INSERT INTO `ltsemester` (`ID`, `SemesterIzvajanja`, `Zacetek`, `Konec`) VALUES
(1, 'zimski', '1. polovica oktobra.', 'Konec prve polovice januarja.'),
(2, 'poletni', '2. polovica januarja', 'Konec prve polovice julija.');

-- --------------------------------------------------------

--
-- Struktura tabele `ltsteber`
--

CREATE TABLE `ltsteber` (
  `ID` char(10) CHARACTER SET utf8mb4 NOT NULL,
  `Opis` varchar(25) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `ltsteber`
--

INSERT INTO `ltsteber` (`ID`, `Opis`) VALUES
('ISP', 'Izbirni sploĹˇni'),
('IST', 'Izbirni strokovni'),
('OSP', 'Obvezni sploĹˇni'),
('OST', 'Obvezni strokovni');

-- --------------------------------------------------------

--
-- Struktura tabele `lttipizpit`
--

CREATE TABLE `lttipizpit` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `Opis` varchar(25) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `lttipizpit`
--

INSERT INTO `lttipizpit` (`ID`, `Opis`) VALUES
(1, 'Kolokvij                 '),
(2, 'PopravniKolokvij         '),
(3, 'Teoreticni               '),
(4, 'Prakticni                ');

-- --------------------------------------------------------

--
-- Struktura tabele `lttipzaposlenega`
--

CREATE TABLE `lttipzaposlenega` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `Opis` varchar(35) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `lttipzaposlenega`
--

INSERT INTO `lttipzaposlenega` (`ID`, `Opis`) VALUES
(1, 'Redni profesorji'),
(2, 'Izredni profesorji'),
(3, 'Docenti'),
(4, 'Predavatelji in viĹˇji predavatelji'),
(5, 'Asistenti'),
(6, 'TehniĹˇki sodelavci'),
(7, 'Raziskovalci'),
(8, 'Ostale sluĹľbe'),
(9, 'Zunanji sodelavci');

-- --------------------------------------------------------

--
-- Struktura tabele `odzivi`
--

CREATE TABLE `odzivi` (
  `ID` int(11) NOT NULL,
  `Komentar` longtext NOT NULL,
  `Datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `pedagogpredmet`
--

CREATE TABLE `pedagogpredmet` (
  `IDPedagog` int(11) NOT NULL,
  `IDPredmet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `pedagogpredmet`
--

INSERT INTO `pedagogpredmet` (`IDPedagog`, `IDPredmet`) VALUES
(8, 64114),
(10, 64190),
(11, 64190),
(12, 64114),
(13, 64190),
(8, 64114),
(10, 64190),
(11, 64190),
(12, 64114),
(13, 64190),
(8, 64114),
(10, 64190),
(11, 64190),
(12, 64114),
(13, 64190),
(8, 64114),
(10, 64190),
(11, 64190),
(12, 64114),
(13, 64190),
(8, 64114),
(10, 64190),
(11, 64190),
(12, 64114),
(13, 64190),
(8, 64114),
(10, 64190),
(11, 64190),
(12, 64114),
(13, 64190);

-- --------------------------------------------------------

--
-- Struktura tabele `predmet`
--

CREATE TABLE `predmet` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Akronim` varchar(15) NOT NULL,
  `KreditneTocke` tinyint(3) UNSIGNED NOT NULL,
  `Letnik` char(1) NOT NULL,
  `IDSteber` char(10) CHARACTER SET utf8mb4 NOT NULL,
  `Predavanja` tinyint(3) UNSIGNED NOT NULL DEFAULT '45',
  `LaboratorijskeVaje` tinyint(3) UNSIGNED NOT NULL DEFAULT '30',
  `AvditorneVaje` tinyint(3) UNSIGNED NOT NULL DEFAULT '15',
  `IDSemestra` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `predmet`
--

INSERT INTO `predmet` (`ID`, `Ime`, `Akronim`, `KreditneTocke`, `Letnik`, `IDSteber`, `Predavanja`, `LaboratorijskeVaje`, `AvditorneVaje`, `IDSemestra`) VALUES
(63202, 'Osnove matematicne analize', 'OMA', 6, '1', 'OSP', 45, 15, 15, '1'),
(63207, 'Linearna algebra', 'LA', 6, '1', 'OSP', 45, 30, 0, '2'),
(63212, 'Arhitektura racunalniĹˇkih sistemov', 'ARS', 6, '1', 'OSP', 45, 30, 0, '2'),
(63249, 'Elektronsko poslovanje (FRI)', 'EP', 6, '3', 'ISP', 45, 30, 0, '1'),
(63250, 'Organizacija in management (FRI)', 'OM', 6, '3', 'ISP', 45, 30, 0, '2'),
(63251, 'Poslovna inteligenca', 'PI', 6, '3', 'OST', 45, 30, 0, '1'),
(63255, 'Spletno programiranje', 'SP', 6, '3', 'OST', 45, 30, 0, '1'),
(63262, 'Zanesljivost in zmogljivost racunalniĹˇkih sistemov (FRI)', 'ZZRS', 6, '2', 'ISP', 45, 30, 0, '2'),
(63269, 'RacunalniĹˇka grafika in tehnologija iger', 'RGTI', 6, '2', 'OST', 45, 30, 0, '1'),
(63271, 'Osnove oblikovanja (FRI)', 'OO', 6, '2', 'OSP', 45, 30, 0, '2'),
(63277, 'Programiranje 1', 'P1', 6, '1', 'OST', 45, 30, 0, '1'),
(63278, 'Programiranje 2 (FRI)', 'P2', 6, '1', 'OST', 45, 30, 0, '2'),
(64101, 'Matematika I', 'M1', 9, '1', 'OSP', 60, 0, 45, '1'),
(64103, 'Osnove elektrotehnike I', 'OE1', 8, '1', 'OST', 60, 15, 30, '1'),
(64104, 'Osnove programiranja', 'OP', 5, '1', 'OST', 30, 15, 15, '1'),
(64105, 'Matematika II', 'M2', 9, '1', 'OSP', 60, 15, 30, '2'),
(64107, 'Osnove elektrotehnike II', 'OE2', 8, '1', 'OST', 60, 30, 15, '2'),
(64108, 'Programiranje mikrokrmilnikov', 'PM', 5, '1', 'OST', 30, 15, 15, '2'),
(64111, 'Matematika III', 'M3', 9, '2', 'OSP', 60, 15, 30, '1'),
(64112, 'Meritve', 'ME', 7, '2', 'OST', 45, 45, 0, '1'),
(64113, 'Digitalne strukture', 'DS', 7, '2', 'OST', 45, 30, 15, '1'),
(64114, 'Komunikacijski sistemi', 'KS', 7, '2', 'OST', 45, 30, 15, '1'),
(64115, 'Matematika IV', 'M4', 9, '2', 'OSP', 45, 15, 15, '2'),
(64116, 'Merilna instrumentacija', 'MI', 5, '2', 'OST', 30, 30, 0, '2'),
(64117, 'Elektricni stroji', 'ES', 7, '2', 'OST', 45, 30, 15, '2'),
(64118, 'PolprevodniĹˇka elektronika', 'PE', 7, '2', 'OST', 45, 30, 15, '2'),
(64119, 'Avtomatsko vodenje sistemov', 'AVS', 5, '2', 'IST', 45, 15, 0, '2'),
(64120, 'Digitalni elektronski sistemi', 'DES', 5, '2', 'IST', 30, 30, 0, '2'),
(64121, 'Energetika in okolje', 'EO', 5, '2', 'IST', 30, 30, 0, '2'),
(64122, 'Informacijski sistemi', 'IS', 5, '2', 'IST', 45, 15, 0, '2'),
(64123, 'Gradniki sistemov vodenja', 'GSV', 7, '3', 'OST', 45, 45, 0, '1'),
(64124, 'Analiza linearnih sistemov', 'ALS', 7, '3', 'OST', 45, 30, 15, '1'),
(64125, 'Signali', 'SG', 6, '3', 'OST', 45, 30, 0, '1'),
(64126, 'Osnove robotike', 'OR', 5, '3', 'OST', 30, 30, 0, '1'),
(64127, 'Optoelektronika', 'OE', 5, '3', 'IST', 30, 30, 0, '1'),
(64128, 'Osnove mehatronike', 'OM', 5, '3', 'IST', 30, 30, 0, '1'),
(64129, 'Inteligentni sistemi', 'IS', 5, '3', 'IST', 45, 15, 0, '1'),
(64130, 'Numericne metode', 'NM', 5, '3', 'IST', 30, 30, 0, '1'),
(64131, 'Elektronika v avtomatiki', 'EA', 7, '3', 'OST', 45, 45, 0, '2'),
(64132, 'Industrijski krmilni in regulacijski sistemi', 'IKRS', 7, '3', 'OST', 45, 45, 0, '2'),
(64133, 'RacunalniĹˇka simulacija', 'RS', 6, '3', 'OST', 45, 30, 0, '2'),
(64134, 'Navidezna resnicnost (Modul A)', 'NRmA', 5, '3', 'ISP', 30, 30, 0, '2'),
(64135, 'Slikovna informatika (Modul A)', 'SImA', 5, '3', 'ISP', 30, 30, 0, '2'),
(64136, 'Nacrtovanje vgrajenih sistemov (Modul B)', 'NVSmB', 5, '3', 'ISP', 30, 30, 0, '2'),
(64137, 'Programiranje vgrajenih sistemov (Modul B)', 'PVSmB', 5, '3', 'ISP', 30, 30, 0, '2'),
(64138, 'Nizkonapetostne elektroenergetske inĹˇtalacije (Modul C)', 'NEImC', 5, '3', 'ISP', 30, 30, 0, '2'),
(64139, 'Programirljivi krmilni sistemi (Modul C)', 'PKSmC', 5, '3', 'ISP', 30, 30, 0, '2'),
(64140, 'Svetovni splet (Modul D)', 'SSmD', 5, '3', 'ISP', 45, 15, 0, '2'),
(64141, 'Multimedijski sistemi (Modul D)', 'MSmD', 5, '3', 'ISP', 45, 15, 0, '2'),
(64142, 'Projektno vodenje, inovativnost in timsko delo (Modul E)', 'PITmE', 5, '3', 'ISP', 30, 30, 0, '2'),
(64143, 'Zasnova in razvoj izdelkov (Modul E)', 'ZRImE', 5, '3', 'ISP', 30, 30, 0, '2'),
(64146, 'Elektronske komponente in senzorji', 'EKS', 6, '3', 'ISP', 45, 15, 15, '1'),
(64147, 'Mehanika in termodinamika (Fizika I)', 'MT', 8, '1', 'OSP', 60, 0, 45, '1'),
(64148, 'Atomika in optika (Fizika II)', 'AO', 8, '1', 'OSP', 60, 0, 45, '2'),
(64154, 'Govorne in slikovne tehnologije', 'GST', 6, '2', 'ISP', 45, 30, 0, '2'),
(64174, 'Digitalna obdelava signalov', 'DOS', 7, '2', 'OST', 45, 45, 0, '2'),
(64176, 'Telekomunikacijski protokoli', 'TKP', 6, '2', 'ISP', 45, 30, 0, '2'),
(64190, 'Uvod v multimedijske sisteme', 'UMMS', 6, '1', 'OST', 45, 15, 15, '1'),
(64191, 'Karierna komunikacija', 'KK', 6, '1', 'OSP', 45, 0, 30, '1'),
(64192, 'TehnoloĹˇke osnove multmedije', 'TOMM', 7, '1', 'OST', 45, 15, 15, '2'),
(64193, 'Internetni sistemi', 'IS', 6, '2', 'OST', 45, 15, 15, '1'),
(64194, 'Radijski in televizijski sistemi', 'RTVS', 6, '2', 'OST', 45, 15, 15, '1'),
(64195, 'Informacijsko-komunikacijske tehnologije in druĹľba', 'IKT', 6, '2', 'OSP', 45, 0, 30, '1'),
(64196, 'Studijska in snemalna tehnika', 'SST', 6, '3', 'OSP', 45, 30, 0, '2'),
(64197, 'Multimedijske vsebine', 'MMV', 6, '3', 'OST', 45, 30, 0, '1'),
(64198, 'Varnost komunikacij in zaĹˇcita vsebin', 'VKZV', 6, '3', 'OST', 45, 30, 0, '1'),
(64199, 'MontaĹľa in postprodukcija', 'MPP', 6, '3', 'OSP', 30, 45, 0, '2'),
(64256, 'Akustika v komunikacijah', 'AK', 6, '2', 'OST', 45, 30, 0, '1'),
(64270, 'Terminalske naprave in uporabniĹˇki vmesniki', 'TNUV', 6, '3', 'OST', 45, 30, 0, '2'),
(64271, 'Mobilni in telematski sistemi', 'MTS', 6, '2', 'OST', 45, 30, 0, '2');

-- --------------------------------------------------------

--
-- Struktura tabele `predmetizpit`
--

CREATE TABLE `predmetizpit` (
  `IDPredmeta` int(11) NOT NULL,
  `IDIzpita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `predmetsmer`
--

CREATE TABLE `predmetsmer` (
  `IDPredmet` int(11) NOT NULL,
  `IDSmer` int(11) NOT NULL,
  `Letnik` varchar(10) NOT NULL,
  `IDSemester` tinyint(3) UNSIGNED NOT NULL,
  `Tip` char(5) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `skoda`
--

CREATE TABLE `skoda` (
  `ID` int(11) NOT NULL,
  `Opis` longtext NOT NULL,
  `Lokacija` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `PotDoSlikeSkode` longtext NOT NULL,
  `DatumObvestila` date NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'Obvesceno',
  `PredvidenDatumOdpravitveSkode` date NOT NULL,
  `IDPrijavitelja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `skoda`
--

INSERT INTO `skoda` (`ID`, `Opis`, `Lokacija`, `PotDoSlikeSkode`, `DatumObvestila`, `Status`, `PredvidenDatumOdpravitveSkode`, `IDPrijavitelja`) VALUES
(1, 'gvx', 'Studio', 'C:\\Shares', '2017-05-29', 'Obvesceno', '2017-06-12', 12);

-- --------------------------------------------------------

--
-- Struktura tabele `smer`
--

CREATE TABLE `smer` (
  `ID` int(11) NOT NULL,
  `IDProgram` int(11) NOT NULL,
  `Ime` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Akronim` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `Naziv` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `AkronimNaziva` varchar(25) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `smer`
--

INSERT INTO `smer` (`ID`, `IDProgram`, `Ime`, `Akronim`, `Naziv`, `AkronimNaziva`) VALUES
(101230106, 12310106, 'Avtomatika(VS)', 'AV(VS)', 'diplomirani inĹľenir elektrotehnike [VS]', 'dipl. inĹľ. el. [VS]'),
(101230613, 12210613, 'Avtomatika', 'AV', 'diplomirani inĹľenir elektrotehnike [UN]', 'dipl. inĹľ. el. [UN]'),
(106010106, 12310106, 'Energetska tehnika in avtomatizacija postrojev(VS)', 'EA(VS)', 'diplomirani inĹľenir elektrotehnike [VS]', 'dipl. inĹľ. el. [VS]'),
(106140613, 12210613, 'Energetika in mehatronika', 'EM', 'diplomirani inĹľenir elektrotehnike [UN]', 'dipl. inĹľ. el. [UN]'),
(106210106, 12310106, 'Elektronika(VS)', 'ET(VS)', 'diplomirani inĹľenir elektrotehnike [VS]', 'dipl. inĹľ. el. [VS]'),
(106210613, 12210613, 'Elektronika', 'ET', 'diplomirani inĹľenir elektrotehnike [UN]', 'dipl. inĹľ. el. [UN]'),
(114121412, 12311412, 'Multimedijske komunikacije(VS)', 'MK(VS)', 'diplomirani inĹľenir multimedijskih komunikacij [VS]', 'dipl. inĹľ. mm. kom. [VS]'),
(114141414, 12211414, 'Multimedija', 'MM', 'diplomirani inĹľenir multimedije [UN]', 'dipl. inĹľ. mm. [UN]'),
(121120106, 12310106, 'TehniĹˇka kakovost(VS)', 'TK(VS)', 'diplomirani inĹľenir elektrotehnike [VS]', 'dipl. inĹľ. el. [VS]'),
(121130106, 12310106, 'Telekomunikacije(VS)', 'TL(VS)', 'diplomirani inĹľenir elektrotehnike [VS]', 'dipl. inĹľ. el. [VS]'),
(121130613, 12210613, 'Telekomunikacije', 'TL', 'diplomirani inĹľenir elektrotehnike [UN]', 'dipl. inĹľ. el. [UN]'),
(201100613, 11420613, 'Avtomatika in informatika', 'AI', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(202210613, 11420613, 'Biomedicinska tehnika', 'BT', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(206060613, 11420613, 'Elektroenergetika', 'EE', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(206210613, 11420613, 'Elektronika', 'ET', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(214141414, 11421414, 'Multimedija', 'MM', 'magister inĹľenir multimedije', 'mag. inĹľ. mm.'),
(214210613, 11420613, 'Mehatronika', 'MT', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(218020613, 11420613, 'Robotika', 'RB', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(221130613, 11420613, 'Telekomunikacije', 'TL', 'magister inĹľenir elektrotehnike', 'mag. inĹľ. el'),
(306130613, 10530613, 'Elektrotehnika', 'EL', 'doktor znanosti', 'dr.');

-- --------------------------------------------------------

--
-- Struktura tabele `smerstudent`
--

CREATE TABLE `smerstudent` (
  `IDSmer` int(11) NOT NULL,
  `IDStudent` int(11) NOT NULL,
  `Letnik` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabele `student`
--

CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `Priimek` varchar(40) NOT NULL,
  `StudentskiMail` char(4) NOT NULL,
  `Geslo` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `SteviloPrijavBrezCertifikata` tinyint(3) UNSIGNED NOT NULL DEFAULT '100',
  `Telefon` char(15) NOT NULL,
  `DomaciNaslov` varchar(64) NOT NULL,
  `DomacaPostnaStevilka` int(11) NOT NULL,
  `IDProgram` int(11) NOT NULL,
  `IDTipMaila` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `student`
--

INSERT INTO `student` (`ID`, `Ime`, `Priimek`, `StudentskiMail`, `Geslo`, `SteviloPrijavBrezCertifikata`, `Telefon`, `DomaciNaslov`, `DomacaPostnaStevilka`, `IDProgram`, `IDTipMaila`) VALUES
(64132017, 'Ana Marija', 'JaneĹľic', '6789', 'v', 100, '042871134', 'Obrezija 11', 1411, 12210613, 1),
(64150009, 'Iza', 'Majcen', '2222', 'v', 100, '041356331', 'Crna vas 29', 1000, 12211414, 1),
(64150025, 'Timotej', 'Holzer', '0912', 'fr', 98, '040721227', 'Smrecje 27', 1354, 12210613, 1),
(64151003, 'Anej', 'Hozjan', '6729', 'fr', 80, '061753903', 'Smrekarjeva ulica 21', 6310, 12211414, 1),
(64152012, 'Miha', 'Podobnikar', '0975', 'rwkfkl                  ', 100, '041675839', 'Moste 24', 1218, 12210613, 1),
(64160021, 'Aleksander', 'KovaÄŤ', '3900', '49b6492f787e9e05e26b01eb191c1d90ceb7aa0f83a39dd8504c98a167117def', 100, '040724968', 'Lendavske gorice 409a', 9220, 12211414, 1),
(64170031, 'Nadja', 'Messner', '4312', '3564                                    ', 73, '031462173', 'JelovĹˇka cesta 4', 4264, 12211414, 1);

-- --------------------------------------------------------

--
-- Struktura tabele `sysdiagrams`
--

CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `sysdiagrams`
--

INSERT INTO `sysdiagrams` (`name`, `principal_id`, `diagram_id`, `version`, `definition`) VALUES
('iFE', 1, 1, 1, 0xc490c48e11c595cb87c2b11ac3a1000000000000000000000000000000003e000300c5a3cb990900060000000000000000000000010000000100000000000000001000003d00000001000000c5a3cb99cb99cb990000000000000000cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99c3bdcb99cb99cb993f000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e000000c5a3cb99cb99cb99100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000200000002100000022000000230000002400000025000000260000002700000028000000290000002a0000002b0000002c0000002d0000002e0000002f000000300000003100000032000000330000003400000035000000360000003700000038000000390000003a0000003b0000003c000000c5a3cb99cb99cb99c5a3cb99cb99cb9965000000c5a3cb99cb99cb994100000042000000430000004400000045000000460000004700000048000000490000004a0000004b0000004c0000004d0000004e0000004f000000500000005100000052000000530000005400000055000000560000005700000058000000590000005a0000005b0000005c0000005d0000005e0000005f0000006000000061000000620000006300000064000000c5a3cb99cb99cb99660000006700000068000000c5a3cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb9952006f006f007400200045006e00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500cb99cb99cb99cb99cb99cb99cb99cb99020000000000000000000000000000000000000000000000000000000000000020257ce280b055c499c587013e00000040080000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb9900000000000000000000000000000000000000000000000000000000000000000000000002000000c3a2180000000000006f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000cb99cb99cb99cb990000000000000000000000000000000000000000000000000000000000000000000000000f000000c59e5b000000000000010043006f006d0070004f0062006a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99000000000000000000000000000000000000000000000000000000000000000000000000000000005f00000000000000000434000a1e500c050000e282acc49a0000000f00cb99cb9946000000c49a000000007d0000604f0000c2a4350000e282ac430100495b01004c110000c483300000c5a2e282ac5b10c584e280a2c49011c2b0c2a000c59e00cb9dc38b5c000008003000000000020000030000003c006b0000000900000000000000c5aec487c2b0c3a91cc281c49011c2ad5100c2a0c3890f5739c3b43b7fe2809e7f61c38743e280a63529e280a0c3a1c59052c599c2a0327dcb9bc59862e280a242c5a4c298273c25cb98c39a2d00002800430000000000000053444dc587011fc58311c5bd630060e28094c587c39f4834c389c587777977c59811c2907000065be2809e0dc59b00002800430000000000000051444dc587011fc58311c5bd630060e28094c587c39f4834c389c587777977c59811c2907000065be2809e0dc59b53000000c49b17000000c393010000003000c484090000070000e282ac04000000c59b02000000e282ac0000050000e282ac5363684772696400cb98300000c3bac59bcb99cb99536b6f646169640000003000c484090000070000e282ac05000000c2a002000000e282ac0000070000e282ac536368477269640018c498cb99cb99c498c5be00004b6174656472610000003400c484090000070000e282ac0c000000c2a402000000e282ac0000090000e282ac5363684772696400c39ae282accb99cb993ac590cb99cb996c7450726f6772616d00000000003400c484090000070000e282ac12000000c2a402000000e282ac0000090000e282ac53636847726964004a790000605400006c7450726f73746f7200000000003000c484090000070000e282ac09000000c59b02000000e282ac0000050000e282ac5363684772696400c2b6c583cb99cb99c48c640000497a70697469640000007800c484090000070000e282ac1f0000005200000001e282ac00004e0000e282ac436f6e74726f6c0044c2abcb99cb99c38d7b000052656c6174696f6e736869702027494453747564656e7461202d3e204944202853747564656e742927206265747765656e202753747564656e742720616e642027497a70697453747564656e7427000000002800c2b5010000070000e282ac20000000310000006700000002e282ac0000436f6e74726f6c00c2adc581cb99cb99137e000000003400c484090000070000e282ac0a000000c59e02000000e282ac00000c0000e282ac5363684772696400c2a8cb9bcb99cb99c38e7c0000497a70697453747564656e7400007400c484090000070000e282ac2e0000006200000001e282ac00004c0000e282ac436f6e74726f6c002bc2b5cb99cb99582b000052656c6174696f6e7368697020274944507265646d6574202d3e2049442028507265646d65742927206265747765656e2027507265646d65742720616e642027507265646d6574536d65722700002800c2b5010000070000e282ac2f000000310000006500000002e282ac0000436f6e74726f6c00e280b9c2bbcb99cb99c28834000000007800c484090000070000e282ac340000005200000001e282ac00004e0000e282ac436f6e74726f6c002bc2b5cb99cb99cb9861000052656c6174696f6e7368697020274944507265646d657461202d3e2049442028507265646d65742927206265747765656e2027507265646d65742720616e642027507265646d6574497a70697427090100002800c2b5010000070000e282ac35000000310000006700000002e282ac0000436f6e74726f6c00c2a4c2a6cb99cb995266000000003400c484090000070000e282ac1a000000c2a602000000e282ac00000a0000e282ac536368477269640006c38dcb99cb99483f00006c74546970497a706974000000007800c484090000070000e282ac3a0000005200000001e282ac00004e0000e282ac436f6e74726f6c002dc48fcb99cb99425c000052656c6174696f6e7368697020274944546970497a70697461202d3e20494420286c74546970497a7069742927206265747765656e20276c74546970497a7069742720616e642027497a70697427090100002800c2b5010000070000e282ac3b000000310000006f00000002e282ac0000436f6e74726f6c001ac3a1cb99cb993f61000000007000c484090000070000e282ac3c0000005200000001e282ac0000480000e282ac436f6e74726f6c00c2b5c490cb99cb995c75000052656c6174696f6e7368697020274944497a70697461202d3e2049442028497a7069742927206265747765656e2027497a7069742720616e642027497a70697453747564656e742700002800c2b5010000070000e282ac3d000000310000005f00000002e282ac0000436f6e74726f6c0077c486cb99cb99097a000000007000c484090000070000e282ac3e0000005200000001e282ac0000480000e282ac436f6e74726f6c00c5b0c485cb99cb99100b000052656c6174696f6e7368697020274944202d3e2049442853656d65737465722927206265747765656e20276c7453656d65737465722720616e642027507265646d6574536d65722700002800c2b5010000070000e282ac3f000000310000005700000002e282ac0000436f6e74726f6c0049c2b0cb99cb990715000000007400c484090000070000e282ac400000005200000001e282ac00004c0000e282ac436f6e74726f6c007fc5bdcb99cb99e2809905000052656c6174696f6e736869702027494453747564656e74202d3e204944202853747564656e742927206265747765656e202753747564656e742720616e642027536d657253747564656e742700002800c2b5010000070000e282ac41000000310000006500000002e282ac0000436f6e74726f6c00c4b9c290cb99cb99c3942d000000007c00c484090000070000e282ac450000006200000001e282ac0000520000e282ac436f6e74726f6c00c4905000000562000052656c6174696f6e736869702027494450726f73746f72202d3e204944202850726f73746f722927206265747765656e20276c7450726f73746f722720616e6420275a61706f736c656e50726f73746f7227000000002800c2b5010000070000e282ac46000000310000006500000002e282ac0000436f6e74726f6c00c48f5500003369000000003000c484090000070000e282ac4e000000cb9802000000e282ac0000080000e282ac5363684772696400e282ac250000c3b65400006c744e617a69766900007800c484090000070000e282ac610000005a00000001e282ac00004f0000e282ac436f6e74726f6c00c59ec594cb99cb99c2a730000052656c6174696f6e73686970202749445072656d657461202d3e2049442028507265646d65742927206265747765656e2027507265646d65742720616e64202750656461676f67507265646d6574270000002800c2b5010000070000e282ac62000000310000006500000002e282ac0000436f6e74726f6c0059c48dcb99cb99c39d3b000000007400c484090000070000e282ac6c0000005200000001e282ac00004b0000e282ac436f6e74726f6c0043150000c5a544000052656c6174696f6e736869702027464b5f54656c65666f6e736b615f5a61706f736c656e6927206265747765656e20275a61706f736c656e692720616e64202754656c65666f6e736b61270000002800c2b5010000070000e282ac6d000000310000006100000002e282ac0000436f6e74726f6c00e280b01700002154000000007c00c484090000070000e282ac6e0000005200000001e282ac0000510000e282ac436f6e74726f6c005f0800000e57000052656c6174696f6e736869702027464b5f476f766f72696c6e65207572655f5a61706f736c656e6927206265747765656e20275a61706f736c656e692720616e642027476f766f72696c6e65207572652703000000002800c2b5010000070000e282ac6f000000310000006700000002e282ac0000436f6e74726f6c00c4840a0000605f000000003800c484090000070000e282ac57000000c2ac02000000e282ac00000d0000e282ac53636847726964001cc3b3cb99cb99c2a8480000476f766f72696c6e65207572650800000000e282ac00c484090000070000e282ac700000005200000001e282ac0000550000e282ac436f6e74726f6c0023320000c58169000052656c6174696f6e736869702027464b5f5a61706f736c656e50726f73746f725f5a61706f736c656e6927206265747765656e20275a61706f736c656e692720616e6420275a61706f736c656e50726f73746f722700000000002800c2b5010000070000e282ac71000000310000006b00000002e282ac0000436f6e74726f6c69622a00003369000000003800c484090000070000e282ac44000000c2b002000000e282ac00000f0000e282ac5363684772696400c48d350000c2a46a00005a61706f736c656e50726f73746f720000006c00c484090000070000e282ac720000006200000001e282ac0000430000e282ac436f6e74726f6c007cc39acb99cb99c5bb03000052656c6174696f6e736869702027464b5f507265646d6574536d65725f536d657227206265747765656e2027536d65722720616e642027507265646d6574536d6572270000002800c2b5010000070000e282ac73000000310000005900000002e282ac0000436f6e74726f6c00c598c5b0cb99cb992d13000000003400c484090000070000e282ac10000000c2a802000000e282ac00000b0000e282ac536368477269640046c59fcb99cb9932190000507265646d6574536d65720000003400c484090000070000e282ac65000000c2a602000000e282ac00000a0000e282ac5363684772696400c2a60e00002634000054656c65666f6e736b61000000006800c484090000070000e282ac7f0000006200000001e282ac00003f0000e282ac436f6e74726f6c002acb87cb99cb99c590c49bcb99cb9952656c6174696f6e736869702027464b5f536d65725f6c7450726f6772616d27206265747765656e20276c7450726f6772616d2720616e642027536d6572270000002800c2b5010000070000e282ace282ac000000310000005500000002e282ac0000436f6e74726f6c0022c394cb99cb9924c584cb99cb9900002c00c484090000070000e282ac0d000000c5a102000000e282ac0000040000e282ac536368477269640074c591cb99cb99c5a2c3b4cb99cb99536d657200007000c484090000070000e282acc2810000005a00000001e282ac0000470000e282ac436f6e74726f6c00233200000b62000052656c6174696f6e736869702027464b5f5a61706f736c656e695f6c744e617a69766927206265747765656e20276c744e617a6976692720616e6420275a61706f736c656e69270000002800c2b5010000070000e282ace2809a000000310000005d00000002e282ac0000436f6e74726f6c00c39a2f00000768000000003000c484090000070000e282ace280a1000000cb9802000000e282ac0000080000e282ac5363684772696400c48dc5bacb99cb99c3b60900006c7453746562657200007400c484090000070000e282acc5bd0000005200000001e282ac0000490000e282ac436f6e74726f6c00c3a7c5becb99cb997020000052656c6174696f6e7368697020274944537465626572202d3e20494420286c745374656265722927206265747765656e20276c745374656265722720616e642027507265646d6574276e742700002800c2b5010000070000e282acc5b9000000310000006500000002e282ac0000436f6e74726f6c002ee28099cb99cb996830000000003000c484090000070000e282ac08000000c2a002000000e282ac0000070000e282ac5363684772696400c288e28093cb99cb99c2983a0000507265646d65740000003800c484090000070000e282ac13000000cb9b02000000e282ac0000100000e282ac536368477269640054240000c2b6cb9b00006c745469705a61706f736c656e65676100007400c484090000070000e282ace280980000005a00000001e282ac00004b0000e282ac436f6e74726f6c00c38d300000c3817c000052656c6174696f6e736869702027464b5f5a61706f736c656e4a655f5a61706f736c656e6927206265747765656e20275a61706f736c656e692720616e6420275a61706f736c656e4a65272700002800c2b5010000070000e282ace28099000000310000006100000002e282ac0000436f6e74726f6c003c2b000035e280b000000000e2809e00c484090000070000e282ace2809c0000005200000001e282ac0000590000e282ac436f6e74726f6c0061420000e280b0e2809d000052656c6174696f6e736869702027464b5f5a61706f736c656e4a655f6c745469705a61706f736c656e65676127206265747765656e20276c745469705a61706f736c656e6567612720616e6420275a61706f736c656e4a652700000000002800c2b5010000070000e282ace2809d000000310000006f00000002e282ac0000436f6e74726f6c00c2a7440000c3b7cb87000000003400c484090000070000e282acc290000000c2a602000000e282ac00000a0000e282ac536368477269640062430000c396c28300005a61706f736c656e4a65720000006c00c484090000070000e282acc2a00000005200000001e282ac0000430000e282ac436f6e74726f6c0052c2b7cb99cb9909c591cb99cb9952656c6174696f6e736869702027464b5f536d657253747564656e745f536d657227206265747765656e2027536d65722720616e642027536d657253747564656e74270000002800c2b5010000070000e282accb87000000310000005900000002e282ac0000436f6e74726f6c0071c38bcb99cb99e284a2c3b4cb99cb9900003400c484090000070000e282ac0e000000c2a802000000e282ac00000b0000e282ac5363684772696472e282acc5b9cb99cb990ac3b6cb99cb99536d657253747564656e740000007000c484090000070000e282accb980000005200000001e282ac0000450000e282ac436f6e74726f6c0077e280a1cb99cb99c5a4c49bcb99cb9952656c6174696f6e736869702027464b5f53747564656e745f6c7450726f6772616d27206265747765656e20276c7450726f6772616d2720616e64202753747564656e742700000000002800c2b5010000070000e282acc581000000310000005b00000002e282ac0000436f6e74726f6c00347ccb99cb99e280b039000000003400c484090000070000e282ac0f000000c2a602000000e282ac00000a0000e282ac5363684772696400c39cc59fcb99cb9924c3bacb99cb996c7453656d6573746572000000003000c484090000070000e282acc2ae000000cb9802000000e282ac0000080000e282ac536368477269640008c4bdcb99cb9936c5a400005469704d61696c6100003400c484090000070000e282ac67000000c2a402000000e282ac0000090000e282ac536368477269640060090000786900005a61706f736c656e6961000000006c00c484090000070000e282acc2b10000005200000001e282ac0000430000e282ac436f6e74726f6c0044c2abcb99cb9935c59a000052656c6174696f6e736869702027464b5f53747564656e745f5469704d61696c6127206265747765656e20275469704d61696c612720616e64202753747564656e74276400002800c2b5010000070000e282accb9b000000310000005900000002e282ac0000436f6e74726f6c692cc2aecb99cb99c4b9e280b9000000003000c484090000070000e282ac01000000c2a002000000e282ac0000070000e282ac536368477269640078c288cb99cb99666c000053747564656e740000007000c484090000070000e282acc2b60000005a00000001e282ac0000470000e282ac436f6e74726f6c0065c3b4cb99cb99cb9d7c000052656c6174696f6e736869702027464b5f5a61706f736c656e695f5469704d61696c6127206265747765656e20275469704d61696c612720616e6420275a61706f736c656e69272700002800c2b5010000070000e282acc2b7000000310000005d00000002e282ac0000436f6e74726f6c00c28314000069e28098000000007c00c484090000070000e282acc2bb0000005a00000001e282ac0000530000e282ac436f6e74726f6c00e28099000000c3a930000052656c6174696f6e736869702027464b5f50656461676f67507265646d65745f5a61706f736c656e6927206265747765656e20275a61706f736c656e692720616e64202750656461676f67507265646d6574271100002800c2b5010000070000e282acc4bd000000310000006900000002e282ac0000436f6e74726f6c007d2400005d30000000003800c484090000070000e282ac16000000c2ae02000000e282ac00000e0000e282ac5363684772696400c5a1c5a2cb99cb996621000050656461676f67507265646d657400000000c28800c484090000070000e282accb9d0000005200000001e282ac00005d0000e282ac436f6e74726f6c0073150000c283c298000052656c6174696f6e736869702027464b5f436c616e694c61626f7261746f72696a615f4c61626f7261746f72696a27206265747765656e20274c61626f7261746f72696a2720616e642027436c616e694c61626f7261746f72696a612703000000002800c2b5010000070000e282acc4be000000310000007300000002e282ac0000436f6e74726f6c00c2b810000013c29800000000e2809e00c484090000070000e282acc3810000005200000001e282ac0000590000e282ac436f6e74726f6c000d1e0000c3817c000052656c6174696f6e736869702027464b5f436c616e694c61626f7261746f72696a615f5a61706f736c656e6927206265747765656e20275a61706f736c656e692720616e642027436c616e694c61626f7261746f72696a612700690000002800c2b5010000070000e282acc382000000310000006f00000002e282ac0000436f6e74726f6c000f0e0000c2a0e280b0000000003c00c484090000070000e282ace280a2000000c2b402000000e282ac0000110000e282ac5363684772696400781e0000c2a0c59a0000436c616e694c61626f7261746f72696a61002e0000007000c484090000070000e282acc4820000005200000001e282ac0000470000e282ac436f6e74726f6c00cb9dc387cb99cb99c58475000052656c6174696f6e736869702027464b5f507265646d6574497a7069745f497a70697427206265747765656e2027497a7069742720616e642027507265646d6574497a706974272700002800c2b5010000070000e282acc384000000310000005d00000002e282ac0000436f6e74726f6c00c2b0c387cb99cb99c28175000000003400c484090000070000e282ac33000000c59e02000000e282ac00000c0000e282ac5363684772696400c5bdc2aecb99cb99c3a2680000507265646d6574497a70697400006c00c484090000070000e282acc4b90000006200000001e282ac0000410000e282ac436f6e74726f6c006d5c0000354e000052656c6174696f6e736869702027464b5f446f676f64656b5f446f676f64656b27206265747765656e2027446f676f64656b2720616e642027446f676f64656b2700000000002800c2b5010000070000e282acc486000000310000005700000002e282ac0000436f6e74726f6c006f6b0000c2a94d000000003000c484090000070000e282ac02000000c2a002000000e282ac0000070000e282ac5363684772696400c39638000064320000446f676f64656b0000003400c484090000070000e282ac06000000c2a802000000e282ac00000b0000e282ac536368477269640024c3bacb99cb99e2809ee284a200004c61626f7261746f72696a6500007400c484090000070000e282acc38b0000005200000001e282ac0000490000e282ac436f6e74726f6c0037c591cb99cb99c389c5a5000052656c6174696f6e736869702027464b5f4c61626f7261746f72696a5f4b61746564726127206265747765656e20274b6174656472612720616e6420274c61626f7261746f72696a271f371100002800c2b5010000070000e282acc49a000000310000005f00000002e282ac0000436f6e74726f6c00c59ec491cb99cb990fc2a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214334120800000006340000c3bc32000078563412070000001401000053006b006f006400610000005f006900640020003d00200063006f006c002e006f0062006a006500630074005f0069006400200061006e00640020006900640063002e0063006f006c0075006d006e005f006900640020003d00200063006f006c002e0063006f006c0075006d006e005f006900640020006c0065006600740020006f00750074006500720020006a006f0069006e0020007300790073002e0063006f006d00700075007400650064005f0063006f006c0075006d006e007300200063006d00630020006f006e00200063006d0063002e006f0062006a006500630074005f006900640020003d00000000000000000000000100000005000000540000002c0000002c0000002c000000340000000000000000000000c2a7290000e28094210000000000002d0100000c0000000c000000070000001c010000c3b708000053070000c2a40100000d02000077010000c39d0400001b030000c5950100001b030000c3ad030000cb9b020000000000000100000006340000c3bc320000000000000a0000000a00000002000000020000001c0100006c1b00000000000001000000c5881300004e06000000000000010000000100000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000600000053006b006f0064006100000021433412080000004b2c0000c2b81100007856341207000000140100004b00610074006500640072006100000069006e0064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000004b2c0000c2b8110000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000080000004b00610074006500640072006100000021433412080000007c2100000a1a00007856341207000000140100006c007400500072006f006700720061006d00000064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000007c2100000a1a0000000000002d0100000d0000000c000000070000001c010000c39c05000046050000c2a40100000d02000077010000c38e0400001b030000c5950100001b030000c3ad030000cb9b0200000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000a0000006c007400500072006f006700720061006d000000214334120800000000240000c2ad0f00007856341207000000140100006c007400500072006f00730074006f007200000064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c00000034000000000000000000000000240000c2ad0f0000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000a0000006c007400500072006f00730074006f00720000002143341208000000572900004b13000078563412070000001401000049007a0070006900740000002e00570069006e0064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000572900004b130000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000600000049007a00700069007400000002000b0070c2accb99cb99647d0000c2a8cb9bcb99cb99647d00000000000002000000c491c491c4910000000000000000000000000000000000010000002000000000000000c2adc581cb99cb99137e0000c5b10e00005801000064000000010000020000c5b10e000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d611a0049004400530074007500640065006e007400610020002d003e0020004900440020002800530074007500640065006e007400290021433412080000007d210000c5830c000078563412070000001401000049007a00700069007400530074007500640065006e007400000073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000007d210000c5830c0000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000006200000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000d00000049007a00700069007400530074007500640065006e007400000004000b00c382c2b6cb99cb99c2983a0000c382c2b6cb99cb99c2ae360000c39cc59fcb99cb99c2ae360000c39cc59fcb99cb99132e00000000000002000000c491c491c4910000000000000000000000000000000000010000002f00000000000000e280b9c2bbcb99cb99c288340000c3810e00005801000040000000010000020000c3810e000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d6119004900440050007200650064006d006500740020002d003e002000490044002000280050007200650064006d0065007400290002000b00c382c2b6cb99cb9959640000c382c2b6cb99cb99c3a26800000000000002000000c491c491c4910000000000000000000000000000000000010000003500000000000000c2a4c2a6cb99cb99526600006f0f0000580100003e0000000100000200006f0f000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d611a004900440050007200650064006d0065007400610020002d003e002000490044002000280050007200650064006d006500740029002143341208000000c2b1240000c2b11f00007856341207000000140100006c00740054006900700049007a007000690074000000c38207000000000000000000000000000000000000000000000000006071400000000000407040000000000000c4913f00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c4913f000000000000000044c2b647540000000000000000c3a4c2b847546425485458c59bc3820758c59bc38207020000000200000000000000000000000000000000000000020000000000000000000000000000000000e2809a430000e2809ac4820000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c2b1240000c2b11f0000000000002d0100000d0000000c000000070000001c010000060900006207000049020000c39f020000c5a3010000c49b04000056040000e2809d0200005604000073050000c5940300000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000100000000000000391300003403000000000000000000000000000002000000020000001c010000060900000000000000000000c5833100000923000000000000000000000d00000004000000040000001c01000006090000c59e0a0000c29006000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b0000006c00740054006900700049007a00700069007400000002000b00c384c491cb99cb99c5af5e0000c384c491cb99cb99c48c6400000000000002000000c491c491c4910000000000000000000000000000000000010000003b000000000000001ac3a1cb99cb993f610000c5b10e00005801000033000000010000020000c5b10e000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d611e004900440054006900700049007a00700069007400610020002d003e00200049004400200028006c00740054006900700049007a00700069007400290002000b004cc587cb99cb99137800004cc587cb99cb99c38e7c00000000000002000000c491c491c4910000000000000000000000000000000000010000003d0000000000000077c486cb99cb99097a0000260b0000580100003a000000010000020000260b000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d6116004900440049007a00700069007400610020002d003e002000490044002000280049007a00700069007400290002000b0072c2bbcb99cb99c3870d000072c2bbcb99cb99321900000000000002000000c491c491c4910000000000000000000000000000000000010000003f0000000000000049c2b0cb99cb99071500007a0a000058010000480000000100000200007a0a000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d6112004900440020002d003e002000490044002800530065006d0065007300740065007200290002000b0016c290cb99cb99666c000016c290cb99cb994d0800000000000002000000c491c491c4910000000000000000000000000000000000010000004100000000000000c4b9c290cb99cb99c3942d00004e0e0000580100003e0000000100000200004e0e000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d61190049004400530074007500640065006e00740020002d003e0020004900440020002800530074007500640065006e007400290004000b004a790000c59b630000c581650000c59b630000c5816500003a6b0000c3bc5100003a6b00000000000002000000c491c491c4910000000000000000000000000000000000010000004600000000000000c48f55000033690000cb870d00005801000045000000010000020000cb870d000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d61190049004400500072006f00730074006f00720020002d003e0020004900440020002800500072006f00730074006f00720029002143341208000000c2b1190000c49a0f00007856341207000000140100006c0074004e0061007a006900760069000000e284a23ec397c396563fc39cc5b05b3fc499c3a9693f0000e282ac3f0000e282ac3fc397c396563fc39cc5b05b3fc499c3a9693f0000e282ac3f0000003f000000000000000000000000c2adc2ac2c3e3333333f000000000000000000000000c3a1c595603d6666663f000000000000000000000000c381c594403c0000e282ac3f00000000000000000000000000000000c5a0000000c5a2000000030000000000000006000000c491cb99cb99cb9900000000c3ba000000c5a3000000030000000000000006000000c491cb99cb99cb9900000000c48d000000c5a3000000010000000300000005000000c48dcb99cb99cb9900000000c48d000000c5a300000002000000030000000500000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c2b1190000c49a0f0000000000002d0100000d0000000c000000070000001c01000064050000c39c05000049020000c39f020000c5a30100006009000056040000e2809d0200005604000073050000c5940300000000000001000000060d00004f03000000000000000000000000000002000000020000001c010000640500000000000001000000060d00004f03000000000000000000000000000002000000020000001c010000640500000100000000000000060d00004f03000000000000000000000000000002000000020000001c010000640500000000000000000000e280a01f00001224000000000000000000000d00000004000000040000001c0100006405000063060000c3ad03000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000006c0074004e0061007a00690076006900000003000b00c396c381cb99cb992e3b0000e280930000002e3b0000e28093000000623300000000000002000000c491c491c491000000000000000000000000000000000001000000620000000000000059c48dcb99cb99c39d3b0000c3810e00005801000036000000010000020000c3810e000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d611900490044005000720065006d0065007400610020002d003e002000490044002000280050007200650064006d0065007400290002000b00c39a16000078690000c39a160000584700000000000002000000c491c491c4910000000000000000000000000000000000010000006d00000000000000e280b017000021540000cb870d0000580100003d000000010000020000cb870d000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d61170046004b005f00540065006c00650066006f006e0073006b0061005f005a00610070006f0073006c0065006e00690002000b00c3b609000078690000c3b6090000c3895900000000000002000000c491c491c4910000000000000000000000000000000000010000006f00000000000000c4840a0000605f0000c5b10e0000580100003d000000010000020000c5b10e000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d611a0046004b005f0047006f0076006f00720069006c006e00650020007500720065005f005a00610070006f0073006c0065006e0069002143341208000000c2ad1d00002111000078563412070000001401000047006f0076006f00720069006c006e006500200075007200650000000000000000001440000000000000244000000000000014400000000000407840000000000000c4913f0000000000000000000000000100000001000000000000000000000000000000000000000000c4913f0000000000000000000000000000000000000000000000000000000000000000000000000000000044c2b6c39f640000000000000000c3a4c2b8c39f646425c5956478e28093111378e2809311130200000002000000000000000000000000000000000000000200000000002041000020410000c2a04000002041000020410000c2a04000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c2ad1d000021110000000000002d0100000d0000000c000000070000001c010000640500007404000049020000c39f020000c5a3010000c3ae02000056040000e2809d0200005604000073050000c5940300000000000001000000060d00004f03000000000000000000000000000002000000020000001c010000640500000000000001000000060d00004f03000000000000000000000000000002000000020000001c010000640500000100000000000000060d00004f03000000000000000000000000000002000000020000001c010000640500000000000000000000e280a01f00001224000000000000000000000d00000004000000040000001c0100006405000063060000c3ad03000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e00000047006f0076006f00720069006c006e0065002000750072006500000002000b004f3300003a6b0000c48d3500003a6b00000000000002000000c491c491c4910000000000000000000000000000000000010000007100000000000000622a000033690000c5b91000005801000040000000010000020000c5b910000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d611c0046004b005f005a00610070006f0073006c0065006e00500072006f00730074006f0072005f005a00610070006f0073006c0065006e0069002143341208000000141c0000c3871200007856341207000000140100005a00610070006f0073006c0065006e00500072006f00730074006f00720000000000e282ac3f0000e282ac3fc490c48e4f3fc397c396563fc487c4ba653f0000e282ac3f00407040000000000000c4913f00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c4913f000000000000000044c2b6c39f640000000000000000c3a4c2b8c39f646425c5956438c2a7201338c2a72013020000000200000000000000000000000000000000000000020000000000000000000000000000000000e2809a430000e2809ac4820000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000141c0000c387120000000000002d0100000d0000000c000000070000001c01000035070000c3ab05000049020000c39f020000c5a3010000c3ad03000056040000e2809d0200005604000073050000c5940300000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000100000000000000201000003403000000000000000000000000000002000000020000001c010000350700000000000000000000c4852800007323000000000000000000000d00000004000000040000001c01000035070000c5bd0800004605000078563412040000006800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000100000005a00610070006f0073006c0065006e00500072006f00730074006f007200000004000b0074c591cb99cb994605000024c3a9cb99cb994605000024c3a9cb99cb99c48c190000c2a8c5b0cb99cb99c48c1900000000000002000000c491c491c4910000000000000000000000000000000000010000007300000000000000c598c5b0cb99cb992d130000c5a50c0000580100003d000000010000020000c5a50c000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d61130046004b005f0050007200650064006d006500740053006d00650072005f0053006d0065007200214334120800000062210000c3a114000078563412070000001401000050007200650064006d006500740053006d00650072000000770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c00000034000000000000000000000062210000c3a1140000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c00000050007200650064006d006500740053006d0065007200000021433412080000005520000032130000785634120700000014010000540065006c00650066006f006e0073006b0061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000005520000032130000000000002d0100000d0000000c000000070000001c010000c39c050000c2b004000049020000c39f020000c5a3010000c38e04000056040000e2809d0200005604000073050000c5940300000000000001000000e2809c0b00004f03000000000000000000000000000002000000020000001c010000c2830400000000000001000000e2809c0b00004f03000000000000000000000000000002000000020000001c010000c2830400000100000000000000e2809c0b00004f03000000000000000000000000000002000000020000001c010000c28304000000000000000000002f1b0000e2809324000000000000000000000d00000004000000040000001c010000c283040000550500004803000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b000000540065006c00650066006f006e0073006b006100000004000b0056cb98cb99cb996cc3aecb99cb9967c39fcb99cb996cc3aecb99cb9967c39fcb99cb9974c591cb99cb9974c591cb99cb9974c591cb99cb990000000002000000c491c491c491000000000000000000000000000000000001000000e282ac0000000000000022c394cb99cb9924c584cb99cb99e280930a00005801000046000000010000020000e280930a000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d61110046004b005f0053006d00650072005f006c007400500072006f006700720061006d0021433412080000006b2200005d11000078563412070000001401000053006d006500720000006d002e00570069006e0064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000006b2200005d110000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005200000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000500000053006d0065007200000003000b00c2983a0000c382640000c2983a00000e6a00004f3300000e6a00000000000002000000c491c491c491000000000000000000000000000000000001000000e2809a00000000000000c39a2f000007680000c5a10b0000580100003c000000010000020000c5a10b000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d61150046004b005f005a00610070006f0073006c0065006e0069005f006c0074004e0061007a006900760069002143341208000000e2809d150000311900007856341207000000140100006c0074005300740065006200650072000000c49010e2809ee280a1782100000000000000000000244000000000004070400000000000c59470400000000000001440000000000000c4913f00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c4913f000000000000000044c2b6c2b86e0000000000000000c3a4c2b8c2b86e6425c4856ec2a0e280a17821c2a0e280a1782102000000020000000000000000000000000000000000000002000000000020410000e2809a430000204100e282ace2809e430000c2a0400000e2809a4300000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000e2809d15000031190000000000002d0100000d0000000c000000070000001c01000035070000c3ab050000c5a301000076020000c582010000c3ad030000c2b10300003a020000c2b1030000c2b0040000390300000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000100000000000000201000003403000000000000000000000000000002000000020000001c010000350700000000000000000000c4852800007323000000000000000000000d00000004000000040000001c01000035070000c5bd0800004605000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000006c007400530074006500620065007200000002000b007ec2a0cb99cb99272300007ec2a0cb99cb99c2983a00000000000002000000c491c491c491000000000000000000000000000000000001000000c5b9000000000000002ee28099cb99cb9968300000cb870d0000580100003c000000010000020000cb870d000058010000020000000000050000e282ac080000e282ac01000000150001000000c2900144420100065461686f6d6119004900440053007400650062006500720020002d003e00200049004400200028006c007400530074006500620065007200290021433412080000004e2b0000c38129000078563412070000001401000050007200650064006d0065007400000069006e0064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000004e2b0000c381290000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000800000050007200650064006d006500740000002143341208000000c5832000007d1e00007856341207000000140100006c0074005400690070005a00610070006f0073006c0065006e00650067006100000072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c5832000007d1e0000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000006a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000110000006c0074005400690070005a00610070006f0073006c0065006e00650067006100000003000b0064320000787f000064320000e280a0c288000062430000e280a0c28800000000000002000000c491c491c491000000000000000000000000000000000001000000e28099000000000000003c2b000035e280b00000c39a0d0000580100003e000000010000020000c39a0d000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61170046004b005f005a00610070006f0073006c0065006e004a0065005f005a00610070006f0073006c0065006e00690002000b00c599430000c2b6cb9b0000c59943000044e2809400000000000002000000c491c491c491000000000000000000000000000000000001000000e2809d00000000000000c2a7440000c3b7cb870000c3a9110000580100003b000000010000020000c3a911000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d611e0046004b005f005a00610070006f0073006c0065006e004a0065005f006c0074005400690070005a00610070006f0073006c0065006e006500670061002143341208000000c2982400006e1300007856341207000000140100005a00610070006f0073006c0065006e004a0065000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c2982400006e130000000000002d0100000d0000000c000000070000001c01000036060000c2b004000049020000c39f020000c5a3010000c38e04000056040000e2809d0200005604000073050000c5940300000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000100000000000000201000003403000000000000000000000000000002000000020000001c010000350700000000000000000000c4852800007323000000000000000000000d00000004000000040000001c01000035070000c5bd0800004605000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b0000005a00610070006f0073006c0065006e004a006500000002000b0074c591cb99cb99c2a0c3b6cb99cb997ec2b8cb99cb99c2a0c3b6cb99cb990000000002000000c491c491c491000000000000000000000000000000000001000000cb870000000000000071c38bcb99cb99e284a2c3b4cb99cb99630c0000580100003d000000010000020000630c000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61130046004b005f0053006d0065007200530074007500640065006e0074005f0053006d00650072002143341208000000c5a32800004312000078563412070000001401000053006d0065007200530074007500640065006e0074000000770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c5a328000043120000000000002d0100000d0000000c000000070000001c010000c49808000053070000c5a301000076020000c582010000c39d040000c2b10300003a020000c2b1030000c2b0040000390300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c00000053006d0065007200530074007500640065006e007400000002000b000ee280b0cb99cb9944c48fcb99cb990ee280b0cb99cb99666c00000000000002000000c491c491c491000000000000000000000000000000000001000000c58100000000000000347ccb99cb99e280b03900002b0c0000580100003c0000000100000200002b0c000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61140046004b005f00530074007500640065006e0074005f006c007400500072006f006700720061006d00214334120800000074220000c5811300007856341207000000140100006c007400530065006d006500730074006500720000006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c00000034000000000000000000000074220000c581130000000000002d0100000d0000000c000000070000001c010000c3b70800005307000049020000c39f020000c5a3010000c39d04000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b0000006c007400530065006d006500730074006500720000002143341208000000e280b03900000c0f00007856341207000000140100005400690070004d00610069006c00610000006e0064006f00770073002e0046006f0072006d0073002c002000560065007200730069006f006e003d0034002e0030002e0030002e0030002c002000430075006c0074007500720065003d006e00650075007400720061006c002c0020005000750062006c00690063004b006500790054006f006b0065006e003d00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000e280b03900000c0f0000000000002d0100000d0000000c000000070000001c01000046050000c59a0a000049020000c39f020000c5a30100006504000056040000e2809d0200005604000073050000c5940300000000000001000000c5910a00003d04000000000000000000000000000002000000020000001c010000e2809c0300000000000001000000c5910a00003d04000000000000000000000000000002000000020000001c010000e2809c0300000100000000000000c5910a00003d04000000000000000000000000000002000000020000001c010000e2809c0300000000000000000000761700003e26000000000000000000000d00000004000000040000001c010000e2809c03000038040000e2809d02000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000005400690070004d00610069006c00610000002143341208000000c48f290000001600007856341207000000140100005a00610070006f0073006c0065006e006900000024727e13000000000000000000607140000000000000244000000000000014400000000000406f40000000000000c4913f0000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c4913f0000000000000000000000000000000044c2b6c39f640000000000000000c3a4c2b8c39f646425c5956440727e1340727e13020000000200000000000000000000000000000000000000020000000000e280b9430000204100e282acc5a443000020410000e280b9430000704100000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c48f29000000160000000000002d0100000d0000000c000000070000001c01000072060000c2a005000049020000c39f020000c5a30100004605000056040000e2809d0200005604000073050000c5940300000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000100000000000000201000003403000000000000000000000000000002000000020000001c010000350700000000000000000000c4852800007323000000000000000000000d00000004000000040000001c01000035070000c5bd0800004605000078563412040000005c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000a0000005a00610070006f0073006c0065006e006900000002000b0008c4bdcb99cb99c49ac5a4000070c2accb99cb99c49ac5a400000000000002000000c491c491c491000000000000000000000000000000000001000000cb9b000000000000002cc2aecb99cb99c4b9e280b90000440b0000580100003c000000010000020000440b000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61130046004b005f00530074007500640065006e0074005f005400690070004d00610069006c0061002143341208000000c59923000046270000785634120700000014010000530074007500640065006e0074000000000000000055c59ecb99cb99c590e282ac2b00000000000055c59ecb99c590e282ac2b0000000000000000000000000000002be282acc59ec590c590cb99c590e282ac2b00000000000055c59ecb99c590e282ac2b000000000000000000000000000055c59ec590e282ace282acc59ecb99c590e282ac2b00000000000055c59ecb99c590e282ac2b0000000000000000000000002be282acc590c59e550055c59ecb99c590e282ac2b00000000000055c59ecb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99c59e55000055c59ecb99c59e55000055c59ecb99c590e282ac2b00000000000055c59ecb99c590e282ac2b0000000000000000002be282acc590c590e282ac2b00000055c59ecb99c590e282ac2b00000000000055c59ecb99c590e282ac2b00000000000000000055c59ecb99cb99cb99cb99cb99cb99cb99000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c59923000046270000000000002d0100000b0000000c000000070000001c01000016080000c3ad03000049020000c39f020000c5a30100001a04000056040000e2809d0200005604000073050000c5940300000000000001000000e280a63c0000c59e1e000000000000090000000900000002000000020000001c010000672000000000000001000000c5881300004e06000000000000010000000100000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f00000008000000530074007500640065006e007400000003000b00e28098c591cb99cb99c59fc2900000c39a160000c59fc2900000c39a160000787f00000000000002000000c491c491c491000000000000000000000000000000000001000000c2b700000000000000c28314000069e2809800000d0c0000580100003c0000000100000200000d0c000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61150046004b005f005a00610070006f0073006c0065006e0069005f005400690070004d00610069006c00610003000b0054240000786900005424000064320000c4be010000643200000000000002000000c491c491c491000000000000000000000000000000000001000000c4bd000000000000007d2400005d30000002110000580100003e0000000100000200000211000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d611b0046004b005f00500065006400610067006f00670050007200650064006d00650074005f005a00610070006f0073006c0065006e006900214334120800000024230000c3bc110000785634120700000014010000500065006400610067006f00670050007200650064006d0065007400000000006ce284a2c59f45c5b1c4912c49c5bbc48ec38e1d4be2809cc38bc5a104000000020000000000106600000001000020000000c382c2b11f6cc5b058c491c48541c3ab5a477f246cc3b3404947c2b1c2ac156d7ec2a9c3961014c3b71dc584c2b8000000000ee282ac000000020000200000004e25c3ba31090f1955c48cc3a9c2ab48e280987bcb9d3c4334c2832713c283c387c394620bc5994fc5af5b78c58460000000c482e280a0c39c1607c394e28099e2809843c4ba416fc2882358702dc5ba0b23c499542cc2b1c2a42666c39d1b591bcb9dc4864308e280a6c490c3813cc2b0c58803c3a92b5b734dc590c2a90fc49ae28093055c320fc5ae61cb87c39ac48521c482c38949c384e280994d036d584bc59b2fc39fc59009e28099375ac5a47f4ec3ba000000000000000000000000000005000000540000002c0000002c0000002c00000034000000000000000000000024230000c3bc110000000000002d0100000d0000000c000000070000001c010000720600000a05000049020000c39f020000c5a30100004605000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f000000500065006400610067006f00670050007200650064006d0065007400000002000b00c5ba1600001ac5a10000781e00001ac5a100000000000002000000c491c491c491000000000000000000000000000000000001000000c4be00000000000000c2b810000013c2980000c5bb110000580100003c000000010000020000c5bb11000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61200046004b005f0043006c0061006e0069004c00610062006f007200610074006f00720069006a0061005f004c00610062006f007200610074006f00720069006a0002000b00c2a41f0000787f0000c2a41f0000c2a0c59a00000000000002000000c491c491c491000000000000000000000000000000000001000000c382000000000000000f0e0000c2a0e280b00000c4871000005801000056000000010000020000c48710000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d611e0046004b005f0043006c0061006e0069004c00610062006f007200610074006f00720069006a0061005f005a00610070006f0073006c0065006e00690021433412080000001d1c00000513000078563412070000001401000043006c0061006e0069004c00610062006f007200610074006f00720069006a00610000006f00720069006a006100000000000000c2a9c2a8c2a83e0000003f000000000000000000000000c2adc2ac2c3e3333333f000000000000000000000000c3a1c595603d6666663f000000000000000000000000c381c594403c0000e282ac3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000001d1c000005130000000000002d0100000d0000000c000000070000001c01000035070000c3ab05000049020000c39f020000c5a3010000c3ad03000056040000e2809d0200005604000073050000c5940300000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000000000001000000201000003403000000000000000000000000000002000000020000001c010000350700000100000000000000201000003403000000000000000000000000000002000000020000001c010000350700000000000000000000c4852800007323000000000000000000000d00000004000000040000001c01000035070000c5bd0800004605000078563412040000006c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000001200000043006c0061006e0069004c00610062006f007200610074006f00720069006a006100000002000b00c2b6c583cb99cb99c288770000c3a9c48ccb99cb99c2887700000000000002000000c491c491c491000000000000000000000000000000000001000000c38400000000000000c2b0c387cb99cb99c281750000c5840b0000580100003d000000010000020000c5840b000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61150046004b005f0050007200650064006d006500740049007a007000690074005f0049007a0070006900740021433412080000005b1a0000e282ac0f000078563412070000001401000050007200650064006d006500740049007a0070006900740000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000005b1a0000e282ac0f0000000000002d0100000d0000000c000000070000001c010000640500007404000049020000c39f020000c5a3010000c3ae02000056040000e2809d0200005604000073050000c5940300000000000001000000060d00004f03000000000000000000000000000002000000020000001c010000640500000000000001000000060d00004f03000000000000000000000000000002000000020000001c010000640500000100000000000000060d00004f03000000000000000000000000000002000000020000001c010000640500000000000000000000e280a01f00001224000000000000000000000d00000004000000040000001c0100006405000063060000c3ad03000078563412040000006200000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000d00000050007200650064006d006500740049007a00700069007400000004000b004a790000c3b6540000726b0000c3b6540000726b0000c2b04f0000e284a25d0000c2b04f00000000000002000000c491c491c491000000000000000000000000000000000001000000c486000000000000006f6b0000c2a94d00002b0c0000580100003c0000000100000200002b0c000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61120046004b005f0044006f0067006f00640065006b005f0044006f0067006f00640065006b002143341208000000c482240000c5991d000078563412070000001401000044006f0067006f00640065006b000000080000001038c2b40a000000001038c2b40a0835c3930a0500000000000000030000000000000000000000000100000001000000000000c29870e280ba70c490e280a6c48470c2b8c49bc5a2707000000018000000e2809305000060000000300000003e000000000000000000c5953f000000000000c5953f0000000000003540000000000000354000000000e28094050000300000003e000000000000000000c4913f000000000000c4913f0000000000003440000000000000344015000000000000001000000022000000e280a2050000e280930500001000000007000000c298050000270000001c0000001b000000c2980500000000000000000000000000000000000005000000540000002c0000002c0000002c000000340000000000000000000000c482240000c5991d0000000000002d010000080000000c000000070000001c010000720600000906000049020000c39f020000c5a30100004605000056040000e2809d0200005604000073050000c5940300000000000001000000c48e1500005c14000000000000060000000600000002000000020000001c010000c59a0a00000000000001000000c5881300004e06000000000000010000000100000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000800000044006f0067006f00640065006b00000021433412080000007b1c00001d1800007856341207000000140100004c00610062006f007200610074006f00720069006a0000004fc382e28094c3ab010000006ce284a2c59f45c5b1c4912c49c5bbc48ec38e1d4be2809cc38bc5a104000000020000000000106600000001000020000000c382c2b11f6cc5b058c491c48541c3ab5a477f246cc3b3404947c2b1c2ac156d7ec2a9c3961014c3b71dc584c2b8000000000ee282ac000000020000200000004e25c3ba31090f1955c48cc3a9c2ab48e280987bcb9d3c4334c2832713c283c387c394620bc5994fc5af5b78c58460000000c482e280a0c39c1607c394e28099e2809843c4ba416fc2882358702dc5ba0b23c499542cc2b1c2a42666c39d1b591bcb9dc4864308e280a6c490c3813cc2b0c58803c3a92b5b734dc590c2a90fc49ae28093055c320fc5ae61cb87c39ac48521c482c38949c384e280994d036d584bc59b2fc39fc59009e28099375ac5a47f4ec3ba000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000007b1c00001d180000000000002d0100000d0000000c000000070000001c010000c5b10400005604000049020000c39f020000c5a3010000c5a203000056040000e2809d0200005604000073050000c5940300000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000000000001000000c5881300000804000000000000000000000000000002000000020000001c010000c3b70800000100000000000000c5881300000804000000000000000000000000000002000000020000001c010000c3b7080000000000000000000055320000c39d23000000000000000000000d00000004000000040000001c010000c3b7080000e280ba0a0000c28106000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c0000004c00610062006f007200610074006f00720069006a00000002000b0063c3b6cb99cb9960c5ba000024c3bacb99cb9960c5ba00000000000002000000c491c491c491000000000000000000000000000000000001000000c49a00000000000000c59ec491cb99cb990fc2a00000c3970c0000580100003f000000010000020000c3970c000058010000020000000000cb99cb99cb9900080000e282ac01000000150001000000c2900144420100065461686f6d61160046004b005f004c00610062006f007200610074006f00720069006a005f004b00610074006500640072006100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000c5a3cb99cb99cb99c5a3cb99cb99cb990400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000c5a3cb99cb99cb99c5a3cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb990100c5a3cb99030a0000cb99cb99cb99cb9900000000000000000000000000000000170000004d6963726f736f66742044445320466f726d20322e300010000000456d626564646564204f626a6563740000000000c3b439cb9b71000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000c0000000b0000004e61c4bd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000c5b0c487c2b0c3a91cc281c49011c2ad5100c2a0c3890f573900000200c4904a6ae280b055c499c58701020200001048450000000000000000000000000000000000c5880100004400610074006100200053006f0075007200630065003d00380033002e003200310032002e003100320036002e003100370032005c00530051004c0045005800500052004500530053003b0049006e0069007400690061006c00200043006100740061006c006f0067003d006900460045003b005000650072007300690073007400200053006500630075007200690074007900200049006e0066006f003d0054007200750065003b0055007300650072002000490044003d00730061003b004d0075006c007400690070006c00650041006300740069007600650052006500730075006c00740053006500740073003d00460061006c00730065003b0043006f006e006e0065000300440064007300530074007200650061006d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000cb99cb99cb99cb9900000000000000000000000000000000000000000000000000000000000000000000000040000000c5884800000000000053006300680065006d00610020005500440056002000440065006600610075006c0074000000000000000000000000000000000000000000000000000000000026000200cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002d0053004300480045004d0041002d0043004f004e00540045004e0054005300000000000000000000000000000000000000000000002c0002010500000007000000cb99cb99cb99cb9900000000000000000000000000000000000000000000000000000000000000000000000003000000060700000000000053006300680065006d00610020005500440056002000440065006600610075006c007400200050006f007300740020005600360000000000000000000000000036000200cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb99cb990000000000000000000000000000000000000000000000000000000000000000000000002000000012000000000000000c0000004c110000c4833000000100260000007300630068005f006c006100620065006c0073005f00760069007300690062006c0065000000010000000b0000001e000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003000370030002c0031002c0031003000300035002c0035002c0031003000350030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0038003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000020000000200000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003600350030002c0031002c0031003500340035002c0035002c0031003300350030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003700300030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000040000000400000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0037003000320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000050000000500000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000060000000600000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003800000034002c0030002c003200380034002c0030002c0031003200370035002c0031002c0031003100310030002c0035002c003900390030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000080000000800000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000090000000900000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c00310036003600350000000a0000000a00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c00310036003600350000000c0000000c00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003500300030002c0031002c0031003300350030002c0035002c0031003200330030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c00310036003600350000000d0000000d00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c00310036003600350000000e0000000e00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200350030002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c00310036003600350000000f0000000f00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000100000001000000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000120000001200000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000130000001300000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003200390035002c0031002c0031003800370035002c0035002c0031003200340035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c0031003600360035000000160000001600000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003600350030002c0031002c0031003200390030002c0035002c0031003300350030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003200390035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003200390035002c00310032002c0032003700310035002c00310031002c00310036003600350000001a0000001a00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003300310030002c0031002c0031003800390030002c0035002c0031003200360030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003300310030002c00310032002c0032003700330030002c00310031002c00310036003800300000001f0000001f000000000000004600000001c394c3a47101000000640062006f00000049004400530074007500640065006e007400610020002d003e0020004900440020002800530074007500640065006e007400290000000000000000000000c384020000000020000000200000001f0000000800000001214e1158214e110000000000000000c2ad0700000000002e0000002e00000000000000440000000100000001000000640062006f0000004900440050007200650064006d006500740020002d003e002000490044002000280050007200650064006d0065007400290000000000000000000000c38402000000002f0000002f0000002e0000000800000001274e1118274e110000000000000000c2ad070000000000330000003300000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003800000034002c0030002c003200380034002c0030002c0031003300380030002c0031002c0031003100340030002c0035002c003700350030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003300380030002c00310032002c0031003600330035002c00310031002c0031003000300035000000340000003400000000000000460000000100270001000000640062006f0000004900440050007200650064006d0065007400610020002d003e002000490044002000280050007200650064006d0065007400290000000000000000000000c38402000000003500000035000000340000000800000001274e11c598274e110000000000000000c2ad0700000000003a0000003a000000000000004e000000010fc5ae1701000000640062006f0000004900440054006900700049007a00700069007400610020002d003e00200049004400200028006c00740054006900700049007a00700069007400290000000000000000000000c38402000000003b0000003b0000003a0000000800000001274e11c298274e110000000000000000c2ad0700000000003c0000003c000000000000003e000000010fc5ae1701000000640062006f0000004900440049007a00700069007400610020002d003e002000490044002000280049007a00700069007400290000000000000000000000c38402000000003d0000003d0000003c0000000800000001094e1158094e110000000000000000c2ad0700000000003e0000003e00000000000000360000000100000001000000640062006f0000004900440020002d003e002000490044002800530065006d0065007300740065007200290000000000000000000000c38402000000003f0000003f0000003e0000000800000001284e11c598284e110000000000000000c2ad0700000000004000000040000000000000004400000001c394c3a47101000000640062006f00000049004400530074007500640065006e00740020002d003e0020004900440020002800530074007500640065006e007400290000000000000000000000c38402000000004100000041000000400000000800000001284e1158284e110000000000000000c2ad070000000000440000004400000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003800340035002c0031002c0031003500310035002c0035002c0031003000300035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003800340035002c00310032002c0032003100390030002c00310031002c0031003300350030000000450000004500000000000000440000000100010001000000640062006f00000049004400500072006f00730074006f00720020002d003e0020004900440020002800500072006f00730074006f007200290000000000000000000000c38402000000004600000046000000450000000800000001274e1158274e110000000000000000c2ad0700000000004e0000004e00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003300380030002c0031002c0031003500300030002c0035002c0032003400300030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003300380030002c00310032002c0031003600330035002c00310031002c0031003000300035000000570000005700000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003800000034002c0030002c003200380034002c0030002c0031003300380030002c0031002c0031003100340030002c0035002c003700350030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003300380030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003300380030002c00310032002c0031003600330035002c00310031002c00310030003000350000006100000061000000000000004400000001c394c3a47101000000640062006f000000490044005000720065006d0065007400610020002d003e002000490044002000280050007200650064006d0065007400290000000000000000000000c38402000000006200000062000000610000000800000001224e11c298224e110000000000000000c2ad070000000000650000006500000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003500300030002c0031002c0031003200300030002c0035002c0031003200330030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003100350035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003100350035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003100350035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003c00000034002c0030002c003200380034002c0030002c0031003100350035002c00310032002c0031003300360035002c00310031002c003800340030000000670000006700000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003600350030002c0031002c0031003400340030002c0035002c0031003300350030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003800340035002c00310032002c0032003100390030002c00310031002c00310033003500300000006c0000006c0000000000000040000000010fc5ae1701000000640062006f00000046004b005f00540065006c00650066006f006e0073006b0061005f005a00610070006f0073006c0065006e00690000000000000000000000c38402000000006d0000006d0000006c0000000800000001224e1118224e110000000000000000c2ad0700000000006e0000006e00000000000000460000000100000001000000640062006f00000046004b005f0047006f0076006f00720069006c006e00650020007500720065005f005a00610070006f0073006c0065006e00690000000000000000000000c38402000000006f0000006f0000006e0000000800000001204e1158204e110000000000000000c2ad0700000000007000000070000000000000004a0000000100350001000000640062006f00000046004b005f005a00610070006f0073006c0065006e00500072006f00730074006f0072005f005a00610070006f0073006c0065006e00690000000000000000000000c38402000000007100000071000000700000000800000001124e11c598124e110000000000000000c2ad07000000000072000000720000000000000038000000013e541101000000640062006f00000046004b005f0050007200650064006d006500740053006d00650072005f0053006d006500720000000000000000000000c384020000000073000000730000007200000008000000011c4e11581c4e110000000000000000c2ad0700000000007f0000007f000000000000003400000001c2836c1101000000640062006f00000046004b005f0053006d00650072005f006c007400500072006f006700720061006d0000000000000000000000c3840200000000e282ac000000e282ac0000007f00000008000000011b4e11c2981b4e110000000000000000c2ad070000000000c281000000c281000000000000003c00000001592d1101000000640062006f00000046004b005f005a00610070006f0073006c0065006e0069005f006c0074004e0061007a0069007600690000000000000000000000c3840200000000e2809a000000e2809a000000c28100000008000000011b4e11581b4e110000000000000000c2ad070000000000e280a1000000e280a100000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003800340035002c0031002c0031003500310035002c0035002c0031003000300035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003800340035002c00310032002c0032003100390030002c00310031002c0031003300350030000000c5bd000000c5bd000000000000004400000001c394c3a47101000000640062006f0000004900440053007400650062006500720020002d003e00200049004400200028006c007400530074006500620065007200290000000000000000000000c3840200000000c5b9000000c5b9000000c5bd0000000800000001204e1118204e110000000000000000c2ad070000000000c290000000c29000000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003500390030002c0031002c0031003200300030002c0035002c0031003200330030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003800340035002c00310032002c0032003100390030002c00310031002c0031003300350030000000e28098000000e280980000000000000040000000010fc5ae1701000000640062006f00000046004b005f005a00610070006f0073006c0065006e004a0065005f005a00610070006f0073006c0065006e00690000000000000000000000c3840200000000e28099000000e28099000000e2809800000008000000011b4e11181b4e110000000000000000c2ad070000000000e2809c000000e2809c000000000000004e000000010fc5ae1701000000640062006f00000046004b005f005a00610070006f0073006c0065006e004a0065005f006c0074005400690070005a00610070006f0073006c0065006e0065006700610000000000000000000000c3840200000000e2809d000000e2809d000000e2809c00000008000000011f4e11c5981f4e110000000000000000c2ad070000000000e280a2000000e280a200000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003800340035002c0031002c0031003500310035002c0035002c0031003000300035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0031003800340035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0031003800340035002c00310032002c0032003100390030002c00310031002c0031003300350030000000c2a0000000c2a000000000000000380000000100630001000000640062006f00000046004b005f0053006d0065007200530074007500640065006e0074005f0053006d006500720000000000000000000000c3840200000000cb87000000cb87000000c2a000000008000000011d4e11c5981d4e110000000000000000c2ad070000000000cb98000000cb98000000000000003a000000010fc5ae1701000000640062006f00000046004b005f00530074007500640065006e0074005f006c007400500072006f006700720061006d0000000000000000000000c3840200000000c581000000c581000000cb9800000008000000011d4e11581d4e110000000000000000c2ad070000000000c2ae000000c2ae00000000000000000000000000000000000000c4900200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0031003300350030002c0031002c0032003700300030002c0035002c0031003100320035000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001c00000032002c0030002c003200380034002c0030002c003900310035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001c00000032002c0030002c003200380034002c0030002c003900310035000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001c00000032002c0030002c003200380034002c0030002c003900310035000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003a00000034002c0030002c003200380034002c0030002c003900310035002c00310032002c0031003000380030002c00310031002c003600360030000000c2b1000000c2b1000000000000003800000001c598c38b1701000000640062006f00000046004b005f00530074007500640065006e0074005f005400690070004d00610069006c00610000000000000000000000c3840200000000cb9b000000cb9b000000c2b10000000800000001204e11c598204e110000000000000000c2ad070000000000c2b6000000c2b6000000000000003c00000001592d1101000000640062006f00000046004b005f005a00610070006f0073006c0065006e0069005f005400690070004d00610069006c00610000000000000000000000c3840200000000c2b7000000c2b7000000c2b600000008000000011b4e11c5981b4e110000000000000000c2ad070000000000c2bb000000c2bb00000000000000480000000100000001000000640062006f00000046004b005f00500065006400610067006f00670050007200650064006d00650074005f005a00610070006f0073006c0065006e00690000000000000000000000c3840200000000c4bd000000c4bd000000c2bb00000008000000011c4e11c2981c4e110000000000000000c2ad070000000000cb9d000000cb9d00000000000000520000000140c5917101000000640062006f00000046004b005f0043006c0061006e0069004c00610062006f007200610074006f00720069006a0061005f004c00610062006f007200610074006f00720069006a0000000000000000000000c3840200000000c4be000000c4be000000cb9d00000008000000011f4e11c2981f4e110000000000000000c2ad070000000000c381000000c381000000000000004e0000000112297701000000640062006f00000046004b005f0043006c0061006e0069004c00610062006f007200610074006f00720069006a0061005f005a00610070006f0073006c0065006e00690000000000000000000000c3840200000000c382000000c382000000c38100000008000000011a4e11581a4e110000000000000000c2ad070000000000c482000000c482000000000000003c000000010fc5ae1701000000640062006f00000046004b005f0050007200650064006d006500740049007a007000690074005f0049007a0070006900740000000000000000000000c3840200000000c384000000c384000000c4820000000800000001204e11c298204e110000000000000000c2ad070000000000c4b9000000c4b900000000000000360000000100000001000000640062006f00000046004b005f0044006f0067006f00640065006b005f0044006f0067006f00640065006b0000000000000000000000c3840200000000c486000000c486000000c4b900000008000000011c4e11c5981c4e110000000000000000c2ad070000000000c38b000000c38b000000000000003e000000010fc5ae1701000000640062006f00000046004b005f004c00610062006f007200610074006f00720069006a005f004b0061007400650064007200610000000000000000000000c3840200000000c49a000000c49a000000c38b0000000800000001424e11c298424e110000000000000000c2ad0f0000010000c59a00000040000000010000000e00000018000000010000001f000000010000000a000000c2b100000070000000c38b0000000500000006000000e280a200000070000000cb9d00000006000000e280a20000005f000000c5a00000003400000008000000330000006d0000001a0000002e00000008000000100000006c00000001000000610000000800000016000000e2809c00000073000000c4820000000900000033000000c48c000000e280b00000003c000000090000000a000000010000006a000000cb980000000c000000010000001b000000000000007f0000000c0000000d000000c4b900000072000000720000000d00000010000000c2a800000071000000c2a00000000d0000000e00000076000000e280b90000003e0000000f000000100000000100000002000000c4b9000000120000000200000078000000c39d000000450000001200000044000000c59e0000005f000000e2809c00000013000000c2900000006a000000010000003a0000001a000000090000007900000068000000c2810000004e0000006700000047000000c5a4000000700000006700000044000000e280980000005e0000006e0000006700000057000000000000004d0000006c00000067000000650000002c0000001b000000e2809800000067000000c290000000e280b9000000c288000000c2bb00000067000000160000005a000000c5bb000000c38100000067000000e280a20000004b00000002000000c5bd000000e280a1000000080000000100000020000000c2b6000000c2ae00000067000000c38d0000002d000000c2b1000000c2ae00000001000000c382000000c3a9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000630074002000540069006d0065006f00750074003d00330030003b0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003d0054007200750065003b005000610063006b00650074002000530069007a0065003d0034003000390036003b004100700070006c00690063006100740069006f006e0020004e0061006d0065003d0022004d006900630072006f0073006f00660074002000530051004c00200053006500720076006500720020004d0061006e006100670065006d0065006e0074002000530074007500640069006f002200000000e282ac050008000000690046004500000000022600120000005400690070004d00610069006c006100000008000000640062006f000000000226002400000043006c0061006e0069004c00610062006f007200610074006f00720069006a006100000008000000640062006f00000000022600160000005a00610070006f0073006c0065006e004a006500000008000000640062006f00000000022600120000006c007400530074006500620065007200000008000000640062006f00000000022600140000005a00610070006f0073006c0065006e006900000008000000640062006f0000000002260016000000540065006c00650066006f006e0073006b006100000008000000640062006f000000000226001c00000047006f0076006f00720069006c006e0065002000750072006500000008000000640062006f00000000022600120000006c0074004e0061007a00690076006900000008000000640062006f00000000022600200000005a00610070006f0073006c0065006e00500072006f00730074006f007200000008000000640062006f000000000226001a00000050007200650064006d006500740049007a00700069007400000008000000640062006f00000000022600160000006c00740054006900700049007a00700069007400000008000000640062006f000000000226001e000000500065006400610067006f00670050007200650064006d0065007400000008000000640062006f00000000022600220000006c0074005400690070005a00610070006f0073006c0065006e00650067006100000008000000640062006f00000000022600140000006c007400500072006f00730074006f007200000008000000640062006f000000000226001800000050007200650064006d006500740053006d0065007200000008000000640062006f00000000022600160000006c007400530065006d0065007300740065007200000008000000640062006f000000000226001800000053006d0065007200530074007500640065006e007400000008000000640062006f000000000226000a00000053006d0065007200000008000000640062006f00000000022600140000006c007400500072006f006700720061006d00000008000000640062006f000000000226001a00000049007a00700069007400530074007500640065006e007400000008000000640062006f000000000226000c00000049007a00700069007400000008000000640062006f000000000226001000000050007200650064006d0065007400000008000000640062006f00000000022600180000004c00610062006f007200610074006f00720069006a00000008000000640062006f00000000022600100000004b00610074006500640072006100000008000000640062006f000000000226000c00000053006b006f0064006100000008000000640062006f000000000226001000000044006f0067006f00640065006b00000008000000640062006f0000000002240010000000530074007500640065006e007400000008000000640062006f00000001000000c396e280a609c582c2bb6bc58845c5a1c2b8371664c491327008004e0000007b00310036003300340043004400440037002d0030003800380038002d0034003200450033002d0039004600410032002d004200360044003300320035003600330042003900310044007d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000c0000000b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062c2885214);

-- --------------------------------------------------------

--
-- Struktura tabele `telefonska`
--

CREATE TABLE `telefonska` (
  `ID` int(11) NOT NULL,
  `Tip` char(7) NOT NULL,
  `IDZaposlenega` int(11) NOT NULL,
  `Cifra` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `telefonska`
--

INSERT INTO `telefonska` (`ID`, `Tip`, `IDZaposlenega`, `Cifra`) VALUES
(2, 'tel', 7, '116'),
(4, 'tel', 6, '813'),
(5, 'tel', 8, '802'),
(7, 'tel', 10, '885'),
(9, 'tel', 11, '101'),
(11, 'tel', 12, '844'),
(13, 'tel', 13, '107');

-- --------------------------------------------------------

--
-- Struktura tabele `tipmaila`
--

CREATE TABLE `tipmaila` (
  `ID` tinyint(3) UNSIGNED NOT NULL,
  `Domena` varchar(25) CHARACTER SET utf8mb4 NOT NULL,
  `Vloga` varchar(25) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `tipmaila`
--

INSERT INTO `tipmaila` (`ID`, `Domena`, `Vloga`) VALUES
(1, 'student.uni-lj.si', 'Ĺ tudent'),
(2, 'fe.uni-lj.si', 'Profesor');

-- --------------------------------------------------------

--
-- Struktura tabele `zaposleni`
--

CREATE TABLE `zaposleni` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_slovenian_ci NOT NULL,
  `Priimek` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_slovenian_ci NOT NULL,
  `IDNaziva` tinyint(3) UNSIGNED NOT NULL,
  `IDTipMaila` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `zaposleni`
--

INSERT INTO `zaposleni` (`ID`, `Ime`, `Priimek`, `IDNaziva`, `IDTipMaila`) VALUES
(6, 'Andrej', 'BajĹľelj', 1, 2),
(7, 'JoĹľe', 'Guna', 1, 2),
(8, 'Andrej', 'Ĺ tern', 1, 2),
(10, 'Klemen', 'PeÄŤnik', 1, 2),
(11, 'MatevĹľ', 'PogaÄŤnik', 1, 2),
(12, 'MatevĹľ', 'PustiĹˇek', 1, 2),
(13, 'Urban', 'Sedlar', 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabele `zaposlenje`
--

CREATE TABLE `zaposlenje` (
  `IDZaposlenega` int(11) NOT NULL,
  `IDTipa` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `zaposlenje`
--

INSERT INTO `zaposlenje` (`IDZaposlenega`, `IDTipa`) VALUES
(6, 6),
(7, 5),
(8, 4),
(10, 4),
(11, 2),
(12, 2),
(13, 3);

-- --------------------------------------------------------

--
-- Struktura tabele `zaposlenprostor`
--

CREATE TABLE `zaposlenprostor` (
  `IDZaposlen` int(11) NOT NULL,
  `IDProstor` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `zaposlenprostor`
--

INSERT INTO `zaposlenprostor` (`IDZaposlen`, `IDProstor`) VALUES
(6, 5),
(7, 5),
(8, 7),
(10, 7),
(11, 9),
(12, 10),
(13, 11);

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `clanilaboratorija`
--
ALTER TABLE `clanilaboratorija`
  ADD KEY `FK_ClaniLaboratorija_Zaposleni` (`IDZaposlenega`),
  ADD KEY `FK_ClaniLaboratorija_Laboratorij` (`IDLab`);

--
-- Indeksi tabele `dogodek`
--
ALTER TABLE `dogodek`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Dogodek_Dogodek` (`IDProstora`);

--
-- Indeksi tabele `govorilneure`
--
ALTER TABLE `govorilneure`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Govorilne ure_Zaposleni` (`IDZaposlenega`);

--
-- Indeksi tabele `izpit`
--
ALTER TABLE `izpit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDTipIzpita -> ID (ltTipIzpit)` (`IDTipIzpita`);

--
-- Indeksi tabele `izpitstudent`
--
ALTER TABLE `izpitstudent`
  ADD KEY `IDIzpita -> ID (Izpit)` (`IDIzpit`),
  ADD KEY `IDStudenta -> ID (Student)` (`IDStudent`);

--
-- Indeksi tabele `katedra`
--
ALTER TABLE `katedra`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `laboratorij`
--
ALTER TABLE `laboratorij`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `A` (`LabIme`,`Akronim`),
  ADD KEY `FK_Laboratorij_Katedra` (`IDKatedre`);

--
-- Indeksi tabele `ltnazivi`
--
ALTER TABLE `ltnazivi`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `ltprogram`
--
ALTER TABLE `ltprogram`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `ltprostor`
--
ALTER TABLE `ltprostor`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `ltsemester`
--
ALTER TABLE `ltsemester`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `ltsteber`
--
ALTER TABLE `ltsteber`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `lttipizpit`
--
ALTER TABLE `lttipizpit`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `lttipzaposlenega`
--
ALTER TABLE `lttipzaposlenega`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `odzivi`
--
ALTER TABLE `odzivi`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `pedagogpredmet`
--
ALTER TABLE `pedagogpredmet`
  ADD KEY `IDPremeta -> ID (Predmet)` (`IDPredmet`),
  ADD KEY `FK_PedagogPredmet_Zaposleni` (`IDPedagog`);

--
-- Indeksi tabele `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDSteber -> ID (ltSteber)` (`IDSteber`);

--
-- Indeksi tabele `predmetizpit`
--
ALTER TABLE `predmetizpit`
  ADD KEY `FK_PredmetIzpit_Izpit` (`IDIzpita`),
  ADD KEY `IDPredmeta -> ID (Predmet)` (`IDPredmeta`);

--
-- Indeksi tabele `predmetsmer`
--
ALTER TABLE `predmetsmer`
  ADD KEY `IDPredmet -> ID (Predmet)` (`IDPredmet`),
  ADD KEY `ID -> ID(Semester)` (`IDSemester`),
  ADD KEY `FK_PredmetSmer_Smer` (`IDSmer`);

--
-- Indeksi tabele `skoda`
--
ALTER TABLE `skoda`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `smer`
--
ALTER TABLE `smer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Smer_ltProgram` (`IDProgram`);

--
-- Indeksi tabele `smerstudent`
--
ALTER TABLE `smerstudent`
  ADD KEY `FK_SmerStudent_Smer` (`IDSmer`),
  ADD KEY `IDStudent -> ID (Student)` (`IDStudent`);

--
-- Indeksi tabele `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UQ__Student__203380EF838605CC` (`StudentskiMail`),
  ADD KEY `FK_Student_TipMaila` (`IDTipMaila`),
  ADD KEY `FK_Student_ltProgram` (`IDProgram`);

--
-- Indeksi tabele `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  ADD PRIMARY KEY (`diagram_id`),
  ADD UNIQUE KEY `UK_principal_name` (`principal_id`,`name`);

--
-- Indeksi tabele `telefonska`
--
ALTER TABLE `telefonska`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Telefonska_Zaposleni` (`IDZaposlenega`);

--
-- Indeksi tabele `tipmaila`
--
ALTER TABLE `tipmaila`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksi tabele `zaposleni`
--
ALTER TABLE `zaposleni`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Zaposleni_ltNazivi` (`IDNaziva`),
  ADD KEY `FK_Zaposleni_TipMaila` (`IDTipMaila`);

--
-- Indeksi tabele `zaposlenje`
--
ALTER TABLE `zaposlenje`
  ADD KEY `FK_ZaposlenJe_Zaposleni` (`IDZaposlenega`),
  ADD KEY `FK_ZaposlenJe_ltTipZaposlenega` (`IDTipa`);

--
-- Indeksi tabele `zaposlenprostor`
--
ALTER TABLE `zaposlenprostor`
  ADD KEY `FK_ZaposlenProstor_Zaposleni` (`IDZaposlen`),
  ADD KEY `IDProstor -> ID (Prostor)` (`IDProstor`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `govorilneure`
--
ALTER TABLE `govorilneure`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabele `katedra`
--
ALTER TABLE `katedra`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT tabele `laboratorij`
--
ALTER TABLE `laboratorij`
  MODIFY `ID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT tabele `ltprogram`
--
ALTER TABLE `ltprogram`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12311413;

--
-- AUTO_INCREMENT tabele `ltprostor`
--
ALTER TABLE `ltprostor`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT tabele `lttipzaposlenega`
--
ALTER TABLE `lttipzaposlenega`
  MODIFY `ID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT tabele `skoda`
--
ALTER TABLE `skoda`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabele `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  MODIFY `diagram_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabele `telefonska`
--
ALTER TABLE `telefonska`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT tabele `zaposleni`
--
ALTER TABLE `zaposleni`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `clanilaboratorija`
--
ALTER TABLE `clanilaboratorija`
  ADD CONSTRAINT `FK_ClaniLaboratorija_Laboratorij` FOREIGN KEY (`IDLab`) REFERENCES `laboratorij` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ClaniLaboratorija_Zaposleni` FOREIGN KEY (`IDZaposlenega`) REFERENCES `zaposleni` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omejitve za tabelo `govorilneure`
--
ALTER TABLE `govorilneure`
  ADD CONSTRAINT `FK_Govorilne ure_Zaposleni` FOREIGN KEY (`IDZaposlenega`) REFERENCES `zaposleni` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
