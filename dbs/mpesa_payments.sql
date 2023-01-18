-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 29, 2022 at 06:38 PM
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
-- Table structure for table `mpesa_payments`
--

CREATE TABLE `mpesa_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mpesa_response` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_payments`
--

INSERT INTO `mpesa_payments` (`id`, `phone`, `receipt_no`, `amount`, `mpesa_response`, `created_at`, `updated_at`) VALUES
(1, '254726425237', 'QIJ6A80R2Y', '10', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"40322-12644400-1\",\"CheckoutRequestID\":\"ws_CO_19092022172539612726425237\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":10},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QIJ6A80R2Y\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20220919172549},{\"Name\":\"PhoneNumber\",\"Value\":254726425237}]}}}}', '2022-10-20 19:03:09', '2022-10-20 19:03:09'),
(2, '254726425237', 'QIJ6A80R2Y', '10', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"40322-12644400-1\",\"CheckoutRequestID\":\"ws_CO_19092022172539612726425237\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":10},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QIJ6A80R2Y\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20220919172549},{\"Name\":\"PhoneNumber\",\"Value\":254726425237}]}}}}', '2022-10-20 19:05:00', '2022-10-20 19:05:00'),
(3, '254726582228', 'QJK7AIL67P', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"11227-7310690-1\",\"CheckoutRequestID\":\"ws_CO_20102022193203048726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJK7AIL67P\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221020193224},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-20 20:02:26', '2022-10-20 20:02:26'),
(4, '254702360897', 'QJK3ALUOXZ', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7371-12260562-1\",\"CheckoutRequestID\":\"ws_CO_20102022200027029702360897\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJK3ALUOXZ\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221020200043},{\"Name\":\"PhoneNumber\",\"Value\":254702360897}]}}}}', '2022-10-20 20:30:44', '2022-10-20 20:30:44'),
(5, '254726582228', 'QJK5AYCBVH', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"31698-8298566-2\",\"CheckoutRequestID\":\"ws_CO_20102022235504618726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJK5AYCBVH\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221020235521},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 00:25:22', '2022-10-21 00:25:22'),
(6, '254726582228', 'QJL0AYHACM', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7383-12447227-1\",\"CheckoutRequestID\":\"ws_CO_21102022000556777726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL0AYHACM\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021000617},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 00:36:18', '2022-10-21 00:36:18'),
(7, '254726582228', 'QJL9AYSX77', '2', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"11223-8051963-1\",\"CheckoutRequestID\":\"ws_CO_21102022003749432726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":2},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL9AYSX77\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021003803},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 01:08:04', '2022-10-21 01:08:04'),
(8, '254726582228', 'QJL0AYTI72', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7099-3804106-1\",\"CheckoutRequestID\":\"ws_CO_21102022004018007726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL0AYTI72\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021004032},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 01:10:33', '2022-10-21 01:10:33'),
(9, '254712595469', 'QJL9B62KU5', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"11221-8545270-1\",\"CheckoutRequestID\":\"ws_CO_21102022082133455712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL9B62KU5\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021082150},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-21 08:51:51', '2022-10-21 08:51:51'),
(10, '254712595469', 'QJL7B66SEH', '2', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18560-22900120-1\",\"CheckoutRequestID\":\"ws_CO_21102022082339784712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":2},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL7B66SEH\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021082354},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-21 08:53:55', '2022-10-21 08:53:55'),
(11, '254712595469', 'QJL4B720VI', '2', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7389-12669011-1\",\"CheckoutRequestID\":\"ws_CO_21102022083755000712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":2},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL4B720VI\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021083808},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-21 09:08:09', '2022-10-21 09:08:09'),
(12, '254726582228', 'QJL3BXAHO3', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18562-23890622-1\",\"CheckoutRequestID\":\"ws_CO_21102022143752801726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL3BXAHO3\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021143808},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 15:08:10', '2022-10-21 15:08:10'),
(13, '254726582228', 'QJL9BXPN39', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7093-5259128-1\",\"CheckoutRequestID\":\"ws_CO_21102022144321236726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL9BXPN39\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021144336},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 15:13:37', '2022-10-21 15:13:37'),
(14, '254726582228', 'QJL5BYCX5P', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"11226-9617459-2\",\"CheckoutRequestID\":\"ws_CO_21102022145148149726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL5BYCX5P\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021145201},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 15:22:03', '2022-10-21 15:22:03'),
(15, '254712595469', 'QJL1C1EM0R', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18550-24045214-1\",\"CheckoutRequestID\":\"ws_CO_21102022153058935712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL1C1EM0R\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021153121},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-21 16:01:22', '2022-10-21 16:01:22'),
(16, '254726582228', 'QJL8C5BGGS', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7384-12985411-1\",\"CheckoutRequestID\":\"ws_CO_21102022161959398726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL8C5BGGS\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021162012},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 16:50:14', '2022-10-21 16:50:14'),
(17, '254726582228', 'QJL1C9FE4H', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"120571-28334459-1\",\"CheckoutRequestID\":\"ws_CO_21102022170636352726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL1C9FE4H\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021170652},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-21 17:36:54', '2022-10-21 17:36:54'),
(18, '254712595469', 'QJL0CQASCM', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"31682-10820245-1\",\"CheckoutRequestID\":\"ws_CO_21102022193148455712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL0CQASCM\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021193203},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-21 20:02:04', '2022-10-21 20:02:04'),
(19, '254712595469', 'QJL5CQU07P', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7376-13159731-1\",\"CheckoutRequestID\":\"ws_CO_21102022193554781712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJL5CQU07P\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221021193610},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-21 20:06:12', '2022-10-21 20:06:12'),
(20, '254726582228', 'QJM0DDQPHQ', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"68431-46533460-1\",\"CheckoutRequestID\":\"ws_CO_22102022075435414726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM0DDQPHQ\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022075449},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 08:24:51', '2022-10-22 08:24:51'),
(21, '254726582228', 'QJM3DEO449', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"105442-26393496-1\",\"CheckoutRequestID\":\"ws_CO_22102022081046278726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM3DEO449\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022081100},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 08:41:01', '2022-10-22 08:41:01'),
(22, '254726582228', 'QJM8DFNE3K', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"11215-11872116-1\",\"CheckoutRequestID\":\"ws_CO_22102022082701814726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM8DFNE3K\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022082714},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 08:57:15', '2022-10-22 08:57:15'),
(23, '254726582228', 'QJM6DGGRL8', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"105457-26459549-1\",\"CheckoutRequestID\":\"ws_CO_22102022084009047726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM6DGGRL8\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022084025},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 09:10:26', '2022-10-22 09:10:26'),
(24, '254726582228', 'QJM3DH8LGX', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18554-26143863-1\",\"CheckoutRequestID\":\"ws_CO_22102022085207243726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM3DH8LGX\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022085220},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 09:22:21', '2022-10-22 09:22:21'),
(25, '254726582228', 'QJM3DQ5P4F', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"120578-29044475-1\",\"CheckoutRequestID\":\"ws_CO_22102022105749731726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM3DQ5P4F\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022105813},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 11:28:15', '2022-10-22 11:28:15'),
(26, '254726582228', 'QJM7DRITT1', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"105439-26876129-1\",\"CheckoutRequestID\":\"ws_CO_22102022111553528726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM7DRITT1\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022111610},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 11:46:11', '2022-10-22 11:46:11'),
(27, '254726582228', 'QJM4DSN99C', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"105452-26920017-1\",\"CheckoutRequestID\":\"ws_CO_22102022113037524726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM4DSN99C\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022113053},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 12:00:54', '2022-10-22 12:00:54'),
(28, '254726582228', 'QJM9DTDMCF', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7380-13763231-1\",\"CheckoutRequestID\":\"ws_CO_22102022113959222726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM9DTDMCF\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022114028},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 12:10:29', '2022-10-22 12:10:29'),
(29, '254726582228', 'QJM3DTV8J3', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"28903-12422442-1\",\"CheckoutRequestID\":\"ws_CO_22102022114632455726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM3DTV8J3\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022114646},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 12:16:48', '2022-10-22 12:16:48'),
(30, '254726582228', 'QJM6DU8DKM', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7115-7986559-1\",\"CheckoutRequestID\":\"ws_CO_22102022115104648726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM6DU8DKM\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022115135},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 12:21:36', '2022-10-22 12:21:36'),
(31, '254726582228', 'QJM4DWG6Z2', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"105459-27067327-1\",\"CheckoutRequestID\":\"ws_CO_22102022121932348726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM4DWG6Z2\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022122000},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 12:50:02', '2022-10-22 12:50:02'),
(32, '254726582228', 'QJM6E2UZLE', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"28899-12775302-1\",\"CheckoutRequestID\":\"ws_CO_22102022133903516726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM6E2UZLE\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022133917},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 14:09:18', '2022-10-22 14:09:18'),
(33, '254726582228', 'QJM0E4E5N0', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"531-17062110-1\",\"CheckoutRequestID\":\"ws_CO_22102022135716277726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM0E4E5N0\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022135729},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-22 14:27:30', '2022-10-22 14:27:30'),
(34, '254712595469', 'QJM7F1P00L', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18563-28204053-2\",\"CheckoutRequestID\":\"ws_CO_22102022193459093712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJM7F1P00L\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221022193525},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-22 20:05:27', '2022-10-22 20:05:27'),
(35, '254726582228', 'QJO3HS16UL', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7091-13669341-1\",\"CheckoutRequestID\":\"ws_CO_24102022083905400726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO3HS16UL\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024083919},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 09:09:21', '2022-10-24 09:09:21'),
(36, '254726582228', 'QJO0JKLLOK', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"68436-55140026-1\",\"CheckoutRequestID\":\"ws_CO_24102022211053064726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO0JKLLOK\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024211115},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 21:41:16', '2022-10-24 21:41:16'),
(37, '254726582228', 'QJO9JLXAG5', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"31703-20794921-1\",\"CheckoutRequestID\":\"ws_CO_24102022212912818726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO9JLXAG5\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024212929},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 21:59:31', '2022-10-24 21:59:31'),
(38, '254726582228', 'QJO0JMZLDU', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18548-34639627-1\",\"CheckoutRequestID\":\"ws_CO_24102022214549439726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO0JMZLDU\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024214606},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 22:16:07', '2022-10-24 22:16:07'),
(39, '254726582228', 'QJO5JNVZLL', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"11225-20755119-1\",\"CheckoutRequestID\":\"ws_CO_24102022220143984726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO5JNVZLL\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024220159},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 22:32:00', '2022-10-24 22:32:00'),
(40, '254726582228', 'QJO3JO04QP', '4', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"31684-20892214-1\",\"CheckoutRequestID\":\"ws_CO_24102022220405013726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":4},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO3JO04QP\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024220419},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 22:34:21', '2022-10-24 22:34:21'),
(41, '254726582228', 'QJO0JO3AHM', '3', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"68442-55295120-1\",\"CheckoutRequestID\":\"ws_CO_24102022220559414726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":3},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJO0JO3AHM\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221024220614},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-24 22:36:16', '2022-10-24 22:36:16'),
(42, '254712595469', 'QJP3JRMDQ1', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"120579-31697033-1\",\"CheckoutRequestID\":\"ws_CO_25102022011507058712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJP3JRMDQ1\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221025011526},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-25 01:45:27', '2022-10-25 01:45:27'),
(43, '254726582228', 'QJP2JTWPK2', '2', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"28884-21175078-1\",\"CheckoutRequestID\":\"ws_CO_25102022064103769726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":2},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJP2JTWPK2\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221025064117},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-25 07:11:18', '2022-10-25 07:11:18'),
(44, '254726582228', 'QJP3JUEA0Z', '2', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"7091-16555871-2\",\"CheckoutRequestID\":\"ws_CO_25102022065443807726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":2},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJP3JUEA0Z\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221025065458},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-25 07:24:59', '2022-10-25 07:24:59'),
(45, '254726582228', 'QJP0JUSBDY', '2', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"120572-31837223-1\",\"CheckoutRequestID\":\"ws_CO_25102022070428671726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":2},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJP0JUSBDY\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221025070449},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-25 07:34:50', '2022-10-25 07:34:50'),
(46, '254726582228', 'QJP2JUVL2E', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"31685-21464449-1\",\"CheckoutRequestID\":\"ws_CO_25102022070700760726582228\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJP2JUVL2E\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221025070716},{\"Name\":\"PhoneNumber\",\"Value\":254726582228}]}}}}', '2022-10-25 07:37:17', '2022-10-25 07:37:17'),
(47, '254110544790', 'QJT0TQZOA6', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"18560-48991658-1\",\"CheckoutRequestID\":\"ws_CO_29102022131829527110544790\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJT0TQZOA6\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221029131840},{\"Name\":\"PhoneNumber\",\"Value\":254110544790}]}}}}', '2022-10-29 13:48:41', '2022-10-29 13:48:41'),
(48, '254712595469', 'QJT9TRB27X', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"66404-32271135-1\",\"CheckoutRequestID\":\"ws_CO_29102022132151476712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJT9TRB27X\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221029132207},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-29 13:52:09', '2022-10-29 13:52:09'),
(49, '254712595469', 'QJT5TRF3ZV', '1', '{\"Body\":{\"stkCallback\":{\"MerchantRequestID\":\"22701-32321864-1\",\"CheckoutRequestID\":\"ws_CO_29102022132325261712595469\",\"ResultCode\":0,\"ResultDesc\":\"The service request is processed successfully.\",\"CallbackMetadata\":{\"Item\":[{\"Name\":\"Amount\",\"Value\":1},{\"Name\":\"MpesaReceiptNumber\",\"Value\":\"QJT5TRF3ZV\"},{\"Name\":\"Balance\"},{\"Name\":\"TransactionDate\",\"Value\":20221029132339},{\"Name\":\"PhoneNumber\",\"Value\":254712595469}]}}}}', '2022-10-29 13:53:40', '2022-10-29 13:53:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
