-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 02 2023 г., 14:09
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bike-store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bikes`
--

CREATE TABLE `bikes` (
  `id` int NOT NULL COMMENT 'bike id',
  `brand_id` int NOT NULL COMMENT 'brand',
  `category_id` int NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb3 NOT NULL COMMENT 'model',
  `color_id` int NOT NULL COMMENT 'color',
  `description` varchar(255) CHARACTER SET utf8mb3 NOT NULL COMMENT 'bike description',
  `price` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL COMMENT 'check id',
  `client_id` int NOT NULL COMMENT 'client id',
  `changed` date NOT NULL COMMENT 'date of change'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cart_bikes`
--

CREATE TABLE `cart_bikes` (
  `id` int NOT NULL,
  `bike_id` int NOT NULL COMMENT 'FK from bikes',
  `cart_id` int NOT NULL COMMENT 'FK from cart, cart related to client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `cart_id` int NOT NULL COMMENT 'копируется из корзины. (ид чека)',
  `client_id` int NOT NULL COMMENT 'ид клиента, кто купил товар',
  `bike_id` int NOT NULL COMMENT 'ид купленного байка',
  `amount` int NOT NULL COMMENT 'копируется из корзины. (количество)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_bikes`
--

CREATE TABLE `orders_bikes` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `bike_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL COMMENT 'ид обзора',
  `bike_id` int NOT NULL COMMENT 'bike id',
  `client_id` int NOT NULL COMMENT 'client id',
  `text` varchar(255) CHARACTER SET utf8mb3 NOT NULL COMMENT 'текст обзора',
  `rating` int NOT NULL COMMENT 'рейтинг, оставленный клиентом'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL COMMENT 'id клиента',
  `name` varchar(200) CHARACTER SET utf8mb3 NOT NULL COMMENT 'имя клиента',
  `mail` varchar(200) CHARACTER SET utf8mb3 NOT NULL COMMENT 'почта клиента',
  `phone` varchar(20) CHARACTER SET utf8mb3 NOT NULL COMMENT 'телефон клиента',
  `password` varchar(150) CHARACTER SET utf8mb3 NOT NULL COMMENT 'пароль',
  `level` int NOT NULL COMMENT 'уровень допуска'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `mail`, `phone`, `password`, `level`) VALUES
(1, 'Name', 'mailkjdfgk@kona.eu', '1232153', 'dhdfghdf', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart_bikes`
--
ALTER TABLE `cart_bikes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'bike id';

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'check id';

--
-- AUTO_INCREMENT для таблицы `cart_bikes`
--
ALTER TABLE `cart_bikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ид обзора';

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id клиента', AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
