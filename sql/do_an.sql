-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2022 at 11:38 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `do_an`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` text NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `phone`, `address`, `gender`, `birthday`, `email`, `password`, `level`) VALUES
(99999999, 'Admin', 0, '', 0, '0000-00-00', 'admin@gmail.com', '123', 0),
(888888888, 'Super Admin', 0, '', 0, '0000-00-00', 'superadmin@gmail.com', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Áo'),
(2, 'Quần'),
(3, 'Phụ kiện');

-- --------------------------------------------------------

--
-- Table structure for table `category_detail`
--

CREATE TABLE `category_detail` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_detail`
--

INSERT INTO `category_detail` (`id`, `name`, `category_id`) VALUES
(1, 'Áo thun', 1),
(2, 'Jacket', 1),
(3, 'Hoodie', 1),
(4, 'Sweater', 1),
(5, 'Áo sơmi', 1),
(6, 'Áo ba lỗ', 1),
(19, 'Quần dài', 2),
(20, 'Quần short', 2),
(21, 'Mũ / nón', 3),
(22, 'Tất ', 3),
(23, 'Balo / túi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `comment_product`
--

CREATE TABLE `comment_product` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `birthday`, `email`, `password`, `token`, `phone`, `address`) VALUES
(2, 'thien', NULL, NULL, '456@gmail.com', '456', 'user_61d5647d8a7757.26499859', 11111, 'phu yen'),
(3, 'user1', NULL, NULL, 'user123@gmail.com', '123', NULL, 0, ''),
(6, 'ha', 0, '2002-02-10', '123@gmail.com', '123', 'user_61d5742a10bc48.59755064', 0, ''),
(7, 'hoang', 1, '2002-01-01', 'hoang@gmail.com', '123456a', NULL, 0, ''),
(8, 'ah', 1, '2002-01-01', 'maioi@gmail.com', '123456a', NULL, 0, ''),
(9, 'hong', 0, '2002-02-02', 'hong123@gmail.com', '123456a', NULL, 0, ''),
(10, 'hai', 1, '2002-01-03', 'hai@gmail.com', '123456a', NULL, 0, ''),
(13, 'hung', 1, '2002-01-01', 'hung@gmail.com', '123456a', NULL, 0, ''),
(14, 'truong', 1, '2002-01-01', 'truong@gmail.com', '123456a', NULL, 0, ''),
(17, 'anh', 1, '2002-01-01', 'anh@gmail.com', '123456a', NULL, 0, ''),
(18, 'User', NULL, NULL, '', '', NULL, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `detail_orders`
--

CREATE TABLE `detail_orders` (
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_orders`
--

INSERT INTO `detail_orders` (`orders_id`, `product_id`, `quantity`) VALUES
(31, 52, 1),
(31, 53, 1),
(32, 52, 2),
(33, 52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(48, 'China'),
(50, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name_receive` varchar(50) NOT NULL,
  `phone_receive` varchar(11) NOT NULL,
  `address_receive` text NOT NULL,
  `note` text NOT NULL,
  `status` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `time`, `name_receive`, `phone_receive`, `address_receive`, `note`, `status`, `customer_id`, `total_price`) VALUES
(31, '2022-01-08 09:31:10', 'thien dep trai', '123123', '12312312', '', 1, 2, 322221),
(32, '2022-01-08 09:33:29', 'qaaa', '123123', '123', '2', 2, 18, 444444),
(33, '2022-01-08 10:35:46', '12312', '-1123123', '123123', '1231', 0, 2, 222222);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `img` text NOT NULL,
  `price` int(11) NOT NULL,
  `manufacturers_id` int(11) NOT NULL,
  `category_detail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `img`, `price`, `manufacturers_id`, `category_detail_id`) VALUES
(52, 'Áo', 'áo', '1641634067.jpg', 222222, 48, 1),
(53, 'Quần', 'Quần', '1641634077.jpg', 99999, 48, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_detail`
--
ALTER TABLE `category_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten` (`name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `comment_product`
--
ALTER TABLE `comment_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`customer_id`),
  ADD KEY `id_product` (`product_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD PRIMARY KEY (`orders_id`,`product_id`),
  ADD KEY `id_product` (`product_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_manufactures_product` (`manufacturers_id`),
  ADD KEY `fk_category_product` (`category_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=888888889;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_detail`
--
ALTER TABLE `category_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `comment_product`
--
ALTER TABLE `comment_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_detail`
--
ALTER TABLE `category_detail`
  ADD CONSTRAINT `category_detail_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `comment_product`
--
ALTER TABLE `comment_product`
  ADD CONSTRAINT `comment_product_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `comment_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD CONSTRAINT `detail_orders_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `detail_orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_manufactures_product` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_detail_id`) REFERENCES `category_detail` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
