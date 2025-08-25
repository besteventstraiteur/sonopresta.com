-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2025 at 12:11 PM
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
-- Database: `sonopresta`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'published' COMMENT 'draft, published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `short_description`, `content`, `author`, `image_url`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Comment choisir son DJ de mariage : Guide complet', 'comment-choisir-son-dj-de-mariage-:-guide-complet', 'Découvrez les critères essentiels pour sélectionner le DJ parfait pour votre mariage. De l\'expérience au style musical, en passant par les équipements, tous nos conseils pour faire le bon choix.', '<p>Découvrez les critères essentiels pour sélectionner le DJ parfait pour votre mariage. De l\'expérience au style musical, en passant par les équipements, tous nos conseils pour faire le bon choix.</p>', NULL, 'http://127.0.0.1:8000/api/uploads/blogs/letsytUZo8ejLoO1TGjrV5SzS6sujlMGn8TYPfjv.jpg', 'published', '2025-06-21 07:13:46', '2025-06-21 07:39:22'),
(6, 'Les moments clés d\'une soirée de mariage réussie', 'les-moments-clés-d\'une-soirée-de-mariage-réussie', 'De l\'entrée des mariés à l\'ouverture du bal, en passant par les animations : découvrez comment orchestrer parfaitement les moments forts de votre soirée de mariage.', '<p>De l\'entrée des mariés à l\'ouverture du bal, en passant par les animations : découvrez comment orchestrer parfaitement les moments forts de votre soirée de mariage.</p>', NULL, 'http://127.0.0.1:8000/api/uploads/blogs/x3FPweWA3TfWCS0sh88gsbGeBpDyIXUUPVPwEeog.jpg', 'published', '2025-06-21 07:17:35', '2025-06-21 07:17:35'),
(7, 'Créer une playlist de mariage personnalisée', 'créer-une-playlist-de-mariage-personnalisée', 'Comment construire une playlist qui reflète votre personnalité tout en faisant danser vos invités ? Nos conseils de DJ professionnel pour une ambiance réussie.', '<p>Comment construire une playlist qui reflète votre personnalité tout en faisant danser vos invités ? Nos conseils de DJ professionnel pour une ambiance réussie.</p>', NULL, 'http://127.0.0.1:8000/api/uploads/blogs/DxagoR70I3ViA9lYpqmxMTRD76g7BaxN6CElBlo6.jpg', 'published', '2025-06-21 07:23:31', '2025-06-21 07:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `brochures`
--

CREATE TABLE `brochures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brochures`
--

INSERT INTO `brochures` (`id`, `title`, `description`, `icon`, `file_path`, `service`, `created_at`, `updated_at`) VALUES
(9, 'Artistes', 'Artistes', NULL, 'http://127.0.0.1:8000/api/uploads/brochures/1754729880_68970d98d35e4.pdf', 'Artistes', '2025-08-09 05:58:00', '2025-08-09 05:58:00'),
(10, 'Guirlandes', 'Guirlandes', NULL, 'http://127.0.0.1:8000/api/uploads/brochures/1754729915_68970dbbed4b6.pdf', 'Guirlandes', '2025-08-09 05:58:35', '2025-08-09 05:58:35'),
(11, 'Location', 'Location', NULL, 'http://127.0.0.1:8000/api/uploads/brochures/1754729946_68970ddae6b03.pdf', 'Location de Matériel', '2025-08-09 05:59:06', '2025-08-09 05:59:06'),
(12, 'Formule DJ', 'Formule DJ', NULL, 'http://127.0.0.1:8000/api/uploads/brochures/1754730385_68970f91954af.pdf', 'DJ Professionnel', '2025-08-09 06:06:25', '2025-08-09 06:06:25');

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `created_at`, `updated_at`) VALUES
(2, 'Éclairage & Effets', 'Éclairage-&-effets', 'Lightbulb', '2025-06-12 11:58:55', '2025-07-14 11:11:33'),
(7, 'Sonorisation', 'sonorisation', 'Speaker', '2025-06-18 03:56:21', '2025-06-21 14:32:16'),
(8, 'Structure & Scène', 'structure-&-scène', 'Monitor', '2025-06-18 03:57:07', '2025-07-14 11:19:08'),
(9, 'Effets Spéciaux', 'effets-spéciaux', 'Package', '2025-06-18 03:57:25', '2025-06-18 03:57:25'),
(10, 'Mixage', 'mixage', 'AudioWaveform', '2025-07-14 11:02:32', '2025-07-14 11:06:44'),
(11, 'Micros & Accessoires', 'micros-&-accessoires', 'MicVocal', '2025-07-14 11:07:22', '2025-07-14 11:11:55'),
(12, 'Univers DJ’', 'univers-dj’', 'Disc3', '2025-07-14 11:13:05', '2025-07-14 11:13:05'),
(13, 'Guirlandes & Autres Décos', 'guirlandes-&-autres-décos', 'Sparkles', '2025-07-14 11:16:33', '2025-07-14 11:16:33'),
(14, 'Audiovisuel', 'audiovisuel', 'Cable', '2025-07-14 11:17:33', '2025-07-14 11:17:33'),
(15, 'Mobilier', 'mobilier', 'BetweenVerticalEnd', '2025-07-14 11:18:38', '2025-07-14 11:18:38'),
(16, 'Distribution Électrique', 'distribution-Électrique', 'Plug', '2025-07-14 11:20:30', '2025-07-14 11:20:48'),
(17, 'Câblage & Accessoires', 'câblage-&-accessoires', 'CircleDashed', '2025-07-14 11:21:30', '2025-07-14 11:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'individual' COMMENT 'individual, business',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `postal_code`, `city`, `type`, `created_at`, `updated_at`) VALUES
(2, 'Uzair', 'Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Gujranwala', '52250', 'Gujranwala', 'individual', '2025-06-21 02:21:53', '2025-06-21 02:21:53'),
(3, 'Uzair', 'Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Gujranwala', '52250', 'Gujranwala', 'business', '2025-06-21 02:30:05', '2025-06-21 02:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'full_cart, product',
  `product_id` int(11) DEFAULT NULL,
  `discount_type` varchar(255) NOT NULL COMMENT 'percentage, fixed',
  `discount` int(11) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `product_id`, `discount_type`, `discount`, `expiry`, `usage_limit`, `created_at`, `updated_at`) VALUES
(2, '5DGS-DFDD-WDS8', 'full_cart', 7, 'percentage', 50, '2025-07-10', 2, '2025-07-07 05:56:52', '2025-07-07 08:11:28'),
(3, 'GALKHO', 'product', 17, 'percentage', 50, '2025-07-09', NULL, '2025-07-07 09:07:23', '2025-07-07 09:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `customer_notes`
--

CREATE TABLE `customer_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devis_requests`
--

CREATE TABLE `devis_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type_event` varchar(255) DEFAULT NULL,
  `type_prestation` varchar(255) DEFAULT NULL,
  `date_event` varchar(255) DEFAULT NULL,
  `number_people` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `accept_cgv` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devis_requests`
--

INSERT INTO `devis_requests` (`id`, `name`, `email`, `telephone`, `type_event`, `type_prestation`, `date_event`, `number_people`, `location`, `comment`, `accept_cgv`, `created_at`, `updated_at`) VALUES
(1, 'Uzair Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Soirée d\'entreprise', 'eclairage', '2025-06-14', NULL, NULL, NULL, 1, '2025-06-12 03:45:41', '2025-06-12 03:45:41'),
(2, 'Uzair Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Soirée d\'entreprise', 'artistes', '2025-06-18', NULL, NULL, NULL, 1, '2025-06-12 03:52:43', '2025-06-12 03:52:43'),
(3, 'Uzair Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Soirée d\'entreprise', 'artistes', '2025-06-18', NULL, NULL, NULL, 1, '2025-06-12 03:53:15', '2025-06-12 03:53:15'),
(4, 'Uzair Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Mariage', 'dj', '2025-06-19', NULL, NULL, NULL, 1, '2025-06-12 03:56:17', '2025-06-12 03:56:17'),
(5, 'Uzair Tahir', 'uzairtahir535@gmail.com', '03213213741', 'Mariage', 'dj', '2025-06-19', NULL, NULL, NULL, 1, '2025-06-12 03:58:03', '2025-06-12 03:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` varchar(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `total_amount` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `template_id` varchar(255) DEFAULT NULL,
  `devis_request_id` varchar(255) DEFAULT NULL,
  `accepted_at` varchar(255) DEFAULT NULL,
  `paid_at` varchar(255) DEFAULT NULL,
  `sent_at` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(4, '0001_01_01_000000_create_documents_table', 1),
(7, '0001_01_01_000000_create_permissions_table', 1),
(9, '0001_01_01_000000_create_profiles_table', 1),
(10, '0001_01_01_000000_create_user_roles_table', 1),
(11, '0001_01_01_000000_create_users_table', 1),
(12, '0001_01_01_000001_create_cache_table', 1),
(13, '0001_01_01_000002_create_jobs_table', 1),
(14, '2025_06_12_061039_create_personal_access_tokens_table', 2),
(15, '2025_04_18_055250_create_users_meta_table', 3),
(18, '0001_01_01_000000_create_devis_requests_table', 4),
(19, '0001_01_01_000000_create_categories_table', 5),
(21, '2025_06_13_044914_create_stock_movements_table', 6),
(22, '0001_01_01_000000_create_products_table', 7),
(23, '0001_01_01_000000_create_order_items_table', 8),
(24, '0001_01_01_000000_create_orders_table', 8),
(25, '2025_06_13_114809_create_order_details_table', 9),
(26, '2025_06_20_064655_create_customer_notes_table', 10),
(27, '2025_06_20_064840_create_sav_attachments_table', 10),
(28, '2025_06_20_064850_create_sav_messages_table', 10),
(30, '2025_06_20_064903_create_sav_tickets_table', 11),
(31, '2025_06_21_065615_create_clients_table', 12),
(32, '2025_06_21_082118_create_blogs_table', 13),
(33, '0001_01_01_000000_create_brochures_table', 14),
(34, '2025_06_23_081923_create_options_table', 15),
(35, '2025_07_07_071850_create_coupons_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(2, 'customizer', '{\r\n  \"colors\": {\r\n    \"primary\": \"#EC4899\",\r\n    \"secondary\": \"#7e22ce\",\r\n    \"background\": \"#FFFFFF\",\r\n    \"text\": \"#333333\",\r\n    \"accent\": \"#7e22ce\"\r\n  },\r\n  \"typography\": {\r\n    \"baseFont\": \"Inter\",\r\n    \"headingFont\": \"Playfair Display\",\r\n    \"baseSize\": 16,\r\n    \"headingWeight\": \"600\",\r\n    \"paragraphSpacing\": 1.5\r\n  },\r\n  \"layout\": {\r\n    \"containerWidth\": 1400,\r\n    \"useFullWidth\": false,\r\n    \"spacing\": \"4\",\r\n    \"borderRadius\": 8\r\n  },\r\n  \"components\": {\r\n    \"buttonStyle\": \"pill\",\r\n    \"cardStyle\": \"shadow\",\r\n    \"useGlassmorphism\": true,\r\n    \"navbarTransparent\": true\r\n  }\r\n}', '2025-07-14 08:31:12', '2025-07-14 08:31:16'),
(5, 'shipping_charges', '{\n  \"shipping_rules\": [],\n  \"default_charges\": 0,\n  \"per_kg_charges\": 2,\n  \"per_km_charges\": 1\n}', '2025-07-14 05:41:54', '2025-07-14 05:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `rental_end_date` varchar(255) DEFAULT NULL,
  `rental_start_date` varchar(255) DEFAULT NULL,
  `rental_recovery` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL COMMENT 'pending, delivered, completed, processing, cancelled',
  `total_amount` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'location, purchase',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `delivery_address`, `notes`, `order_number`, `payment_status`, `coupon`, `discount`, `phone_number`, `rental_end_date`, `rental_start_date`, `rental_recovery`, `status`, `total_amount`, `type`, `created_at`, `updated_at`) VALUES
(18, '1', NULL, NULL, 'ORD-1-65513', 'unpaid', NULL, NULL, NULL, NULL, NULL, 0, 'pending', 105, 'purchase', '2025-06-18 02:26:29', '2025-06-18 02:26:29'),
(19, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-22551', 'paid', NULL, NULL, '+923213213741', NULL, NULL, 0, 'processing', 200, 'purchase', '2025-06-18 02:30:52', '2025-06-18 02:31:33'),
(20, '1', 'Uzair Tahir - Gujranwala , 52250, Gujranwala, FR', NULL, 'ORD-1-94721', 'paid', NULL, NULL, '+923213213745', NULL, NULL, 0, 'processing', 106, 'purchase', '2025-06-18 02:42:14', '2025-06-18 02:44:05'),
(21, '1', NULL, NULL, 'ORD-1-42764', 'unpaid', NULL, NULL, NULL, '2025-06-19T19:00:00.000Z', '2025-06-19T10:28:01.995Z', 0, 'pending', 400, 'location', '2025-06-19 05:39:36', '2025-06-19 05:39:36'),
(22, '1', 'Uzair Tahir - Gujranwala , 52250, Gujranwala, FR', NULL, 'ORD-1-88755', 'paid', NULL, NULL, '+923213213741', '20 Jun 2025 16:06 +05:00', '19 Jun 2025 16:06 +05:00', 0, 'completed', 100, 'location', '2025-06-19 06:17:19', '2025-06-23 08:49:44'),
(23, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-21707', 'paid', NULL, NULL, '+923213213741', '23 Jun 2025 23:29 +05:00', '19 Jun 2025 18:29 +05:00', 0, 'processing', 100, 'location', '2025-06-19 08:29:48', '2025-06-19 08:34:08'),
(39, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-41234', 'paid', NULL, NULL, '+923219640134', NULL, NULL, 0, 'processing', 600, 'purchase', '2025-07-08 07:26:31', '2025-07-08 07:27:20'),
(40, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-68115', 'paid', 'GALKHO', 300, '+923213213741', NULL, NULL, 0, 'processing', 1300, 'purchase', '2025-07-08 07:32:59', '2025-07-08 07:33:36'),
(41, '1', NULL, NULL, 'ORD-1-81444', 'unpaid', 'GALKHO', 1500, NULL, NULL, NULL, 0, 'pending', 2500, 'purchase', '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(42, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-83304', 'paid', '5DGS-DFDD-WDS8', 800, '+923213213741', NULL, NULL, 0, 'processing', 800, 'purchase', '2025-07-08 08:05:02', '2025-07-08 08:05:36'),
(43, '1', 'Uzair Tahir - Gujranwala , 52250, Gujranwala, FR', NULL, 'ORD-1-81983', 'paid', 'GALKHO', 300, '+923213213741', NULL, NULL, 0, 'processing', 1300, 'purchase', '2025-07-08 08:06:45', '2025-07-08 08:07:22'),
(44, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-17032', 'paid', NULL, NULL, '+923219640134', '09 Jul 2025 17:24 +05:00', '08 Jul 2025 17:24 +05:00', 0, 'processing', 6, 'location', '2025-07-08 09:24:19', '2025-07-08 09:24:51'),
(45, '1', 'Uzair Tahir - Gujranwala Sultan Rahi City, 52250, Gujranwala, FR', NULL, 'ORD-1-56078', 'paid', NULL, NULL, '+923219640134', '12 Jul 2025 12:11 +05:00', '11 Jul 2025 12:11 +05:00', 0, 'processing', 18, 'location', '2025-07-11 04:12:08', '2025-07-11 04:13:38'),
(46, '1', 'Uzair Tahir - Gujranwala , 52250, Gujranwala, FR', NULL, 'ORD-1-18397', 'paid', NULL, NULL, '+923213213741', NULL, NULL, 0, 'processing', 1204, 'purchase', '2025-07-14 06:22:38', '2025-07-14 06:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(25, 10, 'delivery_charges', '4.95', '2025-06-13 07:59:30', '2025-06-13 07:59:30'),
(26, 10, 'subtotal', '300', '2025-06-13 07:59:30', '2025-06-13 07:59:30'),
(27, 10, 'delivery_charges_details', '{\"id\":\"letter\",\"name\":\"Lettre suivie\",\"price\":4.95}', '2025-06-13 07:59:30', '2025-06-13 07:59:30'),
(28, 10, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Madina colony, Sheikhpura road\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-13 08:00:26', '2025-06-13 08:00:26'),
(29, 10, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Madina colony, Sheikhpura road\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-13 08:00:26', '2025-06-13 08:00:26'),
(30, 11, 'delivery_charges', '4.95', '2025-06-13 08:18:44', '2025-06-13 08:18:44'),
(31, 11, 'subtotal', '300', '2025-06-13 08:18:44', '2025-06-13 08:18:44'),
(32, 11, 'delivery_charges_details', '{\"id\":\"letter\",\"name\":\"Lettre suivie\",\"price\":4.95}', '2025-06-13 08:18:44', '2025-06-13 08:18:44'),
(33, 11, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-13 08:19:30', '2025-06-13 08:19:30'),
(34, 11, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-13 08:19:30', '2025-06-13 08:19:30'),
(35, 12, 'delivery_charges', '0', '2025-06-13 23:47:51', '2025-06-13 23:47:51'),
(36, 12, 'subtotal', '300', '2025-06-13 23:47:51', '2025-06-13 23:47:51'),
(37, 12, 'delivery_charges_details', 'null', '2025-06-13 23:47:51', '2025-06-13 23:47:51'),
(38, 13, 'delivery_charges', '0', '2025-06-18 01:40:03', '2025-06-18 01:40:03'),
(39, 13, 'subtotal', '300', '2025-06-18 01:40:03', '2025-06-18 01:40:03'),
(40, 13, 'delivery_charges_details', 'null', '2025-06-18 01:40:03', '2025-06-18 01:40:03'),
(41, 14, 'delivery_charges', '0', '2025-06-18 01:40:54', '2025-06-18 01:40:54'),
(42, 14, 'subtotal', '300', '2025-06-18 01:40:54', '2025-06-18 01:40:54'),
(43, 14, 'delivery_charges_details', 'null', '2025-06-18 01:40:54', '2025-06-18 01:40:54'),
(44, 15, 'delivery_charges', '0', '2025-06-18 01:44:01', '2025-06-18 01:44:01'),
(45, 15, 'subtotal', '300', '2025-06-18 01:44:01', '2025-06-18 01:44:01'),
(46, 15, 'delivery_charges_details', 'null', '2025-06-18 01:44:02', '2025-06-18 01:44:02'),
(47, 15, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 01:45:16', '2025-06-18 01:45:16'),
(48, 15, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 01:45:16', '2025-06-18 01:45:16'),
(49, 15, 'customer_name', 'Uzair Tahir', '2025-06-18 01:45:16', '2025-06-18 01:45:16'),
(50, 15, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 01:45:16', '2025-06-18 01:45:16'),
(51, 16, 'delivery_charges', '0', '2025-06-18 02:05:36', '2025-06-18 02:05:36'),
(52, 16, 'subtotal', '200', '2025-06-18 02:05:36', '2025-06-18 02:05:36'),
(53, 16, 'delivery_charges_details', 'null', '2025-06-18 02:05:36', '2025-06-18 02:05:36'),
(54, 16, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:08:20', '2025-06-18 02:08:20'),
(55, 16, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:08:20', '2025-06-18 02:08:20'),
(56, 16, 'customer_name', 'Uzair Tahir', '2025-06-18 02:08:20', '2025-06-18 02:08:20'),
(57, 16, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:08:20', '2025-06-18 02:08:20'),
(58, 17, 'delivery_charges', '0', '2025-06-18 02:09:58', '2025-06-18 02:09:58'),
(59, 17, 'subtotal', '200', '2025-06-18 02:09:58', '2025-06-18 02:09:58'),
(60, 17, 'delivery_charges_details', 'null', '2025-06-18 02:09:58', '2025-06-18 02:09:58'),
(61, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:10:42', '2025-06-18 02:10:42'),
(62, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:10:43', '2025-06-18 02:10:43'),
(63, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:10:43', '2025-06-18 02:10:43'),
(64, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:10:43', '2025-06-18 02:10:43'),
(65, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(66, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(67, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(68, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(69, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:11:55', '2025-06-18 02:11:55'),
(70, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:11:55', '2025-06-18 02:11:55'),
(71, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:11:55', '2025-06-18 02:11:55'),
(72, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:11:55', '2025-06-18 02:11:55'),
(73, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:12:41', '2025-06-18 02:12:41'),
(74, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:12:41', '2025-06-18 02:12:41'),
(75, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:12:41', '2025-06-18 02:12:41'),
(76, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:12:41', '2025-06-18 02:12:41'),
(77, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:13:08', '2025-06-18 02:13:08'),
(78, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:13:08', '2025-06-18 02:13:08'),
(79, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:13:08', '2025-06-18 02:13:08'),
(80, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:13:08', '2025-06-18 02:13:08'),
(81, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:13:29', '2025-06-18 02:13:29'),
(82, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:13:29', '2025-06-18 02:13:29'),
(83, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:13:29', '2025-06-18 02:13:29'),
(84, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:13:29', '2025-06-18 02:13:29'),
(85, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:13:42', '2025-06-18 02:13:42'),
(86, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:13:42', '2025-06-18 02:13:42'),
(87, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:13:42', '2025-06-18 02:13:42'),
(88, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:13:42', '2025-06-18 02:13:42'),
(89, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:13:58', '2025-06-18 02:13:58'),
(90, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:13:58', '2025-06-18 02:13:58'),
(91, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:13:58', '2025-06-18 02:13:58'),
(92, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:13:58', '2025-06-18 02:13:58'),
(93, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:14:20', '2025-06-18 02:14:20'),
(94, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:14:20', '2025-06-18 02:14:20'),
(95, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:14:20', '2025-06-18 02:14:20'),
(96, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:14:20', '2025-06-18 02:14:20'),
(97, 17, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:14:38', '2025-06-18 02:14:38'),
(98, 17, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:14:38', '2025-06-18 02:14:38'),
(99, 17, 'customer_name', 'Uzair Tahir', '2025-06-18 02:14:38', '2025-06-18 02:14:38'),
(100, 17, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:14:38', '2025-06-18 02:14:38'),
(101, 18, 'delivery_charges', '4.95', '2025-06-18 02:26:30', '2025-06-18 02:26:30'),
(102, 18, 'subtotal', '100', '2025-06-18 02:26:30', '2025-06-18 02:26:30'),
(103, 18, 'delivery_charges_details', '{\"id\":\"letter\",\"name\":\"Lettre suivie\",\"price\":4.95}', '2025-06-18 02:26:30', '2025-06-18 02:26:30'),
(104, 19, 'delivery_charges', '0', '2025-06-18 02:30:52', '2025-06-18 02:30:52'),
(105, 19, 'subtotal', '200', '2025-06-18 02:30:52', '2025-06-18 02:30:52'),
(106, 19, 'delivery_charges_details', 'null', '2025-06-18 02:30:52', '2025-06-18 02:30:52'),
(107, 19, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:31:33', '2025-06-18 02:31:33'),
(108, 19, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:31:33', '2025-06-18 02:31:33'),
(109, 19, 'customer_name', 'Uzair Tahir', '2025-06-18 02:31:34', '2025-06-18 02:31:34'),
(110, 19, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:31:34', '2025-06-18 02:31:34'),
(111, 19, 'customer_phone', '+923213213741', '2025-06-18 02:31:34', '2025-06-18 02:31:34'),
(112, 20, 'delivery_charges', '5.95', '2025-06-18 02:42:14', '2025-06-18 02:42:14'),
(113, 20, 'subtotal', '100', '2025-06-18 02:42:14', '2025-06-18 02:42:14'),
(114, 20, 'delivery_charges_details', '{\"id\":\"standard\",\"name\":\"Livraison standard\",\"price\":5.95}', '2025-06-18 02:42:14', '2025-06-18 02:42:14'),
(115, 20, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:42:52', '2025-06-18 02:42:52'),
(116, 20, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213745\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:42:52', '2025-06-18 02:42:52'),
(117, 20, 'customer_name', 'Uzair Tahir', '2025-06-18 02:42:52', '2025-06-18 02:42:52'),
(118, 20, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:42:52', '2025-06-18 02:42:52'),
(119, 20, 'customer_phone', '+923213213745', '2025-06-18 02:42:52', '2025-06-18 02:42:52'),
(120, 20, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-18 02:44:05', '2025-06-18 02:44:05'),
(121, 20, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213745\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-18 02:44:05', '2025-06-18 02:44:05'),
(122, 20, 'customer_name', 'Uzair Tahir', '2025-06-18 02:44:05', '2025-06-18 02:44:05'),
(123, 20, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-18 02:44:05', '2025-06-18 02:44:05'),
(124, 20, 'customer_phone', '+923213213745', '2025-06-18 02:44:05', '2025-06-18 02:44:05'),
(125, 21, 'delivery_charges', '0', '2025-06-19 05:39:36', '2025-06-19 05:39:36'),
(126, 21, 'subtotal', '400', '2025-06-19 05:39:36', '2025-06-19 05:39:36'),
(127, 21, 'delivery_charges_details', 'null', '2025-06-19 05:39:36', '2025-06-19 05:39:36'),
(128, 22, 'delivery_charges', '0', '2025-06-19 06:17:19', '2025-06-19 06:17:19'),
(129, 22, 'subtotal', '100', '2025-06-19 06:17:19', '2025-06-19 06:17:19'),
(130, 22, 'delivery_charges_details', 'null', '2025-06-19 06:17:19', '2025-06-19 06:17:19'),
(131, 22, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-19 06:17:54', '2025-06-19 06:17:54'),
(132, 22, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-19 06:17:54', '2025-06-19 06:17:54'),
(133, 22, 'customer_name', 'Uzair Tahir', '2025-06-19 06:17:54', '2025-06-19 06:17:54'),
(134, 22, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-19 06:17:54', '2025-06-19 06:17:54'),
(135, 22, 'customer_phone', '+923213213741', '2025-06-19 06:17:54', '2025-06-19 06:17:54'),
(136, 23, 'delivery_charges', '0', '2025-06-19 08:29:48', '2025-06-19 08:29:48'),
(137, 23, 'subtotal', '100', '2025-06-19 08:29:48', '2025-06-19 08:29:48'),
(138, 23, 'delivery_charges_details', 'null', '2025-06-19 08:29:48', '2025-06-19 08:29:48'),
(139, 23, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-06-19 08:34:08', '2025-06-19 08:34:08'),
(140, 23, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-06-19 08:34:08', '2025-06-19 08:34:08'),
(141, 23, 'customer_name', 'Uzair Tahir', '2025-06-19 08:34:08', '2025-06-19 08:34:08'),
(142, 23, 'customer_email', 'uzairtahir535@gmail.com', '2025-06-19 08:34:08', '2025-06-19 08:34:08'),
(143, 23, 'customer_phone', '+923213213741', '2025-06-19 08:34:08', '2025-06-19 08:34:08'),
(144, 24, 'delivery_charges', '0', '2025-07-07 08:35:25', '2025-07-07 08:35:25'),
(145, 24, 'subtotal', '7200', '2025-07-07 08:35:25', '2025-07-07 08:35:25'),
(146, 24, 'delivery_charges_details', 'null', '2025-07-07 08:35:25', '2025-07-07 08:35:25'),
(147, 25, 'delivery_charges', '0', '2025-07-07 09:01:43', '2025-07-07 09:01:43'),
(148, 25, 'subtotal', '2000', '2025-07-07 09:01:43', '2025-07-07 09:01:43'),
(149, 25, 'delivery_charges_details', 'null', '2025-07-07 09:01:43', '2025-07-07 09:01:43'),
(150, 25, 'coupon_details', '{\"id\":2,\"code\":\"5DGS-DFDD-WDS8\",\"type\":\"full_cart\",\"product_id\":7,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-07\",\"usage_limit\":2,\"created_at\":\"2025-07-07T08:56:52.000000Z\",\"updated_at\":\"2025-07-07T11:11:28.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:01:43', '2025-07-07 09:01:43'),
(151, 26, 'delivery_charges', '0', '2025-07-07 09:08:05', '2025-07-07 09:08:05'),
(152, 26, 'subtotal', '1000', '2025-07-07 09:08:05', '2025-07-07 09:08:05'),
(153, 26, 'delivery_charges_details', 'null', '2025-07-07 09:08:05', '2025-07-07 09:08:05'),
(154, 26, 'coupon_details', '{\"id\":2,\"code\":\"5DGS-DFDD-WDS8\",\"type\":\"full_cart\",\"product_id\":7,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-07\",\"usage_limit\":2,\"created_at\":\"2025-07-07T08:56:52.000000Z\",\"updated_at\":\"2025-07-07T11:11:28.000000Z\",\"status\":\"active\",\"used\":1}', '2025-07-07 09:08:05', '2025-07-07 09:08:05'),
(155, 27, 'delivery_charges', '0', '2025-07-07 09:32:11', '2025-07-07 09:32:11'),
(156, 27, 'subtotal', '3400', '2025-07-07 09:32:11', '2025-07-07 09:32:11'),
(157, 27, 'delivery_charges_details', 'null', '2025-07-07 09:32:11', '2025-07-07 09:32:11'),
(158, 27, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:32:11', '2025-07-07 09:32:11'),
(159, 28, 'delivery_charges', '0', '2025-07-07 09:37:06', '2025-07-07 09:37:06'),
(160, 28, 'subtotal', '3400', '2025-07-07 09:37:06', '2025-07-07 09:37:06'),
(161, 28, 'delivery_charges_details', 'null', '2025-07-07 09:37:07', '2025-07-07 09:37:07'),
(162, 28, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:37:07', '2025-07-07 09:37:07'),
(163, 30, 'delivery_charges', '0', '2025-07-07 09:40:42', '2025-07-07 09:40:42'),
(164, 30, 'subtotal', '3400', '2025-07-07 09:40:42', '2025-07-07 09:40:42'),
(165, 30, 'delivery_charges_details', 'null', '2025-07-07 09:40:43', '2025-07-07 09:40:43'),
(166, 30, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:40:43', '2025-07-07 09:40:43'),
(167, 31, 'delivery_charges', '0', '2025-07-07 09:44:51', '2025-07-07 09:44:51'),
(168, 31, 'subtotal', '3400', '2025-07-07 09:44:51', '2025-07-07 09:44:51'),
(169, 31, 'delivery_charges_details', 'null', '2025-07-07 09:44:51', '2025-07-07 09:44:51'),
(170, 31, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:44:51', '2025-07-07 09:44:51'),
(171, 32, 'delivery_charges', '0', '2025-07-07 09:47:33', '2025-07-07 09:47:33'),
(172, 32, 'subtotal', '3400', '2025-07-07 09:47:33', '2025-07-07 09:47:33'),
(173, 32, 'delivery_charges_details', 'null', '2025-07-07 09:47:33', '2025-07-07 09:47:33'),
(174, 32, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:47:33', '2025-07-07 09:47:33'),
(175, 33, 'delivery_charges', '0', '2025-07-07 09:48:09', '2025-07-07 09:48:09'),
(176, 33, 'subtotal', '3400', '2025-07-07 09:48:09', '2025-07-07 09:48:09'),
(177, 33, 'delivery_charges_details', 'null', '2025-07-07 09:48:09', '2025-07-07 09:48:09'),
(178, 33, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:48:09', '2025-07-07 09:48:09'),
(179, 34, 'delivery_charges', '0', '2025-07-07 09:49:28', '2025-07-07 09:49:28'),
(180, 34, 'subtotal', '3400', '2025-07-07 09:49:28', '2025-07-07 09:49:28'),
(181, 34, 'delivery_charges_details', 'null', '2025-07-07 09:49:28', '2025-07-07 09:49:28'),
(182, 34, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:49:28', '2025-07-07 09:49:28'),
(183, 35, 'delivery_charges', '0', '2025-07-07 09:51:02', '2025-07-07 09:51:02'),
(184, 35, 'subtotal', '3400', '2025-07-07 09:51:02', '2025-07-07 09:51:02'),
(185, 35, 'delivery_charges_details', 'null', '2025-07-07 09:51:02', '2025-07-07 09:51:02'),
(186, 35, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-07 09:51:02', '2025-07-07 09:51:02'),
(187, 36, 'delivery_charges', '0', '2025-07-08 06:34:26', '2025-07-08 06:34:26'),
(188, 36, 'subtotal', '3400', '2025-07-08 06:34:26', '2025-07-08 06:34:26'),
(189, 36, 'delivery_charges_details', 'null', '2025-07-08 06:34:26', '2025-07-08 06:34:26'),
(190, 36, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-08 06:34:26', '2025-07-08 06:34:26'),
(191, 37, 'delivery_charges', '0', '2025-07-08 06:36:34', '2025-07-08 06:36:34'),
(192, 37, 'subtotal', '3400', '2025-07-08 06:36:34', '2025-07-08 06:36:34'),
(193, 37, 'delivery_charges_details', 'null', '2025-07-08 06:36:34', '2025-07-08 06:36:34'),
(194, 37, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-08 06:36:34', '2025-07-08 06:36:34'),
(195, 38, 'delivery_charges', '0', '2025-07-08 06:38:31', '2025-07-08 06:38:31'),
(196, 38, 'subtotal', '3400', '2025-07-08 06:38:31', '2025-07-08 06:38:31'),
(197, 38, 'delivery_charges_details', 'null', '2025-07-08 06:38:31', '2025-07-08 06:38:31'),
(198, 38, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-08 06:38:31', '2025-07-08 06:38:31'),
(199, 39, 'delivery_charges', '0', '2025-07-08 07:26:31', '2025-07-08 07:26:31'),
(200, 39, 'subtotal', '600', '2025-07-08 07:26:31', '2025-07-08 07:26:31'),
(201, 39, 'delivery_charges_details', 'null', '2025-07-08 07:26:31', '2025-07-08 07:26:31'),
(202, 39, 'coupon_details', 'null', '2025-07-08 07:26:31', '2025-07-08 07:26:31'),
(203, 39, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-08 07:27:20', '2025-07-08 07:27:20'),
(204, 39, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923219640134\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-08 07:27:20', '2025-07-08 07:27:20'),
(205, 39, 'customer_name', 'Uzair Tahir', '2025-07-08 07:27:20', '2025-07-08 07:27:20'),
(206, 39, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-08 07:27:20', '2025-07-08 07:27:20'),
(207, 39, 'customer_phone', '+923219640134', '2025-07-08 07:27:20', '2025-07-08 07:27:20'),
(208, 40, 'delivery_charges', '0', '2025-07-08 07:32:59', '2025-07-08 07:32:59'),
(209, 40, 'subtotal', '1600', '2025-07-08 07:32:59', '2025-07-08 07:32:59'),
(210, 40, 'delivery_charges_details', 'null', '2025-07-08 07:32:59', '2025-07-08 07:32:59'),
(211, 40, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-08 07:32:59', '2025-07-08 07:32:59'),
(212, 40, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-08 07:33:36', '2025-07-08 07:33:36'),
(213, 40, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-08 07:33:36', '2025-07-08 07:33:36'),
(214, 40, 'customer_name', 'Uzair Tahir', '2025-07-08 07:33:36', '2025-07-08 07:33:36'),
(215, 40, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-08 07:33:36', '2025-07-08 07:33:36'),
(216, 40, 'customer_phone', '+923213213741', '2025-07-08 07:33:36', '2025-07-08 07:33:36'),
(217, 41, 'delivery_charges', '0', '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(218, 41, 'subtotal', '4000', '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(219, 41, 'delivery_charges_details', 'null', '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(220, 41, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":1}', '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(221, 42, 'delivery_charges', '0', '2025-07-08 08:05:02', '2025-07-08 08:05:02'),
(222, 42, 'subtotal', '1600', '2025-07-08 08:05:02', '2025-07-08 08:05:02'),
(223, 42, 'delivery_charges_details', 'null', '2025-07-08 08:05:02', '2025-07-08 08:05:02'),
(224, 42, 'coupon_details', '{\"id\":2,\"code\":\"5DGS-DFDD-WDS8\",\"type\":\"full_cart\",\"product_id\":7,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-10\",\"usage_limit\":2,\"created_at\":\"2025-07-07T08:56:52.000000Z\",\"updated_at\":\"2025-07-07T11:11:28.000000Z\",\"status\":\"active\",\"used\":0}', '2025-07-08 08:05:02', '2025-07-08 08:05:02'),
(225, 42, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-08 08:05:36', '2025-07-08 08:05:36'),
(226, 42, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-08 08:05:36', '2025-07-08 08:05:36'),
(227, 42, 'customer_name', 'Uzair Tahir', '2025-07-08 08:05:36', '2025-07-08 08:05:36'),
(228, 42, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-08 08:05:36', '2025-07-08 08:05:36'),
(229, 42, 'customer_phone', '+923213213741', '2025-07-08 08:05:36', '2025-07-08 08:05:36'),
(230, 43, 'delivery_charges', '0', '2025-07-08 08:06:46', '2025-07-08 08:06:46'),
(231, 43, 'subtotal', '1600', '2025-07-08 08:06:46', '2025-07-08 08:06:46'),
(232, 43, 'delivery_charges_details', 'null', '2025-07-08 08:06:46', '2025-07-08 08:06:46'),
(233, 43, 'coupon_details', '{\"id\":3,\"code\":\"GALKHO\",\"type\":\"product\",\"product_id\":17,\"discount_type\":\"percentage\",\"discount\":50,\"expiry\":\"2025-07-09\",\"usage_limit\":null,\"created_at\":\"2025-07-07T12:07:23.000000Z\",\"updated_at\":\"2025-07-07T12:10:09.000000Z\",\"status\":\"active\",\"used\":2}', '2025-07-08 08:06:46', '2025-07-08 08:06:46'),
(234, 43, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-08 08:07:22', '2025-07-08 08:07:22'),
(235, 43, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-08 08:07:22', '2025-07-08 08:07:22'),
(236, 43, 'customer_name', 'Uzair Tahir', '2025-07-08 08:07:22', '2025-07-08 08:07:22'),
(237, 43, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-08 08:07:22', '2025-07-08 08:07:22'),
(238, 43, 'customer_phone', '+923213213741', '2025-07-08 08:07:22', '2025-07-08 08:07:22'),
(239, 44, 'delivery_charges', '0', '2025-07-08 09:24:20', '2025-07-08 09:24:20'),
(240, 44, 'subtotal', '6', '2025-07-08 09:24:20', '2025-07-08 09:24:20'),
(241, 44, 'delivery_charges_details', 'null', '2025-07-08 09:24:20', '2025-07-08 09:24:20'),
(242, 44, 'coupon_details', 'null', '2025-07-08 09:24:20', '2025-07-08 09:24:20'),
(243, 44, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-08 09:24:51', '2025-07-08 09:24:51'),
(244, 44, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923219640134\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-08 09:24:52', '2025-07-08 09:24:52'),
(245, 44, 'customer_name', 'Uzair Tahir', '2025-07-08 09:24:52', '2025-07-08 09:24:52'),
(246, 44, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-08 09:24:52', '2025-07-08 09:24:52'),
(247, 44, 'customer_phone', '+923219640134', '2025-07-08 09:24:52', '2025-07-08 09:24:52'),
(248, 45, 'delivery_charges', '0', '2025-07-11 04:12:08', '2025-07-11 04:12:08'),
(249, 45, 'subtotal', '18', '2025-07-11 04:12:08', '2025-07-11 04:12:08'),
(250, 45, 'delivery_charges_details', 'null', '2025-07-11 04:12:08', '2025-07-11 04:12:08'),
(251, 45, 'coupon_details', 'null', '2025-07-11 04:12:08', '2025-07-11 04:12:08'),
(252, 45, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-11 04:13:38', '2025-07-11 04:13:38'),
(253, 45, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":\"Sultan Rahi City\",\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923219640134\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-11 04:13:38', '2025-07-11 04:13:38'),
(254, 45, 'customer_name', 'Uzair Tahir', '2025-07-11 04:13:38', '2025-07-11 04:13:38'),
(255, 45, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-11 04:13:39', '2025-07-11 04:13:39'),
(256, 45, 'customer_phone', '+923219640134', '2025-07-11 04:13:39', '2025-07-11 04:13:39'),
(257, 46, 'delivery_charges', '4', '2025-07-14 06:22:38', '2025-07-14 06:22:38'),
(258, 46, 'subtotal', '1200', '2025-07-14 06:22:38', '2025-07-14 06:22:38'),
(259, 46, 'delivery_charges_details', '{\"id\":\"standard\",\"name\":\"Livraison standard\",\"price\":4}', '2025-07-14 06:22:38', '2025-07-14 06:22:38'),
(260, 46, 'coupon_details', 'null', '2025-07-14 06:22:38', '2025-07-14 06:22:38'),
(261, 46, 'shipping_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"name\":\"Uzair Tahir\"}', '2025-07-14 06:23:31', '2025-07-14 06:23:31'),
(262, 46, 'billing_details', '{\"address\":{\"city\":\"Gujranwala\",\"country\":\"FR\",\"line1\":\"Gujranwala\",\"line2\":null,\"postal_code\":\"52250\",\"state\":null},\"email\":\"uzairtahir535@gmail.com\",\"name\":\"Uzair Tahir\",\"phone\":\"+923213213741\",\"tax_exempt\":\"none\",\"tax_ids\":[]}', '2025-07-14 06:23:31', '2025-07-14 06:23:31'),
(263, 46, 'customer_name', 'Uzair Tahir', '2025-07-14 06:23:31', '2025-07-14 06:23:31'),
(264, 46, 'customer_email', 'uzairtahir535@gmail.com', '2025-07-14 06:23:31', '2025-07-14 06:23:31'),
(265, 46, 'customer_phone', '+923213213741', '2025-07-14 06:23:31', '2025-07-14 06:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `subtotal`, `discount`, `created_at`, `updated_at`) VALUES
(17, '10', '1', 2, 100, 200, NULL, '2025-06-13 07:59:30', '2025-06-13 07:59:30'),
(18, '10', '3', 1, 100, 100, NULL, '2025-06-13 07:59:30', '2025-06-13 07:59:30'),
(19, '11', '1', 2, 100, 200, NULL, '2025-06-13 08:18:44', '2025-06-13 08:18:44'),
(20, '11', '3', 1, 100, 100, NULL, '2025-06-13 08:18:44', '2025-06-13 08:18:44'),
(21, '12', '1', 2, 100, 200, NULL, '2025-06-13 23:47:51', '2025-06-13 23:47:51'),
(22, '12', '3', 1, 100, 100, NULL, '2025-06-13 23:47:51', '2025-06-13 23:47:51'),
(23, '13', '3', 1, 100, 100, NULL, '2025-06-18 01:40:02', '2025-06-18 01:40:02'),
(24, '13', '1', 2, 100, 200, NULL, '2025-06-18 01:40:02', '2025-06-18 01:40:02'),
(25, '14', '3', 1, 100, 100, NULL, '2025-06-18 01:40:54', '2025-06-18 01:40:54'),
(26, '14', '1', 2, 100, 200, NULL, '2025-06-18 01:40:54', '2025-06-18 01:40:54'),
(27, '15', '3', 1, 100, 100, NULL, '2025-06-18 01:44:01', '2025-06-18 01:44:01'),
(28, '15', '1', 2, 100, 200, NULL, '2025-06-18 01:44:01', '2025-06-18 01:44:01'),
(29, '16', '3', 1, 100, 100, NULL, '2025-06-18 02:05:36', '2025-06-18 02:05:36'),
(30, '16', '1', 1, 100, 100, NULL, '2025-06-18 02:05:36', '2025-06-18 02:05:36'),
(31, '17', '3', 1, 100, 100, NULL, '2025-06-18 02:09:58', '2025-06-18 02:09:58'),
(32, '17', '1', 1, 100, 100, NULL, '2025-06-18 02:09:58', '2025-06-18 02:09:58'),
(33, '18', '3', 1, 100, 100, NULL, '2025-06-18 02:26:30', '2025-06-18 02:26:30'),
(34, '19', '3', 1, 100, 100, NULL, '2025-06-18 02:30:52', '2025-06-18 02:30:52'),
(35, '19', '1', 1, 100, 100, NULL, '2025-06-18 02:30:52', '2025-06-18 02:30:52'),
(36, '20', '3', 1, 100, 100, NULL, '2025-06-18 02:42:14', '2025-06-18 02:42:14'),
(37, '21', '5', 1, 100, 100, NULL, '2025-06-19 05:39:36', '2025-06-19 05:39:36'),
(38, '21', '7', 3, 100, 300, NULL, '2025-06-19 05:39:36', '2025-06-19 05:39:36'),
(39, '22', '9', 1, 100, 100, NULL, '2025-06-19 06:17:19', '2025-06-19 06:17:19'),
(40, '23', '5', 1, 100, 100, NULL, '2025-06-19 08:29:48', '2025-06-19 08:29:48'),
(41, '24', '17', 12, 600, 7200, NULL, '2025-07-07 08:35:25', '2025-07-07 08:35:25'),
(42, '25', '12', 2, 1000, 2000, NULL, '2025-07-07 09:01:43', '2025-07-07 09:01:43'),
(43, '26', '12', 1, 1000, 1000, NULL, '2025-07-07 09:08:05', '2025-07-07 09:08:05'),
(44, '27', '12', 1, 1000, 1000, NULL, '2025-07-07 09:32:11', '2025-07-07 09:32:11'),
(45, '27', '17', 4, 600, 2400, 1200, '2025-07-07 09:32:11', '2025-07-07 09:32:11'),
(46, '28', '12', 1, 1000, 1000, NULL, '2025-07-07 09:37:06', '2025-07-07 09:37:06'),
(47, '28', '17', 4, 600, 2400, 1200, '2025-07-07 09:37:06', '2025-07-07 09:37:06'),
(48, '29', '12', 1, 1000, 1000, NULL, '2025-07-07 09:39:41', '2025-07-07 09:39:41'),
(49, '30', '12', 1, 1000, 1000, NULL, '2025-07-07 09:40:42', '2025-07-07 09:40:42'),
(51, '31', '12', 1, 1000, 1000, NULL, '2025-07-07 09:44:51', '2025-07-07 09:44:51'),
(52, '31', '17', 4, 600, 2400, 1200, '2025-07-07 09:44:51', '2025-07-07 09:44:51'),
(53, '32', '12', 1, 1000, 1000, NULL, '2025-07-07 09:47:33', '2025-07-07 09:47:33'),
(54, '32', '17', 4, 600, 2400, 1200, '2025-07-07 09:47:33', '2025-07-07 09:47:33'),
(55, '33', '12', 1, 1000, 1000, NULL, '2025-07-07 09:48:09', '2025-07-07 09:48:09'),
(56, '33', '17', 4, 600, 2400, 1200, '2025-07-07 09:48:09', '2025-07-07 09:48:09'),
(57, '34', '12', 1, 1000, 1000, NULL, '2025-07-07 09:49:28', '2025-07-07 09:49:28'),
(58, '34', '17', 4, 600, 2400, 1200, '2025-07-07 09:49:28', '2025-07-07 09:49:28'),
(59, '35', '12', 1, 1000, 1000, NULL, '2025-07-07 09:51:02', '2025-07-07 09:51:02'),
(60, '35', '17', 4, 600, 2400, 1200, '2025-07-07 09:51:02', '2025-07-07 09:51:02'),
(61, '36', '17', 4, 600, 2400, 1200, '2025-07-08 06:34:26', '2025-07-08 06:34:26'),
(62, '36', '12', 1, 1000, 1000, NULL, '2025-07-08 06:34:26', '2025-07-08 06:34:26'),
(63, '37', '17', 4, 600, 2400, 1200, '2025-07-08 06:36:34', '2025-07-08 06:36:34'),
(64, '37', '12', 1, 1000, 1000, NULL, '2025-07-08 06:36:34', '2025-07-08 06:36:34'),
(65, '38', '17', 4, 600, 2400, 1200, '2025-07-08 06:38:30', '2025-07-08 06:38:30'),
(66, '38', '12', 1, 1000, 1000, NULL, '2025-07-08 06:38:30', '2025-07-08 06:38:30'),
(67, '39', '17', 1, 600, 600, NULL, '2025-07-08 07:26:31', '2025-07-08 07:26:31'),
(68, '40', '12', 1, 1000, 1000, NULL, '2025-07-08 07:32:59', '2025-07-08 07:32:59'),
(69, '40', '17', 1, 600, 600, 300, '2025-07-08 07:32:59', '2025-07-08 07:32:59'),
(70, '41', '17', 5, 600, 3000, 1500, '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(71, '41', '12', 1, 1000, 1000, NULL, '2025-07-08 08:03:46', '2025-07-08 08:03:46'),
(72, '42', '12', 1, 1000, 1000, NULL, '2025-07-08 08:05:02', '2025-07-08 08:05:02'),
(73, '42', '17', 1, 600, 600, NULL, '2025-07-08 08:05:02', '2025-07-08 08:05:02'),
(74, '43', '12', 1, 1000, 1000, NULL, '2025-07-08 08:06:46', '2025-07-08 08:06:46'),
(75, '43', '17', 1, 600, 600, 300, '2025-07-08 08:06:46', '2025-07-08 08:06:46'),
(76, '44', '15', 1, 6, 6, NULL, '2025-07-08 09:24:19', '2025-07-08 09:24:19'),
(77, '45', '15', 3, 6, 18, NULL, '2025-07-11 04:12:08', '2025-07-11 04:12:08'),
(78, '46', '17', 2, 600, 1200, NULL, '2025-07-14 06:22:38', '2025-07-14 06:22:38');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, 'App\\Models\\User', 4, 'MyAppToken', '148852753e8695df30130a98cb03b0a6a0f626ff70b139764ab6fda3e416dd33', '[\"*\"]', NULL, NULL, '2025-06-12 01:15:18', '2025-06-12 01:15:18'),
(2, 'App\\Models\\User', 5, 'MyAppToken', 'c83a36346ba7650cb77c5e8bcef2af820342112b7632ee108b99d6f6857e4b90', '[\"*\"]', NULL, NULL, '2025-06-12 01:32:43', '2025-06-12 01:32:43'),
(3, 'App\\Models\\User', 6, 'MyAppToken', '2b9256381d6ab8690393e6fa7a0a56fc92e972719677e9e970a3f87c4dec07ec', '[\"*\"]', NULL, NULL, '2025-06-12 01:34:16', '2025-06-12 01:34:16'),
(4, 'App\\Models\\User', 7, 'MyAppToken', '37f711e3ec73e978287070d50ac6664f7d8b224c35d6dff09cc2cd25e0998001', '[\"*\"]', NULL, NULL, '2025-06-12 01:48:15', '2025-06-12 01:48:15'),
(5, 'App\\Models\\User', 7, 'MyAppToken', '81c1f115555c6f61b617720a11dd2e55e8d2e1dba621c8bd1ea3ef5edbc15872', '[\"*\"]', NULL, NULL, '2025-06-12 01:52:23', '2025-06-12 01:52:23'),
(6, 'App\\Models\\User', 7, 'MyAppToken', 'e32491d4de44ea3dc0534e2811d2c55b3fa5422fd68b7b19fb3a305a2cdf9028', '[\"*\"]', NULL, NULL, '2025-06-12 01:59:23', '2025-06-12 01:59:23'),
(7, 'App\\Models\\User', 7, 'MyAppToken', '81d9f013d63b01c30d719c4a776107466fb0d7d3a399096f93732246034487b0', '[\"*\"]', NULL, NULL, '2025-06-12 02:32:44', '2025-06-12 02:32:44'),
(8, 'App\\Models\\User', 7, 'MyAppToken', '3fce63095bd0871fded1694822ffbc78ebcd3d637943e0a6d693902c32148466', '[\"*\"]', NULL, NULL, '2025-06-12 02:32:57', '2025-06-12 02:32:57'),
(9, 'App\\Models\\User', 1, 'MyAppToken', '295c0a0a8db28aa8aee1bb21c64adf0867f37203f9dc5d2569f26a25133fdfd3', '[\"*\"]', NULL, NULL, '2025-06-12 02:33:58', '2025-06-12 02:33:58'),
(10, 'App\\Models\\User', 1, 'MyAppToken', '5c90c9c78810e6fab8e04093e85f6b9a94e10bb8e42be8cf15711d3297961a75', '[\"*\"]', NULL, NULL, '2025-06-12 02:34:58', '2025-06-12 02:34:58'),
(11, 'App\\Models\\User', 1, 'MyAppToken', 'e3ca227d9377025d16b328d6491e78ab722ebe9123a0405e6806e231131cb68a', '[\"*\"]', NULL, NULL, '2025-06-12 02:35:16', '2025-06-12 02:35:16'),
(12, 'App\\Models\\User', 1, 'MyAppToken', 'a54d58cdf0de1ff3fa96f747757badd9a530539c989f055d00443dcc319d1cef', '[\"*\"]', NULL, NULL, '2025-06-12 02:39:40', '2025-06-12 02:39:40'),
(13, 'App\\Models\\User', 1, 'MyAppToken', '514fa4e3095574c9f26a46779906aa23f4afc56f43ab6b36a699b67130e8c066', '[\"*\"]', NULL, NULL, '2025-06-12 02:42:42', '2025-06-12 02:42:42'),
(14, 'App\\Models\\User', 1, 'MyAppToken', 'aebe067a5b59fb5aacff55482a2d884bc93d1d26f059dacd61c7f83247ef43b9', '[\"*\"]', NULL, NULL, '2025-06-12 02:57:01', '2025-06-12 02:57:01'),
(15, 'App\\Models\\User', 1, 'MyAppToken', 'c50bc02c20bd4302c5e173b8dd6b08f3be0b94b72f0cde97ee9d20611bf39fe6', '[\"*\"]', NULL, NULL, '2025-06-13 04:33:25', '2025-06-13 04:33:25'),
(16, 'App\\Models\\User', 1, 'MyAppToken', 'b86c974605e57f0643529f423073b22e5ae0680030e7fe243d4eb4d3c7a4acb1', '[\"*\"]', '2025-06-18 02:31:40', NULL, '2025-06-13 06:21:48', '2025-06-18 02:31:40'),
(17, 'App\\Models\\User', 1, 'MyAppToken', '8bdc5805f4da102c6c010d6dc2c9894be6f08d180c0eaf0300721384d8dc38e0', '[\"*\"]', '2025-07-12 05:11:32', NULL, '2025-06-18 00:44:04', '2025-07-12 05:11:32'),
(18, 'App\\Models\\User', 1, 'MyAppToken', '3c5dd1d56bf3776290bce778ff9cdf3cc39bf56785d82fe4d13af3c3831624c9', '[\"*\"]', NULL, NULL, '2025-06-18 02:33:18', '2025-06-18 02:33:18'),
(19, 'App\\Models\\User', 1, 'MyAppToken', '008e95426885e2382b1b26fedf0d57b44d7ef9e6ee0ed36691e0674eecfaff3b', '[\"*\"]', '2025-06-20 03:14:12', NULL, '2025-06-18 02:35:19', '2025-06-20 03:14:12'),
(20, 'App\\Models\\User', 2, 'MyAppToken', '1767c1ca04209831f960d882b55783917fc44825ebb5d4ab193bb86ca4aeffbe', '[\"*\"]', NULL, NULL, '2025-06-20 03:42:10', '2025-06-20 03:42:10'),
(21, 'App\\Models\\User', 2, 'MyAppToken', '66e159fe850b140d6d5111e2ad7d3d0743c32cca02c5f050e1459d54fae3434e', '[\"*\"]', '2025-06-20 04:27:22', NULL, '2025-06-20 03:42:51', '2025-06-20 04:27:22'),
(22, 'App\\Models\\User', 1, 'MyAppToken', '8a79d682d4f43866a3ab95246f1b272db3e5701cdd51d05f55c2d8135f91f47f', '[\"*\"]', '2025-06-20 10:58:42', NULL, '2025-06-20 04:30:14', '2025-06-20 10:58:42'),
(23, 'App\\Models\\User', 2, 'MyAppToken', 'a90b14ed085b95ad828454512397223e8ada1a5d3a1ab64431f8c0817633a775', '[\"*\"]', '2025-06-20 10:00:57', NULL, '2025-06-20 05:02:07', '2025-06-20 10:00:57'),
(24, 'App\\Models\\User', 2, 'MyAppToken', 'a8784eb1e713c6524da49111f16a397a67e5e270331e30fbc0705b4ebf722bbb', '[\"*\"]', '2025-06-20 11:02:14', NULL, '2025-06-20 10:59:03', '2025-06-20 11:02:14'),
(25, 'App\\Models\\User', 1, 'MyAppToken', 'e78fecbfe2352e6a5ce77df69d1a77535233580d348e38336247a13423369c58', '[\"*\"]', '2025-06-21 04:19:32', NULL, '2025-06-20 11:02:35', '2025-06-21 04:19:32'),
(26, 'App\\Models\\User', 1, 'MyAppToken', '45595f779bd93814b3e8e06b54273fe496901e217457066fbc1303e0e44ed735', '[\"*\"]', '2025-06-23 07:41:30', NULL, '2025-06-21 04:19:45', '2025-06-23 07:41:30'),
(27, 'App\\Models\\User', 1, 'MyAppToken', '9ce8083d5228e4252a068ac99420324cd5e86a53353e2cf6b4332eaaef262c7b', '[\"*\"]', '2025-06-21 15:45:39', NULL, '2025-06-21 11:31:05', '2025-06-21 15:45:39'),
(28, 'App\\Models\\User', 3, 'MyAppToken', '56da68859c0fa1eb2e93937685dfb5e68dfa9ad87c28cff0748ab43f7c7988a7', '[\"*\"]', NULL, NULL, '2025-06-23 07:48:28', '2025-06-23 07:48:28'),
(29, 'App\\Models\\User', 1, 'MyAppToken', '390686ac6cd18dd6d09c0fd3f1190903d9d9ab7a1f91119fda59ce622a000a92', '[\"*\"]', '2025-07-12 05:20:38', NULL, '2025-06-23 08:32:37', '2025-07-12 05:20:38'),
(30, 'App\\Models\\User', 1, 'MyAppToken', 'c2f26b35cd8533016a4b49da57861d6256e3541ab30ac73772b2ad3c7aa53982', '[\"*\"]', '2025-07-14 06:25:39', NULL, '2025-07-12 05:29:10', '2025-07-14 06:25:39'),
(31, 'App\\Models\\User', 4, 'MyAppToken', '91cd7107e0ed45f5f26550310766cae4c2e9eca333ebeafa2fe77c3a94161b18', '[\"*\"]', NULL, NULL, '2025-07-14 06:36:19', '2025-07-14 06:36:19'),
(32, 'App\\Models\\User', 4, 'MyAppToken', '9775978ec9f730c1fd0282c3244050208a6231f3ae3046315089936048baadb9', '[\"*\"]', '2025-07-14 06:39:09', NULL, '2025-07-14 06:36:40', '2025-07-14 06:39:09'),
(33, 'App\\Models\\User', 4, 'MyAppToken', '7f652a587b938a1f4bf2c25c09c6e0c9d95b88d36d66916e3a68488feac8adf0', '[\"*\"]', '2025-07-15 03:18:34', NULL, '2025-07-15 03:18:31', '2025-07-15 03:18:34'),
(34, 'App\\Models\\User', 5, 'MyAppToken', 'd0e607e051659780c0b8bf6771f9aa7c90763e70600888279dd42ffa50d6ef2a', '[\"*\"]', NULL, NULL, '2025-07-15 03:44:46', '2025-07-15 03:44:46'),
(35, 'App\\Models\\User', 6, 'MyAppToken', '904f57d86e7adc707e91aced06b594d59911588c601d12e1c9218b13c8d7f5fe', '[\"*\"]', NULL, NULL, '2025-07-15 03:46:51', '2025-07-15 03:46:51'),
(36, 'App\\Models\\User', 7, 'MyAppToken', '847455cf6bf627f97b2f11b68c569a16ce961752e7478b340be98f0f4be732e0', '[\"*\"]', NULL, NULL, '2025-07-15 03:51:11', '2025-07-15 03:51:11'),
(37, 'App\\Models\\User', 7, 'MyAppToken', 'f5c07294aceb3c5c2a1c89f39862fede1c20393fce233ceabbef2a02d0e6e6c6', '[\"*\"]', '2025-07-15 03:56:04', NULL, '2025-07-15 03:56:01', '2025-07-15 03:56:04'),
(38, 'App\\Models\\User', 1, 'MyAppToken', 'ed36c7c38886219165e3d06fd5e444d3c41055cb900a0aa530a1c114c7cc5bc0', '[\"*\"]', '2025-07-29 04:43:16', NULL, '2025-07-15 10:48:40', '2025-07-29 04:43:16'),
(39, 'App\\Models\\User', 1, 'MyAppToken', '9b652b4a2685f14eb3393ccd5419e90199f4ca4f6bf63d7e1df347b2e1bb959c', '[\"*\"]', '2025-08-09 06:46:12', NULL, '2025-08-04 02:16:43', '2025-08-09 06:46:12'),
(40, 'App\\Models\\User', 1, 'MyAppToken', 'd5c51d57a184fb589d59c551c4743fc3d29a0b68e4afe8a3176b24ffa43269e2', '[\"*\"]', '2025-08-09 07:04:57', NULL, '2025-08-09 06:47:02', '2025-08-09 07:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `min_stock` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `daily_price` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `rented_out` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'both, vente, location',
  `free_shipping` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `short_description`, `image_url`, `category_id`, `brand`, `stock`, `min_stock`, `weight`, `sale_price`, `daily_price`, `available`, `featured`, `rented_out`, `type`, `free_shipping`, `created_at`, `updated_at`) VALUES
(12, 'JBL EON #615', '<p>Enceinte large bande active 2 voies 15\" + 1\" Puissance: 500W RMS / 1000W crête Réponse en fréquence: 47 Hz - 20 kHz (-10 dB) SPL max: 127 dB Dispersion pavillonnaire: 90º x 50° 2 entrées combo XLR / jack 6,3 mm niveau ligne ou micro 4 DSP avec plus de réglages via Bluetooth (pas d\'audio via Bluetooth !) Contrôle du niveau d\'entrée Sortie parallèle XLR Embase pour pied d\'enceinte 35 mm Dimensions: 708 x 429 x 368 mm Poids: 17,7 kg</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ybvuKXTP4kkYaRcgkhmz0UhL6C2MBYMqdg4lPOBM.png', '7', 'UBL', 998, 1, 17.7, 1000, 45, 1, 1, NULL, 'location', 0, '2025-06-21 14:50:40', '2025-07-14 14:26:48'),
(13, 'JBL EON #715', '<p>Enceinte large bande active 2 voies 15\" + 1\"</p><p>Puissance: 500W RMS / 1000W crête</p><p>Réponse en fréquence: 47 Hz - 20 kHz (-10 dB)</p><p>SPL max: 127 dB</p><p>Dispersion pavillonnaire: 90º x 50°</p><p>2 entrées combo XLR / jack 6,3 mm niveau ligne ou micro</p><p>4 DSP avec plus de réglages via Bluetooth (pas d\'audio via Bluetooth !)</p><p>Contrôle du niveau d\'entrée</p><p>Sortie parallèle XLR</p><p>Embase pour pied d\'enceinte 35 mm</p><p>Dimensions: 708 x 429 x 368 mm</p><p>Poids: 17,7 kg</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/FZLNi8isLxUJATNCx1ocHeJpSpRLAGBPvuln7AkE.png', '7', 'UBL', 90, 1, 17.7, NULL, 50, 1, 1, NULL, 'location', 0, '2025-06-21 15:04:44', '2025-07-14 14:26:28'),
(15, 'Spot PAR LED Filaire - Stairville 5x3W', '<p>Intensité lumineuse : env. 9000 lux à 1 m</p><p>Angle de diffusion : 25°</p><p>Modes DMX-512 : 4, 6 ou 8 canaux</p><p>Mode automatique</p><p>Mode maître/esclave</p><p>Entrée et sortie DMX sur XLR 3 broches</p><p>Refroidissement par ventilateur thermorégulé</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/2twsEU8TmBra3c4zaF6jpqUjxCZnkCDOx4Kahl04.png', '2', 'Starvlle', 100, 1, 2, NULL, 6, 1, 1, NULL, 'location', 0, '2025-06-21 15:19:09', '2025-06-21 15:19:17'),
(18, 'BST FIRST-SA15DSP2', '<p>Enceinte Amplifiée 38cm 600W en bois avec DSP et écran LCD BST FIRST-SA15DSP2</p><p>Modes: Live, Music, Speech, DJ</p><p>Afficheur DSP</p><p>Connecteurs: 2 entrées Combo Ligne/Micro,Bluetooth, Sortie Mix par XLR</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/BVUT0L8OveGpWA8yNxta4NV68oNTXm8gWM52zOkw.png', '7', 'BST', 100, 1, 25, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-14 11:31:10', '2025-07-14 14:26:09'),
(19, 'BST FIRST-SP12', '<p>LF : Amplificateur de classe D</p><p>HF : Amplificateur de classe AB</p><p>DSP 24bit avec une fréquence déchantillonnage de 96kHz</p><p>Modes: Live, Music, Speech, DJ</p><p>Afficheur DSP</p><p>Connecteurs: 2 entrées Combo Ligne/Micro, Bluetooth, Sortie Mix par XLR</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Hyow2LOBsxpZppZhZ2dK9jSsU3FITztHAgnwFtZj.png', '7', 'BST', 100, 1, 25, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 11:33:15', '2025-07-14 14:25:58'),
(20, 'Enceinte DBR12 YAMAHA', '<p>Yamaha DBR12 Enceinte de sonorisation 2 voies Amplification Class D Série DBR</p><p>Haut parleur cone 12”</p><p>Bobine mobile de 2”</p><p>Tweeter de 1”</p><p>Bloc magnétique aimants en ferrite</p><p>Crossover 2.1kHz FIR X Tuning</p><p>Puissance 700W dynamique (500+200) / 325W continue (260+65)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/MVNhV7Mf25sJwSrwON4QkKhBzXEqVGMX2dmKbbqh.png', '7', 'YAMAHA', 100, 1, 15.8, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-14 11:35:21', '2025-07-14 14:25:51'),
(21, 'Retour/Wedge A12', '<p>Montage coaxial 12\" + 1,35\"</p><p>Puissance (bi-amplifaction): LF 300W</p><p>(classe D) + HF 50W (classe AB) et 700W crête</p><p>Dispersion: 80° x 80°</p><p>Double limiteur</p><p>SPL max: 124 dB</p><p>Réponse en fréquence: 50 Hz - 20 kHz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/mHOFKJqIG7flWyBdjoHpMv10xQasgviLr0lRqeZ0.png', '7', 'THE BOX PRO', 100, 1, 7.5, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-14 11:37:45', '2025-07-14 14:25:42'),
(22, 'Subwoofer JBL 618', '<p>Réponse en fréquence : 31 - 150 Hz</p><p>Amplification de classe D</p><p>Puissance : 500 / 1000 Watt (RMS / crête)</p><p>SPL Max : 134 dB</p><p>Contrôleur DSP programmable</p><p>Fréquence de coupure : 80 / 100 / 120 Hz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/xtnBUJNPnJuNnNCVaBqn5EIucTDqLIb8MNYXa6YD.png', '7', 'UBL', 100, 1, 41.2, NULL, 60, 1, 1, NULL, 'location', 0, '2025-07-14 11:40:06', '2025-07-14 14:25:36'),
(23, 'Subwoofer JBL 718', '<p>Puissance : 750 Watt RMS, 1500 Watt crête</p><p>Équipement : haut-parleur 18\"</p><p>Technologie dbx DriveRack Inside avec suppression automatique de larsen</p><p>Égaliseur de sortie 8 bandes, réglable sur le panneau de commande ou via l\'application de contrôle universelle JBL Pro Connect</p><p>Bluetooth 5.0 Audio Streaming</p><p>Réponse en fréquence : 40 - 150 Hz (-10 dB)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/uS5Sq1ozLsuvTfiIkofC3DYDBi9QFRYaqID3az5z.png', '7', 'UBL', 100, 1, 37, NULL, 70, 1, 1, NULL, 'location', 0, '2025-07-14 11:41:48', '2025-07-14 14:25:28'),
(24, 'Subwoofer TS12S', '<p>Puissance: 2500 Watt crête</p><p>Haut-parleur 12\"</p><p>Réponse en fréquence (-3 dB): 44 - 140 Hz</p><p>Spectre de fréquence (-10 dB): 38 - 152 Hz</p><p>Niveau de pression sonore max.: 130 dB (à 1 m)</p><p>2 entrées sur XLR + Jack 6,3 mm</p><p>2 sorties sur XLR</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/pNymjGdkq1W9dWXyjGef9Bv7UrUzJJFcJTovykBR.png', '7', 'ALTO', 100, 1, 25.9, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-14 11:43:20', '2025-07-14 14:25:20'),
(25, 'Enceinte KRK', '<p>Haut-parleur 6,5\" en verre-aramide</p><p>Tweeter 1\" en verre-aramide</p><p>Amplificateur de classe D de 145 Watt biamplifié : tweeter 48 Watt, Haut-parleur 97W</p><p>Niveau de pression sonore Max : 110 dB (SPL)</p><p>Réponse en fréquence : 42 Hz - 40 kHz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/JhTvvreKnCq10mOL0gnjNxBb0a4ba7gkjfpYWoIh.png', '7', 'KRK', 100, 1, 7.7, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-14 11:44:39', '2025-07-14 14:25:12'),
(26, 'Enceinte Mobile', '<p>Puissance : 120 Watt</p><p>3 entrées pour les sources audio câblées : 2x micro/ligne, 1x ligne stéréo</p><p>Sortie ligne par jack</p><p>Durée moyenne de fonctionnement de la batterie, pour la musique : environ 4 heures, pour la parole : environ 6 heures</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/uJ4XKo0Ratec4C0ZwnVCYPOu5JU1EydBhke8g6BR.png', '7', 'THE BOX PRO', 100, 1, 8.9, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-14 11:46:07', '2025-07-14 14:25:01'),
(27, 'Bose S1 Pro', '<p>Puissance: 2500 Watt crête</p><p>Haut-parleur 12\"</p><p>Réponse en fréquence (-3 dB): 44 - 140 Hz</p><p>Spectre de fréquence (-10 dB): 38 - 152 Hz</p><p>Niveau de pression sonore max.: 130 dB (à 1 m)</p><p>2 entrées sur XLR + Jack 6,3 mm</p><p>2 sorties sur XLR</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/M3akSP5JROdbeZsY7qiP8zpuUCHrgvcv7sOB2LWk.png', '7', 'ROSE', 100, 1, 26, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-14 11:47:41', '2025-07-14 14:24:52'),
(28, 'Bose F1', '<p>Haut-parleur 6,5\" en verre-aramide</p><p>Tweeter 1\" en verre-aramide</p><p>Amplificateur de classe D de 145 Watt biamplifié : tweeter 48 Watt, Haut-parleur 97 Watt</p><p>Niveau de pression sonore Max : 110 dB (SPL)</p><p>Réponse en fréquence : 42 Hz - 40 kHz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/MnUGC29F0iiE5aupz65enJn6GiO4aOFD1TnbN05n.png', '7', 'ROSE', 100, 1, 7.65, NULL, 270, 1, 1, NULL, 'location', 0, '2025-07-14 11:48:56', '2025-07-14 14:24:43'),
(29, 'Bose F1 Système complet', '<p>Full system (2 têtes + 2 Subs)</p><p>2x Bose F1 Model 812</p><p>Haut-parleur 6,5\" en verre-aramide</p><p>Tweeter 1\" en verre-aramide</p><p>Amplificateur de classe D de 145 Watt biamplifié : tweeter 48 Watt, Haut-parleur 97 Watt</p><p>Niveau de pression sonore Max : 110 dB (SPL)</p><p>Réponse en fréquence : 42 Hz - 40 kHz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/8RxnnDPqox0hj0hQqUpHLUk0vjkBc9zkYY3Q2tDW.png', '7', 'ROSE', 100, 1, 20.2, NULL, 500, 1, 1, NULL, 'location', 0, '2025-07-14 11:50:12', '2025-07-14 14:24:37'),
(30, 'Pack JBL #1 (100 pax)', '<p>2 enceintes JBL #615 avec pieds inclus</p><p>Enceinte large bande active 2 voies 15\" + 1\"</p><p>Puissance : 500W RMS / 1000W crête</p><p>Réponse en fréquence : 47 Hz - 20 kHz (-10 dB)</p><p>SPL max : 127 dB</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ZLC9s9eFYRvEN5RhhqESjvQcyaDIrUoZwtJi4vHE.png', '7', 'UBL', 100, 1, 42, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-14 11:51:59', '2025-07-14 14:24:31'),
(31, 'Pack JBL #2 (100 PAX)', '<p>2 enceintes JBL #615 et #618 avec pieds inclus</p><p>Enceinte large bande active 2 voies 15\" + 1\"</p><p>Puissance : 500W RMS / 1000W crête</p><p>Réponse en fréquence: 47 Hz - 20 kHz (-10 dB)</p><p>SPL max : 127 dB</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/FVCPvq2KaMTN6ej3B507MopmYf79vePc8esGaKXA.png', '7', 'UBL', 100, 1, 35.5, NULL, 140, 1, 1, NULL, 'location', 0, '2025-07-14 11:53:37', '2025-07-14 14:24:24'),
(32, 'Pack JBL #3 (200 PAX)', '<p>2 enceintes JBL #615 et 2 enceinte JBL #618</p><p>avec tubes inclus</p><p>Enceinte large bande active 2 voies 15\" + 1\"</p><p>Puissance : 500W RMS / 1000W crête</p><p>Réponse en fréquence: 47 Hz - 20 kHz (-10 dB)</p><p>SPL max : 127 dB</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/0TQ9cYYRmgewEGiwPnnbLduCQqNm9vAolhhdmgSU.png', '7', 'UBL', 100, 1, 113, NULL, 200, 1, 1, NULL, 'location', 0, '2025-07-14 11:55:28', '2025-07-14 14:24:18'),
(33, 'Pack JBL #4 (400 PAX)', '<p>4 enceintes JBL #615 et 2 enceinte JBL #618</p><p>avec tubes et cornes inclus</p><p>Enceinte large bande active 2 voies 15\" + 1\"</p><p>Puissance : 500W RMS / 1000W crête</p><p>Réponse en fréquence: 47 Hz - 20 kHz (-10 dB)</p><p>SPL max : 127 dB</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/C5fNRfD9drcMa9GHQcHJpyg7wXHa4If6Xs3OocsI.png', '7', 'UBL', 100, 1, 149.8, NULL, 270, 1, 1, NULL, 'location', 0, '2025-07-14 11:56:53', '2025-07-14 14:24:10'),
(34, 'Pack YAMAHA/alto #1 (80 PAX)', '<p>2 enceintes Yamaha #DBR12</p><p>Amplification Class D Série DBR</p><p>Haut parleur cone 12”</p><p>Bobine mobile de 2”</p><p>Tweeter de 1”</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Coz7IJoRFkRfz3TOuYuqsjrm91ldV3DxkiaikhZ5.png', '7', 'YAMAHA', 100, 1, 15.8, NULL, 70, 1, 1, NULL, 'location', 0, '2025-07-14 12:03:23', '2025-07-14 14:23:56'),
(35, 'Pack YAMAHA/alto #2 (80 PAX)', '<p>2 enceintes Yamaha #DBR12 et</p><p>1 enceinte ALTO #TS12S</p><p>Amplification Class D Série DBR</p><p>Haut parleur cone 12”</p><p>Bobine mobile de 2”</p><p>Tweeter de 1”</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ggKhTYvVmEpu4uj165eIioGF2czj10dFVdrBNkdp.png', '7', 'YAMAHA', 100, 1, 57.5, NULL, 100, 1, 1, NULL, 'location', 0, '2025-07-14 12:05:30', '2025-07-14 14:23:31'),
(36, 'Pack YAMAHA/alto #3 (150 PAX)', '<p>2 enceintes Yamaha #DBR12 et</p><p>2 enceintes ALTO #TS12S</p><p>Amplification Class D Série DBR</p><p>Haut parleur cone 12”</p><p>Bobine mobile de 2”</p><p>Tweeter de 1”</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/zkk3JN4grr5WrVW4H0oNoWEwvF9rq2SnH2zN4gs7.png', '7', 'YAMAHA', 100, 1, 83.4, NULL, 130, 1, 1, NULL, 'location', 0, '2025-07-14 12:06:49', '2025-07-14 14:23:24'),
(37, 'Pack YAMAHA/alto #4 (200 PAX)', '<p>4 enceintes Yamaha #DBR12 et</p><p>2 enceintes ALTO #TS12S</p><p>Amplification Class D Série DBR</p><p>Haut parleur cone 12”</p><p>Bobine mobile de 2”</p><p>Tweeter de 1”</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/P2V7RWf3zY8Mc2J4ESugiUBsp1a4M1hCFCguUHG1.png', '7', 'YAMAHA', 100, 1, 115, NULL, 200, 1, 1, NULL, 'location', 0, '2025-07-14 12:07:51', '2025-07-14 14:23:15'),
(38, 'Table de Mixage - Yamaha MG06X', '<p>2x entrées niveau micro ou ligne (XLR/jack 6,3 mm TRS)</p><p>Pré-amplis micro D-Pre avec circuit de dérivation Inverted Darlington</p><p>Alimentation Phantom +48V</p><p>Égaliseur 2 bandes</p><p>Filtre passe-haut et pad atténuateur de 26 dB</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/HthvtVFeGklixxYJ3yjPlTV0HmIENFWwZurDpFW0.png', '10', 'YAMAHA', 100, 1, 0.9, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 12:17:45', '2025-07-14 14:23:07'),
(39, 'Table de Mixage - Yamaha MG10XU', '<p>Table de Mixage MG10 XU</p><p>10 canaux</p><p>4 entrées micro (XLR / jack) avec alimentation fantôme + 48V: canaux 1-2 avec compresseur intégré</p><p>Égaliseur 3 bandes</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/YTsbX1FnXqa7uXjmdUK10toJRzwIooDQOMeDaMAR.png', '10', 'YAMAHA', 100, 1, 2.1, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-14 12:20:37', '2025-07-14 14:23:00'),
(40, 'Table de Mixage - Yamaha MG10XUF', '<p>Table de mixage MG10 XUF</p><p>10 entrées - 4 mono, 3 stéréo</p><p>Sorties XLR symétriques</p><p>Préampli micro \"D-PRE\" avec circuit Darlington inversé</p><p>Alimentation fantôme +48 V</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/yMap9LMUzPZw1TRVPbHDrqEBTiRPn2PLyc640vgv.png', '10', 'YAMAHA', 98, 1, 3.3, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 12:24:30', '2025-07-14 14:22:52'),
(41, 'Table de Mixage - Yamaha MG012', '<p>Console analogique</p><p>12 canaux</p><p>6 préamplis micros classe A D-PRE avec circuit Darlington inversé</p><p>Alimentation phantom +48V commutable pour les canaux 1-6</p><p>12 entrées de niveau ligne (4 mono + 4 stéréo)</p><p>2 entrées Aux (AUX 1 commutable entre préfader et postfader)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/QlGs3Anb7MAgsh9qPnBfR2EYPFfG6BHMe7Gy5wxg.png', '10', 'YAMAHA', 100, 1, 4.2, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-14 12:26:05', '2025-07-14 14:22:45'),
(42, 'Table de Mixage - Yamaha MG12XU', '<p>Table de Mixage MG10 XU 10 canaux</p><p>4 entrées micro (XLR / jack) avec alimentation fantôme + 48V: canaux 1-2 avec compresseur intégré</p><p>Égaliseur 3 bandes</p><p>Filtre passe-haut et commutateur d\'atténuation de 26 dB</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/cbWQ3EuhUKd8EyF2gVOjTrWaijJnu3huB0efzySB.png', '10', 'YAMAHA', 100, 1, 2.1, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-14 12:27:21', '2025-07-14 14:22:33'),
(43, 'YAMAHA LS9-16', '<p>16 canaux d\'entrée micro/ligne mono et 4 canaux d\'entrée stéréo, extensibles jusqu\'à 32 canaux en deux couches.</p><p>16 bus de mixage, 8 bus de matrice, plus des bus stéréo et mono avec mode LCR.</p><p>Compact et léger, il peut être facilement déplacé et installé par une seule personne (12,0 kg).</p><p>Rack virtuel équipé d\'effets et d\'égaliseurs pour répondre à toutes les exigences de traitement.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/qqjfOfkaoDeixR2n5eO1wxTj5nubxcy6KhYb1w4y.png', '10', 'YAMAHA', 100, 1, 12, NULL, 90, 1, 1, NULL, 'location', 0, '2025-07-14 12:28:23', '2025-07-14 14:22:26'),
(44, 'Behringer Xenyx X2442 USB', '<p>10 entrées microphone avec alimentation fantôme </p><p>48 Volt et filtre coupe-bas 75 Hz</p><p>EQ 3 bandes avec médiums paramétriques, compresseur et insert dans les canaux 1-8</p><p>4 entrées stéréo</p><p>4 voies Aux (2 Pre/Post commutables, 2 Post)</p><p>4 sous-groupes avec sortie séparée</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/cxBCmNazR8HMOolXyQd01zho64dbyv3VM2Ww6UyY.png', '10', 'GAMME', 100, 1, 6.8, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-14 12:29:46', '2025-07-14 12:29:46'),
(45, 'Micro HF Sans fil T-Bone (double)', '<p>Système UHF sans fil 2 canaux</p><p>2 micros à main sans fil avec capsules dynamiques (cardioïde)</p><p>Gamme de fréquence: 823 - 832 MHz</p><p>8 groupes de fréquences préprogrammés avec 8 canaux chacun</p><p>1 canal utilisateur</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/6H52NL7bAYdwngrpsKsObVc6Sl6V4blLxJT7X6Xx.png', '11', 'THE BOX PRO', 100, 1, 2.9, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 14:02:24', '2025-07-14 14:22:14'),
(46, 'Micro HF Sans fil T-Bone (En Rack)', '<p>Système UHF sans fil 2 canaux</p><p>2 micros à main sans fil avec capsules dynamiques (cardioïde)</p><p>Gamme de fréquence: 823 - 832 MHz</p><p>8 groupes de fréquences préprogrammés avec 8 canaux chacun</p><p>1 canal utilisateur</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Ul5Q1nL7KDwTjDzXNJWEgiTHOuQd49zeBXE6qbu1.png', '11', 'THE BOX PRO', 100, 1, 2.9, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 14:19:00', '2025-07-14 14:22:08'),
(47, 'Micro HF Sans fil T-Bone (simple)', '<p>Club mixer 4 canaux - Contrôle de crossfader</p><p>Fader Start</p><p>Égaliseur 3 bandes (-26 dB à +6 dB) et isolateur 3 bandes (-6 dB)</p><p>Talk Over (-20 dB)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/rOVPjFzpI2AvGPHBZHAoKibwxeW6HNrzKKJAh15A.png', '11', 'THE BOX PRO', 100, 1, 5.4, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 14:20:22', '2025-07-14 14:22:02'),
(48, 'QLXD4 - SM58 QLXD Shure', '<p>Plan de fréquence K51 606MHz-670MHz</p><p>Directivité du micro : Cardioïde</p><p>Plan de fréquence : Plan K51 (606MHz - 670MHz)</p><p>Technologie HF : HF Numérique</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Ndglx4AqhaBWvPsuL5sXk3evEvVTJ72gAefyOqRG.png', '11', 'SHURE', 100, 1, 1.47, NULL, 45, 1, 1, NULL, 'location', 0, '2025-07-14 14:29:46', '2025-07-14 14:31:59'),
(49, 'Micro Filaire Shure S55 (chant)', '<p>Micro voix dynamique \"Elvismic\"</p><p>Directivité : cardioïde</p><p>Réponse en fréquence : 50 Hz - 15 kHz</p><p>Sensibilité : -58 dBV/Pa (1,3 mV)</p><p>Bouton marche / arrêt</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/oeN2IYN7y3cEWgUSZyeRlNhHFLLq4mF1xzZekzRi.png', '11', 'SHURE', 100, 1, 0.5, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 14:30:55', '2025-07-14 14:31:53'),
(50, 'Micro Filaire T-Bone GM55 (chant)', '<p>Microphone de chant dynamique T.Bone GM55</p><p>Modèle \"Elvis\"</p><p>Directivité : Supercardioïde</p><p>Réponse en fréquence : 40 - 17000 Hz</p><p>Sensibilité : 2,4 mV/Pa</p><p>SPL max. : 155 dB</p><p>Impédance : 415 Ohm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/6xrKmSnBzog1BGmptg5Mvorcgu876tFEdYoCbzPF.png', '11', 'THE BOX PRO', 100, 1, 0.53, NULL, 18, 1, 1, NULL, 'location', 0, '2025-07-14 14:32:48', '2025-07-14 14:32:48'),
(51, 'Micro Col de Cygne (conférence)', '<p>Plan de fréquence K51 606MHz-670MHz</p><p>Directivité du micro : Cardioïde</p><p>Plan de fréquence : Plan K51 (606MHz - 670MHz)</p><p>Technologie HF : HF Numérique</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ugRWhTfgPbCWu8pJznucGNF0s4MsdCg5xd4AUuGt.png', '11', 'THE BOX PRO', 100, 1, 1.47, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 14:34:11', '2025-07-14 14:34:11'),
(52, 'Micro Filaire Dynamique', '<p>Micro à main dynamique</p><p>Idéal pour fûts de batterie, voix </p><p>et ampli guitare</p><p>Directivité: supercardioïde</p><p>Bouton marche / arrêt</p><p>Câble jack 6,3 mm / XLR de 3 mètres, pince micro et adaptateur de pas de vis inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/UyLc2lkL1TZyJIfY9jDlkRpwXhRF8N5ySs27TYwS.png', '11', 'THE BOX PRO', 100, 1, 0.3, NULL, 15, 1, 1, NULL, 'location', 0, '2025-07-14 14:36:51', '2025-07-14 14:36:51'),
(53, 'Kit De 3 Micros MB 60', '<p>Interrupteur marche / arrêt</p><p>Pinces et mallette fournis</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/D7m0t1cr5ya141MSOCUENNY0dxVFgQkaqhdYI50U.png', '11', 'THE BOX PRO', 100, 1, 4, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 14:38:43', '2025-07-14 14:38:43'),
(54, 'Pied de Micro Noir', '<p>Pied de Micro Noir sans Perche Embase Ronde</p><p>Hauteur minimum : 87 cm</p><p>Hauteur maximum : 152 cm</p><p>Epaisseur du tube : 1,65 mm</p><p>Diamètre de l\'embase : 25 cm</p><p>Poids : 3,44 kg (embase seule 2,6 kg)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Czf2jQLTC8ehfrB4F6b6ls8zixQUm5WRpqof0xq0.png', '11', 'K&M', 100, 1, 3.4, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-14 14:40:22', '2025-07-14 14:40:22'),
(55, 'Pied de Micro Gravity', '<p>Pied de micro avec trépied extra-lourd </p><p>et surface douce au toucher</p><p>Perche extensible avec 2 vis de serrage, </p><p>perche extensible jusqu\'à 880 mm</p><p>Base lourde en zinc moulé sous pression</p><p>Réglable en hauteur de 1030 à 1690 mm</p><p>Revêtement poudré</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/XPqnBFutXqEEGuskisKuUtLYT3C9KVadeGrMRZkw.png', '11', 'GRAVITY', 100, 1, 4.26, NULL, 8, 1, 1, NULL, 'location', 0, '2025-07-14 14:41:58', '2025-07-14 14:41:58'),
(56, 'Pied de Micro perche', '<p>Pied de microphone</p><p>Trépied long</p><p>Surface douce au toucher</p><p>Bras télescopique extensible jusqu\'à 880 mm</p><p>Bras avec 2 points d\'ajustement</p><p>Base robuste en zinc moulé</p><p>Hauteur ajustable de 1030 à 1690 mm</p><p>Poids : 2,7 kg</p><p>Passe-câble de couleur noir inclus</p><p>Pince micro inclue</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/51pXlNTAcBHzEZswqe5rlLgr6o67zvHjv4RoRdqz.png', '11', 'K&M', 100, 1, 2.7, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-14 14:43:22', '2025-07-14 14:43:22'),
(57, 'Pince Micro Adaptable', '<p>Pour microphone de 32 à 42 mm de diamètre</p><p>En plastique incassable</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/c4UQ5rQTJtfXB7zxLBqFx5cJ1NUgGXWeCNQJuDiH.png', '11', 'THE BOX PRO', 100, 1, 0.02, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-14 14:46:20', '2025-07-14 14:46:20'),
(58, 'Barre led', '<p>Barre DMX 4-en-1 avec laser, 2 effets Derby rotatifs à LEDs, 2 projecteurs à LEDs, 1 stroboscope à LEDs blanches et UV</p><p>39 programmes intégrés (avec les 4 unités d\'effets) en mode automatique et musique</p><p>Laser de classe 2M</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/zpoZF6ynYx84IkWbRcMe6NyyqrX26TYSpUkAGaR1.png', '2', 'SHOWTEC', 100, 1, 4.3, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 14:52:41', '2025-07-14 14:52:41'),
(59, 'Barre LED AFX', '<p>AFX Light - Barre De Lumière</p><p>DMX</p><p>Autonome 4-En-1</p><p>Derby</p><p>Astro Uv</p><p>Strobe</p><p>DMX Télécommande</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/xBnJz5wYu5Boc5VLkfByr9Ej82mkGTxI63UxO0xU.png', '2', 'AFX', 100, 1, 5.35, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-14 14:54:42', '2025-07-14 14:54:42'),
(60, 'Mastbar LED AFX', '<p>9 LED RGBWA-UV 6-en-1 de 10W</p><p>6/10 canaux DMX</p><p>Bras supérieur est inclinable</p><p>Pilotage par WIFI</p><p>Modes de fonctionnement DMX, automatique, maître-esclave, contrôlé par le son, la télécommande IR fournie ou par l’application via WIFI</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/LlXC3GZXXxuSVIy7uyIPdiDycEH5FjsgfrcOwsu7.png', '2', 'AFX', 100, 1, 5, NULL, 75, 1, 1, NULL, 'location', 0, '2025-07-14 14:56:26', '2025-07-14 14:56:26'),
(61, 'Spot PAR LED Filaire - Stairville 5x3W', '<p>Intensité lumineuse : env. 9000 lux à 1 m</p><p>Angle de diffusion : 25°</p><p>Modes DMX-512 : 4, 6 ou 8 canaux</p><p>Mode automatique</p><p>Mode maître/esclave</p><p>Entrée et sortie DMX sur XLR 3 broches</p><p>Refroidissement par ventilateur thermorégulé</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/vJiQQnPBbuWQczGINb0qvcUvIhJf3beYEAIUtKdJ.png', '2', 'STARVLLE', 100, 1, 6.2, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-14 14:57:57', '2025-07-14 14:57:57'),
(62, 'Spot PAR LED Filaire - Stairville 5x8W', '<p>Contrôle musique grâce au microphone intégré (sensibilité réglable)</p><p>Mode automatique</p><p>Mode maître/esclave</p><p>Entrée et sortie DMX sur XLR 3 broches</p><p>Refroidissement par ventilateur thermorégulé</p><p>Alimentation: AC 100-240V, 50/60 Hz</p><p>Consommation max. : 32 Watt</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/4zHrhq6V68oFKReA8G4yM2RXp1goYpOJyyYmMOJg.png', '2', 'STARVLLE', 100, 1, 6, NULL, 8, 1, 1, NULL, 'location', 0, '2025-07-14 15:00:10', '2025-07-14 15:00:10'),
(63, 'PAR LED IP65 AFX 18x15W', '<p>Plusieurs températures pour le blanc</p><p>Entrée/sortie DMX et alimentation sur connecteurs étanches IP65</p><p>Changeur de couleurs / Stroboscope</p><p>Modes DMX, Maitre/Esclave, Automatique ou Couleur fixe avec programmes intégrés</p><p>Plusieurs modes DMX de 4 à 12 canaux</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/hSQMw7nxsJttGf7DotscthZpWb3JNaq6Ntkvljlt.png', '2', 'AFX', 100, 1, 5.5, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-14 15:01:39', '2025-07-14 15:01:39'),
(64, 'Pack de 6 Spots batterie PAR LED (6x12W)AFX', '<p>Pack de 6 Par Led autonome 5 LED de 12W Rouge-Vert-Bleu-Ambre-Blanc (5 en 1)</p><p>Fonctionne sur secteur 220V ou sur batterie rechargeable au Lithium</p><p>Changeur de couleurs</p><p>Stroboscope</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/5dYWyLUzRWQ7aDAdDguWuRxbzfoPSw3VXA1d1Dox.png', '2', 'AFX', 100, 1, 18, NULL, 175, 1, 1, NULL, 'location', 0, '2025-07-14 15:03:55', '2025-07-14 15:03:55'),
(65, 'Pack de 6 Spots batterie PAR LED (4x15W)', '<p>Ensemble de tournée complet</p><p>Composé de : 6x Stairville BEL4 Battery Event Light avec 4x LED de 15 Watt 6en1 RGB AW+UV et le flightcase de tournée correspondant</p><p>Ensemble idéal pour l\'éclairage mobile et flexible d\'événements</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/FIArHQV6s0GfZ1AGIiiXzw0eByNQIVHdPktkrzVX.png', '2', 'STARVLLE', 100, 1, 40, NULL, 175, 1, 1, NULL, 'location', 0, '2025-07-14 15:05:17', '2025-07-14 15:05:17'),
(66, 'Pack de 4 Spots batterie PAR LED (4x12W) IBIZA', '<p>Pack de 4 projecteurs PAR doté d\'une batterie rechargeable pour éclairage de mur, de colonne en toute liberté pendant des heures</p><p>4 LED RGBWA-UV 6-en-1</p><p>1 / 4 / 6 / 10 canaux DMX</p><p>2 programmes intégrés</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/OxJZo9oTM6DAKdwtngWiGK78rXE1gP97HmzYpN2A.png', '2', 'IBIZA', 100, 1, 14.4, NULL, 100, 1, 1, NULL, 'location', 0, '2025-07-14 15:06:41', '2025-07-14 15:06:41'),
(67, 'Spot a l’unité batterie PAR LED (1x12W) AFX', '<p>Spot Par Led autonome 5 LED de 12W Rouge-Vert-Bleu-Ambre-Blanc (5 en 1)</p><p>Fonctionne sur secteur 220V ou sur batterie rechargeable au Lithium</p><p>Changeur de couleurs</p><p>Stroboscope</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/erT4bdg1HnS8i35SyGWHLvQPOl75JCjeP47CxS0Y.png', '2', 'AFX', 100, 1, 3, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-14 15:08:22', '2025-07-14 15:08:22'),
(68, 'Spot a l’unité batterie PAR LED (1x15W)', '<p>1x Stairville BEL4 Battery Event Light avec 4x LED de 15 Watt 6en1 RGB AW+UV</p><p>Idéal pour l\'éclairage mobile et flexible d\'événements</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/GHSWJjjOP912Wr0Nr2uZ12Am9QSvZtu5C0z6LQYI.png', '2', 'STARVLLE', 100, 1, 3.6, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-14 15:10:49', '2025-07-14 15:10:49'),
(69, 'spot a l’unité batterie PAR LED (1x12W) IBIZA', '<p>Projecteur PAR doté d\'une batterie rechargeable pour éclairage de mur, de colonne en toute liberté pendant des heures</p><p>4 LED RGBWA-UV 6-en-1</p><p>1 / 4 / 6 / 10 canaux DMX</p><p>2 programmes intégrés</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/TEJS6H6R79QBB59ow2Z0YRRAIDVUlFs18XAC0TTj.png', '2', 'IBIZA', 100, 1, 3.6, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-14 15:11:55', '2025-07-14 15:11:55'),
(70, 'Spot LED 200W blanc froid THORN', '<p>THORN LED FL IP66 200W 840 PC</p><p>Spot pour éclairage grande surface, véhicule, façade, architecture...</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/xwQzz0lqqLsq2qMachVKYIJrXkZxyQ8tayN7iMzV.png', '2', 'THORN', 100, 1, 6.6, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 15:14:04', '2025-07-14 15:14:04'),
(71, 'Stroboscope 600W', '<p>Type de LED : 648 x LED CMS de 0,2W RGBW</p><p>Angle du faisceau : 100°.</p><p>Nombre de canaux DMX : 1 / 2 / 3 / 4 / 7</p><p>Connecteur DMX : entrée/sortie XLR 3 broches</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/470B1gWwH7TYnw16wi8bnsJ4OSAoNektKFAZKsTi.png', '2', 'CAMEO', 100, 1, 4.8, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 15:15:32', '2025-07-14 15:15:32'),
(72, 'Boitier à étincelles Sparkular AFX', '<p>Machine à étincelles froides avec télécommande</p><p>Contrôle par DMX ou télécommande fournie</p><p>Hauteur de gerbe d’étincelles 3 - 3,5 m</p><p>Etincelles froides, aucun risque de brûlures</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/cYwGpe4vujEyYtfIrGvwkFRwRo1yp4xwsZ9iRIgR.png', '2', 'AFX', 100, 1, 9, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-14 15:17:34', '2025-07-14 15:17:34'),
(73, 'Poudre pour etincelles froides', '<p>Consommable pour Boitier à étincelles Sparkular AFX</p><p>Etincelles froides, aucun risque de brûlures</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/gLs6MN32RGIEFDiurH4LMwf7iXk0tMbHy5XLyR2b.png', '2', 'AFX', 100, 1, 45, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-14 15:18:54', '2025-07-14 15:18:54'),
(74, 'Machine a bulle', '<p>Fonctionne avec une batterie rechargeable</p><p>Ventilateur haute vitesse permettant de créer des centaines de bulles par minute</p><p>Boîtier rigide en matière plastique</p><p>Consommation électrique : 24 Watt sous 120 Volts, 10 Watt sous 230 Volts</p><p>Consommation de liquide : 1 litre toutes les 50 min. sous 120 Volts, 1 litre toutes les 90 min. sous 230 Volts</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/6VXZEfXmHhVKpirCgpHSrSdXDLlkSnky407F9pMX.png', '2', 'ADJ', 100, 1, 2, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 15:20:17', '2025-07-14 15:20:17'),
(75, 'Produit A Bulle', '<p>Bidon de 5 litres de liquide à bulles ADJ pour machines à bulles</p><p>Prêt à l’usage</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/vlmuyB1CT42WiKaNTAKDDveQLwwG1eLmhy1nOLAP.png', '2', 'ADJ', 100, 1, 4.5, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-14 15:21:22', '2025-07-14 15:21:22'),
(76, 'Machine à fumeée af 150 DMX', '<p>Interface DMX-512 intégrée</p><p>Contrôlable avec n\'importe quel contrôleur DMX-512</p><p>Possibilité de générer pratiquement n\'importe quelle densité de fumée</p><p>Télécommande inclue</p><p>Temps de chauffe : env. 8 min.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/egQ2HCxQJEhZQ4RGGteUqt2yoPFVGrAKVElaz2By.png', '2', 'STARVLLE', 100, 1, 9.7, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 15:22:41', '2025-07-14 15:22:41'),
(77, 'Produit A Fumée En L', '<p>Effet brumeux de longue durée et de densité moyenne</p><p>Liquide fumigène prêt à l\'emploi pour machines à fumée</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/kT42qDp5VYG5QID2v1YITuCCED3CqNgEOyGx6ghB.png', '2', 'PREMIUMFLUIDS', 100, 1, 5.1, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-14 15:24:11', '2025-07-14 15:24:11'),
(78, 'Machine à Fumée Lourde - Stairville GF3000 (carbo-glace)', '<p>Réservoir d\'eau de 8,2 litres</p><p>Capacité de glace sèche: 2,2 kg</p><p>Débit max. : env. 220 m³ / min.</p><p>Temps de chauffe : env. 15 min.</p><p>Alimentation : AC 230V - 50 Hz</p><p>Consommation max. : 2400 Watt</p><p>Température ambiante idéale : -25°C à +25°C</p><p>Carbo-glace non comprise</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/nGXnRhD1vaB16i8h83KbZhdcwIKjtUHKa5PKPuUQ.png', '2', 'STARVLLE', 100, 1, 7.55, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-14 15:25:40', '2025-07-14 15:25:41'),
(79, 'Machine à Brouillard - Stairville AFH-600 DMX Hazer', '<p>Corps de chauffe : Evaporateur électronique de 600 Watt</p><p>Temps de chauffe : env. 2 min.</p><p>Réservoir de 2,3 litres</p><p>Débit de brouillard continu</p><p>Entrée et sortie DMX sur XLR 3 broches</p><p>Alimentation : AC 230V, 50 Hz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/pdG7tVMwBfbV7MafEE9W7rcuXDAKtun9YFlSd0Vi.png', '2', 'STARVLLE', 100, 1, 4.3, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-14 15:26:57', '2025-07-14 15:26:57'),
(80, 'Produit A Brouillard', '<p>Bidon de 5 litres de liquide à brouillard</p><p>Prêt à l’usage</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/o5KDMIxYMTAxvDrCjXdEkdFkSBMMsIhKOwF4dkmb.png', '2', 'MARTIN', 100, 1, 5, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-14 15:28:30', '2025-07-14 15:28:30'),
(81, 'Lyre spot 60 led', '<p>Alimentation : 50 - 60 Hz</p><p>Consommation : 115W</p><p>1 led de 60W blanche</p><p>7 couleurs + blanc</p><p>Gobos : 6 rotatif + 8 fixe</p><p>Pan : 540°</p><p>Tilt : 270°</p><p>Angle : 17° à 25° max</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/tkx2G15IsidT4nuefc8wzKQgs8pNGsCvlDoLCAJt.png', '2', 'AFX', 100, 1, 3.8, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-14 15:29:41', '2025-07-14 15:29:41'),
(82, 'Lyre spot MHX-25', '<p>Source : LED 25 Watt</p><p>Roue de 7 gobos rotatifs + ouvert</p><p>Fonction Gobo Shake</p><p>Système de gobos interchangeable</p><p>Roue de 8 couleurs + blanc</p><p>Système de correction automatique des mouvements Pan et Tilt</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/tJxpa5NxVlJZm4fIio814gxyW4tLnWZ4n97miBAu.png', '2', 'STARVLLE', 100, 1, 3.5, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-14 15:31:12', '2025-07-14 15:31:12'),
(83, 'Lyre spot MHX-50', '<p>Source : 1 LED de 50 Watt</p><p>Puissance de luminosité : 20000 Lux à 1 m</p><p>Angle de diffusion : 14°</p><p>Roue de 8 couleurs + blanc (8 couleurs pleines, 8 demi-couleurs + effet arc-en-ciel)</p><p>Roue de 7 gobos rotatifs + ouvert</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/GS5YhW8KgWhQU0hh0wpqHV7GNs0XDgo41Ae78Hx5.png', '2', 'STARVLLE', 100, 1, 2.5, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-14 15:32:29', '2025-07-14 15:32:29'),
(84, 'Lyre wash/beam 7x40w', '<p>5 modes DMX: HSIC, PERSON1, PERSON2, CMY &amp; PIXEL</p><p>7x 40W 4-en-1 RGBW Osram LED</p><p>Zoom de 4,5º à 36º</p><p>Artnet / RDM / DMX</p><p>Contrôle des pixels</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Blwll56udz0nTcjaDNInTUCgcfBzkJhvsj1WHXoc.png', '2', 'AFX', 100, 1, 9.3, NULL, 45, 1, 1, NULL, 'location', 0, '2025-07-14 15:33:35', '2025-07-14 15:33:35'),
(85, 'Lyre BEEDREAM760-FC', '<p>Lentille frontale rotative</p><p>7 LED RGBW 60W + 39 LED SMD RGB 0.2W</p><p>Flight case professionnel de transport inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/70SqkT2wu8kMxQEEzaYhP0m28uRtkxunmItlG9d1.png', '2', 'AFX', 100, 1, 10, NULL, 48, 1, 1, NULL, 'location', 0, '2025-07-14 15:34:35', '2025-07-14 15:34:35'),
(86, 'Lyre wash/beam 19x40w', '<p>Lentille frontale rotative</p><p>19 LED RGBW 40W + 46 LED SMD RGB 0.2W</p><p>26/38/102/114 canaux DMX</p><p>Fonctionnement DMX, maître-esclave, activation audio ou automatique</p><p>Optiques spécifiques de haute précision</p><p>CTB &amp; CTO, changement linéaire de la température de couleur de 2800-8000°K</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ShXATwJjiMKDD9TGGkE99Julc04g5dw1u71wr1nk.png', '2', 'AFX', 100, 1, 17, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-14 15:35:58', '2025-07-14 15:35:58'),
(87, 'Splitter DMX AFX', '<p>Répartiteur DMX qui permet de dédoubler le signal DMX à l\'entrée afin de l\'envoyer dans deux chaînes différentes</p><p>1 sortie Link</p><p>1 entrée &amp; 2 sorties isolées électriquement</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/YUPCejTELnTBclJFapJs72IAarAk0LO24HoKsXfN.png', '2', 'AFX', 100, 1, 0.6, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-14 15:37:26', '2025-07-14 15:37:26'),
(88, 'Stairville DDC-12 DMX', '<p>12 faders + fader master</p><p>Design compact</p><p>Utilisation facile</p><p>Sortie DMX sur XLR 3 broches</p><p>Entrée pour bloc d\'alimentation DC 9V</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/W54GcNjXOMfq53vJxuffPAJPOhgbt9lJInbbSEIG.png', '2', 'STARVLLE', 100, 1, 0.9, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-14 15:38:39', '2025-07-14 15:38:39'),
(89, 'Chamsys magicq mini connect', '<p>Se connecte à un PC ou un Mac pour contrôler l\'éclairage et l\'équipement vidéo</p><p>Répond aux réglementations sur les bagages à main de toutes les grandes compagnies aériennes</p><p>10 faders de lecture sur jusqu\'à 500 pages</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/eakAHIq8BxtIV6slJP5mNKNqw1MiLorCk5iWloXU.png', '2', 'STARVLLE', 100, 1, 3.7, NULL, 90, 1, 1, NULL, 'location', 0, '2025-07-14 15:40:58', '2025-07-14 15:40:58'),
(90, 'DMX emmeteur eurolite', '<p>LED de statut</p><p>Fréquence de transmission: 2,4 GHz - Bande ISM (licence libre et gratuite dans le monde entier)</p><p>Jusqu\'à 6 canaux utilisables simultanément pour un total de 3072 canaux DMX contrôlables</p><p>Bloc d\'alimentation incl: 100/240 V AC, 50/60 Hz</p><p>78 canaux</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/C7oRLqN2SzWf10qoPv4CyKZ2T2JJ1xMVBYj2c18e.png', '2', 'STARVLLE', 100, 1, 0.1, NULL, 45, 1, 1, NULL, 'location', 0, '2025-07-14 15:42:36', '2025-07-14 15:42:37'),
(91, 'DMX recepteur eurolite', '<p>Se connecte à un PC ou un Mac pour contrôler l\'éclairage et l\'équipement vidéo</p><p>Répond aux réglementations sur les bagages à main de toutes les grandes compagnies aériennes</p><p>10 faders de lecture sur jusqu\'à 500 pages</p><p>Interface réseau intégrée pour jusqu\'à 64 univers</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ndd32S0bE8UEUj40dLfZzrwS6xGP0UhjStGumgWI.png', '2', 'STARVLLE', 100, 1, 0.1, NULL, 45, 1, 1, NULL, 'location', 0, '2025-07-14 15:43:20', '2025-07-14 15:43:20'),
(92, 'Interface DMX control software', '<p>LED de statut</p><p>Fréquence de transmission: 2,4 GHz - Bande ISM (licence libre et gratuite dans le monde entier)</p><p>Jusqu\'à 6 canaux utilisables simultanément pour un total de 3072 canaux DMX contrôlables</p><p>Bloc d\'alimentation incl: 100/240 V AC, 50/60 Hz</p><p>78 canaux</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/7et1uSSrQHzNnpeiLyFkIglacTu38sAD33jsVMVW.png', '2', 'DASLIGHT', 100, 1, 0.4, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-14 15:45:05', '2025-07-14 15:45:05'),
(93, 'Interface DMX sunlite suite 3', '<p>Interface DMX 256 canaux</p><p>Peut être étendue à 512 canaux</p><p>128 canaux en mode autonome</p><p>Fonctionne avec les logiciels Sunlite Suite 2 et Sunlite Suite 3</p><p>Sortie DMX via XLR 3 broches</p><p>Prise USB-C pour la connexion au PC</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/QhBvooXBWD6tLz5iM7Jd3jjt68ugI3e5pGwK153L.png', '2', 'SUNLITE', 100, 1, 0.1, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 15:46:40', '2025-07-14 15:46:40'),
(94, 'Interface DMX sunlite suite 2', '<p>Se connecte à un PC ou un Mac pour contrôler l\'éclairage et l\'équipement vidéo avec le logiciel MagicQ</p><p>Répond aux réglementations sur les bagages à main de toutes les grandes compagnies aériennes</p><p>10 faders de lecture sur jusqu\'à 500 pages</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/cgH9iiAXPfe2rF9sISe8XLyOcNCWtaWtpY3wY5Gp.png', '2', 'SUNLITE', 100, 1, 4, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-14 15:47:52', '2025-07-14 15:47:52'),
(95, 'Enceinte KRK', '<p>Haut-parleur 6,5\" en verre-aramide</p><p>Tweeter 1\" en verre-aramide</p><p>Amplificateur de classe D de 145 Watt biamplifié : tweeter 48 Watt, Haut-parleur 97W</p><p>Niveau de pression sonore Max : 110 dB (SPL)</p><p>Réponse en fréquence : 42 Hz - 40 kHz</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/kzMGjWHGHN1FLQj98nkHDZTgAyldmxzhkiC7JyXD.png', '12', 'KRK', 100, 1, 5, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-15 13:37:59', '2025-07-15 13:37:59'),
(96, 'Platine - CD/USB Gemini 600', '<p>Platine CD/USB</p><p>Kit éclaté :</p><p>- 2 Decks</p><p>- Lecteur CDJ 210 CD Plat USB DJ Pitch +/-8-24% Compatible MP3</p><p>- 1 table de mixage</p><p>- Câblage RCA inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/fsV8AxJZEroYVZwTHEgqrbQylM0B2VkLZsOnwO6h.png', '12', 'GEMINI', 100, 1, 10, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-15 13:39:12', '2025-07-15 13:39:12'),
(97, 'Contrôleur - Pioneer DDJ SX2', '<p>4 entrées : 2xCD (RCA) / 2xLine/Phono (RCA)</p><p>Sorties: 2x Master (RCA + XLR) / Booth (Jack6.35mm)</p><p>2 entrées Mic (Combo XLR Jack + Jack 6.35mm)</p><p>Double sortie casque (Jack 6.35mm + 3.5mm)</p><p>Mode Slip, Filtre Sound colour, Crossfader curve adjust, Needle Search</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/VJi4xUu06bfMH5Vm47mx20kKyo8BllMXdAUEvMOF.png', '12', 'PIONEER DJ', 100, 1, 6.6, NULL, 90, 1, 1, NULL, 'location', 0, '2025-07-15 13:41:25', '2025-07-15 13:41:25'),
(98, 'Contrôleur - Denon MCX 8000', '<p>Contrôleur de DJ 4 canaux</p><p>2 entrées micro</p><p>2 entrées USB pour une utilisation autonome sans ordinateur</p><p>2 écrans haute résolution</p><p>3 effets pré/post fader pour la lecture numérique et analogique interne</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/93b9y6Jl5AtcGNiyhXjI9ih6vA37lq3g2btf7Th6.png', '12', 'DENON DJ', 100, 1, 4.3, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-15 13:42:53', '2025-07-15 13:42:53'),
(99, 'Contrôleur - Traktor Kontrol S4 MK3', '<p>Sortie principale (Cinch &amp; XLR)</p><p>Sortie cabine (6,3 mm)</p><p>4 entrées ligne stéréo (Cinch)</p><p>2 entrées microphone (prise combinée XLR et jack 6,3 mm)</p><p>2 sorties casque (3,5 mm et 6,3 mm)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/fLGLS47vMKzfChCNqHdFPKcD3CLOAPHOZZETPbfj.png', '12', 'TRAKTOR', 100, 1, 3.2, NULL, 60, 1, 1, NULL, 'location', 0, '2025-07-15 13:44:21', '2025-07-15 13:44:21'),
(100, 'Contrôleur - Rane One', '<p>Jouabilité de platine vinyle traditionnelle, fonctionnalité numérique</p><p>Crossfader MAG FOUR précis pour le mixage et le scratching</p><p>Six boutons style radio et deux déclencheurs paddle pour effets logiciels</p><p>Commandes de bouclage dédiées intégrées</p><p>Logiciel Serato DJ Pro inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/QmpTQm7881dKmoBYj0aHjOmajNZcDBW58LnYJFfU.png', '12', 'RANE', 100, 1, 10.7, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-15 13:45:32', '2025-07-15 13:45:32'),
(101, 'Contrôleur - Rane Four', '<p>Entrées:</p><p>2x microphone sur prise combinée </p><p>XLR/Jack 6,3 mm</p><p>2x RCA (commutable phono/ligne)</p><p>Sorties:</p><p>1x sortie casque sur mini Jack stéréo 3,5 mm</p><p>1x sortie casque sur Jack stéréo 6,3 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/gFSp91OH6XYibbj4IS4HHgKt3VT7VDpczeXBxvLv.png', '12', 'RANE', 100, 1, 3, NULL, 150, 1, 1, NULL, 'location', 0, '2025-07-15 13:46:37', '2025-07-15 13:46:37'),
(102, 'Contrôleur - Rane performer', '<p><span style=\"color: rgb(0, 0, 0);\">Jogwheels motorisés haute résolution de 8,5\" Pads avec affichage OLED Stem Split - les voix et les instrumentaux sont séparés sur simple pression de bouton Boutons séparés Instrumental/Acapella</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/WKkMgh6gL8fbB9SYLyXeNiUDLGJb7WpMqvRzgHUj.png', '12', 'RANE', 100, 1, 10.7, NULL, 170, 1, 1, NULL, 'location', 0, '2025-07-15 13:49:02', '2025-07-15 13:49:02'),
(103, 'Contrôleur Denon DJ - SC Live 4', '<p>Sortie principale (Cinch &amp; XLR)</p><p>Sortie cabine (6,3 mm)</p><p>4 entrées ligne stéréo (Cinch)</p><p>2 entrées microphone (prise combinée XLR et jack 6,3 mm)</p><p>2 sorties casque (3,5 mm et 6,3 mm)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/5UZrsciOKNfvbbBoScWk1F1m0nqEW3Q85p71V1oz.png', '12', 'DENON DJ', 100, 1, 3.2, NULL, 90, 1, 1, NULL, 'location', 0, '2025-07-15 13:50:10', '2025-07-15 13:50:10'),
(104, 'Contrôleur - Denon MC7000', '<p>Contrôleur DJ 4 voies avec double interface audio USB, connectez 2 ordinateurs simultanément</p><p>Serato DJ Pro ainsi que 3 packs d’extension</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/07CWs7BQBE0JDPPhdFVcjQRUJiOkBgidi9QPqH3i.png', '12', 'DENON DJ', 100, 1, 6.7, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-15 13:51:19', '2025-07-15 13:51:19'),
(105, 'Platine Vinyle Stanton', '<p>Platine vinyle Entraînement Direct Stanton T62</p><p>Bras droit avec force d\'appui réglabe</p><p>2 touches START/STOP</p><p>Pitch ajustable sur fader +/ 10%</p><p>Vitesse réglable 33 ou 45 tr/mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/RuDI2no67sqCTo9EFPBirrBV6GX7d67M72p4ouuQ.png', '12', 'STANTON', 100, 1, 6.3, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-15 13:52:43', '2025-07-15 13:52:43'),
(106, 'Platine vinyle audio technica LP120XUSB', '<p>Audio-Technica AT-LP120XUSB Silver </p><p>Tourne-disques à entraînement direct (analogique et USB) </p><p>Fonctionnement entièrement manuel</p><p>Trois vitesses au choix : 33, 45 et 78 tours</p><p>Tête de lecture AT-HS6 ½\" universelle et cellule AT-VM95E Dual Magnet™ avec pointe de lecture elliptique de 0,3 x 0,7 millième de pouce</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/2G6bIFh0f6edT36yHFKkvZ64PnAUXdPBwh2bnqzQ.png', '12', 'AUDIO TECHNICA', 100, 1, 8, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-15 13:56:35', '2025-07-15 13:56:35'),
(107, 'Platine vinyle SL-1200MK7', '<p>Boîtier en aluminium moulé sous pression</p><p>Couple de démarrage et de freinage réglable</p><p>Plage de réglage du pitch : ±8% / ±16%</p><p>Fonction de lecture inversée</p><p>Eclairage du diamant à LED</p><p>Plage de réglage de la hauteur du bras de lecture : 0 - 6 mm</p><p>Niveaux de vitesse : 33 1/3, 45 et 78 tr/min</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/MEvM8NqRLmSRLXlhJnXbcSHcUf8S3cfWCmIADMQw.png', '12', 'TECHNICS', 100, 1, 8, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-15 14:07:55', '2025-07-15 14:07:55'),
(108, 'Table mixage Behringer DJX 750', '<p>Table de mixage DJ professionnelle DJX 750</p><p>Ultra Low-Noise</p><p>5 canaux avec superbes préamplis phono</p><p>47 effets numériques 24 bits</p><p>Delay, Reverb, Flanger, Filter, Panner, Ultrabass, Exciter, Vinylizer, Voice Changer, etc.</p><p>Double compteur de BPM automatique et intelligent</p><p>Affichage des différences de rythme et de synchronisation</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/19dgyfNu4e7xHckJ9V2uiG5QQ985pwfdwZcN0PsE.png', '12', 'BEHRINGER', 100, 1, 3.9, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-15 14:09:13', '2025-07-15 14:09:13'),
(109, 'Pioneer CDJ-2000NXS2', '<p>Lecteur CD Multi-Formats / USB / Wifi / SD</p><p>Compatible Wifi pour connecter votre Ordinateur, Téléphone, Ipad...</p><p>Lecture MultiSources : CD, DVD, périphériques de stockage USB, cartes mémoire SD, lecteurs de mémoire flash et disques durs</p><p>Compatible avec les fichiers MP3, AAC, WAV et AIFF (16/24 bits)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/rB7haJmeTJcbmhcOyhOlsENEeNN8xkFT6P04F8at.png', '12', 'PIONEER DJ', 100, 1, 2.6, NULL, 250, 1, 1, NULL, 'location', 0, '2025-07-15 14:27:42', '2025-07-15 14:27:42'),
(110, 'Pioneer DJM-900NXS2', '<p>Club mixer 4 canaux - Contrôle de crossfader</p><p>Fader Start</p><p>Égaliseur 3 bandes (-26 dB à +6 dB) et isolateur 3 bandes (-6 dB)</p><p>Talk Over (-20 dB)</p><p>Affichage du niveau crête</p><p>Section d\'effets Sound Color FX</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/NS6ml36fjISVSEzVdTKIZHleBGEKV5eXZLPsdvQK.png', '12', 'PIONEER DJ', 100, 1, 7.6, NULL, 200, 1, 1, NULL, 'location', 0, '2025-07-15 14:28:50', '2025-07-15 14:28:50');
INSERT INTO `products` (`id`, `name`, `description`, `short_description`, `image_url`, `category_id`, `brand`, `stock`, `min_stock`, `weight`, `sale_price`, `daily_price`, `available`, `featured`, `rented_out`, `type`, `free_shipping`, `created_at`, `updated_at`) VALUES
(111, 'Kit Platines Pioneer CDJ2000 NXS2 + DJM 900 NXS2', '<p>Platine CD/USB</p><p>Kit éclaté :</p><p>- 2 Decks</p><p>- Lecteur CDJ-2000NXS2</p><p>- 1 table de mixage</p><p>- Câblage RCA inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Nvb4f5uSCgSGqXvSciPGm0AybpD19r0d3lvmA5GB.png', '12', 'PIONEER DJ', 100, 1, 7.6, NULL, 320, 1, 1, NULL, 'location', 0, '2025-07-15 14:30:22', '2025-07-15 14:30:22'),
(112, 'Pioneer CDJ-2000NXS', '<p>Lecteur CD Multi-Formats / USB / Wifi / SD</p><p>Lecture MultiSources : CD, DVD, périphériques de stockage USB, cartes mémoire SD, lecteurs de mémoire flash et disques durs</p><p>Compatible avec les fichiers MP3, AAC, WAV et AIFF (16/24 bits)</p><p>Connectivité avancé avec une Carte Son Intégré 24bits / 48Khz et Contrôle HID et Midi via USB.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/crvanmgNsDZfQkvvKjxhyvVpsP4qafE44MZl8UUz.png', '12', 'PIONEER DJ', 100, 1, 4.3, NULL, 200, 1, 1, NULL, 'location', 0, '2025-07-15 14:31:40', '2025-07-15 14:31:40'),
(113, 'Pioneer DJM-900NXS', '<p>Club mixer 4 canaux - Contrôle de crossfader</p><p>Fader Start</p><p>Égaliseur 3 bandes (-26 dB à +6 dB) et isolateur 3 bandes (-6 dB)</p><p>Talk Over (-20 dB)</p><p>Affichage du niveau crête</p><p>Section d\'effets Sound Color FX</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/HlFcH0BBTrgZojxzY59nKVmINXCoIiSnQG3Rx1ei.png', '12', 'PIONEER DJ', 100, 1, 7.6, NULL, 200, 1, 1, NULL, 'location', 0, '2025-07-15 14:33:48', '2025-07-15 14:33:48'),
(114, 'Kit Platines Pioneer CDJ2000 NXS + DJM900 NXS', '<p>Platine CD/USB</p><p>Kit éclaté :</p><p>- 2 Decks</p><p>- Lecteur CDJ-2000NXS</p><p>- 1 table de mixage DJM900NXS</p><p>- Câblage RCA inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/IZQwT3uxm8LuUHduj4tPhZ0AlnhBNlueSjFuHfXr.png', '12', 'PIONEER DJ', 100, 1, 24.4, NULL, 300, 1, 1, NULL, 'location', 0, '2025-07-15 14:37:18', '2025-07-15 14:37:18'),
(115, 'Pied de platines universel', '<p>Support de clavier</p><p>Design en double X</p><p>En acier recouvert de poudre</p><p>Supporte une charge max. de 65 kg</p><p>Hauteur réglable de 100 - 900 mm</p><p>Surface de pose caoutchoutée</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/mq3WKPQa59UAB0tWsyrtpDq9utQZzG8zdvMR0Vw8.png', '12', 'K&M', 100, 1, 4.45, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 14:38:30', '2025-07-15 14:38:30'),
(116, 'Table DJ Universelle - Millenium', '<p>Table DJ universelle</p><p>Convient pour DJ : idéal petit contrôleur</p><p>Facile et rapide à monter</p><p>Dimensions table : 820 x 465 mm</p><p>Hauteur ajustable : 720 - 960 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/B8WuQh5R0M6CBTwt7hB9OT1xW0cYg75Rx92iSAMV.png', '12', 'MILLENIUM', 100, 1, 13.4, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 14:40:02', '2025-07-15 14:40:02'),
(117, 'Pied Monitoring Triangle noir (la Paire)', '<p><span style=\"color: rgb(0, 0, 0);\">Support pour enceinte KRK</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ApAUVx3HgliNAvRjeaDfn9aF1jYs5BfKpbbzURZn.png', '12', 'KRK', 100, 1, 5.6, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 14:41:40', '2025-07-15 14:41:40'),
(118, 'Pied Monitoring Triangle blanc (la Paire)', '<p><span style=\"color: rgb(0, 0, 0);\">Support pour enceinte KRK</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/PfWG3tYvs4mXzjjAPAIYTVwZcguH3KnKKQjFQcdE.png', '12', 'KRK', 100, 1, 5.6, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 14:52:53', '2025-07-15 14:52:53'),
(119, 'Desk DJ - Lycra', '<p>Cabine DJ en Lycra &amp; Alu</p><p>Lycras fournis</p><p>4 Panneaux à assembler</p><p>Housse de transport</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/rYsKeEQAWS7TnzbTyNFpKbmNynVaW75gm4mN4wXm.png', '12', 'ADJ', 100, 1, 20.2, NULL, 42, 1, 1, NULL, 'location', 0, '2025-07-15 14:54:27', '2025-07-15 14:54:27'),
(120, 'Desk DJ - Ibiza Aluminium', '<p>Structure métallique légère</p><p>Composé de 4 panneaux pliables et d\'une tablette en métal pour poser votre régie</p><p>Charnières à glissement pour montage/démontage sans outil</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/o8S3TdzzVFwRLnbzfVI0hpz4kpdeZ4cNT75Uawxa.png', '12', 'IBIZA', 100, 1, 20.2, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-15 14:56:32', '2025-07-15 14:56:32'),
(121, 'Desk DJ - Alu', '<p>Table pliante pour évènement</p><p>Table pliable, démontable et stable pour les DJs, les techniciens de l\'éclairage et du son, etc.</p><p>Construction très légère en aluminium</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/F3M4Y0bDtr5u4ORZYp90aULTt7KJdQROql0I7047.png', '12', 'ADJ', 100, 1, 6.2, NULL, 28, 1, 1, NULL, 'location', 0, '2025-07-15 14:58:56', '2025-07-15 14:58:56'),
(122, 'Lycra blanc pour desk dj afx pro / ibiza alu', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu Lycra Blanc parfait pour habiller les desk DJ AFX Pro et Ibiza Alu</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/BfeS5kehGpOOxfMUrRLP5l0sem6fc9gOmhqzImFC.png', '12', NULL, 100, 1, 0, NULL, 15, 1, 1, NULL, 'location', 0, '2025-07-15 15:00:47', '2025-07-15 15:00:47'),
(123, 'Lycra noir pour  desk dj afx pro / ibiza alu', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu Lycra Noir parfait pour habiller les desk DJ AFX Pro et Ibiza Alu</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/lXaSELMOhVpnRNcdUKprZkSd0Un31TvcY5VaTe8d.png', '12', NULL, 100, 1, 0, NULL, 15, 1, 1, NULL, 'location', 0, '2025-07-15 15:01:39', '2025-07-15 15:01:39'),
(124, 'Ciel étoilé blanc froid (ligne de 10m à l’unité)', '<p>Guirlande de 10m équipée de LED couleur blanc froid</p><p>Type d\'éclairage : LED</p><p>Raccordables : Oui</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/CRNcXEHJ5Pzg6AeRTTrjq49SR4JPjDSdVGZfSeGa.png', '13', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-15 15:04:44', '2025-07-15 15:04:44'),
(125, 'Ciel étoilé blanc chaud  (ligne de 10m à l’unité)', '<p>Guirlande de 10m équipée de LED couleur blanc chaud</p><p>Type d\'éclairage : LED</p><p>Raccordables : Oui</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/L0c2ewOVTVsnuR8GQlQuz2SefGhcreO2Jqm4W1JG.png', '13', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-15 15:05:34', '2025-07-15 15:05:34'),
(126, 'Guirlande Guinguette Blanc chaud  (ligne de 10m à l’unité)', '<p>Guirlande de 10m équipée de LED type guinguette couleur blanc chaud</p><p>Type d\'éclairage : LED</p><p>Raccordables : Oui</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Q1T0jsqtzEJXhNzYA6HDOqszF1haQCUm1CgaEzYy.png', '13', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-15 15:06:22', '2025-07-15 15:06:23'),
(127, 'Bambou 3M', '<p>Mât bambou pour ciel étoilé</p><p>Hauteur : 3m</p><p>Utilisation avec embases spéciales bambou</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/rfyD4c2V7dBQtDq2kx88VY0aPbnRoIKf8PbYostS.png', '13', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-15 15:07:26', '2025-07-15 15:07:26'),
(128, 'Embase Bambou 10kg', '<p><span style=\"color: rgb(0, 0, 0);\">Embase pour mâts bambou 10kg</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/OR4v7Ktj8qCV6WY7c4aZ51W4n2mqzb8JwPQuhyZ7.png', '13', NULL, 100, 1, 10, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:08:20', '2025-07-15 15:08:20'),
(129, 'Sac de sable', '<p>Renfort de poids pour mâts </p><p>bambou ou barnum</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/SJ4GuFVlO4vwynyibSuYV3Kj2Ms9eXHJ15E8wm2T.png', '13', NULL, 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 15:10:23', '2025-07-15 15:10:23'),
(130, 'PHOTOBOOTH Essentiel', '<p><span style=\"color: rgb(0, 0, 0);\">Une solution simple et efficace pour capturer vos souvenirs en haute qualité. Livré et installé sur place, il inclut des accessoires amusants, propose jusqu\'à 400 tirages instantanés et un cadre personnalisable pour marquer votre événement</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/tTKggU6hyWXv32Zd5wPyqnHHFAk2b7LTXEh03P2o.png', '13', NULL, 100, 1, 0, NULL, 400, 1, 1, NULL, 'location', 0, '2025-07-15 15:11:31', '2025-07-15 15:11:31'),
(131, 'PHOTOBOOTH STANDARD', '<p><span style=\"color: rgb(0, 0, 0);\">Alliant simplicité et convivialité, ce photobooth inclut des accessoires festifs et permet des impressions instantanées (jusqu\'à 400 tirages) avec un cadre personnalisable. Idéal pour immortaliser vos moments uniques avec style</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/jlTKcVhuNa97PL6Bh9mU7TtlRNG3pxR1fkaV7Prc.png', '13', NULL, 100, 1, 0, NULL, 417, 1, 1, NULL, 'location', 0, '2025-07-15 15:12:20', '2025-07-15 15:12:20'),
(132, 'PHOTOBOOTH PREMIUM', '<p><span style=\"color: rgb(0, 0, 0);\">Doté d’un écran interactif supplémentaire pour visionner les photos prises en direct, ce photobooth inclut des accessoires variés, 400 tirages instantanés et un cadre personnalisable, combinant fun et technologie</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/j8rtETFj91CUXTTu05BvBGdDhhtdh3mMTawCnM10.png', '13', NULL, 100, 1, 0, NULL, 500, 1, 1, NULL, 'location', 0, '2025-07-15 15:13:26', '2025-07-15 15:13:26'),
(133, 'PHOTOBOOTH MIROIR', '<p><span style=\"color: rgb(0, 0, 0);\">Offrez une touche d’élégance et d’interactivité à vos événements avec ce photobooth unique en son genre. Doté d’un grand miroir interactif, il capte l’attention et invite vos invités à se photographier tout en découvrant une expérience ludique et immersive. Livré avec des accessoires variés pour plus de fun, il permet jusqu’à 400 tirages instantanés en qualité professionnelle. De plus, personnalisez le cadre pour rendre chaque souvenir encore plus mémorable</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/GVxXLyf9a8A7szeuFdDbiYHDk8zcLcLoSzlRy1Zq.png', '13', NULL, 100, 1, 0, NULL, 792, 1, 1, NULL, 'location', 0, '2025-07-15 15:14:21', '2025-07-15 15:14:21'),
(134, 'VIDEOBOOTH 360°', '<p>Notre installation facile à utiliser vous permet d\'enregistrer des vidéos de qualité professionnelle en quelques minutes seulement ! </p><p>le vidéobooth est un moyen amusant et interactif de capturer l\'essence de votre événement et d\'offrir un moment amusant pour vos invités. </p><p>Service inclus, prestation d’une durée de 4H</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/tQ7Man1cuWsPRRvpMgiEXDRKrFRacp8VRXKHjgdM.png', '13', NULL, 100, 1, 0, NULL, 667, 1, 1, NULL, 'location', 0, '2025-07-15 15:15:11', '2025-07-15 15:15:11'),
(135, 'Vidéo-Projecteur', '<p>Connectiques</p><p>HDMI : 1</p><p>Port USB : 2</p><p>RCA : 1</p><p>Réseau</p><p>Wifi : avec Transmetteur en option</p><p>Bluetooth : Non</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/7hN4ULI2bR09i2skXB0sfj1Hp1gWDvrEhZDrlYl8.png', '14', 'EPSON', 100, 1, 0, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-15 15:16:38', '2025-07-15 15:16:38'),
(136, 'Support vidéo projecteur', '<p>Matériau : acier</p><p>Hauteur : 700 - 1250 mm</p><p>Support : 479 x 312 mm</p><p>Capacité de charge max. : 10 kg</p><p>Poids : 5,4 kg</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/4TjP05CAMryORcvaDpK0nLpOAoQ4aUmPwSsHFyXE.png', '14', 'K&M', 100, 1, 0, NULL, 8, 1, 1, NULL, 'location', 0, '2025-07-15 15:17:43', '2025-07-15 15:17:43'),
(137, 'Ecran de projection 2m x 2m', '<p>Ecran de projection dépliable</p><p>Taille : 2m x 2m</p><p>Projection : 4/3 ou 16/9</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/rP6THqpJojb8xBqAoBiFD8SB69ToUSEDjyo4aQW2.png', '14', NULL, 100, 1, 0, NULL, 38, 1, 1, NULL, 'location', 0, '2025-07-15 15:19:37', '2025-07-15 15:19:37'),
(138, 'Selfie Box', '<p>Boitier \"Selfie Box\" Wiforama</p><p>Le boitier WIFORAMA offre des animations photos innovantes depuis son réseau WIFI et permet aux possesseurs de smartphone d’envoyer des images sans avoir besoin de télécharger d’application.</p><p>Les photos sont personnalisées, diffusées et peuvent être récupérer sur clef Usb.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/7ks25hmxmTZa04fqrZ79yR1Y89HPMI4m5MIIbuAX.png', '14', 'WIFORAMA', 100, 1, 0, NULL, 80, 1, 1, NULL, 'location', 0, '2025-07-15 15:20:48', '2025-07-15 15:20:48'),
(139, 'Télé 65\"', '<p>Rétroéclairage par LED - Quantum Dot technology - Quantum Dot technology - Supreme UHD dimming</p><p>Format d\'affichage : 4K UHD (2160p)</p><p>Résolution : 3840 x 2160</p><p>Technologie HDR : Hybrid Log-Gamma (HLG), HDR 10+, Quantum HDR</p><p>Tuner TV numérique : DVB-C, DVB-S2, DVB-T2</p><p>Interface vidéo : HDMI</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/KMIdGWVdvay13TlCY8HwCnA52GQKM9VdPJFPVGPl.png', '14', 'SAMSUNG', 100, 1, 0, NULL, 50, 1, 1, NULL, 'location', 0, '2025-07-15 15:21:39', '2025-07-15 15:21:39'),
(140, 'Support TV Amovible', '<p>Support TV universel amovible</p><p>Sur roulette avec blocage des roues arrières</p><p>Réglage de la hauteur au choix</p><p>Couleur : Aluminium anthracite</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/j2aejeR357dyofemA8soVvIUjViIYrMbLUnsdXIp.png', '14', 'K&M', 100, 1, 0, NULL, 12, 1, 1, NULL, 'location', 0, '2025-07-15 15:22:49', '2025-07-15 15:22:49'),
(141, 'Câble HDMI 1m', '<p><span style=\"color: rgb(0, 0, 0);\">Câble de raccordement HDMI 1m</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/FPRaYMEi3kgjsjs6GgTGkig3z9ifQ8KKrlH1mdVT.png', '14', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:23:39', '2025-07-15 15:23:39'),
(142, 'Rallonge HDMI 10M', '<p><span style=\"color: rgb(0, 0, 0);\">Rallonge HDMI 10m</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ucFsHt67d03BlLZTSN9xyQyNF121OLGcCVcdVv4b.png', '14', NULL, 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 15:24:25', '2025-07-15 15:24:25'),
(143, 'Splitter HDMI', '<p>Répartiteur HDMI </p><p>Port d’entrée HDMI et plusieurs ports de sortie HDMI</p><p>Division du signal d’entrée en 2, 4, 8 ou même 16 sorties vidéo</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/t1l8SjQvzFjeYO6TI89HeHrR3lNy4jNr4dUAiIzU.png', '14', 'STARTECH', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-15 15:25:28', '2025-07-15 15:25:28'),
(144, 'Mange-Debout', '<p>Table haute parfaite pour les cocktails </p><p>Hauteur : 110 cm</p><p>Diamètre : 80 cm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ZsPyYDyicth7IB5lv1VMlyIO64RpEWuc8Vw3dsFe.png', '15', NULL, 100, 1, 0, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-15 15:26:43', '2025-07-15 15:26:43'),
(145, 'Lycra blanc mange debout', '<p>Housses de mange debout de qualité professionnelle</p><p>Correspond à toutes les ambiances</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/pxZ3dO9iGSuf41S6IoUh5U8tpaGn9OAkUAdM25h7.png', '15', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:27:41', '2025-07-15 15:27:41'),
(146, 'Lycra noir Mange-Debout', '<p>Housses de mange debout de qualité professionnelle</p><p>Correspond à toutes les ambiances</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/pHNUOfDHw8vaqBhqQKVTPfevJND4pmfJ7cGBkAJI.png', '15', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:28:26', '2025-07-15 15:28:26'),
(147, 'Table Pliante', '<p>Table pliante de qualité professionnelle pouvant accueillir 8 personnes</p><p>Longueur : 180 cm</p><p>Largeur : 75 cm</p><p>Hauteur : 74 cm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/PXJvsNkYxI0PbRzK1UgvuoLG6TT1EIBwbGUNLQSN.png', '15', NULL, 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 15:29:16', '2025-07-15 15:29:16'),
(148, 'Tissu Table Pliante', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu pour table en lycra blanc</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/HFe8SDLaLJ2VCtTr2yNNbLneyFxu2Qx4e42aYE4M.png', '15', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:30:02', '2025-07-15 15:30:26'),
(149, 'Bar lumineux', '<p>Bar lumineux LED</p><p>RGBW</p><p>1,50m de large</p><p>Avec télécommande</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/oQjmpZjglNYLPvyVP69WcIYbUCDKegRdz9hxfx0p.png', '15', NULL, 100, 1, 0, NULL, 60, 1, 1, NULL, 'location', 0, '2025-07-15 15:31:06', '2025-07-15 15:31:06'),
(150, 'Pied Monitoring Triangle noir (la Paire)', '<p><span style=\"color: rgb(0, 0, 0);\">Support pour enceinte KRK</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/PbFHUG6CF5bqz06BfaYTSbzLD1yA82PM5jQwUzTS.png', '15', 'KRK', 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 15:32:10', '2025-07-15 15:32:10'),
(151, 'Pied Monitoring Triangle blanc (la Paire)', '<p><span style=\"color: rgb(0, 0, 0);\">Support pour enceinte KRK</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/WNkKmH98oKF73Ny9pvl0YVj5F4mFGFzbDkcCQZrV.png', '15', 'KRK', 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 15:32:53', '2025-07-15 15:32:53'),
(152, 'Parasol', '<p><span style=\"color: rgb(0, 0, 0);\">Parasol avec embase + embout</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/EChlsh3pBGfNgiYumcd6DSgzzB7f1GovzaoJKpHT.png', '15', NULL, 100, 1, 0, NULL, 18, 1, 1, NULL, 'location', 0, '2025-07-15 15:33:43', '2025-07-15 15:33:43'),
(153, 'Barnum 3mx3m', '<p>Barnum de réception</p><p>Longueur : 3m</p><p>Largeur : 3m</p><p>Hauteur : 3m (déplié)</p><p>Couleur structure : Noire</p><p>Couleur bâche : Grise</p><p>IP UV</p><p>Pliage pratique</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/wXhpDKbxHzm9DfBMGjWGhxiiRg66F3WfWGOYbGww.png', '15', NULL, 100, 1, 0, NULL, 45, 1, 1, NULL, 'location', 0, '2025-07-15 15:34:30', '2025-07-15 15:34:30'),
(154, 'Bar à Vinyles', '<p>Bar à Vinyles en bois</p><p>Permet de faire participer les gens dans le choix de la musique parmi une sélection de disques vinyles de tous styles et tous horizons</p><p>Moment de partage</p><p>3 bacs vinyles inclus</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/CVXiSApIaBsfWSYgR42fQXo2oYypVuawM7OtGfpv.png', '15', NULL, 100, 1, 0, NULL, 200, 1, 1, NULL, 'location', 0, '2025-07-15 15:35:14', '2025-07-15 15:35:14'),
(155, 'Pupitre Champêtre', '<p>Pupitre en bois </p><p>Style champêtre</p><p>Idéal pour cérémonie, thème bohème...</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/yUERFcSeinZwsF58DlEdIKmwx11ByZ57QqQK2rtS.png', '15', NULL, 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-15 15:36:07', '2025-07-15 15:36:07'),
(156, 'Pupitre de conférence - Alu/Plexi', '<p>Pupitre de conférence haute qualité</p><p>Support en plexiglas</p><p>Armature en aluminium</p><p>Idéal séminaire, conférence...</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ynTqS5bbsI7LXX19kWIku4JIYcr8QlhHJDlgdIZH.png', '15', NULL, 100, 1, 0, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-15 15:37:02', '2025-07-15 15:37:02'),
(157, 'Pupitre d\'Orchestre', '<p>Pupitre d\'orchestre</p><p>Hauteur totale max. : env. 1350 mm</p><p>En acier revêtu de poudre noir</p><p>Connecteurs en plastique</p><p>Plateau perforé</p><p>Dimensions du plateau: 475 x 345 x 50 mm</p><p>Extension à 1 niveau</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Q67shI5l8TEGIKamqB3EY8WrwPRH84PeueejL94I.png', '15', NULL, 100, 1, 0, NULL, 8, 1, 1, NULL, 'location', 0, '2025-07-15 15:37:52', '2025-07-15 15:37:52'),
(158, 'Pupitre de conference', '<p>Pupitre de conférence haute qualité</p><p>Support en bois</p><p>Armature en aluminium noir</p><p>Idéal séminaire, conférence...</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/GyxRLff5ITSV8gsD3z8PL40guZGHX1SwsMjpEYur.png', '15', NULL, 100, 1, 0, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-15 15:38:48', '2025-07-15 15:38:48'),
(159, 'Pied de platines universel', '<p>Support de clavier</p><p>Design en double X</p><p>En acier recouvert de poudre</p><p>Supporte une charge max. de 65 kg</p><p>Hauteur réglable de 100 - 900 mm</p><p>Surface de pose caoutchoutée</p><p>Patin ajustable pour surfaces irrégulières</p><p>Anneaux de marquage noirs incl.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/AFTZBL6p1WCidqfsYcvbyM7uwvZmIQBhPDWFOF1g.png', '8', 'K&M', 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 15:41:01', '2025-07-15 15:41:01'),
(160, 'Tube liaison K&M M20 pour SUB 18\"', '<p>Tube de liaison qui vient s’intercaler entre un subwoofer 18\" et son enceinte associée</p><p>Maintien ferme et sans vibration</p><p>Coloris : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/9iPg3tdnQ73LaOh1JEuWdSh19WGbg7bqLUiWHapV.png', '8', 'K&M', 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 15:42:13', '2025-07-15 15:42:13'),
(161, 'Tube liaison K&M M18 pour SUB 15\"', '<p>Tube de liaison qui vient s’intercaler entre un subwoofer 15\" et son enceinte associée</p><p>Maintien ferme et sans vibration</p><p>Coloris : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ZHzFXpS0muZURCdFNah1rBBGU7fI116x4t7EUkVy.png', '8', 'K&M', 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 15:42:50', '2025-07-15 15:42:50'),
(162, 'Pied enceinte avec embase carrée lourde', '<p>Tube d’extension de 35 mm avec filetage M20 (mâle)</p><p>Hauteur : 2,4 m</p><p>Type de produit : Socle et trépieds</p><p>Hauteur min. : 1420 mm</p><p>Hauteur max : 2420 mm</p><p>Longueur de transport : 1420 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/R2BPRvIrlAOUhGGmdPCV9XybpO3JpNp0rdGBUvdh.png', '8', 'K&M', 100, 1, 0, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-15 15:43:50', '2025-07-15 15:43:50'),
(163, 'Pied enceinte - Millenium', '<p>En aluminium</p><p>Diamètre du tube d\'admission : 35 mm</p><p>Supporte une charge max. de 30 kg</p><p>Hauteur réglable de 108 à environ 200 cm</p><p>Poids : 2,2 kg</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Kr8KoXdXNGpCI3nCtmvQ2pGFXhOg3EOP5WPm5jWq.png', '8', 'MILLENIUM', 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:44:39', '2025-07-15 15:44:39'),
(164, 'Pied enceinte - Gravity', '<p>Spécificités : télescopique réglable en hauteur</p><p>En aluminium recouvert de poudre noire</p><p>Capacité de charge max. : 35 kg</p><p>Hauteur (min.) : 106 cm</p><p>Hauteur (max.) : 192 cm</p><p>Diamètre : 35 mm</p><p>Dimensions : (Ø x H) 35 mm x 192 cm</p><p>Vis et goupille de sécurité</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/M9lg2oQyJhucpPVjNX1BMvcEBe3tbMVXirToRief.png', '8', 'GRAVITY', 100, 1, 0, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-15 15:45:38', '2025-07-15 15:45:38'),
(165, 'Lycra Blanc pied', '<p>Lycra blanc en Tri</p><p>Idéal pour mise en valeur de votre scène et prestation</p><p>Pour pied d\'enceinte ou lumière</p><p>Coloris blanc</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/TqNTB21rPFJ47gq5VT21meNva6k5an9MK42hJ7Rq.png', '8', NULL, 100, 1, 0, NULL, 3, 1, 1, NULL, 'location', 0, '2025-07-15 15:46:28', '2025-07-15 15:46:28'),
(166, 'Lycra Noir pied', '<p>Lycra noir en Tri</p><p>Idéal pour mise en valeur de votre scène et prestation</p><p>Pour pied d\'enceinte ou lumière</p><p>Coloris noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ZJJl7wRtOTqgF7bzRwZpY5rOrrYMLfLPfu8Z3bde.png', '8', NULL, 100, 1, 0, NULL, 3, 1, 1, NULL, 'location', 0, '2025-07-15 15:47:26', '2025-07-15 15:47:26'),
(167, 'Traverse pour pied enceinte', '<p>Pour pied d’enceinte</p><p>Supporte une charge max. de 70 kg (2 enceintes de 35 kg max.)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/yltTXge7N4OraiG2IbccxeW69Yu9RkGsLLEknhxV.png', '8', 'K&M', 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 15:48:23', '2025-07-15 15:48:23'),
(168, 'Pied pour barre led', '<p>Construction métallique</p><p>Extrêmement fonctionnel</p><p>Hauteur télescopique (2 éléments)</p><p>Jambes pliantes</p><p>Poids : 1,5kg</p><p>Hauteur max. : 213 cm</p><p>Hauteur min. : 77 cm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/D8DxoADr7XbMcL9IHs944SOINieKSvoBN7YO5jMd.png', '8', 'SHOWTEC', 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:49:39', '2025-07-15 15:49:39'),
(169, 'Lycra blanc pour pied barre led', '<p>Tissu pour pied barre LED</p><p>Couleur : blanc</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/tfOHI3IbJ42rHGEYV3Ta1tat7DNciAvQaVWo5LqE.png', '8', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-15 15:51:01', '2025-07-15 15:51:01'),
(170, 'Totem 3m TRUSS F34', '<p>Traversée en 4 points</p><p>Longueur : 3 m</p><p>Distance des tubes (extérieur) : 29 cm</p><p>Diamètre tube principal : 50 mm</p><p>Epaisseur : 2 mm</p><p>Croisillons : 20 mm</p><p>Matériau : Acier</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/kU7Uft4avSaGYbHP3XgFmEDtREGymGBEcMf4bYr7.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-15 15:52:03', '2025-07-15 15:52:03'),
(171, 'Totem 2m TRUSS F34', '<p>Traversée en 4 points</p><p>Longueur : 2 m</p><p>Distance des tubes (extérieur) : 29 cm</p><p>Diamètre tube principal : 50 mm</p><p>Epaisseur : 2 mm</p><p>Croisillons : 20 mm</p><p>Matériau : Acier</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/8yiXHvyZray43j3SBBnMKbScDPyMgGe6hyaweFIU.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 20, 1, 1, NULL, 'location', 0, '2025-07-15 15:52:58', '2025-07-15 15:52:58'),
(172, 'Totem 1m TRUSS F34', '<p>Structure 4 points</p><p>Longueur : 1 m</p><p>Distance des tubes (extérieur) : 29 cm</p><p>Diamètre tube principal : 50 mm</p><p>Epaisseur : 2 mm</p><p>Croisillons : 20 mm</p><p>Matériau : AlMgSi F31</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/HSSkiNtxvRxqizUELNNu91nPLyTklGilRuJsuSm9.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 9, 1, 1, NULL, 'location', 0, '2025-07-15 15:53:54', '2025-07-15 15:53:54'),
(173, 'Totem - Angles 90°', '<p>Traversée en 4 points</p><p>Aluminium : EN AW 6082 T6</p><p>Tube principal : 51 x 2 mm</p><p>Diagonale : 16 x 2 mm</p><p>Poids : 6 kg</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/HzogK7UrodjF40sr6uQONbn3wVNM0FvqHH8D5L7f.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 18, 1, 1, NULL, 'location', 0, '2025-07-15 15:54:54', '2025-07-15 15:54:54'),
(174, 'Lycra blanc pour Totem 1M TRUSS F34', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu Lycra Blanc parfait pour habiller les totems de 1m</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/V789YAsUyXHWo8IppEKn78HFqPm6dcPgPsQTys23.png', '8', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:55:31', '2025-07-15 15:55:31'),
(175, 'Lycra blanc pour Totem 2M TRUSS F34', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu Lycra Blanc parfait pour habiller les totems de 2m</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/C6cqrzds4nGZEAeh8fF8rMxAGn2h1klerz81ixIo.png', '8', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:56:02', '2025-07-15 15:56:02'),
(176, 'Totem 1,5m TRUSS F34', '<p>Hauteur : 1m50</p><p>Supporte une charge max. de 25 kg</p><p>Poids total : 26,5 kg</p><p>Composition du support :</p><p>4 tubes de connexion de 1m50</p><p>1 plaque de support (350 x 350 mm)</p><p>1 plaque de sol (600 x 600 mm)</p><p>1 Lycra adapté</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/yC9gNUv7wvM6vUpOoX7qfiSjmYTwj0CxRoPGBowR.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 11, 1, 1, NULL, 'location', 0, '2025-07-15 15:56:53', '2025-07-15 15:56:53'),
(177, 'Embase Bois 5KG 450x450x5mm', '<p>Embase en bois</p><p>Pour traverses F31-F34, F22-F24</p><p>Dimensions: 450 x 450 x 5 mm</p><p>Poids : 7,8 kg</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/JY2JqVNf4ecWoxp3cfE5Eo5aqoTmxMNUeM6Kx1IS.png', '8', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:57:50', '2025-07-15 15:57:50'),
(178, 'Embase Métallique 450x450cm (légère)', '<p>Embase métallique</p><p>Pour traverses F31-F34, F22-F24</p><p>Dimensions : 450 x 450 x 5 mm</p><p>Matériau : AlMgSi F31</p><p>Poids : 1,8 kg</p><p>Couleur : Gris</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/MaizMOyHYzjTuGLHew6KqLJaQ0iYs1fCt3KfiI5Z.png', '8', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:59:20', '2025-07-15 15:59:20'),
(179, 'Embase Bambou 10kg', '<p><span style=\"color: rgb(0, 0, 0);\">Embase pour mâts bambou 10kg</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/WL7fnOGacveZfdZiUrBG3WFaWWOVvKfHEGgV7tTD.png', '8', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-15 15:59:50', '2025-07-15 15:59:50'),
(180, 'Embase en croix 15KG', '<p>Embase lourde 15kg pour TRUSS F34</p><p>Forme en croix</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/imY3OOULuLyIs258agZ5dx7UcJR0quXCKucO5Uqd.png', '8', NULL, 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-15 16:00:42', '2025-07-15 16:00:42'),
(181, 'Embase Lourde 80x80 40KG (3 ou 4 points)', '<p>Embase lourde pour structure Truss</p><p>40KG</p><p>Forme : Carrée</p><p>Couleur : Noire</p><p>Adaptable en 4 points ou 3 points</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/9LtDaXZ1j0wcNtuKg1amuivdjmeoqPol08TP9BJt.png', '8', NULL, 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-15 16:01:48', '2025-07-15 16:01:48'),
(182, 'Embase Lourde 40KG (3 ou 4 points)', '<p>Embase lourde pour structure Truss</p><p>40KG</p><p>Forme : Ronde</p><p>Couleur : Grise</p><p>Adaptable en 4 points ou 3 points</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/94LDBhT3RNTsv4AypfGi78GhHiJxl89cQ6u5u8NK.png', '8', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-16 16:35:00', '2025-07-16 16:35:00'),
(183, 'Table DJ Universelle - Millenium', '<p>Table DJ universelle</p><p>Convient pour DJ : idéal petit contrôleur</p><p>Facile et rapide à monter</p><p>Dimensions table : 820 x 465 mm</p><p>Hauteur ajustable : 720 - 960 mm</p><p>Couleur : noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/3RdMG2UKOTCOl4MgFUdpr6x5wfT1haHegBSlZJJJ.png', '8', 'MILLENIUM', 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 16:35:55', '2025-07-16 16:35:55'),
(184, 'Pied Télescopique Gris (Lumière)', '<p>Pied en aluminium</p><p>Supporte une charge max. de 30 kg</p><p>Hauteur réglable de 1,25 à env. 2,5 m</p><p>Poids d\'un pied : 2,16 kg</p><p>Couleur : Gris</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Q7oX0g4iM69Dh0vCol1eDYv5RuT6IfJhzr1SX5XC.png', '8', 'K&M', 100, 1, 0, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-16 16:39:50', '2025-07-16 16:39:50'),
(185, 'Barre en T Grise', '<p>Barre en T</p><p>Pour différents type d\'éclairage</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/eazh6qPqhD0yqwKjVEN4ennIgL14vqyFaHr186H6.png', '8', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 16:40:41', '2025-07-16 16:40:41'),
(186, 'Pied Télescopique Noir (Lumière)', '<p>Pied en aluminium</p><p>Supporte une charge max. de 30 kg</p><p>Hauteur réglable de 1,25 à env. 2,5 m</p><p>Poids d\'un pied : 2,16 kg</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ppkr3bkjCr8Psf2ivQwbXaiGMlcELp88gVWkJgAn.png', '8', 'GRAVITY', 100, 1, 0, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-16 16:41:33', '2025-07-16 16:41:33'),
(187, 'Barre en T Noire', '<p>Barre en T Noire</p><p>Permet d\'accrocher des spots</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ymTr5Moq3nKu4UfiVEGfqxyGGa0H92HZsUijq7CX.png', '8', 'GRAVITY', 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 16:42:26', '2025-07-16 16:42:26'),
(188, 'Pied télescopique pour QFX Barre Led + Barre en T', '<p>Couleur : Noir ou Gris</p><p>Pied d\'éclairage pliable très stable avec barre en T sur le dessus</p><p>Conception robuste avec 3 sections télescopiques en acier</p><p>Parfait pour monter toutes sortes de projecteurs et petits effets lumineux</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/YZSRCNYZWlmfgHCdlQNafjyF2eHjHBl2yT1KiHgI.png', '8', 'GRAVITY', 100, 1, 0, NULL, 9, 1, 1, NULL, 'location', 0, '2025-07-16 16:43:23', '2025-07-16 16:43:23'),
(189, 'Desk DJ - Lycra', '<p>Cabine DJ en Lycra &amp; Alu</p><p>Lycras fournis</p><p>4 Panneaux à assembler</p><p>Housse de transport</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/62m4ZmucmpukABdUWnmbbsaUmy9KUB8sVY91dB6U.png', '8', 'ADJ', 100, 1, 0, NULL, 42, 1, 1, NULL, 'location', 0, '2025-07-16 16:44:07', '2025-07-16 16:44:07'),
(190, 'Desk DJ - Ibiza Aluminium', '<p>Structure métallique légère</p><p>Composé de 4 panneaux pliables et d\'une tablette en métal pour poser votre régie</p><p>Charnières à glissement pour montage/démontage sans outil</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/AM5bUCHFCxl16AnJ39kE9OLvN3ZQSIh74HvcVXlZ.png', '8', 'IBIZA', 100, 1, 0, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-16 16:44:41', '2025-07-16 16:44:41'),
(191, 'Desk DJ - Alu', '<p>Table pliante pour évènement</p><p>Table pliable et stable pour les DJ, les techniciens de l\'éclairage et du son, etc</p><p>Peut être facilement démonté et pliable</p><p>Construction très légère en aluminium</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/VQy2E1bjkEcojhxHyvyjBw9EzryO0jNXGMYEtir1.png', '8', 'ADJ', 100, 1, 0, NULL, 28, 1, 1, NULL, 'location', 0, '2025-07-16 16:45:15', '2025-07-16 16:45:15'),
(192, 'Lycra blanc pour desk dj afx pro / ibiza alu', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu Lycra Blanc parfait pour habiller les desk DJ AFX Pro et Ibiza Alu</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/7Q3BTzyU3wGC1vx1Unz5TDVjNJH366urHeasts7l.png', '8', NULL, 100, 1, 0, NULL, 15, 1, 1, NULL, 'location', 0, '2025-07-16 16:45:50', '2025-07-16 16:45:50'),
(193, 'lycra noir pour  desk dj afx pro / ibiza alu', '<p><span style=\"color: rgb(0, 0, 0);\">Tissu Lycra Noir parfait pour habiller les desk DJ AFX Pro et Ibiza Alu</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/YirMyu2kE5tSnlOINSlXgLkPBmbUSxhsfSzoHaV6.png', '8', NULL, 100, 1, 0, NULL, 15, 1, 1, NULL, 'location', 0, '2025-07-16 16:46:20', '2025-07-16 16:46:20'),
(194, 'Praticable de scène 2,0m x 1,0m', '<p>Praticable de scène pour extérieur</p><p>Dimensions : 2,0 x 1,0 m</p><p>Imperméabilisé (BFU 100)</p><p>Plaque de sérigraphie finlandaise de 12 mm</p><p>Revêtement phénolique marron foncé HEXA \"anti-dérapant\" 220 g/m²</p><p>Poids admissible max. : 750 kg/m²</p><p>A protéger des rayons intenses du soleil et de l\'engorgement d\'eau</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/UMLI1ACZU3GspICrWTyShkDYujFGKjdqz1LTiPC0.png', '8', NULL, 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-16 16:47:07', '2025-07-16 16:47:07'),
(195, 'Escalier pour scène hauteur 60cM', '<p>Escalier 3 marches bois pour praticables de scène</p><p>Hauteur : 60cm</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/ooUIbBj5e2H5Kb7dO0zEVAJoKIq7YUyv7KaHFQPt.png', '8', NULL, 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-16 16:47:50', '2025-07-16 16:47:50'),
(196, 'Coton gratté Noir M1 (prix au mètre)', '<p>Coton Gratté ignifugé pouvant être utilisé en tant que nappe sur les plateaux de tournage</p><p>Aussi utilisé pour contrôler la lumière en absorbant ou en diffusant la lumière d’une source spécifique</p><p>Prix au mètre</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/B1LFzWIJwR24B1sE1ze86IWiYPuLfdyRKD301xkK.png', '8', NULL, 100, 1, 0, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-16 16:48:51', '2025-07-16 16:48:51'),
(197, 'Pied pour praticable 60cm-1m', '<p>Jeu de quatre pieds enfichables</p><p>Hauteur de 60 cm - 1m (convertibles)</p><p>Convient pour praticables de scène de tournée</p><p>Dimensions au sol : 60 x 60 mm</p><p>Épaisseur de paroi : 2,5 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/1VMamTOgoJcMqfO0AhW7t3nGy0aZzfODjVbNpzzz.png', '8', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 16:49:49', '2025-07-16 16:49:49'),
(198, 'Pied pour praticable 20cm', '<p>Jeu de quatre pieds enfichables</p><p>Hauteur de 20 cm</p><p>Convient pour praticables de scène de tournée</p><p>Dimensions au sol : 60 x 60 mm</p><p>Épaisseur de paroi : 2,5 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/afL4JJilNLv1vXFSNKeSzUrPxaLGk5cJveMXUOXs.png', '8', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 16:50:33', '2025-07-16 16:50:33'),
(199, 'Pied pour praticable 10cm', '<p>Jeu de quatre pieds enfichables</p><p>Hauteur de 10 cm</p><p>Convient pour praticables de scène de tournée</p><p>Dimensions au sol : 60 x 60 mm</p><p>Épaisseur de paroi : 2,5 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/FxSksE51t0e4ibCb88oDLyqIe776GS42FqoSuMo9.png', '8', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 16:51:05', '2025-07-16 16:51:05'),
(200, 'Elingues De Sécurité', '<p>Longueur 600mm</p><p>Charge de rupture Maxi 250 Kg</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/u5sqWOgO9sBjF3v1fT7Gkn9FfcqU4fs2X76SnTX3.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 16:52:38', '2025-07-16 16:52:38'),
(201, 'Coupleur F34 (grand)', '<p><span style=\"color: rgb(0, 0, 0);\">Coupleur pour Truss F34 (50mm)</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/6SFbH3sMVD723PBAMnUNXrWL6XxNB3sqlkgREBfS.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 16:53:46', '2025-07-16 16:53:46'),
(202, 'Coupleur F34 (petit)', '<p><span style=\"color: rgb(0, 0, 0);\">Coupleur pour Truss F34 (30mm)</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/OEYJFQK1DKCyyFB0mhJJgIAgkP24LXCHRYU7vzlK.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 16:54:24', '2025-07-16 16:54:24'),
(203, 'Crochet Acier F34', '<p>Crochet avec contre plaque</p><p>Idéal pour ne pas abimer les structures</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Pb9FF7xMRPd7M7TDXDhb3fuuI4hjE1PuttVdhi15.png', '8', NULL, 100, 1, 0, NULL, 3, 1, 1, NULL, 'location', 0, '2025-07-16 16:55:23', '2025-07-16 16:55:23'),
(204, 'Accroche Barquette', '<p>Matière : Plastique</p><p>Couleur : noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/hOlYRsM9HWtAw3L7LzVBUmh1GbnvSsFCtvsYfWJD.png', '8', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 16:56:34', '2025-07-16 16:56:34'),
(205, 'Kit goupilles', '<p><span style=\"color: rgb(0, 0, 0);\">Goupille pour structure Truss F34</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/j669DIesLRftRFvMOo2pzAmZP6Z9l2GuvQ2lpiC0.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 16:57:33', '2025-07-16 16:57:33'),
(206, 'Kit beta', '<p><span style=\"color: rgb(0, 0, 0);\">Beta pour structure Truss F34</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/SJnrNkvTtMcrMngIyQ9g7KhCAvyyRfF9XqlqM8iO.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 16:58:27', '2025-07-16 16:58:27'),
(207, 'Manchon', '<p><span style=\"color: rgb(0, 0, 0);\">Manchons pour structure Truss F34</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/drzceTKeLfpkFnAiB2vknr2XMr5CR6yAMmjqss7o.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 16:59:17', '2025-07-16 16:59:17'),
(208, 'Manchon Olive', '<p><span style=\"color: rgb(0, 0, 0);\">Manchons olives pour structure Truss F34</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/aWpdBjdDNsPDfv2ZLnxAhNF8e5uUqHa49hID0il5.png', '8', 'GLOBAL TRUSS', 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 17:00:05', '2025-07-16 17:00:05'),
(209, 'Accroche Barquette', '<p>Matière : Plastique</p><p>Couleur noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/JjN66XDYm55TNVtwr1BnlTso6DYbRYzR5MEDaR9v.png', '16', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:02:04', '2025-07-16 17:02:04'),
(210, 'Multiprise étanche 220V 16A IP54 noire (barquette)', '<p>Bloc multiprise IP 54 permettant une utilisation en extérieur</p><p>4 prises femelles standard Français munies de capots de fermeture</p><p>Câble en HO7 souple et de grande résistance</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/RihiNUE6KCgjoa14DQp5aljbE89NXDCtoTQfqzAw.png', '16', NULL, 100, 1, 0, NULL, 1, 1, 1, NULL, 'location', 0, '2025-07-16 17:02:53', '2025-07-16 17:02:53'),
(211, 'Passage De Cable Rigide 1M', '<p>Passage de Câble Rigide 1M</p><p>2 canaux : 30x32 mm</p><p>Résistance protège câble 20 Tonnes max</p><p>Capot jaune articulé</p><p>Dim. : L.1000 x l.250 x H.45 mm</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/zjfTxbnEW0X2Hj0FMPjar9tYPIg9LGDTRqBCFZE2.png', '16', NULL, 100, 1, 0, NULL, 6, 1, 1, NULL, 'location', 0, '2025-07-16 17:03:46', '2025-07-16 17:03:47'),
(212, 'Prolongateur électrique 16A 1M IP', '<p>Rallonge pour tous besoins, bricolage, activités d\'intérieur ou d\'extérieur - pour acquérir une souplesse de travail</p><p>Cordon électrique pouvant supporter une puissance maximale sous 230V~ de 3500W</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/qTHOtWhHKkKivioT8lohJ85l9PmfRiVaJKc4y87u.png', '16', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:05:00', '2025-07-16 17:05:00'),
(213, 'Prolongateur électrique 16A 2M IP', '<p>Rallonge pour tous besoins, bricolage, activités d\'intérieur ou d\'extérieur - pour acquérir une souplesse de travail</p><p>Cordon électrique pouvant supporter une puissance maximale sous 230V~ de 3500W</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/tOsHwfpD18Q06OOknnocNnJ5ZCFjiA71Bpw1LoIr.png', '16', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 17:05:34', '2025-07-16 17:05:34'),
(214, 'Enrouleur électrique 15m - 4 prises', '<p><span style=\"color: rgb(0, 0, 0);\">Rallonge Prolongateur électrique 15 m avec enrouleur 4 Prises 16 A section 31,5 mm² Gris</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/L4PIMFe4iD1OakY7Bonshb7fmBdoTyIsTM4umvwH.png', '16', NULL, 100, 1, 0, NULL, 8, 1, 1, NULL, 'location', 0, '2025-07-16 17:06:26', '2025-07-16 17:06:26'),
(215, 'Enrouleur électrique 30m - 4 prises', '<p><span style=\"color: rgb(0, 0, 0);\">Rallonge Prolongateur électrique 30 m avec enrouleur 4 Prises 16 A section 31,5 mm² Gris</span></p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/hLXTOvkWeixdWmRtMT116xIkacjQo2oN2xkKzi1x.png', '16', NULL, 100, 1, 0, NULL, 16, 1, 1, NULL, 'location', 0, '2025-07-16 17:07:15', '2025-07-16 17:07:15'),
(216, 'Gaffeur Blanc', '<p>Longueur : 50 mètres</p><p>Largeur : 50 mm</p><p>Couleur : blanc</p><p>Gaffeur professionnel, pour coller les câbles, etc...</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/G0t7IIrXsOreswazp22jaCOb5u3qBtYLOSuEqJdf.png', '17', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-16 17:08:09', '2025-07-16 17:08:09'),
(217, 'Gaffeur noir', '<p>Longueur: 50 mètres</p><p>Largeur : 50 mm</p><p>Couleur : noir mat</p><p>Gaffeur professionnel, pour coller les câbles, etc...</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/5a0jhPHfjZvvKr30RHXOuwXrNB1VOPITHIe8m25C.png', '17', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-16 17:09:05', '2025-07-16 17:09:05'),
(218, 'Module (XLR) 1M', '<p>Longueur : 1m</p><p>XLR mâle - XLR femelle</p><p>Fiches Neutrik NC 3 FXX-BAG + NC 3 MXX-BAG</p><p>Câble CME 220</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/3vsAoB8GkjHfo5iIquJ895hI9xCncib29FdkL4we.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:10:06', '2025-07-16 17:10:06'),
(219, 'Module (XLR) 5-6M', '<p>Longueur : 5m-6m</p><p>XLR mâle - XLR femelle</p><p>Fiches Neutrik NC 3 FXX-BAG + NC 3 MXX-BAG</p><p>Câble CME 220</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/nqmjXm0tfkUYsZg5U0h0ebhAkAbRMq1qWXq7Y4k3.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:10:36', '2025-07-16 17:10:36'),
(220, 'Module (XLR) 10M', '<p>Longueur : 10m</p><p>XLR mâle - XLR femelle</p><p>Fiches Neutrik NC 3 FXX-BAG + NC 3 MXX-BAG</p><p>Câble CME 220</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/RjxjvOXmxUkXCp9hgfBR4KRSKdMbA1nqW3Atb51Q.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:11:05', '2025-07-16 17:11:05'),
(221, 'Module (XLR) 20M', '<p>Longueur : 20m</p><p>XLR mâle - XLR femelle</p><p>Fiches Neutrik NC 3 FXX-BAG + NC 3 MXX-BAG</p><p>Câble CME 220</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/mdYP22VYY4M9HTnfLRlXWVcnuU3EQmrpXAGA2mNn.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:11:34', '2025-07-16 17:11:34'),
(222, 'Touret XLR Son (50M)', '<p>Longueur du câble : 50 m</p><p>Connecteurs XLR Amphenol (mâle/femelle)</p><p>Section de câble : 4 x 0,22 mm²</p><p>Blindage tressé</p><p>Diamètre extérieur : 7 mm</p><p>Enrouleur en matière plastique</p><p>Design très robuste</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/YwjF4VPQTWTFfbIV1KSvHInyC2IpTzLWVGYWZDjE.png', '17', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-16 17:12:14', '2025-07-16 17:12:14'),
(223, 'Module (DMX) 1M', '<p>Longueur : 1m</p><p>Impédance: 110 Ohm</p><p>1 x XLR mâle 3 broches - 1 x XLR femelle 3 broches</p><p>Section de câble: 2 x 0,34 mm²</p><p>Couleur du câble et XLR: Noir</p><p>Anneaux de marquage vert</p><p>Attache de câble incl.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/qbZjMELjzu2HCenkih0cDmTum1sdB69hlKHiZJx3.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:13:04', '2025-07-16 17:13:04'),
(224, 'Module (DMX) 5-6M', '<p>Longueur : 5m</p><p>Impédance: 110 Ohm</p><p>1 x XLR mâle 3 broches - 1 x XLR femelle 3 broches</p><p>Section de câble: 2 x 0,34 mm²</p><p>Couleur du câble et XLR: Noir</p><p>Anneaux de marquage vert</p><p>Attache de câble incl.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/CaiQbfUKz0oAV14rcw68umfEpUdqm0CF33VPAeoq.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:13:36', '2025-07-16 17:13:36');
INSERT INTO `products` (`id`, `name`, `description`, `short_description`, `image_url`, `category_id`, `brand`, `stock`, `min_stock`, `weight`, `sale_price`, `daily_price`, `available`, `featured`, `rented_out`, `type`, `free_shipping`, `created_at`, `updated_at`) VALUES
(225, 'Module (DMX) 10M', '<p>Longueur : 10m</p><p>Impédance: 110 Ohm</p><p>1 x XLR mâle 3 broches - 1 x XLR femelle 3 broches</p><p>Section de câble: 2 x 0,34 mm²</p><p>Couleur du câble et XLR: Noir</p><p>Anneaux de marquage vert</p><p>Attache de câble incl.</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/B8UeSCAgBEFJIeIuYBs2rOy5ZN54znUwfu6QNz1Q.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:14:04', '2025-07-16 17:14:04'),
(226, 'Module (DMX) 20M', '<p>Longueur : 20m</p><p>Impédance : 110 Ohm</p><p>1x XLR mâle 3 broches - 1x XLR femelle 3 broches</p><p>Section de câble : 2 x 0,34 mm²</p><p>Couleur du câble et XLR : Noir</p><p>Anneaux de marquage vert</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/s1JLeTKLuKEjXBuDsUXQD9z8uHba4eJdWZWJJ60D.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:14:33', '2025-07-16 17:14:33'),
(227, 'Touret 50m DMX', '<p>Longueur : 50 m</p><p>Câble 3 conducteurs</p><p>Impédance : 110 Ohm</p><p>Fiches XLR 5 broches (3 broches connectées)</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/8Ys4galhix1NSgltrQWo7i2gYcI8LDmUzU6DIwoi.png', '17', NULL, 100, 1, 0, NULL, 25, 1, 1, NULL, 'location', 0, '2025-07-16 17:15:03', '2025-07-16 17:15:03'),
(228, 'Cordon d\'Alimentation Européen (Schuko vers IEC C13)', '<p>Connecteur Schuko mâle + connecteur IEC C13 femelle</p><p>Alimentation de divers appareils : consoles de mixage, jeux de lumière, enceintes... </p><p>Trois conducteurs de 1 mm² et une gaine flexible</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/A5BRfYSQcfrVyDeeOBrCCpUuAtzk166eUqjJpjPX.png', '17', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 17:15:46', '2025-07-16 17:15:46'),
(229, 'Câble d\'extension IEC - IEC', '<p>Fiche mâle IEC C14 et fiche femelle IEC C13</p><p>Permet de rallonger la longueur d’alimentation de divers appareils : consoles de mixage, jeux de lumière, enceintes... </p><p>Trois conducteurs de 1 mm² et une gaine flexible</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/UIPXeMCBGMOcxMpk33v1RESXQMuMjNygxP2wy0uk.png', '17', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 17:16:33', '2025-07-16 17:16:33'),
(230, 'Système SON sans fil HF - Denon', '<p>Denon Professional DN-202WT</p><p>Émetteur audio sans fil</p><p>Fonctionne avec DN-202WR</p><p>Récepteur audio sans fil jusqu\'à 30m de portée</p><p>Utilisation de plusieurs réceptéurs 202WR DN pour un seul émetteur DN-202WT</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/QphU3emr2ShQPMPf3dOjJ1rgVncdeoM7uzGaVrRm.png', '17', 'DENON', 100, 1, 0, NULL, 40, 1, 1, NULL, 'location', 0, '2025-07-16 17:17:32', '2025-07-16 17:17:32'),
(231, 'Patch RJ45 - T-Sssnake (femelle)', '<p>Compatible avec n’importe quel câble réseau blindé avec connecteur RJ-45 ou Ethercon dans toutes les longueurs</p><p>Peut également être utilisé pour DMX</p><p>Broche 1-3 occupée</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/iZgY3FaU1oy4QVbG0yOwNurYtGkcjnc1AkaI7Yjg.png', '17', 'THE SSSNAKE', 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-16 17:18:39', '2025-07-16 17:18:39'),
(232, 'Patch RJ45 - T-Sssnake (mâle)', '<p>Compatible avec n’importe quel câble réseau blindé avec connecteur RJ-45 ou Ethercon dans toutes les longueurs </p><p>Peut également être utilisé pour DMX </p><p>Broche 1-3 occupée</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/UFUedjrRiXrIrvANfWhpzfB6N72Q854GC2Sd0bIO.png', '17', 'THE SSSNAKE', 100, 1, 0, NULL, 30, 1, 1, NULL, 'location', 0, '2025-07-16 17:19:46', '2025-07-16 17:19:46'),
(233, 'Ultra-Di Behringer - Model Di100', '<p>Boitier de direct actif</p><p>Entrée jack, sortie jack et XLR</p><p>Interrupteur de masse</p><p>Pad atténuateur -20, -40 dB</p><p>Sortie parallèle jack</p><p>Fonctionne sur pile 9V ou par alimentation Phantom 15-52V</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/791tA5OFR11jUXC3cWhLfPNsS5e4gSeymdKFdsgE.png', '17', 'BEHRINGER', 100, 1, 0, NULL, 15, 1, 1, NULL, 'location', 0, '2025-07-16 17:21:06', '2025-07-16 17:21:06'),
(234, 'RJ45 10m', '<p>Câble RJ45 CAT 5e UTP</p><p>Longueur : 10 m</p><p>Connecteurs : Mâle/Mâle</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/CMzXVWuhoBCxJ1nUf1h3IO82rhKbA8V2gguq0t42.png', '17', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-16 17:21:54', '2025-07-16 17:21:54'),
(235, 'RJ45 20m', '<p>Câble RJ45 CAT 5e UTP</p><p>Longueur : 20 m</p><p>Connecteurs : Mâle/Mâle</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/i9OdvgAkPVo5s7Ptt4gkbKMm4861HwyGpPOLaqIm.png', '17', NULL, 100, 1, 0, NULL, 10, 1, 1, NULL, 'location', 0, '2025-07-16 17:22:28', '2025-07-16 17:22:28'),
(236, 'RJ45 Touret 50M', '<p>Câble RJ45 CAT 5e UTP</p><p>Longueur : 50 m</p><p>Connecteurs : Mâle/Mâle</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/7wSgytWAcz5D1IeWiUFBrmYCRPRXhkmV9q9spbu0.png', '17', NULL, 100, 1, 0, NULL, 35, 1, 1, NULL, 'location', 0, '2025-07-16 17:23:13', '2025-07-16 17:23:13'),
(237, 'Cable antenne 10m', '<p>Longueur : 10 m</p><p>Câble coaxial HF</p><p>Type de câble : RG58</p><p>Diamètre extérieur : env. 5 mm</p><p>Impédance : 50 Ohm</p><p>Couleur : Noir</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/OTFuAFjiLXLT8OEFjdJzSUmz7CeqzzpDIYKd0egA.png', '17', NULL, 100, 1, 0, NULL, 5, 1, 1, NULL, 'location', 0, '2025-07-16 17:24:05', '2025-07-16 17:24:05'),
(238, 'Mini-Jack RCA', '<p>Longueur : 3 mètres</p><p>1x mini-jack stéréo 3,5 mm / 2x Cinch (RCA)</p><p>Idéal pour PC / carte son</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/Eqr5o4kBCwYLrAQwif4AQRRrHtLuNFmxU0l5zFVC.png', '17', NULL, 100, 1, 0, NULL, 3, 1, 1, NULL, 'location', 0, '2025-07-16 17:24:52', '2025-07-16 17:24:52'),
(239, 'Mini-Jack Jack', '<p>Câble Jack 6,3 mm vers Mini-Jack 3,5 mm</p><p>Fiches en métal noir</p><p>Contacts plaqués or</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/1oRh0rND1OL74CjshM9jMmlc7Y6lH1NixmMq0mk5.png', '17', NULL, 100, 1, 0, NULL, 3, 1, 1, NULL, 'location', 0, '2025-07-16 17:25:42', '2025-07-16 17:25:42'),
(240, 'XLR Mâle > Jack 6,5', '<p>Longueur : 3 m</p><p>Section de câble : 2 x 0,20 mm²</p><p>Jack stéréo 6,3 mm - XLR mâle</p><p>Fiches Neutrik (Rean)</p><p>Fiches en métal noir</p><p>Contacts plaqués or</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/w1Q22fSsdCBDEakTEIQwgsvGFvSURjqi8RVtArvv.png', '17', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 17:26:53', '2025-07-16 17:26:53'),
(241, 'XLR Femelle > Jack 6,5', '<p>Longueur : 30 cm</p><p>XLR femelle - Jack stéréo mâle 6,3 mm</p><p>Fiches en métal noir</p><p>Contacts dorés</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/dh4yOzQZOmdWzb2XzqRHgQJFVCCKSkix2MRfQtas.png', '17', NULL, 100, 1, 0, NULL, 4, 1, 1, NULL, 'location', 0, '2025-07-16 17:27:40', '2025-07-16 17:27:40'),
(242, 'RCA XLR Femelle', '<p>Longueur: 1,5 m</p><p>Section de câble: 1 x 0,22 mm²</p><p>2 x XLR femelles - 2 x RCA (Cinch) mâle</p><p>Fiches Neutrik (Rean)</p><p>Contacts plaqués or</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/r0xmTqQ4vu9lXNA1tsrpEEv3LTqDQMAY9SytZ8La.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:28:44', '2025-07-16 17:28:44'),
(243, 'RCA XLR Mâle', '<p>Longueur: 1,5 m</p><p>Section de câble: 1 x 0,22 mm²</p><p>2 x XLR mâle - 2 x RCA (Cinch) mâle</p><p>Fiches Neutrik (Rean)</p><p>Contacts plaqués or</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/taLmjZk87HxOYe9jdHJjLzXHvmX6Mtr4M8IxKWby.png', '17', NULL, 100, 1, 0, NULL, 2, 1, 1, NULL, 'location', 0, '2025-07-16 17:29:37', '2025-07-16 17:29:37'),
(244, 'XLR Y', '<p>Longueur: 30 cm</p><p>XLR femelle - Jack stéréo mâle 6,3 mm</p><p>Fiches en métal noir</p><p>Contacts dorés</p>', NULL, 'http://sonoprf.cluster100.hosting.ovh.net/backend/public/api/uploads/products/FktyeFWNP9u8bJpnQB6jZIHqobpmwqJZ1lnsHYYZ.png', '17', NULL, 100, 1, 0, NULL, 3, 1, 1, NULL, 'location', 0, '2025-07-16 17:30:24', '2025-08-09 07:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `sav_attachments`
--

CREATE TABLE `sav_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sav_messages`
--

CREATE TABLE `sav_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `is_internal` tinyint(1) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sav_messages`
--

INSERT INTO `sav_messages` (`id`, `ticket_id`, `user_id`, `sender_id`, `is_internal`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 2, NULL, 'Price', 'What is the price of hostinger', 0, '2025-06-20 03:48:39', '2025-06-20 03:48:39'),
(2, 4, 1, 2, NULL, NULL, 'Hi are you there?', 0, '2025-06-20 03:50:24', '2025-06-20 03:50:24'),
(3, 4, 2, 1, NULL, NULL, 'Yes I am here', 0, '2025-06-20 03:50:24', '2025-06-20 03:50:24'),
(4, 4, 1, 2, NULL, NULL, 'I need some information', 0, '2025-06-20 04:27:22', '2025-06-20 04:27:22'),
(5, 4, 1, 1, NULL, NULL, 'which type of information do you need?', 0, '2025-06-20 05:48:45', '2025-06-20 05:48:45'),
(6, 4, 1, 2, NULL, NULL, 'About price', 0, '2025-06-20 06:17:08', '2025-06-20 06:17:08'),
(7, 4, 1, 1, NULL, NULL, 'Its very cheap', 0, '2025-06-20 06:18:51', '2025-06-20 06:18:51'),
(9, 4, 1, 1, 1, NULL, 'Resolved', 0, '2025-06-20 06:30:04', '2025-06-20 06:30:04'),
(10, 4, 1, 1, 1, NULL, 'Through company', 0, '2025-06-20 06:30:49', '2025-06-20 06:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `sav_tickets`
--

CREATE TABLE `sav_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'open' COMMENT 'open, in_progress, closed',
  `product_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `priority` varchar(255) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `closed_at` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sav_tickets`
--

INSERT INTO `sav_tickets` (`id`, `title`, `status`, `product_id`, `order_id`, `customer_id`, `description`, `priority`, `assigned_to`, `closed_at`, `created_at`, `updated_at`) VALUES
(2, 'Domain Update', 'open', NULL, NULL, 1, 'hello.com', 'normal', NULL, NULL, '2025-06-20 02:32:30', '2025-06-20 02:32:30'),
(4, 'Hosting Pricing', 'closed', NULL, NULL, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'normal', NULL, NULL, '2025-06-20 03:45:21', '2025-06-20 06:01:54');

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('igOLn4Yp8LdcDsD4mkUAwSULXkHcKeYOlO2vpsHz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia1UzMXRYdFRKZ01wekM4d1VwT3lkSnJTZHRRZjBhSFBJekRVemQ3bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749814047),
('m3dspVZAQ8cnSKaHEk8NhhdxckZ5xn7roverqOfY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFd2RjFVYVpPNlp0RG5YU0s5MUNwbTlDSGR1RkVqUU5uNE80R2dIRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750231692);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `product_id`, `quantity`, `type`, `reason`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(5, 6, 5, 'out', 'Accidently added', NULL, 1, '2025-06-19 04:43:31', '2025-06-19 04:43:31'),
(6, 6, 20, 'in', NULL, NULL, 1, '2025-06-19 05:57:37', '2025-06-19 05:57:37'),
(7, 6, 10, 'out', NULL, NULL, 1, '2025-06-19 05:57:57', '2025-06-19 05:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer' COMMENT 'customer,admin',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Uzair Ahmed', 'uzairtahir535@gmail.com', '+923219640134', NULL, '$2y$12$HLR/OOrGG7QeZIwXhTvmdeVOX78pFMG99niRgXMmfnCVm5HhAQcs2', 'admin', NULL, '2025-06-12 02:33:58', '2025-06-23 07:41:04'),
(2, 'Maahey inc', 'uzairtahir.business@gmail.com', NULL, NULL, '$2y$12$mPBgrOIncsznh0dEZBEJhurw6BapBhKv097eQaTX3Jk5MH8tw/spa', 'customer', NULL, '2025-06-20 03:42:09', '2025-06-20 03:42:09'),
(8, 'Maahey inc', 'maahey.inc@gmail.com', '+923213274255', NULL, '$2y$12$tuttqTyDnDzHFrFq1aWFteZS6.FpK2jNKjWshUYUDH/ul45eooQwS', 'admin', NULL, '2025-06-20 03:42:09', '2025-06-20 03:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `users_meta`
--

CREATE TABLE `users_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_meta`
--

INSERT INTO `users_meta` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(3, 4, 'login_otp', '3179', '2025-07-15 02:58:24', '2025-07-15 02:59:57'),
(4, 7, 'login_otp', '5771', '2025-07-15 03:51:31', '2025-07-15 03:55:53'),
(5, 1, 'login_otp', '6298', '2025-07-15 10:46:06', '2025-08-09 06:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brochures`
--
ALTER TABLE `brochures`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devis_requests`
--
ALTER TABLE `devis_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sav_attachments`
--
ALTER TABLE `sav_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sav_messages`
--
ALTER TABLE `sav_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sav_tickets`
--
ALTER TABLE `sav_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_meta`
--
ALTER TABLE `users_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brochures`
--
ALTER TABLE `brochures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_notes`
--
ALTER TABLE `customer_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devis_requests`
--
ALTER TABLE `devis_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `sav_attachments`
--
ALTER TABLE `sav_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sav_messages`
--
ALTER TABLE `sav_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sav_tickets`
--
ALTER TABLE `sav_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_meta`
--
ALTER TABLE `users_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
