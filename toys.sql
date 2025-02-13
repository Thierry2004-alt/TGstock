-- Adminer 4.8.1 MySQL 8.0.30 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `product_supplier`;
CREATE TABLE `product_supplier` (
  `product_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `product_supplier_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_supplier_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `product_supplier` (`product_id`, `supplier_id`, `product_supplier_id`) VALUES
(1,	2,	1);

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `category` enum('toy','game') DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `products` (`product_id`, `product_name`, `description`, `category`, `price`) VALUES
(1,	'lego set',	'A popular building toy for kids',	'toy',	4900.00),
(2,	'Monopoly',	'A classic board game for families',	'game',	1900.00),
(3,	'Barbie doll',	'a fashionable doll for young girls',	'toy',	2900.00),
(4,	'Nerf Gun',	'A fun toy for kids to play with friends',	'toy',	3900.00),
(5,	'teddy bear',	'a cuddly plush toy for kids',	'toy',	900.00),
(6,	'scrabble',	'a cool word game',	'game',	2000.00),
(7,	'Scrabble',	'A fun toy for kids to play with friends',	'game',	2000.00),
(8,	'barbie',	'gurly doll',	'toy',	2000.00);

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `product_supplier_id` int DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  KEY `stock_id` (`stock_id`),
  KEY `product_supplier_id` (`product_supplier_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`),
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`product_supplier_id`) REFERENCES `product_supplier` (`product_supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `report` (`report_id`, `stock_id`, `product_supplier_id`, `time`) VALUES
(1,	1,	1,	'2025-02-11 17:48:15');

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `stocks` (`stock_id`, `product_id`, `quantity`, `location`) VALUES
(1,	1,	4,	'batouri');

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `phone`, `address`) VALUES
(1,	'anderson',	'679405992',	'Garoua'),
(2,	'Edge',	'650515159',	'Batouri'),
(3,	'Meave',	'691491680',	'Yaounde'),
(4,	'henry',	'678250313',	'batouri');

DROP TABLE IF EXISTS `toys`;
CREATE TABLE `toys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `category` text,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` enum('admin','staff','superadmin') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1,	'thierry',	'11335',	'admin'),
(2,	'jessica',	'052040',	'staff'),
(3,	'john',	'8963',	'staff'),
(19,	'onana',	'1984a0',	'superadmin');

-- 2025-02-11 23:02:00
