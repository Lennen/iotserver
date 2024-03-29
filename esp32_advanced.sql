-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.0.218
-- Время создания: Окт 29 2023 г., 21:34
-- Версия сервера: 5.7.37-40
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `esp32_advanced`
--

-- --------------------------------------------------------

--
-- Структура таблицы `codes`
--

CREATE TABLE `codes` (
  `code_id` int(11) NOT NULL,
  `code_value` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `code_start_date` date NOT NULL,
  `code_expired_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `codes`
--

INSERT INTO `codes` (`code_id`, `code_value`, `code_start_date`, `code_expired_date`) VALUES
(1, '123er', '2021-04-27', '2025-02-28');

-- --------------------------------------------------------

--
-- Структура таблицы `organizations`
--

CREATE TABLE `organizations` (
  `org_id` int(11) NOT NULL,
  `org_name` text COLLATE utf8_unicode_ci NOT NULL,
  `org_full_name` text COLLATE utf8_unicode_ci NOT NULL,
  `org_eng_name` text COLLATE utf8_unicode_ci NOT NULL,
  `org_description` text COLLATE utf8_unicode_ci NOT NULL,
  `org_logo` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `organizations`
--

INSERT INTO `organizations` (`org_id`, `org_name`, `org_full_name`, `org_eng_name`, `org_description`, `org_logo`) VALUES
(1, 'GENERVIS', 'Generation Visual', 'Generation Visual', 'Массовая автоматическая генерация визуально понятных и приятных одностраничных веб-ресурсов из несовременных и скучных текстовых документов', ''),
(2, 'Технофея', 'Сообщество разработчиков Технофея', 'Technofeya', 'Разработки радиоэлектронных устройств', ''),
(3, 'РАНХиГС', 'Российская академия народного хозяйства и государственной службы при Президенте РФ', 'RANEPA', '', ''),
(4, 'СФУ', 'Сибирский Федеральный университет', 'Siberian Federal University', '', ''),
(5, 'Микроволновая электроника', 'Микроволновая электроника', 'Microwave electronics', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_login` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `reset_password_token` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `user_ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_email` text COLLATE utf8_unicode_ci NOT NULL,
  `email_status` tinyint(4) NOT NULL,
  `user_name` text COLLATE utf8_unicode_ci NOT NULL,
  `user_patro` text COLLATE utf8_unicode_ci NOT NULL,
  `user_surname` text COLLATE utf8_unicode_ci NOT NULL,
  `user_affiliation` text COLLATE utf8_unicode_ci NOT NULL,
  `user_job_title` text COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_avatar` text COLLATE utf8_unicode_ci NOT NULL,
  `user_secret` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_org`
--

CREATE TABLE `user_org` (
  `id` int(11) NOT NULL,
  `user_id` text COLLATE utf8_unicode_ci NOT NULL,
  `org_id` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user_org`
--

INSERT INTO `user_org` (`id`, `user_id`, `org_id`) VALUES
(44, '24', '4'),
(45, '29', '1'),
(46, '29', '2'),
(49, '30', '4'),
(50, '30', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `user_sensors`
--

CREATE TABLE `user_sensors` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sensor_name` text COLLATE utf8_unicode_ci NOT NULL,
  `sensor_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `val_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user_sensors`
--

INSERT INTO `user_sensors` (`id`, `sensor_id`, `user_id`, `sensor_name`, `sensor_desc`, `val_type`) VALUES
(1, 2, 24, 'Hello', 'Определяет температуру в ванной комнате', 0),
(13, 1, 32, 'servo8', 'датчик%20света', 0),
(14, 2, 32, 'servo2', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `vals`
--

CREATE TABLE `vals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `val` double NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `vals`
--

INSERT INTO `vals` (`id`, `user_id`, `sensor_id`, `val`, `datetime`) VALUES
(1, 33, 1, 149, '2023-02-17 16:20:23'),
(2, 33, 1, 64, '2023-02-17 16:20:24'),
(3, 33, 2, 142, '2023-02-17 16:20:26'),
(4, 33, 2, 56, '2023-02-17 16:20:27'),
(5, 33, 2, 23, '2023-02-17 16:20:28'),
(6, 33, 2, 4, '2023-02-17 16:20:30'),
(7, 33, 2, 131, '2023-02-17 16:20:32'),
(8, 33, 2, 176, '2023-02-17 16:20:33'),
(9, 33, 1, 153, '2023-02-17 16:20:36'),
(10, 33, 2, 0, '2023-02-17 16:20:39'),
(11, 33, 2, 45, '2023-02-17 16:20:42'),
(12, 33, 2, 127, '2023-02-17 16:20:44'),
(13, 33, 1, 93, '2023-02-17 16:21:07'),
(14, 33, 1, 161, '2023-02-17 16:21:07'),
(15, 33, 1, 101, '2023-02-17 16:21:08'),
(16, 33, 1, 34, '2023-02-17 16:21:08'),
(17, 33, 1, 8, '2023-02-17 16:21:09'),
(18, 33, 1, 135, '2023-02-17 16:21:13'),
(19, 33, 1, 180, '2023-02-17 16:21:16'),
(20, 33, 2, 71, '2023-02-17 16:21:17'),
(21, 33, 2, 127, '2023-02-17 16:21:20'),
(22, 33, 2, 172, '2023-02-17 16:21:21'),
(23, 33, 2, 120, '2023-02-17 16:21:22'),
(24, 33, 2, 52, '2023-02-17 16:21:23'),
(25, 33, 2, 123, '2023-02-17 16:22:08'),
(26, 33, 1, 30, '2023-02-17 16:22:10'),
(27, 33, 2, 37, '2023-02-17 16:22:13'),
(28, 33, 2, 120, '2023-02-17 16:22:16'),
(29, 33, 2, 164, '2023-02-17 16:22:17'),
(30, 33, 1, 71, '2023-02-17 16:22:18'),
(31, 33, 2, 0, '2023-02-17 16:22:21'),
(32, 33, 1, 164, '2023-02-17 16:22:53'),
(33, 33, 1, 180, '2023-02-17 16:22:55'),
(34, 33, 1, 15, '2023-02-17 16:22:56'),
(35, 33, 1, 0, '2023-02-17 16:22:57'),
(36, 33, 1, 41, '2023-02-17 16:22:58'),
(37, 33, 1, 123, '2023-02-17 16:22:58'),
(38, 33, 1, 180, '2023-02-17 16:23:00'),
(39, 33, 1, 90, '2023-02-17 16:23:01'),
(40, 33, 1, 19, '2023-02-17 16:23:02'),
(41, 33, 1, 0, '2023-02-17 16:23:03'),
(42, 33, 2, 180, '2023-02-17 16:23:04'),
(43, 33, 2, 0, '2023-02-17 16:23:07'),
(44, 33, 2, 180, '2023-02-17 16:23:09'),
(45, 33, 2, 0, '2023-02-17 16:23:11'),
(46, 33, 2, 172, '2023-02-17 16:23:12'),
(47, 33, 1, 176, '2023-02-17 16:23:15'),
(48, 33, 2, 0, '2023-02-17 16:23:17'),
(49, 33, 2, 168, '2023-02-17 16:23:19'),
(50, 33, 2, 0, '2023-02-17 16:23:20'),
(51, 33, 2, 176, '2023-02-17 16:23:22'),
(52, 33, 2, 127, '2023-02-17 16:24:07'),
(53, 33, 2, 60, '2023-02-17 16:24:08'),
(54, 33, 1, 79, '2023-02-17 16:24:10'),
(55, 33, 1, 176, '2023-02-17 16:24:10'),
(56, 33, 2, 153, '2023-02-17 16:25:16'),
(57, 33, 2, 93, '2023-02-17 16:25:16'),
(58, 33, 2, 30, '2023-02-17 16:25:18'),
(59, 33, 1, 82, '2023-02-17 16:25:18'),
(60, 33, 1, 8, '2023-02-17 16:25:19'),
(61, 33, 1, 157, '2023-02-17 16:25:20'),
(62, 33, 1, 41, '2023-02-17 16:25:21'),
(63, 33, 1, 4, '2023-02-17 16:25:23'),
(64, 33, 1, 52, '2023-02-17 16:25:27'),
(65, 33, 1, 101, '2023-02-17 16:25:29'),
(66, 33, 1, 149, '2023-02-17 16:25:30'),
(67, 33, 1, 180, '2023-02-17 16:25:31'),
(68, 33, 1, 108, '2023-02-17 16:25:33'),
(69, 33, 1, 49, '2023-02-17 16:25:33'),
(70, 33, 1, 8, '2023-02-17 16:25:36'),
(71, 33, 1, 60, '2023-02-17 16:25:37'),
(72, 33, 1, 112, '2023-02-17 16:25:38'),
(73, 33, 1, 149, '2023-02-17 16:25:39'),
(74, 33, 2, 105, '2023-02-17 16:25:40'),
(75, 33, 2, 146, '2023-02-17 16:25:41'),
(76, 33, 1, 71, '2023-02-17 16:25:42'),
(77, 33, 1, 26, '2023-02-17 16:25:43'),
(78, 33, 1, 131, '2023-02-17 16:25:45'),
(79, 33, 1, 79, '2023-02-17 16:27:13'),
(80, 33, 1, 19, '2023-02-17 16:27:13'),
(81, 33, 1, 146, '2023-02-17 16:27:14'),
(82, 33, 1, 93, '2023-02-17 16:27:16'),
(83, 33, 1, 41, '2023-02-17 16:27:16'),
(84, 33, 3, 79, '2023-02-17 16:27:17'),
(85, 33, 3, 30, '2023-02-17 16:27:18'),
(86, 33, 3, 161, '2023-02-17 16:27:19'),
(87, 33, 2, 79, '2023-02-17 16:27:34'),
(88, 33, 2, 11, '2023-02-17 16:27:35'),
(89, 33, 2, 164, '2023-02-17 16:27:35'),
(90, 33, 1, 142, '2023-02-17 16:27:37'),
(91, 33, 1, 60, '2023-02-17 16:27:37'),
(92, 33, 2, 97, '2023-02-17 16:28:20'),
(93, 33, 2, 34, '2023-02-17 16:28:20'),
(94, 33, 2, 105, '2023-02-17 16:28:58'),
(95, 33, 2, 15, '2023-02-17 16:28:59'),
(96, 33, 2, 123, '2023-02-17 16:29:02'),
(97, 33, 2, 164, '2023-02-17 16:29:04'),
(98, 33, 2, 56, '2023-02-17 16:29:04'),
(99, 33, 2, 30, '2023-02-17 16:29:05'),
(100, 33, 2, 112, '2023-02-17 16:29:06'),
(101, 33, 2, 164, '2023-02-17 16:29:07'),
(102, 33, 2, 90, '2023-02-17 16:29:07'),
(103, 33, 2, 30, '2023-02-17 16:29:08'),
(104, 33, 1, 123, '2023-02-17 16:29:13'),
(105, 33, 1, 179, '2023-02-17 16:29:14'),
(106, 33, 1, 67, '2023-02-17 16:29:15'),
(107, 33, 1, 127, '2023-02-17 16:30:08'),
(108, 33, 1, 26, '2023-02-17 16:30:09'),
(109, 33, 2, 90, '2023-02-17 16:30:11'),
(110, 33, 2, 164, '2023-02-17 16:30:11'),
(111, 33, 2, 120, '2023-02-17 16:30:14'),
(112, 33, 2, 60, '2023-02-17 16:30:14'),
(113, 33, 2, 11, '2023-02-17 16:30:15'),
(114, 33, 2, 123, '2023-02-17 16:30:17'),
(115, 33, 2, 45, '2023-02-17 16:30:18'),
(116, 33, 2, 123, '2023-02-17 16:33:12'),
(117, 33, 2, 172, '2023-02-17 16:33:14'),
(118, 33, 2, 101, '2023-02-17 16:33:15'),
(119, 33, 2, 75, '2023-02-17 16:33:15'),
(120, 33, 2, 49, '2023-02-17 16:33:16'),
(121, 33, 1, 131, '2023-02-17 16:33:17'),
(122, 33, 1, 82, '2023-02-17 16:33:17'),
(123, 33, 1, 15, '2023-02-17 16:33:20'),
(124, 33, 1, 97, '2023-02-17 16:33:21'),
(125, 33, 2, 161, '2023-02-17 16:33:22'),
(126, 33, 2, 112, '2023-02-17 16:33:23'),
(127, 33, 2, 45, '2023-02-17 16:33:24'),
(128, 33, 1, 153, '2023-02-17 16:33:35'),
(129, 33, 1, 172, '2023-02-17 16:33:36'),
(130, 33, 1, 95, '2023-02-17 16:33:37'),
(131, 33, 1, 39, '2023-02-17 16:33:37'),
(132, 33, 2, 95, '2023-02-17 16:33:38'),
(133, 33, 3, 100, '2023-02-17 16:44:59'),
(134, 33, 3, 223, '2023-02-17 16:45:01'),
(135, 33, 3, -82, '2023-02-17 16:45:02'),
(136, 33, 3, -191, '2023-02-17 16:45:02'),
(137, 33, 1, 137, '2023-02-17 16:45:05'),
(138, 33, 1, 39, '2023-02-17 16:45:10'),
(139, 33, 1, 95, '2023-02-17 16:45:11'),
(140, 33, 1, 52, '2023-02-17 16:45:14'),
(141, 33, 1, 135, '2023-02-17 16:45:14'),
(142, 33, 1, 0, '2023-02-17 16:45:18'),
(143, 33, 2, 180, '2023-02-17 16:45:22'),
(144, 33, 3, 45, '2023-02-17 16:45:28'),
(145, 33, 3, 123, '2023-02-17 16:45:28'),
(146, 33, 3, 182, '2023-02-17 16:45:29'),
(147, 33, 3, -46, '2023-02-17 16:45:30'),
(148, 33, 3, -5, '2023-02-17 16:45:30'),
(149, 33, 3, 13, '2023-02-17 16:45:32'),
(150, 33, 3, -9, '2023-02-17 16:45:36'),
(151, 33, 3, 50, '2023-02-17 16:45:37'),
(152, 33, 3, -23, '2023-02-17 16:45:41'),
(153, 33, 4, 73, '2023-02-17 16:45:44'),
(154, 33, 4, 155, '2023-02-17 16:45:44'),
(155, 33, 4, 0, '2023-02-17 16:45:45'),
(156, 33, 4, -100, '2023-02-17 16:45:46'),
(157, 33, 4, -146, '2023-02-17 16:45:46'),
(158, 33, 4, 0, '2023-02-17 16:45:47'),
(159, 33, 4, 64, '2023-02-17 16:45:47'),
(160, 33, 4, 114, '2023-02-17 16:45:47'),
(161, 33, 4, 173, '2023-02-17 16:46:03'),
(162, 33, 4, 41, '2023-02-17 16:46:03'),
(163, 33, 4, -150, '2023-02-17 16:46:04'),
(164, 33, 4, -9, '2023-02-17 16:46:04'),
(165, 33, 4, 82, '2023-02-17 16:46:05'),
(166, 33, 5, 177, '2023-02-17 16:46:11'),
(167, 33, 5, 54, '2023-02-17 16:46:11'),
(168, 33, 5, -87, '2023-02-17 16:46:12'),
(169, 33, 5, 59, '2023-02-17 16:46:13'),
(170, 33, 5, 141, '2023-02-17 16:46:13'),
(171, 33, 2, 71, '2023-02-17 16:46:27'),
(172, 33, 1, 79, '2023-02-17 16:46:28'),
(173, 33, 1, 135, '2023-02-17 16:46:28'),
(174, 33, 1, 77, '2023-02-17 16:46:31'),
(175, 33, 1, 27, '2023-02-17 16:46:32'),
(176, 33, 3, 110, '2023-02-17 16:46:43'),
(177, 33, 3, -110, '2023-02-17 16:46:46'),
(178, 33, 3, 171, '2023-02-17 16:46:48'),
(179, 33, 3, 118, '2023-02-17 16:46:53'),
(180, 33, 3, 215, '2023-02-17 16:46:53'),
(181, 33, 4, 189, '2023-02-17 16:46:55'),
(182, 33, 4, -40, '2023-02-17 16:46:55'),
(183, 33, 4, 171, '2023-02-17 16:46:56'),
(184, 33, 3, -110, '2023-02-17 16:49:39'),
(185, 33, 3, 92, '2023-02-17 16:49:39'),
(186, 33, 3, -146, '2023-02-17 16:49:40'),
(187, 33, 3, -251, '2023-02-17 16:49:41'),
(188, 33, 3, 13, '2023-02-17 16:49:41'),
(189, 33, 3, 180, '2023-02-17 16:49:42'),
(190, 33, 3, 66, '2023-02-17 16:49:44'),
(191, 33, 3, 4, '2023-02-17 16:49:44'),
(192, 33, 3, -93, '2023-02-17 16:49:46'),
(193, 33, 3, 30, '2023-02-17 16:49:46'),
(194, 33, 3, 136, '2023-02-17 16:49:49'),
(195, 33, 3, 198, '2023-02-17 16:49:49'),
(196, 33, 3, 145, '2023-02-17 16:50:30'),
(197, 33, 4, 154, '2023-02-17 16:50:32'),
(198, 33, 4, -207, '2023-02-17 16:50:33'),
(199, 33, 3, 73, '2023-02-17 16:54:24'),
(200, 33, 3, 125, '2023-02-17 16:54:24'),
(201, 33, 4, -146, '2023-02-17 16:54:26'),
(202, 33, 4, 66, '2023-02-17 16:54:27'),
(203, 33, 4, 189, '2023-02-17 16:54:28'),
(204, 33, 4, 22, '2023-02-17 16:54:29'),
(205, 33, 4, -93, '2023-02-17 16:54:29'),
(206, 33, 5, -84, '2023-02-17 16:54:30'),
(207, 33, 5, 136, '2023-02-17 16:54:31'),
(208, 33, 5, 224, '2023-02-17 16:54:31'),
(209, 33, 5, 57, '2023-02-17 16:54:32'),
(210, 33, 5, -66, '2023-02-17 16:54:32'),
(211, 33, 5, -190, '2023-02-17 16:54:33'),
(212, 33, 2, 119, '2023-02-17 16:57:40'),
(213, 33, 2, 150, '2023-02-17 16:57:41'),
(214, 33, 2, 29, '2023-02-17 16:57:43'),
(215, 33, 1, 91, '2023-02-17 16:57:51'),
(216, 33, 1, 156, '2023-02-17 16:57:52'),
(217, 33, 2, 94, '2023-02-17 16:57:54'),
(218, 33, 2, 113, '2023-02-17 16:57:54'),
(219, 33, 3, 101, '2023-02-17 16:57:57'),
(220, 33, 3, -84, '2023-02-17 16:58:00'),
(221, 33, 3, 83, '2023-02-17 16:58:01'),
(222, 33, 4, 136, '2023-02-17 16:58:03'),
(223, 33, 4, -146, '2023-02-17 16:58:03'),
(224, 33, 4, -14, '2023-02-17 16:58:04'),
(225, 33, 3, 145, '2023-02-17 16:58:29'),
(226, 33, 3, -75, '2023-02-17 16:58:30'),
(227, 33, 3, 215, '2023-02-17 16:58:31'),
(228, 33, 4, 171, '2023-02-17 16:58:33'),
(229, 33, 4, -84, '2023-02-17 16:58:33'),
(230, 33, 4, 163, '2023-02-17 16:58:34'),
(231, 33, 3, 145, '2023-02-17 16:59:07'),
(232, 33, 3, 207, '2023-02-17 16:59:19'),
(233, 32, 1, 3, '2023-03-26 16:02:59'),
(234, 32, 1, 3, '2023-03-26 16:03:03'),
(235, 32, 1, 3, '2023-05-10 22:19:02'),
(236, 32, 1, 3, '2023-05-10 22:19:02'),
(237, 32, 1, 3, '2023-08-13 02:10:19'),
(238, 24, 1, 5000, '2023-08-14 08:05:30'),
(239, 32, 1, 3, '2023-08-16 07:34:55'),
(240, 32, 1, 3, '2023-08-22 08:12:15'),
(241, 32, 1, 3, '2023-08-22 19:42:02'),
(242, 32, 1, 3, '2023-09-08 10:28:11'),
(243, 32, 1, 3, '2023-09-08 10:28:11'),
(244, 32, 1, 3, '2023-09-15 08:42:35'),
(245, 24, 1, 5000, '2023-10-29 13:38:50');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`code_id`);

--
-- Индексы таблицы `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`org_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user_org`
--
ALTER TABLE `user_org`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_sensors`
--
ALTER TABLE `user_sensors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vals`
--
ALTER TABLE `vals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `codes`
--
ALTER TABLE `codes`
  MODIFY `code_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `organizations`
--
ALTER TABLE `organizations`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_org`
--
ALTER TABLE `user_org`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `user_sensors`
--
ALTER TABLE `user_sensors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `vals`
--
ALTER TABLE `vals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
