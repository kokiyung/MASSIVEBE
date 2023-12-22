-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 05:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pesanin`
--
CREATE DATABASE IF NOT EXISTS `pesanin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pesanin`;

-- --------------------------------------------------------

--
-- Table structure for table `mitra`
--

CREATE TABLE `mitra` (
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cafename` varchar(100) NOT NULL,
  `phone` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mitra`
--

INSERT INTO `mitra` (`username`, `name`, `cafename`, `phone`, `email`, `password`) VALUES
('test', 'joko', 'Fatimah', 2147483647, 'khoirul@gmail.com', 'test123'),
('test123', 'joko', 'Forest tree', 2147483647, 'khoirul@gmail.com', 'test123');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_pro` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `filepro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_pro`, `name`, `price`, `category`, `filepro`) VALUES
('b53', 'Packet Hemat 1', 66999, 'Food', 'image_1702989206162.jpg'),
('b590', 'paket 99', 90000, 'Snack', 'image_1702989287624.jpg'),
('PKT17', 'Break fast', 49998, 'Food', 'image_1703014107414.jpeg'),
('pkt21', 'Paket 21', 9000000, 'Food', 'image_1702992275253.jpeg'),
('Test353', 'Paket Hemat 53', 60000, 'Food', 'image_1703040844245.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(100) NOT NULL,
  `id_pro` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `pay` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `note` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pro`, `price`, `name`, `date`, `time`, `pay`, `status`, `note`) VALUES
('Joko08211', 'PKt17', 69000, 'Joko', '2023-12-20', '00:55:10', 'Debit', 'Accept', 'pesan dekat jendela'),
('Test789', 'Paket Hemat 53', 0, 'Iirul', '2023-12-20', '11:34:00', 'Debit', 'Accept', 'OUTDOOR');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `name`, `phone`, `email`, `password`) VALUES
('della12398', 'Khoirul Hidayanto', 2147483647, 'kjokam354@gmail.com', '78990'),
('della123980', 'Khoirul Hidayanto', 2147483647, 'kjokam354@gmail.com', '99999'),
('della1239807', 'Khoirul Hidayanto', 2147483647, 'kjokam354@gmail.com', '777777'),
('della12398079', 'Khoirul Hidayanto', 2147483647, 'kjokam354@gmail.com', 'jokowi123'),
('test', 'Khoirul Hidayanto', 2147483647, 'kjokam354@gmail.com', 'test123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mitra`
--
ALTER TABLE `mitra`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_pro`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
