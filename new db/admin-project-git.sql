-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2022 at 07:21 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin-project-git`
--

-- --------------------------------------------------------

--
-- Table structure for table `post_news`
--

CREATE TABLE `post_news` (
  `id` int(128) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 NOT NULL,
  `details` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `image` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(128) COLLATE utf8_german2_ci NOT NULL,
  `status` enum('pending','approved','rejected','') COLLATE utf8_german2_ci DEFAULT 'pending',
  `news_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Dumping data for table `post_news`
--

INSERT INTO `post_news` (`id`, `title`, `details`, `image`, `category`, `status`, `news_date`) VALUES
(55, 'Hello world', 'Hello world 456', 'team-4.jpg', 'Popularnews', 'pending', '2022-02-16 00:00:00.000000'),
(56, 'বিষ ছাড়া কিভাবে শাকসবজির পোকা দমন করবেন', 'বিষ ছাড়া কিভাবে শাকসবজির পোকা দমন করবেন', 'team-4.jpg', 'International', 'pending', '0000-00-00 00:00:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post_news`
--
ALTER TABLE `post_news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post_news`
--
ALTER TABLE `post_news`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
