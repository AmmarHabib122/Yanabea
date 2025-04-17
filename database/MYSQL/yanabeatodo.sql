-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2025 at 03:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yanabeatodo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_16_063304_update_users_table_for_username_and_nullable_email', 1),
(5, '2025_04_16_065540_create_todo_lists_table', 1),
(6, '2025_04_16_065547_create_todos_table', 1),
(7, '2025_04_16_222345_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'auth-token', 'f3bb9ae11477f66f0a45c28171a6e9cbda5d3543bec49aa9b51c92e541315a08', '[\"*\"]', NULL, NULL, '2025-04-16 22:16:45', '2025-04-16 22:16:45'),
(4, 'App\\Models\\User', 13, 'auth-token', '44d5c92667ce5129a3cbc064d42633434d696d0b90422211b70006e88b5029d8', '[\"*\"]', '2025-04-17 09:15:29', NULL, '2025-04-17 08:57:53', '2025-04-17 09:15:29'),
(5, 'App\\Models\\User', 14, 'auth-token', 'c678b9c80eb3a8643861af253aa686e0a2262bc7bde3cd04e643d97b0afca6d7', '[\"*\"]', NULL, NULL, '2025-04-17 09:17:13', '2025-04-17 09:17:13'),
(6, 'App\\Models\\User', 15, 'auth-token', 'a4898c773e11c1e7f0657ef1ed40aa3934cd8cf60660719f17cdfeec329acf5e', '[\"*\"]', '2025-04-17 12:41:29', NULL, '2025-04-17 12:24:52', '2025-04-17 12:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `todolist_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','completed','in_progress') NOT NULL DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `todolist_id`, `title`, `description`, `status`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sed impedit est.', NULL, 'in_progress', '2025-08-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(2, 1, 'Ullam dolore.', 'Et nostrum voluptatem ea in ea. Sed ut laudantium doloremque placeat sed sapiente cupiditate. Temporibus necessitatibus similique temporibus nostrum tempore molestiae nesciunt. Assumenda voluptates blanditiis ut accusantium dolorem.', 'in_progress', '2025-12-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(3, 1, 'Rerum asperiores nulla.', NULL, 'in_progress', '2026-03-08', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(4, 1, 'Nihil ipsa.', 'Temporibus asperiores quia temporibus ut. Ut quia et voluptas expedita nulla deserunt veritatis. Quibusdam saepe inventore odio delectus suscipit similique veniam. A animi dicta aperiam soluta.', 'in_progress', '2025-05-24', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(5, 1, 'Iure voluptatem quaerat.', 'Dolores vel vel nulla non dolores reprehenderit. Neque exercitationem et eos id ea aut. In fugiat error ullam est ut aut libero.', 'completed', '2026-01-06', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(6, 2, 'Magni rem voluptatem.', 'Assumenda aut tempore ab. Perspiciatis recusandae est voluptates quam eligendi. Recusandae soluta nesciunt debitis explicabo voluptas quia vel. Quod ullam molestias delectus quia eos tempore.', 'pending', '2025-11-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(7, 2, 'Illo dolores ea odio.', 'Et doloribus est sit dignissimos dolor. Et id numquam et sed eum hic. Nihil exercitationem consequatur sapiente ipsa.', 'completed', '2025-12-27', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(8, 2, 'Voluptatem culpa illum maxime ut.', 'Odio est quidem eum consequatur ex rem inventore. Aut beatae eveniet placeat magni quo.', 'in_progress', '2025-09-23', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(9, 2, 'Odit voluptate expedita neque.', NULL, 'pending', '2026-02-22', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(10, 2, 'Quisquam aut debitis.', 'Facere nam aliquam et. Nemo quam molestias a corrupti molestiae qui minima.', 'in_progress', '2025-06-11', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(11, 3, 'Placeat ut dolore magni.', NULL, 'completed', '2026-04-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(12, 3, 'Deserunt ratione ratione sapiente.', NULL, 'in_progress', '2025-08-18', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(13, 3, 'Eius a sit.', NULL, 'pending', '2025-11-22', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(14, 3, 'Quidem aut quia autem.', 'Inventore eligendi aut a quos molestiae. Voluptatem quia laborum et et commodi commodi totam. Dolore ea nihil saepe autem. Fuga quas est occaecati impedit consequatur.', 'pending', '2026-03-06', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(15, 3, 'Beatae amet.', NULL, 'in_progress', '2026-01-20', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(16, 4, 'Aut similique error.', 'Ea inventore qui rerum et assumenda. Inventore distinctio qui quas iste et vero tempora. Et eaque ex molestiae voluptas.', 'pending', '2025-10-01', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(17, 4, 'Id at.', 'Minima sunt inventore iste rerum. Nam odit nulla ut ut vero. Ipsam est rerum occaecati a maxime enim.', 'pending', '2025-10-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(18, 4, 'Dolorum exercitationem et.', 'Consequatur maxime et tenetur. Eius iste est dolorum. Consequatur qui possimus nam dignissimos inventore. Id laborum ipsum similique aut.', 'completed', '2025-12-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(19, 4, 'Ea aliquid voluptatibus dignissimos illo.', NULL, 'pending', '2025-09-20', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(20, 4, 'Aut ut ut quod.', 'Aut explicabo quia occaecati labore quod. Est aut eligendi ut provident modi. Et unde laborum cupiditate explicabo possimus mollitia aut. Et quia earum quia.', 'completed', '2026-03-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(21, 5, 'Ad earum reiciendis.', 'Ex est rem eveniet fugiat. Libero iure voluptatibus et autem et consequatur possimus. Ipsum voluptas ipsa pariatur vero qui libero porro.', 'in_progress', '2025-07-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(22, 5, 'Nisi quam omnis id.', NULL, 'in_progress', '2026-01-22', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(23, 5, 'In non omnis.', 'Corporis voluptatibus ab velit est. Quae et rerum et doloribus fugit. Laudantium ut voluptatibus iure sed cum. Hic harum omnis asperiores iste et quaerat.', 'pending', '2025-06-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(24, 5, 'Et minima consequatur et.', NULL, 'pending', '2025-05-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(25, 5, 'Id ipsum.', 'Animi et aliquid facilis modi. Non quibusdam quibusdam cupiditate officia enim. Facere et aut fuga. Porro esse earum aut voluptas cum iusto. Voluptatem pariatur porro sit voluptatibus et sit consequatur.', 'completed', '2025-09-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(26, 6, 'Vel aperiam dolorum.', 'Facilis consequatur est illum dolor nesciunt ut. Facilis ut consequatur enim pariatur quia. Doloremque qui ipsa aut deserunt dolores sint et quia. Ipsa deserunt perferendis illum consequuntur sit soluta unde quibusdam.', 'pending', '2025-07-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(27, 6, 'Quia et laborum.', NULL, 'completed', '2025-11-30', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(28, 6, 'Ullam qui numquam.', NULL, 'pending', '2026-03-30', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(29, 6, 'Quis illo voluptas.', NULL, 'in_progress', '2025-06-24', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(30, 6, 'Temporibus aut aut rerum.', 'Rem pariatur eius fuga cum aut amet et. Quas eius velit facere est rerum accusantium explicabo. Saepe consequatur et esse quae unde. Numquam dicta consequatur dolore ea voluptates inventore.', 'pending', '2025-08-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(31, 7, 'Veniam accusantium dignissimos eos.', NULL, 'pending', '2026-03-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(32, 7, 'Quo commodi omnis suscipit.', NULL, 'in_progress', '2025-12-22', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(33, 7, 'Ut fugiat eum ut.', 'Laudantium voluptatem et aspernatur quis voluptatum ex. Sit facilis facilis qui provident quo voluptatem. Et praesentium voluptas unde perspiciatis architecto eius voluptatem.', 'pending', '2025-12-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(34, 7, 'Voluptatum quis sapiente repellat.', NULL, 'completed', '2025-06-08', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(35, 7, 'Ut animi.', NULL, 'pending', '2026-04-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(36, 8, 'Ut ad ut fugit.', 'Provident deleniti porro nihil ut temporibus iste ducimus. Voluptatum facere qui a vel eum molestiae. Magnam atque voluptatem voluptate quia et est.', 'completed', '2025-07-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(37, 8, 'Ea id aut nostrum.', NULL, 'in_progress', '2026-01-21', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(38, 8, 'Distinctio vel velit.', 'Delectus quod consequatur et nostrum veritatis. Ut maiores culpa quae provident enim. Sit et quam nihil explicabo dolor veritatis.', 'in_progress', '2026-02-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(39, 8, 'Id consequuntur esse quia itaque.', 'Molestias labore qui veritatis. Voluptatem autem ipsum minus reiciendis autem mollitia ea. Ducimus porro nulla est quo similique ab. Et hic a dolor maiores.', 'completed', '2026-01-20', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(40, 8, 'Amet voluptate corporis.', NULL, 'pending', '2025-08-31', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(41, 9, 'Officiis velit corrupti.', NULL, 'in_progress', '2026-03-21', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(42, 9, 'Veritatis autem autem.', NULL, 'completed', '2026-03-18', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(43, 9, 'Odio blanditiis commodi.', 'Id veniam aut iste vel. Est voluptas quo placeat labore doloremque qui quia. Aut harum ut ea cum animi quo.', 'completed', '2025-10-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(44, 9, 'Fugit qui et.', NULL, 'completed', '2026-02-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(45, 9, 'Qui quia quo.', 'Qui aut rerum eaque. Voluptate non aut mollitia et a. Debitis aperiam incidunt possimus dolores nostrum.', 'pending', '2026-04-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(46, 10, 'Aut commodi debitis.', NULL, 'completed', '2026-04-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(47, 10, 'Sunt rem consequuntur.', NULL, 'pending', '2026-02-12', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(48, 10, 'Temporibus aliquid voluptates.', NULL, 'in_progress', '2026-01-18', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(49, 10, 'At aut quo.', 'Facilis corporis dolor id velit aliquid. Reprehenderit consequatur nam nesciunt repudiandae qui nisi doloremque. Aliquid et nihil ea voluptatem qui.', 'in_progress', '2026-01-20', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(50, 10, 'Deleniti iure est.', 'Sed optio maxime voluptatum nam. Sunt ab sit iusto distinctio beatae. Alias deleniti omnis cupiditate atque. Quaerat molestias iste placeat praesentium magni eum. Porro maxime et at.', 'pending', '2025-11-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(51, 11, 'Praesentium ab sint eos.', 'Eius dolor inventore aut est iure. Enim exercitationem vel ex fuga perspiciatis aut tempora officiis. Sunt perspiciatis reiciendis eum voluptate qui. Distinctio labore velit tenetur voluptatem a recusandae ut.', 'in_progress', '2025-12-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(52, 11, 'Ullam voluptas sint deleniti sed.', 'Aliquid sed assumenda aut aliquid. Sapiente similique minima et nihil dolores aspernatur. Id qui repudiandae excepturi fugit. Mollitia quis aliquid autem expedita sint deleniti.', 'pending', '2026-03-20', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(53, 11, 'Tempora doloremque odio consequuntur enim.', NULL, 'in_progress', '2025-08-08', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(54, 11, 'Autem sequi modi libero.', 'Nobis officia quia qui libero dolores nihil autem. Placeat perspiciatis non ex debitis necessitatibus. Aut sed nostrum consequatur quibusdam.', 'in_progress', '2025-11-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(55, 11, 'Expedita mollitia temporibus harum.', NULL, 'pending', '2025-09-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(56, 12, 'Ut cum iste esse.', 'Corporis laudantium natus quia reiciendis aperiam et. Et et inventore quos et natus voluptatibus. Similique tempore expedita dolor est in rem.', 'in_progress', '2026-01-17', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(57, 12, 'Natus error iure eius.', 'Voluptatem labore perspiciatis non nulla repellat veniam quo. Voluptatem quis et exercitationem officiis possimus nisi. Molestiae mollitia quam provident officia. Tempora distinctio possimus delectus asperiores sequi consequatur.', 'pending', '2026-01-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(58, 12, 'Facere ipsum alias delectus.', NULL, 'completed', '2025-12-28', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(59, 12, 'Sint cum vel.', NULL, 'pending', '2025-08-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(60, 12, 'Nihil nemo voluptatum.', 'Minus architecto est ex voluptas a pariatur. Non voluptatem est quas quis et quam quis. Consequuntur eligendi vel qui non. In molestias similique consectetur rem quia doloremque.', 'completed', '2025-11-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(61, 13, 'Earum quisquam ipsa.', 'Minus ad facere architecto neque quidem fugiat beatae optio. In vero beatae dignissimos. Repellat voluptatum ut at dolore.', 'pending', '2025-05-27', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(62, 13, 'Blanditiis similique quo.', 'Dolor minima vero sunt consequuntur. Facilis animi earum veniam sed repellendus excepturi rem. Exercitationem quam consequatur molestiae corporis quibusdam deleniti qui. Laudantium eligendi saepe qui ut labore qui deserunt totam.', 'completed', '2025-06-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(63, 13, 'Provident necessitatibus vel rem.', NULL, 'completed', '2026-03-11', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(64, 13, 'Quos iste laboriosam voluptatem.', NULL, 'pending', '2025-06-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(65, 13, 'At illo voluptatem et.', 'Consequatur qui magni et voluptatem unde quia. Iure et eaque aut consequatur voluptas blanditiis. Sit voluptatibus dolorum dolores sunt.', 'in_progress', '2025-08-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(66, 14, 'Autem magni mollitia.', 'Aut soluta sit in neque nulla velit quo natus. Ad officiis corporis debitis minima optio inventore. Voluptatem inventore maiores voluptates at quam voluptatem.', 'in_progress', '2025-07-11', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(67, 14, 'Perspiciatis sed dolores vel.', 'Enim quidem qui quasi tenetur velit. Consectetur nostrum nobis ad explicabo. Quidem repudiandae eum tenetur.', 'in_progress', '2026-02-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(68, 14, 'Est delectus quia sed.', NULL, 'completed', '2025-07-19', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(69, 14, 'Commodi sed numquam.', NULL, 'pending', '2026-01-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(70, 14, 'Delectus vitae.', 'Impedit vitae velit sit tenetur enim quos tempore. Iusto non aliquid tempora labore. Quo error dolores ea possimus culpa neque unde excepturi. Explicabo vero dolore eius delectus.', 'completed', '2025-05-16', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(71, 15, 'Aut tempora facere laborum.', NULL, 'in_progress', '2026-01-16', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(72, 15, 'Aliquid et corrupti.', NULL, 'pending', '2025-10-30', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(73, 15, 'Nisi laborum numquam sunt.', 'Quae hic ipsum eum nihil similique. Dolorem qui qui ex voluptatibus illum sed omnis. Sunt quaerat magni qui cumque corporis. Reiciendis omnis natus ducimus.', 'in_progress', '2025-10-30', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(74, 15, 'Odio voluptatem aut incidunt.', NULL, 'pending', '2025-05-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(75, 15, 'Non totam voluptatum dolores.', NULL, 'in_progress', '2025-07-08', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(76, 16, 'At maxime animi.', NULL, 'pending', '2025-12-31', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(77, 16, 'Officiis illum voluptas.', NULL, 'pending', '2025-08-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(78, 16, 'Fuga asperiores qui quae.', 'Pariatur aut labore aspernatur pariatur et quae soluta ea. A rerum eum qui eaque consequatur quia. Voluptate consequuntur doloribus recusandae ipsam recusandae voluptatem quia. Fugiat consequatur eum voluptas praesentium nihil ex possimus nostrum.', 'pending', '2026-02-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(79, 16, 'Consequatur nulla et.', NULL, 'completed', '2025-05-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(80, 16, 'Enim officia cupiditate.', 'Voluptas et illum voluptatem adipisci. Non atque cumque deserunt odio quam consequuntur.', 'pending', '2025-05-07', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(81, 17, 'Velit est ea.', 'Animi eum vel ut aut veritatis dolores consequatur. Est quae neque doloribus aut. Et sunt officia saepe quo omnis. Quisquam culpa animi quis inventore quo vel non natus.', 'pending', '2025-09-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(82, 17, 'Iste quidem.', NULL, 'in_progress', '2025-05-21', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(83, 17, 'Saepe fugiat quidem et.', NULL, 'completed', '2025-12-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(84, 17, 'Aut aut enim.', NULL, 'in_progress', '2025-06-08', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(85, 17, 'Consequatur ea sequi quia expedita.', 'Esse iste adipisci corrupti aut enim. Eos iure sed voluptatem nihil quod non dignissimos. Voluptate et nobis aut illum nobis exercitationem similique qui. Et voluptas rem nam eaque.', 'in_progress', '2025-07-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(86, 18, 'Sunt cupiditate et tempora dolores.', 'Sequi nisi esse quia dignissimos et. Quae quis sed temporibus numquam aperiam consequatur. Sit enim sapiente quia.', 'pending', '2025-11-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(87, 18, 'Ducimus error consequatur consectetur.', NULL, 'completed', '2025-06-24', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(88, 18, 'Qui quo ut optio.', NULL, 'in_progress', '2025-07-16', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(89, 18, 'Voluptates quaerat adipisci.', 'Et eveniet officia nemo nostrum corrupti sit modi. Repudiandae optio aperiam aut odio consectetur. Commodi alias officiis mollitia consequatur dolor nesciunt inventore rem. Ut reiciendis ex laboriosam et quibusdam nulla.', 'pending', '2025-04-19', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(90, 18, 'Illo voluptatem molestiae id molestias.', NULL, 'in_progress', '2025-09-21', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(91, 19, 'Autem vel consectetur.', NULL, 'completed', '2026-01-02', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(92, 19, 'Ad reiciendis quisquam.', NULL, 'pending', '2025-04-17', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(93, 19, 'Nobis quia facere.', NULL, 'in_progress', '2025-07-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(94, 19, 'Beatae excepturi sit accusamus.', 'Aut omnis fuga aspernatur voluptas beatae assumenda aspernatur autem. Saepe qui ab consequatur vel ea nostrum quia. Consequatur praesentium voluptatem nihil sed repellat. Officia voluptatibus et aut.', 'pending', '2026-01-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(95, 19, 'Totam recusandae sit.', 'Dolorem eaque in quidem ea incidunt dolorem aspernatur. Qui quia molestiae ex minus ut. Quo impedit tempora voluptatibus et est itaque.', 'completed', '2025-09-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(96, 20, 'Earum numquam vitae.', 'In ad eligendi aspernatur distinctio tempore sit doloremque. Dolorem laboriosam placeat quis itaque minus labore. Fugit eaque sed velit voluptatum neque similique libero. Sit eius voluptates omnis ut sunt impedit.', 'in_progress', '2026-04-12', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(97, 20, 'Praesentium est enim quaerat.', NULL, 'in_progress', '2026-04-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(98, 20, 'In occaecati illum.', 'Id quo et aspernatur rerum omnis tempora. Nulla officiis omnis quam vel omnis fugit et. Vero minima quae dolorum enim. Et vitae saepe sunt nam porro.', 'completed', '2025-06-12', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(99, 20, 'Laudantium earum repudiandae quasi non.', NULL, 'completed', '2026-02-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(100, 20, 'Architecto eum aut.', 'Cum aliquid ex non minima. Aut qui deserunt enim nisi et. Qui ut sed consequatur illum.', 'in_progress', '2026-01-29', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(101, 21, 'Aperiam quia magni maiores.', NULL, 'in_progress', '2025-12-11', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(102, 21, 'Dolorem ipsum quis.', NULL, 'pending', '2025-11-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(103, 21, 'Incidunt placeat aut vero.', 'Debitis id enim ratione omnis voluptas qui cupiditate. Error fugiat deleniti natus tenetur sunt. Recusandae labore tempore officiis maxime eveniet.', 'in_progress', '2025-10-19', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(104, 21, 'Reiciendis et quia soluta aspernatur.', NULL, 'pending', '2025-11-26', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(105, 21, 'Illum necessitatibus.', NULL, 'in_progress', '2025-11-02', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(106, 22, 'Et reiciendis dolore.', 'Eum qui est et. Itaque ipsam ullam vero molestiae. Possimus consequuntur aliquam sit qui.', 'in_progress', '2026-01-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(107, 22, 'Qui et rerum facilis ut.', 'Unde voluptatem rem labore aspernatur nisi. Blanditiis incidunt id nemo occaecati nostrum. Id eos natus iusto deleniti aut qui facere veniam.', 'in_progress', '2025-05-14', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(108, 22, 'Sed placeat reiciendis soluta.', 'Ut quibusdam molestiae sit repellendus fuga quidem. Sed nihil odit adipisci possimus. Autem sunt ratione occaecati similique temporibus. Qui fugiat placeat reprehenderit eaque.', 'in_progress', '2025-08-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(109, 22, 'At illum vero architecto.', 'Fuga dolores qui eius sed laboriosam. Ex doloribus porro omnis dolores.', 'pending', '2025-10-30', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(110, 22, 'Esse dolore accusamus non.', 'Repudiandae cumque rerum distinctio et. Aut cumque rerum vitae dicta accusamus suscipit iure.', 'in_progress', '2025-10-17', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(111, 23, 'Et illo omnis qui.', NULL, 'completed', '2026-03-28', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(112, 23, 'Deleniti molestiae.', NULL, 'completed', '2025-09-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(113, 23, 'Et occaecati dignissimos.', NULL, 'in_progress', '2025-12-12', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(114, 23, 'Asperiores repellendus harum quis.', 'Nisi eius et ducimus in sit. Quos cumque eaque et nemo laboriosam. Et porro enim est dicta laboriosam.', 'in_progress', '2026-03-07', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(115, 23, 'Ut minima atque.', 'Architecto nobis non consequatur quia qui quis. Distinctio est voluptatem rerum nostrum excepturi quia ut. Enim quisquam ut tempore quasi.', 'pending', '2025-09-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(116, 24, 'Est ea modi quis.', 'Molestiae necessitatibus eius sint aut distinctio quod. Autem ipsum commodi sunt officia sequi ducimus aliquid. Incidunt molestias dignissimos pariatur sit.', 'pending', '2025-07-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(117, 24, 'Molestiae nihil ratione qui autem.', 'Perspiciatis et nemo quia architecto perspiciatis enim. Voluptatum ipsa vero consequatur dolores reprehenderit veritatis qui. Aut beatae magnam maiores voluptas error autem. Sunt voluptates repellat possimus est tempore qui.', 'in_progress', '2025-12-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(118, 24, 'Iste maiores fugit dolores atque.', NULL, 'in_progress', '2025-12-04', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(119, 24, 'Reiciendis quis saepe.', NULL, 'completed', '2025-06-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(120, 24, 'Dolorum itaque tempora.', 'Recusandae voluptatum ea officia quo in blanditiis. Voluptas id doloremque asperiores vitae voluptas. Eos ut iste nobis. Unde dolor corrupti molestiae cupiditate earum officiis fuga voluptatum.', 'completed', '2025-11-06', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(121, 25, 'Cum laudantium.', 'Ipsum dicta adipisci sint. Ut et eaque quisquam amet ea ipsum animi dolorem. Qui omnis amet sequi officia est omnis.', 'pending', '2025-09-09', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(122, 25, 'Similique rem nam.', NULL, 'pending', '2026-03-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(123, 25, 'Ut atque id accusantium.', NULL, 'pending', '2025-05-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(124, 25, 'Quos accusamus quo dolorum.', NULL, 'in_progress', '2025-07-03', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(125, 25, 'Qui aut.', 'Rerum quidem nulla natus porro ut. Quis molestias fugiat harum ex nobis.', 'pending', '2026-01-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(126, 26, 'Neque iste iure.', NULL, 'completed', '2026-04-06', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(127, 26, 'Facere dolorem.', NULL, 'completed', '2025-08-09', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(128, 26, 'Quos aspernatur.', 'Quasi expedita sit non ad et ut. Debitis exercitationem numquam quam omnis aperiam. Rerum nesciunt ipsa cupiditate quidem sint eveniet. Deleniti reiciendis omnis aut.', 'completed', '2025-12-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(129, 26, 'Vero sed nesciunt suscipit.', NULL, 'completed', '2025-05-07', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(130, 26, 'Beatae ipsa alias.', 'Nihil vel possimus laborum saepe. Doloribus aut sunt ut nobis culpa. Temporibus qui molestiae ea ab commodi.', 'in_progress', '2026-01-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(131, 27, 'Commodi sunt sit commodi.', NULL, 'in_progress', '2026-03-21', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(132, 27, 'Accusamus voluptate eos.', 'Possimus quis ipsum omnis adipisci. Voluptatem est impedit libero aut consequatur. Est ea necessitatibus ea. Dicta illum ut et eos molestiae voluptas aperiam.', 'pending', '2026-01-15', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(133, 27, 'Et doloremque sapiente vero.', NULL, 'completed', '2025-09-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(134, 27, 'Facere corporis possimus hic.', NULL, 'completed', '2025-11-22', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(135, 27, 'Sint quisquam architecto dolore.', NULL, 'pending', '2025-11-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(136, 28, 'Commodi quae a.', 'Fuga numquam omnis odit culpa sunt quae. Qui aspernatur laborum blanditiis ad ea. Adipisci ex tempore qui ut sunt sed quo. Sunt dolores ut quasi voluptatibus quasi sunt. Voluptatem molestiae et quo cumque.', 'completed', '2026-04-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(137, 28, 'Et labore est.', 'Est omnis at tenetur nemo. Omnis tenetur eveniet dolores consequatur ea est. Rerum nemo culpa sit reprehenderit perferendis rerum voluptatibus. Molestiae reprehenderit ut quos.', 'pending', '2025-09-02', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(138, 28, 'Sed officia dolore eligendi.', NULL, 'in_progress', '2025-08-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(139, 28, 'Dolorem ratione enim.', NULL, 'in_progress', '2026-01-25', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(140, 28, 'Dolorem aut vero tenetur.', 'Id quia totam possimus delectus repellendus earum. Quo architecto adipisci doloremque laudantium. Aspernatur velit qui laboriosam sed molestiae. Explicabo quidem nulla perferendis amet voluptas quasi omnis eligendi.', 'in_progress', '2025-08-18', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(141, 29, 'Repellat dolores unde possimus.', NULL, 'completed', '2025-12-10', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(142, 29, 'Enim commodi qui.', NULL, 'completed', '2025-07-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(143, 29, 'Quam dolore sit odit.', 'Perspiciatis tempora dolores consequuntur dicta. Dolor et natus et culpa. Hic et velit placeat autem porro praesentium aspernatur. Et cum quod sunt illum.', 'in_progress', '2026-04-12', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(144, 29, 'Est cum id.', 'Illum nulla error est non sint qui. Consequatur sit aut vel non sit. Et totam ducimus incidunt.', 'pending', '2026-02-01', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(145, 29, 'Omnis corporis magnam illum.', NULL, 'completed', '2025-10-27', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(146, 30, 'Iusto molestiae rerum.', 'Odit ullam voluptas non ut dolorem deserunt corrupti. Ut rerum accusantium recusandae blanditiis earum sint doloremque. Amet qui et rem eius cum. Et aut exercitationem perferendis voluptatem inventore illum.', 'pending', '2026-03-30', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(147, 30, 'Sint deserunt optio.', 'Voluptatem non quis officia illum. Quos vitae corporis quos saepe sint quo. Ut sapiente officia doloremque sunt. Saepe ipsam animi quae optio tempore.', 'pending', '2025-07-21', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(148, 30, 'Voluptatem ipsa dolorem maxime.', 'Est nisi illum maxime sed odio aut. Quam quaerat id quia maxime quia voluptas. Et qui sapiente sed. Qui occaecati qui doloribus ducimus id.', 'completed', '2026-01-05', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(149, 30, 'Ea sunt veniam.', 'Deserunt voluptatum magnam magnam. Aut eius laudantium aut quisquam cumque. Sit deleniti omnis fugit. Et culpa dolor repudiandae aut sed in blanditiis.', 'in_progress', '2025-06-20', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(150, 30, 'Et architecto incidunt.', NULL, 'pending', '2025-05-13', '2025-04-16 22:16:06', '2025-04-16 22:16:06'),
(151, 1, 'this is a test title number 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-16 23:21:50', '2025-04-16 23:21:50'),
(153, 35, 'this is a test title number 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-17 06:25:30', '2025-04-17 06:25:30'),
(154, 37, 'this is a test title number 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-17 06:27:10', '2025-04-17 06:27:10'),
(155, 38, 'this is a test title number 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-17 06:27:14', '2025-04-17 06:27:14'),
(156, 38, 'this is a test titlde number 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-17 06:27:34', '2025-04-17 06:27:34'),
(157, 38, 'this is a test titlde nudmber 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-17 06:27:36', '2025-04-17 06:27:36'),
(158, 38, 'this is a test titlde nudmdber 4 update', 'this is a test description number 4', 'completed', '2026-06-02', '2025-04-17 06:27:37', '2025-04-17 06:27:37'),
(160, 38, 'this is a tesst titlde nudmdber 4 update', 'this is a test dsescription number 4', 'completed', '2026-06-02', '2025-04-17 06:27:40', '2025-04-17 06:27:40'),
(161, 38, 'this is a dtesst titlde nudmdber 4 update', 'this is a test dsescription number 4', 'completed', '2026-06-02', '2025-04-17 06:27:42', '2025-04-17 06:27:42'),
(162, 38, 'this is a dtesst titldsfde nudmdber 4 update', 'this is a test dsescription number 4', 'completed', '2026-06-02', '2025-04-17 06:27:59', '2025-04-17 06:27:59'),
(163, 38, 'this is a dtesst titldsfde nudmdbdsfger 4 update', 'this is a test dsescription number 4', 'completed', '2026-06-02', '2025-04-17 06:28:01', '2025-04-17 06:28:01'),
(164, 38, 'this is a dtesst titldsfde nudmdsdfgbdsfger 4 update', 'this is a test dsescription number 4', 'completed', '2026-06-02', '2025-04-17 06:28:02', '2025-04-17 06:28:02'),
(167, 41, 'user migrations', 'Building the user migratinos', 'completed', '2025-05-29', '2025-04-17 12:33:02', '2025-04-17 12:33:02'),
(168, 41, 'user factory', 'Building the user factory', 'in_progress', '2025-06-30', '2025-04-17 12:33:47', '2025-04-17 12:33:47'),
(169, 41, 'user seeder', 'Building the user seeder', 'pending', '2025-08-30', '2025-04-17 12:34:06', '2025-04-17 12:34:06'),
(170, 41, 'user controller', 'Building the user controller', 'pending', '2025-09-30', '2025-04-17 12:34:21', '2025-04-17 12:34:21'),
(171, 41, 'user rescounrce', 'Building the user rescounrce', 'pending', '2025-10-30', '2025-04-17 12:34:32', '2025-04-17 12:34:32'),
(172, 42, 'todo migrations', 'Building the todo migrations', 'completed', '2025-05-30', '2025-04-17 12:37:56', '2025-04-17 12:37:56'),
(174, 42, 'todo factory', 'Building the todo factory', 'in_progress', '2025-06-30', '2025-04-17 12:38:20', '2025-04-17 12:38:20'),
(175, 42, 'todo controller', 'Building the todo controller', 'pending', '2025-08-30', '2025-04-17 12:39:21', '2025-04-17 12:39:21'),
(176, 42, 'todo rescource', 'Building the todo rescource', 'pending', '2025-09-30', '2025-04-17 12:39:31', '2025-04-17 12:39:31'),
(178, 43, 'todoList migrations', 'Building the todo migrations', 'completed', '2025-05-30', '2025-04-17 12:40:27', '2025-04-17 12:40:27'),
(179, 43, 'todoList rescource', 'Building the todo rescource', 'in_progress', '2025-06-30', '2025-04-17 12:40:49', '2025-04-17 12:40:49'),
(180, 43, 'todoList controller', 'Building the todo controller', 'completed', '2025-06-30', '2025-04-17 12:41:29', '2025-04-17 12:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `todo_lists`
--

CREATE TABLE `todo_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todo_lists`
--

INSERT INTO `todo_lists` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Explicabo doloribus iure quibusdam.', 'Nam iusto quaerat cupiditate ut asperiores commodi nostrum. Fuga aut amet autem at incidunt.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(2, 1, 'Tenetur quod qui est.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(3, 1, 'Quibusdam iure.', 'Totam delectus est sunt harum deleniti rerum provident. Temporibus aperiam quia molestias rerum aut vitae et. Officiis rerum excepturi aut ipsum dolore libero nostrum. Non dolorem sint doloribus qui magnam.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(4, 2, 'Aut est in repellendus.', 'Eligendi est magni sint delectus. Necessitatibus omnis soluta modi. Numquam autem amet quidem harum sapiente. Aperiam quia consequatur a voluptatum vitae vel aut.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(5, 2, 'Molestiae quia vitae pariatur.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(6, 2, 'Atque optio fugit nemo ab.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(7, 3, 'Libero aut excepturi.', 'Et blanditiis facilis non laboriosam quae voluptatum nihil. Fuga quae at sint et maxime. Ducimus hic vel sunt aperiam sit. Quis ea doloribus ea animi.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(8, 3, 'In dicta ea.', 'Dolorem dolores ea enim aut quas. Sed et est ipsa quibusdam aspernatur facere. Consequatur pariatur omnis assumenda alias.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(9, 3, 'Laborum ex reiciendis.', 'Rerum ex hic error aut et et nam. Est inventore ea dolor a qui. Alias alias non neque dignissimos est alias.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(10, 4, 'Est est.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(11, 4, 'Et ut placeat.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(12, 4, 'Rerum minus qui minus.', 'In inventore libero eius quos sed earum vel. Est et et qui. Vero tempore error ipsum consequatur voluptatem ad. Illum nesciunt sunt nostrum esse. Impedit non est maxime vel explicabo adipisci exercitationem et.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(13, 5, 'Sint dolore hic.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(14, 5, 'Sit voluptatem.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(15, 5, 'Facere dolores similique voluptatem quaerat.', 'Recusandae quibusdam iusto est illum dolores placeat itaque. Aut ut reiciendis quisquam ut voluptatem a illo. Error architecto sequi voluptates error. Amet illum ut minima qui odit non.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(16, 6, 'Omnis quis sed quisquam.', 'Quo architecto quam quas et. Quia hic atque animi enim occaecati commodi amet. Sequi minima fugiat est debitis qui. Nemo aut rem enim.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(17, 6, 'Cum eligendi quia odio repellendus.', 'Minus ut qui amet voluptatem a voluptatem accusantium. Facilis illum facere ratione adipisci quibusdam sed. Aut rerum aliquam velit. Voluptatum soluta perferendis culpa ut.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(18, 6, 'Impedit dolorem culpa reprehenderit.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(19, 7, 'Est corporis ex.', 'Laboriosam ut ut eos ducimus minus. Odit nihil et est voluptatem. Ut vero odit voluptas ab. Voluptatem enim id error qui labore voluptatem.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(20, 7, 'Inventore nesciunt.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(21, 7, 'Rerum sunt.', 'Accusantium quasi sint pariatur corrupti velit. Ut rem quo tenetur voluptatem ipsum autem et rem. Itaque quaerat voluptas ipsum. Corporis a magni et sed eum facilis.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(22, 8, 'Possimus aut voluptatem reiciendis.', 'Aut illo hic quo quasi molestiae distinctio. Commodi aspernatur sed et ut id laboriosam. Ipsam rem aut veritatis quidem enim eos est.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(23, 8, 'Esse laborum magni ut.', 'Necessitatibus optio repellat inventore at sed. Magni qui qui ex expedita laborum officiis eos. Cupiditate est possimus delectus debitis nihil explicabo. Tenetur commodi quasi voluptatem libero atque ullam.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(24, 8, 'Delectus a non repellendus.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(25, 9, 'Et sapiente magni ratione.', 'Voluptatem doloribus error et repellat nam consequuntur veritatis sequi. Saepe in odit at magnam et qui rerum. Earum et harum sequi vel aut assumenda. Hic quos commodi numquam dolore autem aut.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(26, 9, 'Et perspiciatis dolorem.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(27, 9, 'Et quia praesentium minus.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(28, 10, 'Dolorem occaecati eum esse.', 'Ad in reiciendis voluptas doloremque nemo et. Quas eius quo deleniti. Earum et voluptatem blanditiis voluptatem omnis sit.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(29, 10, 'Dicta laudantium iure at tempora.', 'Voluptatem sint illo ut culpa. Ut ullam eum nesciunt aut voluptas. Iure earum nihil vel non ex ipsum velit. Reprehenderit quam ab maxime rerum.', '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(30, 10, 'Consequuntur ut sit.', NULL, '2025-04-16 22:16:01', '2025-04-16 22:16:01'),
(31, 2, 'Repellendus vero asperيiores.', 'Molestiae in et praesentium nemo rerum doloribus neque. Distinctio et maxime qui porro sed fugiat fugit. Molestias officia tempore totam rem maiores. Deserunt et est dignissimos corrupti dolores assumenda. Ducimus ratione voluptatum et nam voluptatem autem dolorem.', '2025-04-16 22:40:35', '2025-04-16 22:40:35'),
(33, 13, 'Repellendus vero asperيiores.', 'Molestiae in et praesentium nemo rerum doloribus neque. Distinctio et maxime qui porro sed fugiat fugit. Molestias officia tempore totam rem maiores. Deserunt et est dignissimos corrupti dolores assumenda. Ducimus ratione voluptatum et nam voluptatem autem dolorem.', '2025-04-17 06:25:01', '2025-04-17 06:25:01'),
(35, 13, 'Repellendus vero asdperيiores.', 'Molestiae in et praesentium nemo rerum doloribus neque. Distinctio et maxime qui porro sed fugiat fugit. Molestias officia tempore totam rem maiores. Deserunt et est dignissimos corrupti dolores assumenda. Ducimus ratione voluptatum et nam voluptatem autem dolorem.', '2025-04-17 06:25:11', '2025-04-17 06:25:11'),
(37, 13, 'Repellendus verto asdperيiores.', 'Molestiae in et praesentium nemo rerum doloribus neque. Distinctio et maxime qui porro sed fugiat fugit. Molestias officia tempore totam rem maiores. Deserunt et est dignissimos corrupti dolores assumenda. Ducimus ratione voluptatum et nam voluptatem autem dolorem.', '2025-04-17 06:26:58', '2025-04-17 06:26:58'),
(38, 13, 'Repellefndus verto asdperيiores.', 'Molestiae in et praesentium nemo rerum doloribus neque. Distinctio et maxime qui porro sed fugiat fugit. Molestias officia tempore totam rem maiores. Deserunt et est dignissimos corrupti dolores assumenda. Ducimus ratione voluptatum et nam voluptatem autem dolorem.', '2025-04-17 06:27:03', '2025-04-17 06:27:03'),
(41, 15, 'Building User Model', 'This User Model must include fields like: username, password, email, address, etc', '2025-04-17 12:28:15', '2025-04-17 12:28:15'),
(42, 15, 'Building Todo Model', 'This User Model must include fields like: title, status, description, user_id, etc', '2025-04-17 12:29:07', '2025-04-17 12:29:07'),
(43, 15, 'Building TodoList Model', 'This User Model must include fields like: title, status, goal_date, user_id, etc', '2025-04-17 12:29:34', '2025-04-17 12:29:34'),
(44, 15, 'Building Client Model', 'This User Model must include fields like: name, status, phone, address, etc', '2025-04-17 12:30:19', '2025-04-17 12:30:19'),
(45, 15, 'Building Employee Model', 'This User Model must include fields like: name, salary, phone, address, etc', '2025-04-17 12:30:41', '2025-04-17 12:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sarai Gerhold', 'xtreutel@example.com', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'HjNXoXx69f', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(2, 'Jenifer Harris', 'herta.barton@example.com', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'nyBQtPtQnn', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(3, 'Giles Bechtelar', 'twelch@example.com', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'MM0hRMPJVK', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(4, 'Maryse Koelpin', 'whitney.witting@example.com', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'pWk6VJ538N', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(5, 'Mr. Tremayne Kihn', 'kulas.delpha@example.org', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'Qc2JsrLp7D', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(6, 'Mr. Louie Bosco', 'katelyn27@example.net', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'nJnmzzPkAD', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(7, 'Mrs. Marietta Bradtke', 'merritt41@example.com', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'KCd9rSagEd', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(8, 'Favian Gulgowski', 'elton32@example.net', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'SgdB5ZggtN', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(9, 'Damion Glover', 'klynch@example.com', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', '9UBH03e4MP', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(10, 'Leonor Nicolas', 'theathcote@example.net', '2025-04-16 22:15:55', '$2y$12$1kWkbTYY4rzQa9y4PMQCeO6j/33l93jWpa8j3N3xBwNEXY8wSyWqu', 'UYgVfoBCxo', '2025-04-16 22:15:55', '2025-04-16 22:15:55'),
(11, 'ammar', 'ammar@gmail.com', NULL, '$2y$12$CI9xruUi2fosV5e7DkF6Z.PtC.ZNNfmG9IVQhLm4qX//kOLPcAWK.', NULL, '2025-04-16 22:16:45', '2025-04-16 22:16:45'),
(13, 'ammar1', 'ammar1@gmail.com', NULL, '$2y$12$eHnTMh7xYLXp0VasUsid5ukO7bpIQYZLAsK4ANF2/OG7dzMR/Oqae', NULL, '2025-04-16 22:30:26', '2025-04-16 22:30:26'),
(14, 'ammar12', 'ammar12@gmail.com', NULL, '$2y$12$k6pMf/xm/8vdwqelwxZmkO4gTuOQGjXiJ8sKWNIp2OZ9Wx/AFEdUm', NULL, '2025-04-17 09:17:13', '2025-04-17 09:17:13'),
(15, 'Yanabea', 'Yanabea@test.com', NULL, '$2y$12$o0M6GuXGCrBRzSklHrr0sO8C3Lj1YuQCcFpa6r7L7Oe6aKik6Uz3G', NULL, '2025-04-17 12:24:52', '2025-04-17 12:24:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `todos_title_todolist_id_unique` (`title`,`todolist_id`),
  ADD KEY `todos_todolist_id_foreign` (`todolist_id`);

--
-- Indexes for table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `todo_lists_title_user_id_unique` (`title`,`user_id`),
  ADD KEY `todo_lists_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `todo_lists`
--
ALTER TABLE `todo_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `todos_todolist_id_foreign` FOREIGN KEY (`todolist_id`) REFERENCES `todo_lists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD CONSTRAINT `todo_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
