-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 03:53 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `abandoned_cart`
--

CREATE TABLE `abandoned_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `days` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `author` text NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `isbn_number` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `author`, `user_id`, `isbn_number`, `updated_at`, `created_at`, `status`) VALUES
(10, 'ahmed', NULL, '1223', '2022-06-28 11:11:22', '2022-06-26 18:52:10', 1),
(20, 'Anas', NULL, '985', '2022-06-28 11:11:22', '2022-06-27 16:47:29', 1),
(21, 'Adam', NULL, '8466', '2022-06-28 11:11:22', '2022-06-27 16:48:35', 1),
(22, 'Aaser', NULL, '8764', '2022-06-28 11:11:22', '2022-06-27 16:49:12', 1),
(23, 'Ammar', NULL, '531', '2022-06-27 19:12:39', '2022-06-27 17:32:12', 1),
(24, 'Aaser', NULL, '51564', '2022-06-27 17:43:42', '2022-06-27 17:32:53', 1),
(25, 'Omar', NULL, '5461', '2022-06-27 17:33:30', '2022-06-27 17:33:30', 1),
(26, 'Amir', NULL, '664', '2022-06-27 17:34:05', '2022-06-27 17:34:05', 1),
(27, 'Any Book', NULL, '9856', '2022-06-27 18:35:19', '2022-06-27 18:35:19', 1),
(28, 'Ammar again', NULL, '32654', '2022-06-27 18:35:53', '2022-06-27 18:35:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `books_orders`
--

CREATE TABLE `books_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `days` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books_orders`
--

INSERT INTO `books_orders` (`id`, `book_id`, `order_id`, `days`, `created_at`, `updated_at`) VALUES
(14, 10, 13, 3, '2022-06-28 10:26:06', '2022-06-28 10:26:06'),
(15, 20, 13, 3, '2022-06-28 10:26:06', '2022-06-28 10:26:06'),
(16, 21, 13, 3, '2022-06-28 10:26:06', '2022-06-28 10:26:06'),
(17, 22, 13, 3, '2022-06-28 10:26:06', '2022-06-28 10:26:06'),
(18, 22, 14, 3, '2022-06-28 10:32:03', '2022-06-28 10:32:03'),
(19, 23, 14, 3, '2022-06-28 10:32:03', '2022-06-28 10:32:03'),
(20, 24, 14, 3, '2022-06-28 10:32:03', '2022-06-28 10:32:03'),
(21, 10, 16, 3, '2022-06-28 10:35:32', '2022-06-28 10:35:32'),
(22, 24, 16, 3, '2022-06-28 10:35:32', '2022-06-28 10:35:32'),
(23, 28, 16, 3, '2022-06-28 10:35:32', '2022-06-28 10:35:32');

-- --------------------------------------------------------

--
-- Table structure for table `book_data`
--

CREATE TABLE `book_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_data`
--

INSERT INTO `book_data` (`id`, `book_id`, `lang_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(9, 10, 1, 'Life Is Hard', 'Life Is Hard Life Is Hard', '2022-06-26 18:52:10', '2022-06-26 18:52:10'),
(10, 20, 1, 'No Thing', 'No Thing', '2022-06-27 16:47:29', '2022-06-27 16:47:29'),
(11, 21, 1, 'No Thing', 'Life Is Hard Life Is Hard Life Is Hard', '2022-06-27 16:48:35', '2022-06-27 16:48:35'),
(12, 22, 1, 'Test', 'No Thing', '2022-06-27 16:49:12', '2022-06-27 16:49:12'),
(13, 23, 1, 'Test Refund', 'No Thing', '2022-06-27 17:32:12', '2022-06-27 17:32:12'),
(14, 24, 1, 'Test', 'No Thing', '2022-06-27 17:32:53', '2022-06-27 17:32:53'),
(15, 25, 1, 'Testing', 'Life Is Hard Life Is Hard', '2022-06-27 17:33:30', '2022-06-27 17:33:30'),
(16, 26, 1, 'jkashdjsad', 'Life Is Hard Life Is Hard Life Is Hard', '2022-06-27 17:34:05', '2022-06-27 17:34:05'),
(17, 27, 1, 'Test Book too', 'asdasdasd', '2022-06-27 18:35:19', '2022-06-27 18:35:19'),
(18, 28, 1, 'Testing', 'Life is hard Life is hard', '2022-06-27 18:35:53', '2022-06-27 18:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `book_id`, `created_at`, `updated_at`) VALUES
(4, '/uploads/books/10/1656276730.jpg', 10, '2022-06-26 20:52:10', '2022-06-26 18:52:10'),
(5, '/uploads/books/10/1656276730.jpg', 10, '2022-06-26 20:52:10', '2022-06-26 18:52:10'),
(6, '/uploads/books/20/1656355649.jpg', 20, '2022-06-27 18:47:29', '2022-06-27 16:47:29'),
(7, '/uploads/books/20/1656355649.jpg', 20, '2022-06-27 18:47:29', '2022-06-27 16:47:29'),
(8, '/uploads/books/21/1656355715.jpg', 21, '2022-06-27 18:48:35', '2022-06-27 16:48:35'),
(9, '/uploads/books/21/1656355715.jpg', 21, '2022-06-27 18:48:35', '2022-06-27 16:48:35'),
(10, '/uploads/books/22/1656355752.jpg', 22, '2022-06-27 18:49:12', '2022-06-27 16:49:12'),
(11, '/uploads/books/23/1656358332.jpg', 23, '2022-06-27 19:32:12', '2022-06-27 17:32:12'),
(12, '/uploads/books/24/1656358373.jpg', 24, '2022-06-27 19:32:53', '2022-06-27 17:32:53'),
(13, '/uploads/books/25/1656358410.jpg', 25, '2022-06-27 19:33:30', '2022-06-27 17:33:30'),
(14, '/uploads/books/26/1656358445.jpg', 26, '2022-06-27 19:34:05', '2022-06-27 17:34:05'),
(15, '/uploads/books/27/1656362119.jpg', 27, '2022-06-27 20:35:19', '2022-06-27 18:35:19'),
(16, '/uploads/books/28/1656362153.jpg', 28, '2022-06-27 20:35:53', '2022-06-27 18:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` text NOT NULL,
  `title` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `title`, `created_at`) VALUES
(1, 'EN', 'English', '2022-06-26 17:14:19'),
(2, 'AR', 'العربية', '2022-06-26 17:14:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `days` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `days`, `created_at`, `updated_at`, `status_id`) VALUES
(13, 1, NULL, '2022-06-28 13:11:22', '2022-06-28 11:11:22', 7),
(14, 1, NULL, '2022-06-28 12:37:37', '2022-06-28 10:37:37', 3),
(16, 1, NULL, '2022-06-28 12:36:55', '2022-06-28 10:36:55', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Wait', '2022-06-26 17:30:54', NULL),
(2, 'Borrowed', '2022-06-26 21:37:47', NULL),
(3, 'Refused', '2022-06-26 22:06:59', NULL),
(5, 'Refund', '2022-06-27 19:08:46', NULL),
(7, 'Complete', '2022-06-27 19:44:28', NULL),
(8, 'Cancel', '2022-06-27 20:25:59', NULL),
(9, 'Refund-Refused', '2022-06-27 20:29:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `assignable_type` text NOT NULL,
  `assignable_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `assignable_type`, `assignable_id`, `created_at`, `updated_at`) VALUES
(5, 'tag1', 'book', 10, '2022-06-26 18:52:10', '2022-06-26 18:52:10'),
(6, 'tag2', 'book', 10, '2022-06-26 18:52:10', '2022-06-26 18:52:10'),
(7, 'tag1', 'book', 20, '2022-06-27 16:47:29', '2022-06-27 16:47:29'),
(8, 'tag4', 'book', 20, '2022-06-27 16:47:29', '2022-06-27 16:47:29'),
(9, 'tag3', 'book', 21, '2022-06-27 16:48:35', '2022-06-27 16:48:35'),
(10, 'tag4', 'book', 21, '2022-06-27 16:48:35', '2022-06-27 16:48:35'),
(11, 'tag1', 'book', 22, '2022-06-27 16:49:12', '2022-06-27 16:49:12'),
(12, 'tag4', 'book', 22, '2022-06-27 16:49:12', '2022-06-27 16:49:12'),
(13, 'tag1', 'book', 23, '2022-06-27 17:32:12', '2022-06-27 17:32:12'),
(14, 'tag2', 'book', 23, '2022-06-27 17:32:12', '2022-06-27 17:32:12'),
(15, 'tag3', 'book', 24, '2022-06-27 17:32:53', '2022-06-27 17:32:53'),
(16, 'tag4', 'book', 24, '2022-06-27 17:32:53', '2022-06-27 17:32:53'),
(17, 'tag3', 'book', 26, '2022-06-27 17:34:05', '2022-06-27 17:34:05'),
(18, 'tag4', 'book', 26, '2022-06-27 17:34:05', '2022-06-27 17:34:05'),
(19, 'tag1', 'book', 27, '2022-06-27 18:35:19', '2022-06-27 18:35:19'),
(20, 'tag2', 'book', 27, '2022-06-27 18:35:19', '2022-06-27 18:35:19'),
(21, 'tag1', 'book', 28, '2022-06-27 18:35:53', '2022-06-27 18:35:53'),
(22, 'tag2', 'book', 28, '2022-06-27 18:35:53', '2022-06-27 18:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `guard`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'web', 'ahmed.hussein.202050@gmail.com', NULL, '$2y$10$EdHCjSfr7z4MYloS8jsmNOYo7quudNB/f7UZW1k0UZelFRcJ1StUi', NULL, '2022-06-26 16:42:40', '2022-06-26 16:42:40'),
(2, 'omar', 'admin', 'omar@email.com', '2022-06-26 18:43:07', '$2y$10$EdHCjSfr7z4MYloS8jsmNOYo7quudNB/f7UZW1k0UZelFRcJ1StUi', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abandoned_cart`
--
ALTER TABLE `abandoned_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books_orders`
--
ALTER TABLE `books_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_data`
--
ALTER TABLE `book_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abandoned_cart`
--
ALTER TABLE `abandoned_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `books_orders`
--
ALTER TABLE `books_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `book_data`
--
ALTER TABLE `book_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
