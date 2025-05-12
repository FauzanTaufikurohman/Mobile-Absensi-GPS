-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2025 at 10:53 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absen`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('masuk','keluar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_11_181412_create_absensi_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api-token', '698acf522a6a6e6f9ae21184a267c04b08dea4c85b9b20ee1800c02b1629654e', '[\"*\"]', NULL, NULL, '2025-05-11 12:30:36', '2025-05-11 12:30:36'),
(2, 'App\\Models\\User', 3, 'api-token', '31fd0f6250681e40fc42a277bfd9e30055c1b7ab714210fd1c610db97d1aefc8', '[\"*\"]', NULL, NULL, '2025-05-11 12:31:25', '2025-05-11 12:31:25'),
(3, 'App\\Models\\User', 3, 'api-token', 'a986e2c1093c6b5f323050842ff142ce0a46ae132a88f40ddbbcd2f78a3c69a4', '[\"*\"]', NULL, NULL, '2025-05-11 12:40:46', '2025-05-11 12:40:46'),
(4, 'App\\Models\\User', 3, 'api-token', 'a9580e5191a7687e6a9afca7b6e9b6654b21aa4fb3b2c56e7a3fe794480cfe10', '[\"*\"]', NULL, NULL, '2025-05-11 13:01:00', '2025-05-11 13:01:00'),
(5, 'App\\Models\\User', 2, 'api-token', 'ddcb0d88155f95154c4ae0382590a2ed76003bf11919b822ef9cf218c75f5773', '[\"*\"]', NULL, NULL, '2025-05-11 13:02:12', '2025-05-11 13:02:12'),
(6, 'App\\Models\\User', 2, 'api-token', '8d567afaf4d47e0a7f60d05dd53e49fe84e6319a305e72d5a91e017ec4a98fd2', '[\"*\"]', NULL, NULL, '2025-05-11 13:02:14', '2025-05-11 13:02:14'),
(7, 'App\\Models\\User', 3, 'api-token', '24ce0186f1903707b789d03eff7a3d89f851381789e66bcbfb0f1ee044881047', '[\"*\"]', NULL, NULL, '2025-05-11 13:03:07', '2025-05-11 13:03:07'),
(8, 'App\\Models\\User', 2, 'api-token', '874e19b45e3c35ccf724a537f0ae1cd605fcd2caad263da9d9bb2f4b216aa793', '[\"*\"]', NULL, NULL, '2025-05-11 13:03:18', '2025-05-11 13:03:18'),
(9, 'App\\Models\\User', 3, 'api-token', '8d90c2bcba74c853e4e625098e574c85313a1fb84d6648755846c08e834e7996', '[\"*\"]', NULL, NULL, '2025-05-11 13:03:39', '2025-05-11 13:03:39'),
(10, 'App\\Models\\User', 3, 'api-token', 'd3aae612e4f8a38a9cce4c68528cd7e82fa0257bb84f95b13d142408b9ca2784', '[\"*\"]', NULL, NULL, '2025-05-11 13:05:31', '2025-05-11 13:05:31'),
(11, 'App\\Models\\User', 3, 'api-token', '7458591565770c3ac5615676fd4aebcc0f34e93e1f6f5881e354a1de55417279', '[\"*\"]', NULL, NULL, '2025-05-11 13:05:56', '2025-05-11 13:05:56'),
(12, 'App\\Models\\User', 3, 'api-token', '69a6f9184f40f678ef66a4ffd9e81c10c6f0736c3f8371627f63d3481ebef8c1', '[\"*\"]', NULL, NULL, '2025-05-11 13:06:26', '2025-05-11 13:06:26'),
(13, 'App\\Models\\User', 3, 'api-token', '31a81df7e02289bfcda0eb0d8a793349c56f9111935ac4dea1ec0bf51b4168ea', '[\"*\"]', NULL, NULL, '2025-05-11 13:06:57', '2025-05-11 13:06:57'),
(14, 'App\\Models\\User', 3, 'api-token', 'cbdfed44745a7196b2d23ac705ff3b6f7ff8b6ccb202ba3578aeba2c92d1e565', '[\"*\"]', NULL, NULL, '2025-05-11 13:08:06', '2025-05-11 13:08:06'),
(15, 'App\\Models\\User', 3, 'api-token', '8e90efb94f59abbaa55491f574bf81724ddc2275fa8d63ebfb5d91e45445b3cb', '[\"*\"]', NULL, NULL, '2025-05-11 13:08:22', '2025-05-11 13:08:22'),
(16, 'App\\Models\\User', 3, 'api-token', 'f75963adff6291c969db55f46ff78cadb25ed7ceaadd68fbb3f3d94baa6a670d', '[\"*\"]', NULL, NULL, '2025-05-11 13:09:16', '2025-05-11 13:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'fauzan', 'fauzan123@gmail.com', NULL, '$2y$10$/EHlj7t9dUgfR/NXT1LaCuC3aKiD50AWR0CpoFG13PRyyY3QU9aqa', NULL, '2025-05-11 12:27:04', '2025-05-11 12:27:04'),
(3, 'jo', 'jojo@gmail.com', NULL, '$2y$10$yzsrxG3NyZtyms0DV7NBzOoCO9jikA4Rlpt.JLdM6H4bQxg2aP3De', NULL, '2025-05-11 12:31:08', '2025-05-11 12:31:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensi_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
