-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 12:03 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `punch_records`
--

CREATE TABLE `punch_records` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `punchTime` datetime DEFAULT NULL,
  `punchType` varchar(255) DEFAULT NULL,
  `punchMode` varchar(50) DEFAULT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `punch_records`
--

INSERT INTO `punch_records` (`id`, `userId`, `punchTime`, `punchType`, `punchMode`, `deviceId`, `created_at`, `updated_at`) VALUES
(1, 9, '2023-08-10 16:02:02', 'Finger', 'IN', '1', '2023-08-10 06:02:02', '2023-08-10 06:02:02'),
(2, 11, '2023-08-10 16:02:07', 'Finger', 'IN', '1', '2023-08-10 06:02:02', '2023-08-10 06:02:02'),
(3, 9, '2023-08-10 16:02:02', 'Finger', 'IN', '1', '2023-08-10 06:02:02', '2023-08-10 06:02:02'),
(4, 11, '2023-08-10 16:02:07', 'Finger', 'IN', '1', '2023-08-10 06:02:02', '2023-08-10 06:02:02'),
(5, 9, '2023-08-10 16:02:02', 'Finger', 'IN', '1', '2023-08-10 06:02:03', '2023-08-10 06:02:03'),
(6, 11, '2023-08-10 16:02:07', 'Finger', 'IN', '1', '2023-08-10 06:02:03', '2023-08-10 06:02:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `punch_records`
--
ALTER TABLE `punch_records`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `punch_records`
--
ALTER TABLE `punch_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
