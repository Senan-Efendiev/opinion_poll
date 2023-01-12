-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 12 2023 г., 15:50
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `opinion_poll`
--

-- --------------------------------------------------------

--
-- Структура таблицы `another_city`
--

CREATE TABLE `another_city` (
  `ID` int NOT NULL,
  `mentality` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Менталитет',
  `kind_people` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Добрые люди',
  `abstained` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Воздержались'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `another_city`
--

INSERT INTO `another_city` (`ID`, `mentality`, `kind_people`, `abstained`) VALUES
(1, '75 человек', '42 человека', '20 человек'),
(2, '56 человек', '29 человек', '1 человек');

-- --------------------------------------------------------

--
-- Структура таблицы `research`
--

CREATE TABLE `research` (
  `ID` int NOT NULL,
  `Id_region` varchar(100) NOT NULL COMMENT 'Наименование региона',
  `places` varchar(100) NOT NULL COMMENT 'Места'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `research`
--

INSERT INTO `research` (`ID`, `Id_region`, `places`) VALUES
(1, 'Сургут', 'Парк за Саймой'),
(2, 'Тюмень', 'Центральная площадь');

-- --------------------------------------------------------

--
-- Структура таблицы `results`
--

CREATE TABLE `results` (
  `ID` int NOT NULL,
  `satisfied` varchar(100) NOT NULL COMMENT 'Удовлетворены',
  `not_satisfied` varchar(100) NOT NULL COMMENT 'Не удовлетворены',
  `abstained` varchar(100) NOT NULL COMMENT 'Воздержались'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `results`
--

INSERT INTO `results` (`ID`, `satisfied`, `not_satisfied`, `abstained`) VALUES
(1, '40 человек', '10 человек', '15 человек'),
(2, '67 человек', '10 человек', '2 человека');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `ID` int NOT NULL,
  `subject_of_research` varchar(100) NOT NULL COMMENT 'Предмет исследования',
  `attractions` varchar(100) NOT NULL COMMENT 'Достопримечательности',
  `noisy_places` varchar(100) NOT NULL COMMENT 'Шумные места',
  `city` varchar(100) NOT NULL COMMENT 'Город'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`ID`, `subject_of_research`, `attractions`, `noisy_places`, `city`) VALUES
(1, 'Привлекательные места', 'Парк за Саймой', 'Центр города', 'Сургут'),
(2, 'Самые прилюдные места', 'Улица Ленина', 'Торговый центр', 'Тюмень');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `another_city`
--
ALTER TABLE `another_city`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `research`
--
ALTER TABLE `research`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `places` (`places`);

--
-- Индексы таблицы `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `city` (`city`),
  ADD UNIQUE KEY `city_2` (`city`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `another_city`
--
ALTER TABLE `another_city`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `research`
--
ALTER TABLE `research`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `results`
--
ALTER TABLE `results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `another_city`
--
ALTER TABLE `another_city`
  ADD CONSTRAINT `another_city_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `results` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `research`
--
ALTER TABLE `research`
  ADD CONSTRAINT `research_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `another_city` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `subject` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `research` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
