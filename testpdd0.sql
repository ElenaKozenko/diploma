
CREATE TABLE `answers` (
  `a_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `tkt_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `answ` text COLLATE utf8mb4_unicode_ci,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `questions` (
  `q_id` int(11) UNSIGNED NOT NULL,
  `tkt_id` int(11) NOT NULL,
  `tp_id` int(11) NOT NULL DEFAULT '27',
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `true_ans` int(11) NOT NULL,
  `ans1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans3` text COLLATE utf8mb4_unicode_ci,
  `ans4` text COLLATE utf8mb4_unicode_ci,
  `ans5` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `tickets` (
  `tkt_id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `topics` (
  `tp_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `surname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patr` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `answers`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `ans_tkt_FK` (`tkt_id`),
  ADD KEY `ans_u_FK` (`u_id`);

ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `que_tkt_FK` (`tkt_id`),
  ADD KEY `que_tp_FK` (`tp_id`);

ALTER TABLE `tickets`
  ADD PRIMARY KEY (`tkt_id`);

ALTER TABLE `topics`
  ADD PRIMARY KEY (`tp_id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);





ALTER TABLE `answers`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;



ALTER TABLE `questions`
  MODIFY `q_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `tickets`
  MODIFY `tkt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;


ALTER TABLE `topics`
  MODIFY `tp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;


ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `answers`
  ADD CONSTRAINT `ans_tkt_FK` FOREIGN KEY (`tkt_id`) REFERENCES `tickets` (`tkt_id`),
  ADD CONSTRAINT `ans_u_FK` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `questions`
  ADD CONSTRAINT `que_tkt_FK` FOREIGN KEY (`tkt_id`) REFERENCES `tickets` (`tkt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `que_tp_FK` FOREIGN KEY (`tp_id`) REFERENCES `topics` (`tp_id`) ON DELETE CASCADE ON UPDATE CASCADE;



CREATE  VIEW `std_results`  AS SELECT `answers`.`a_id` AS `a_id`, `answers`.`u_id` AS `u_id`, `tickets`.`name` AS `name`, `answers`.`status` AS `status`, cast(`answers`.`start_time` as date) AS `date`, timestampdiff(SECOND,`answers`.`start_time`,`answers`.`end_time`) AS `time` FROM (`answers` join `tickets`) WHERE (`answers`.`tkt_id` = `tickets`.`tkt_id`) ;


CREATE VIEW `students`  AS SELECT `users`.`u_id` AS `u_id`, concat(`users`.`surname`,' ',`users`.`name`,' ',`users`.`patr`) AS `fio` FROM `users` WHERE (`users`.`category` = 'student') ORDER BY `users`.`surname` ASC ;





INSERT INTO `answers` (`a_id`, `u_id`, `tkt_id`, `status`, `answ`, `start_time`, `end_time`) VALUES
(8, 1, 1, 1, '\"[\\\"3\\\",\\\"2\\\",\\\"2\\\",\\\"4\\\"]\"', '2022-04-23 10:39:05', '2022-04-23 10:39:10'),
(9, 1, 1, 1, '\"[\\\"3\\\",\\\"2\\\",\\\"2\\\",\\\"4\\\"]\"', '2022-04-23 10:52:51', '2022-04-23 10:53:03'),
(10, 1, 1, 1, '\"[\\\"2\\\",\\\"3\\\",\\\"2\\\",\\\"4\\\"]\"', '2022-04-23 10:54:10', '2022-04-23 10:54:15'),
(11, 1, 1, 1, '\"[\\\"2\\\",\\\"2\\\",\\\"3\\\",\\\"3\\\"]\"', '2022-04-23 11:32:33', '2022-04-23 11:32:43'),
(12, 4, 1, 0, '...', '2022-04-13 17:19:07', '2022-04-13 17:39:08'),
(13, 2, 1, 0, 'hfghgfh', '2022-04-23 17:19:07', '2022-04-23 17:39:08');


INSERT INTO `questions` (`q_id`, `tkt_id`, `tp_id`, `task`, `true_ans`, `ans1`, `ans2`, `ans3`, `ans4`, `ans5`, `description`) VALUES
(2, 1, 27, 'В каком случае водитель совершит вынужденную остановку?', 2, 'Остановившись непосредственно перед пешеходным переходом, чтобы уступить дорогу пешеходу', 'Остановившись на проезжей части из-за технической неисправности транспортного средства', 'В обоих перечисленных случаях', NULL, NULL, '«Вынужденная остановка» - прекращение движения транспортного средства, связанное с его технической неисправностью, опасностью, создаваемой перевозимым грузом, состоянием водителя (пассажира) или появления препятствия на дороге. (Пункт 1.2 ПДД, термин «Вынужденная остановка»)'),
(7, 1, 5, 'Что означает мигание зелёного сигнала светофора?', 2, 'Предупреждает о неисправности светофора', 'Разрешает движение и информирует о том, что вскоре будет включен запрещающий сигнал', 'Запрещает дальнейшее движение', NULL, NULL, 'Длительность мигания зелёного сигнала светофора обычно составляет 3-4 с. Это позволяет водителю заблаговременно, в зависимости от конкретных условий, принять решение: 1) продолжить движение с прежней скоростью; 2) несколько увеличить скорость; 3) начать снижение скорости вплоть до остановки. (Пункт 6.2 ПДД)'),
(8, 1, 1, 'Что понимается под временем реакции водителя?', 2, ' Время с момента обнаружения водителем опасности до полной остановки транспортного средства', 'Время с момента обнаружения водителем опасности до начала принятия мер по её избежанию', 'Время, необходимое для переноса ноги с педали управления подачи топлива на педаль тормоза', NULL, NULL, 'Под временем реакции водителя понимается время с момента обнаружения водителем опасности до начала принятия мер по её избежанию. Время реакции водителя - величина непостоянная. В основном зависит от возраста, самочувствия в данный момент. Компенсировать недостаток реакции можно снижением скорости. («Техника управления автомобилем»)'),
(9, 1, 1, 'Какие из указанных знаков запрещают движение водителям мопедов?', 4, 'Только А', 'Только Б', ' В и Г', ' В и Г', NULL, 'Запрещают движение водителям мопедов все знаки из перечисленных: А – 4.4.1 «Велосипедная дорожка»; Б – 5.14 «Полоса для маршрутных транспортных средств»; В – 4.5.2 «Пешеходная и велосипедная дорожка с совмещенным движением»; Г – 4.5.4 «Пешеходная и велосипедная дорожка с разделением движения». (Дорожные знаки) Только знак 5.14.2 «Полоса для велосипедистов» разрешает движение мопедов, но он не представлен в вопросе Пункт 24.7 ПДД');



INSERT INTO `tickets` (`tkt_id`, `name`) VALUES
(1, 'Билет 1'),
(2, 'Билет 2'),
(3, 'Билет 3'),
(4, 'Билет 4'),
(5, 'Билет 5'),
(6, 'Билет 6'),
(7, 'Билет 7'),
(8, 'Билет 8'),
(9, 'Билет 9'),
(10, 'Билет 10'),
(11, 'Билет 11'),
(12, 'Билет 12'),
(13, 'Билет 13'),
(14, 'Билет 14'),
(15, 'Билет 15'),
(16, 'Билет 16'),
(17, 'Билет 17'),
(18, 'Билет 18'),
(19, 'Билет 19'),
(20, 'Билет 20'),
(21, 'Билет 21'),
(22, 'Билет 22'),
(23, 'Билет 23'),
(24, 'Билет 24'),
(25, 'Билет 25'),
(26, 'Билет 26'),
(27, 'Билет 27'),
(28, 'Билет 28'),
(29, 'Билет 29'),
(30, 'Билет 30'),
(31, 'Билет 31'),
(32, 'Билет 32'),
(33, 'Билет 33'),
(34, 'Билет 34'),
(35, 'Билет 35'),
(36, 'Билет 36'),
(37, 'Билет 37'),
(38, 'Билет 38'),
(39, 'Билет 39'),
(40, 'Билет 40');


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



INSERT INTO `users` (`u_id`, `surname`, `name`, `patr`, `category`, `login`, `password`) VALUES
(1, 'Войтович', 'Елена', 'Эдуардовна', 'admin', 'admin', 'admin'),
(2, 'Иванов', 'Иван', 'Иванович', 'student', '111', '111'),
(3, 'Петров', 'Петр', 'Петрович', 'student', '222', '222'),
(4, 'Петров', 'Петр', 'Дмитриевич', 'student', '333', '333'),
(6, 'Реута', 'Людмила', 'Юрьевна', 'student', '444', '444'),
(8, 'Шишкина', 'Мила', 'Львовна', 'student', '555', '555'),
(9, 'Лютиковская', 'Мила', 'Львовна', 'student', '908', '67567');
