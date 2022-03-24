-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 24 2022 г., 11:21
-- Версия сервера: 10.5.11-MariaDB-log
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
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `a_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `tkt_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` int(11) NOT NULL,
  `answ` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE `pictures` (
  `pic_id` int(11) NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pictures`
--

INSERT INTO `pictures` (`pic_id`, `path`) VALUES
(1, '/pic/no_pic.png');

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `q_id` int(11) UNSIGNED NOT NULL,
  `tkt_id` int(11) NOT NULL,
  `pic_id` int(11) NOT NULL,
  `tp_id` int(11) NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `true_ans` int(11) NOT NULL,
  `ans1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans5` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE `tickets` (
  `tkt_id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tickets`
--

INSERT INTO `tickets` (`tkt_id`, `name`) VALUES
(1, 'Билет 1'),
(2, 'Билет 2');

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `tp_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`tp_id`, `name`) VALUES
(1, 'Движение по автомагистралям'),
(2, 'Общие положения'),
(3, 'Дорожные знаки'),
(4, 'Дорожная разметка'),
(5, 'Сигналы светофора и регулировщика'),
(6, 'Начало движения, маневрирование'),
(7, 'Скорость движения'),
(8, 'Обгон, опережение, встречный разъезд'),
(9, 'Остановка и стоянка'),
(10, 'Проезд перекрестков'),
(11, 'Пользование внешними световыми приборами и звуковыми сигналами'),
(12, 'Неисправности и условия допуска транспортных средств к эксплуатации'),
(13, 'Безопасность движения и техника управления автомобилем'),
(14, 'Оказание доврачебной медицинской помощи'),
(15, 'Общие обязанности водителей'),
(16, 'Расположение транспортных средств на проезжей части'),
(17, 'Приоритет маршрутных транспортных средств'),
(18, 'Буксировка механических транспортных средств'),
(19, 'Применение специальных сигналов'),
(20, 'Движение в жилых зонах'),
(21, 'Учебная езда и дополнительные требования к движению велосипедистов'),
(22, 'Движение через железнодорожные пути'),
(23, 'Пешеходные переходы и места остановок маршрутных транспортных средств'),
(24, 'Перевозка людей и грузов'),
(25, 'Ответственность водителя'),
(26, 'Применение аварийной сигнализации и знака аварийной остановки'),
(27, 'Без темы');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `surname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patr` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `ans_tkt_FK` (`tkt_id`),
  ADD KEY `ans_u_FK` (`u_id`);

--
-- Индексы таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`pic_id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `que_tkt_FK` (`tkt_id`),
  ADD KEY `que_pic_id` (`pic_id`),
  ADD KEY `que_tp_FK` (`tp_id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`tkt_id`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`tp_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pictures`
--
ALTER TABLE `pictures`
  MODIFY `pic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `q_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
  MODIFY `tkt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `topics`
--
ALTER TABLE `topics`
  MODIFY `tp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `ans_tkt_FK` FOREIGN KEY (`tkt_id`) REFERENCES `tickets` (`tkt_id`),
  ADD CONSTRAINT `ans_u_FK` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `que_pic_id` FOREIGN KEY (`pic_id`) REFERENCES `pictures` (`pic_id`),
  ADD CONSTRAINT `que_tkt_FK` FOREIGN KEY (`tkt_id`) REFERENCES `tickets` (`tkt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `que_tp_FK` FOREIGN KEY (`tp_id`) REFERENCES `topics` (`tp_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
