-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Апр 25 2022 г., 17:22
-- Версия сервера: 10.1.44-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testpdd0`
--

-- --------------------------------------------------------

--
-- Структура для представления `std_results`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `std_results`  AS SELECT `answers`.`a_id` AS `a_id`, `answers`.`u_id` AS `u_id`, `tickets`.`name` AS `name`, `answers`.`status` AS `status`, cast(`answers`.`start_time` as date) AS `date`, timestampdiff(SECOND,`answers`.`start_time`,`answers`.`end_time`) AS `time` FROM (`answers` join `tickets`) WHERE (`answers`.`tkt_id` = `tickets`.`tkt_id`) ;

--
-- VIEW `std_results`
-- Данные: Ниодного
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
