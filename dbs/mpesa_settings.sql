-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 29, 2022 at 06:40 PM
-- Server version: 5.7.34-log
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_ngoism`
--

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_settings`
--

CREATE TABLE `mpesa_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mpesa_passkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_consumerkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_consumersecret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_env` enum('sandbox','live') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `mpesa_callbackurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_confirmationurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_validationurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_shortcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_testshortcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_status` tinyint(4) NOT NULL DEFAULT '0',
  `mpesa_testpasskey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_testconsumerkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_testconsumersecret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_testamount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_settings`
--

INSERT INTO `mpesa_settings` (`id`, `mpesa_passkey`, `mpesa_consumerkey`, `mpesa_consumersecret`, `mpesa_env`, `mpesa_callbackurl`, `mpesa_confirmationurl`, `mpesa_validationurl`, `mpesa_shortcode`, `mpesa_amount`, `mpesa_testshortcode`, `mpesa_status`, `mpesa_testpasskey`, `mpesa_testconsumerkey`, `mpesa_testconsumersecret`, `mpesa_testamount`, `created_at`, `updated_at`) VALUES
(1, '90020be9dcd71ba5fd15989675270c3315b4444759386632ae68dd5856afc5b1', 'r9ikbb8UFYYQTFnq7FLx0IAGlGJQ4wqe', 'qhGKV1tbiNAH7Z8T', 'live', NULL, NULL, NULL, '164762', NULL, '174379', 0, '90020be9dcd71ba5fd15989675270c3315b4444759386632ae68dd5856afc5b1', '2sh2YA1fTzQwrZJthIrwLMoiOi3nhhal', 'CKaCnw224K4Lc56w', '1', '2022-10-19 13:29:58', '2022-10-29 10:49:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mpesa_settings`
--
ALTER TABLE `mpesa_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mpesa_settings`
--
ALTER TABLE `mpesa_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
