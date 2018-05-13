-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: localhost:3306
-- Χρόνος δημιουργίας: 13 Μάη 2018 στις 17:25:09
-- Έκδοση διακομιστή: 10.1.31-MariaDB-cll-lve
-- Έκδοση PHP: 5.6.30

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `col10127_harvester`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `agro_dataset`
--

CREATE TABLE `agro_dataset` (
  `id` int(11) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `server_time` datetime NOT NULL,
  `sensor_time` datetime NOT NULL,
  `temp` decimal(8,2) NOT NULL,
  `humidity` tinyint(4) NOT NULL,
  `pH` decimal(8,2) NOT NULL,
  `battery` decimal(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `agro_location_registry`
--

CREATE TABLE `agro_location_registry` (
  `id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `location_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `location_details` text CHARACTER SET utf8,
  `location_x` varchar(255) DEFAULT NULL,
  `location_y` varchar(255) DEFAULT NULL,
  `location_z` varchar(255) DEFAULT NULL,
  `notify_temp_min` decimal(13,2) DEFAULT NULL,
  `notify_temp_max` decimal(13,2) DEFAULT NULL,
  `temp` decimal(8,2) NOT NULL,
  `humidity` tinyint(4) NOT NULL,
  `pH` decimal(8,2) NOT NULL,
  `battery` decimal(8,2) NOT NULL,
  `server_time` datetime NOT NULL,
  `sensor_time` datetime NOT NULL,
  `device_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `agro_location_registry`
--

INSERT INTO `agro_location_registry` (`id`, `date_time`, `location_name`, `location_details`, `location_x`, `location_y`, `location_z`, `notify_temp_min`, `notify_temp_max`, `temp`, `humidity`, `pH`, `battery`, `server_time`, `sensor_time`, `device_id`) VALUES
(23, '2018-05-12 00:00:00', 'Αγρόκτημα 1', 'Δοκιμαστική Εγγραφή.', '38.900485', '22.43525599999998', '0.0000', '0.00', '32.00', '21.00', 52, '7.30', '3.62', '2018-05-10 11:38:46', '2018-05-10 11:20:58', '1'),
(24, '2018-05-12 00:00:00', 'Αγρόκτημα 2', '', '38.8999232', '22.449461799999995', '0.0000', '-10.00', '40.00', '21.00', 52, '7.30', '3.62', '2018-05-10 11:38:46', '2018-05-10 11:20:58', '1');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `agro_meta_daily_data`
--

CREATE TABLE `agro_meta_daily_data` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `day_date` date NOT NULL,
  `temp` decimal(8,2) NOT NULL,
  `humidity` smallint(6) NOT NULL,
  `ph` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_assets`
--

CREATE TABLE `cms_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_assets`
--

INSERT INTO `cms_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 347, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 8, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(4, 1, 9, 10, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5, 1, 11, 12, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6, 1, 13, 14, 1, 'com_config', 'com_config', '{}'),
(7, 1, 15, 22, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(8, 1, 23, 90, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),
(9, 1, 91, 92, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 93, 94, 1, 'com_installer', 'com_installer', '{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 95, 96, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(12, 1, 97, 98, 1, 'com_login', 'com_login', '{}'),
(13, 1, 99, 100, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 101, 102, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 103, 104, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 105, 106, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(17, 1, 107, 108, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18, 1, 109, 274, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(19, 1, 275, 280, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(20, 1, 281, 282, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(21, 1, 283, 284, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),
(22, 1, 285, 286, 1, 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(23, 1, 287, 288, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(24, 1, 289, 292, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.own\":{\"6\":1},\"core.edit.state\":[]}'),
(25, 1, 293, 300, 1, 'com_weblinks', 'com_weblinks', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),
(26, 1, 301, 302, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 24, 29, 2, 'com_content.category.2', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(29, 7, 16, 17, 2, 'com_contact.category.4', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(30, 19, 276, 277, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(31, 25, 294, 295, 2, 'com_weblinks.category.6', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(32, 24, 290, 291, 1, 'com_users.category.7', 'Uncategorised', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(33, 1, 303, 304, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(34, 25, 296, 297, 2, 'com_weblinks.category.8', 'Blog Roll', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(35, 8, 30, 57, 2, 'com_content.category.9', 'Blog', '{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(36, 44, 71, 72, 3, 'com_content.article.1', 'Module Positions', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(39, 44, 69, 70, 3, 'com_content.article.4', 'Home page article', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(41, 1, 305, 306, 1, 'com_users.category.10', 'Uncategorised', ''),
(42, 1, 307, 308, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),
(44, 8, 58, 73, 2, 'com_content.category.10', 'Template Articles', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(45, 44, 59, 60, 3, 'com_content.article.7', 'Offline page', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(46, 44, 61, 62, 3, 'com_content.article.8', 'Module Variations', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(49, 44, 63, 64, 3, 'com_content.article.11', 'Typography', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(50, 44, 65, 66, 3, 'com_content.article.12', 'Article Page Break', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(51, 7, 18, 19, 2, 'com_contact.category.11', 'Contact Persons', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(52, 8, 74, 89, 2, 'com_content.category.12', 'Joomla Articles', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(53, 52, 75, 76, 3, 'com_content.article.13', 'Archived Article', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(54, 52, 77, 78, 3, 'com_content.article.14', 'Archived Article 1', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(55, 52, 79, 80, 3, 'com_content.article.15', 'Archived Article 2', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(56, 52, 83, 84, 3, 'com_content.article.16', 'Archived Article 3', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(57, 52, 81, 82, 3, 'com_content.article.17', 'Archived Article 4', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(58, 7, 20, 21, 2, 'com_contact.category.13', 'Second Contacts Category', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(59, 25, 298, 299, 2, 'com_weblinks.category.14', 'Sample-Data Weblinks ', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(60, 19, 278, 279, 2, 'com_newsfeeds.category.15', 'Sample Data News Feeds', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(75, 35, 31, 38, 3, 'com_content.category.21', 'Second Category', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(76, 35, 39, 46, 3, 'com_content.category.22', 'Third Category', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(77, 35, 47, 56, 3, 'com_content.category.23', 'First Category', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(78, 75, 32, 33, 4, 'com_content.article.27', 'Nulla pulvinar at interdum', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(80, 75, 34, 35, 4, 'com_content.article.29', 'Class aptent taciti ', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(81, 75, 36, 37, 4, 'com_content.article.30', 'Maecenas facilisis', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(82, 76, 40, 41, 4, 'com_content.article.31', 'Donec dictum nisi eget', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(83, 76, 42, 43, 4, 'com_content.article.32', 'Donec ut magna', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(84, 76, 44, 45, 4, 'com_content.article.33', ' Curabitur at mauris', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(85, 77, 48, 49, 4, 'com_content.article.34', 'Donec neque metus, tempus', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(86, 77, 54, 55, 4, 'com_content.article.35', ' Aenean eu justo', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(87, 77, 50, 51, 4, 'com_content.article.36', 'Nam scelerisque erat quis ', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(88, 77, 52, 53, 4, 'com_content.article.37', 'Quote of someone famous', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(89, 44, 67, 68, 3, 'com_content.article.38', 'Single Article', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(90, 3, 6, 7, 2, 'com_banners.category.24', 'Banners', '{\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(104, 1, 309, 310, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(105, 1, 311, 312, 1, 'com_tags', 'com_tags', '{\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(106, 1, 313, 314, 1, '#__ucm_content.2', '#__ucm_content.2', '[]'),
(107, 1, 315, 316, 1, '#__ucm_content.3', '#__ucm_content.3', '[]'),
(108, 1, 317, 318, 1, '#__ucm_content.4', '#__ucm_content.4', '[]'),
(109, 1, 319, 320, 1, '#__ucm_content.5', '#__ucm_content.5', '[]'),
(110, 1, 321, 322, 1, '#__ucm_content.6', '#__ucm_content.6', '[]'),
(111, 1, 323, 324, 1, '#__ucm_content.7', '#__ucm_content.7', '[]'),
(112, 1, 325, 326, 1, '#__ucm_content.8', '#__ucm_content.8', '[]'),
(113, 1, 327, 328, 1, '#__ucm_content.9', '#__ucm_content.9', '[]'),
(114, 1, 329, 330, 1, '#__ucm_content.10', '#__ucm_content.10', '[]'),
(115, 1, 331, 332, 1, '#__ucm_content.11', '#__ucm_content.11', '[]'),
(117, 1, 333, 334, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(118, 1, 335, 336, 1, 'com_ajax', 'com_ajax', '{}'),
(119, 1, 337, 338, 1, 'com_postinstall', 'com_postinstall', '{}'),
(120, 18, 110, 111, 2, 'com_modules.module.208', 'Main Menu', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(121, 18, 112, 113, 2, 'com_modules.module.147', 'Quick Contact', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(124, 18, 114, 115, 2, 'com_modules.module.152', 'Blog Categories', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(125, 18, 116, 117, 2, 'com_modules.module.197', 'Product Categories', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(126, 18, 118, 119, 2, 'com_modules.module.17', 'Breadcrumbs', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(127, 18, 120, 121, 2, 'com_modules.module.16', 'Login Form', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(128, 18, 122, 123, 2, 'com_modules.module.196', 'Recent Products', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(129, 18, 124, 125, 2, 'com_modules.module.193', 'Popular Tags', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(132, 18, 126, 127, 2, 'com_modules.module.92', 'Smart Search Module', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(134, 18, 128, 129, 2, 'com_modules.module.204', 'Tagged Under', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(136, 18, 130, 131, 2, 'com_modules.module.212', 'Joomla Pages Banner', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(137, 18, 132, 133, 2, 'com_modules.module.106', '\"gray-box\" suffix', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(139, 18, 134, 135, 2, 'com_modules.module.96', '\"border-box\" suffix', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(140, 18, 136, 137, 2, 'com_modules.module.98', '\"color-box\" suffix', ''),
(141, 18, 138, 139, 2, 'com_modules.module.102', '\"color\" suffix', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(142, 18, 140, 141, 2, 'com_modules.module.93', 'Default Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(143, 18, 142, 143, 2, 'com_modules.module.95', '\"border-color\" suffix', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(144, 18, 144, 145, 2, 'com_modules.module.94', '\"border-black\" suffix', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(145, 18, 146, 147, 2, 'com_modules.module.214', '\"border-gray-top\" suffix', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(146, 18, 148, 149, 2, 'com_modules.module.104', '\"dark-title\" suffix', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(147, 18, 150, 151, 2, 'com_modules.module.103', '\"color-title\" suffix', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(149, 18, 152, 153, 2, 'com_modules.module.107', '\"menu1\"  Menu Class Suffix', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(151, 18, 154, 155, 2, 'com_modules.module.190', 'Who\'s Online', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(153, 18, 156, 157, 2, 'com_modules.module.160', 'Archived Articles', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(156, 18, 158, 159, 2, 'com_modules.module.216', 'Template Pages Banner', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(157, 18, 160, 161, 2, 'com_modules.module.217', 'Contact Us Banner', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(158, 18, 162, 163, 2, 'com_modules.module.218', 'Top Toolbar Contact Phone Number', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(159, 18, 164, 165, 2, 'com_modules.module.219', 'Home Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(160, 18, 166, 167, 2, 'com_modules.module.97', '\"dark-box\" suffix', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(161, 18, 168, 169, 2, 'com_modules.module.105', '\"gray-title\" suffix', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(170, 18, 170, 171, 2, 'com_modules.module.224', 'Wooden Wall Panels', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(171, 18, 172, 173, 2, 'com_modules.module.225', 'Tools & Accesories Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(172, 18, 174, 175, 2, 'com_modules.module.226', 'Wooden Floors Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(173, 18, 176, 177, 2, 'com_modules.module.227', 'Finishing Elements Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(174, 18, 178, 179, 2, 'com_modules.module.228', 'mod_st_promo_image', ''),
(175, 18, 180, 181, 2, 'com_modules.module.229', 'ST Promo Image Module', ''),
(176, 18, 182, 183, 2, 'com_modules.module.230', 'Wooden Wall Panels', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(177, 18, 184, 185, 2, 'com_modules.module.231', 'Tools & Accesories Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(178, 18, 186, 187, 2, 'com_modules.module.232', 'Wooden Floors Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(179, 18, 188, 189, 2, 'com_modules.module.233', 'Finishing Elements Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(181, 18, 190, 191, 2, 'com_modules.module.235', 'Latest News ', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(182, 18, 192, 193, 2, 'com_modules.module.236', 'Products Pages Banner', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(183, 18, 194, 195, 2, 'com_modules.module.237', 'News Pages Banner', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(184, 18, 196, 197, 2, 'com_modules.module.238', 'Archive', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(185, 1, 339, 340, 1, '#__ucm_content.12', '#__ucm_content.12', '[]'),
(186, 52, 85, 86, 3, 'com_content.article.50', 'Archived Article 6', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(187, 52, 87, 88, 3, 'com_content.article.51', 'Archived Article 5', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(188, 1, 341, 342, 1, '#__ucm_content.13', '#__ucm_content.13', '[]'),
(189, 18, 198, 199, 2, 'com_modules.module.239', 'What Makes Us Different?', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(193, 18, 200, 201, 2, 'com_modules.module.243', '\"big-title\" Module Suffix', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(194, 18, 202, 203, 2, 'com_modules.module.244', 'Menu homepage (third list)', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(195, 18, 204, 205, 2, 'com_modules.module.245', 'Contact Us', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(196, 18, 206, 207, 2, 'com_modules.module.246', 'About Us', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(198, 18, 208, 209, 2, 'com_modules.module.248', 'Recent Products', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(199, 18, 210, 211, 2, 'com_modules.module.249', 'Latest News ', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(201, 18, 212, 213, 2, 'com_modules.module.251', 'Available Worldwide', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(202, 18, 214, 215, 2, 'com_modules.module.252', 'Products Catalog \'14', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(203, 18, 216, 217, 2, 'com_modules.module.253', 'Latest News Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(204, 18, 218, 219, 2, 'com_modules.module.254', 'Disclaimer Menu', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(205, 1, 343, 344, 1, 'com_k2', 'com_k2', '{\"core.admin\":[],\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(206, 18, 220, 221, 2, 'com_modules.module.255', 'K2 Comments', ''),
(207, 18, 222, 223, 2, 'com_modules.module.256', 'Recent Products', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(208, 18, 224, 225, 2, 'com_modules.module.257', 'Product Categories', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(209, 18, 226, 227, 2, 'com_modules.module.258', 'K2 Users', ''),
(210, 18, 228, 229, 2, 'com_modules.module.259', 'K2 User', ''),
(211, 18, 230, 231, 2, 'com_modules.module.260', 'K2 Quick Icons (admin)', ''),
(212, 18, 232, 233, 2, 'com_modules.module.261', 'K2 Stats (admin)', ''),
(213, 18, 234, 235, 2, 'com_modules.module.262', 'Tagged Under', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(214, 18, 236, 237, 2, 'com_modules.module.263', 'Archive', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(215, 18, 238, 239, 2, 'com_modules.module.264', 'Fabrik Form Module', ''),
(216, 18, 240, 241, 2, 'com_modules.module.265', 'Fabrik List Module', ''),
(217, 1, 345, 346, 1, 'com_fabrik', 'com_fabrik', '{\"core.admin\":[],\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),
(218, 27, 25, 26, 3, 'com_content.article.52', 'Dashboard', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(219, 18, 242, 243, 2, 'com_modules.module.266', 'Other Page Slider Module (2)', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(220, 18, 244, 245, 2, 'com_modules.module.267', 'Select Language', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(221, 18, 246, 247, 2, 'com_modules.module.79', 'Multilanguage status', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(224, 18, 248, 249, 2, 'com_modules.module.270', 'DEXAMENES Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(225, 18, 250, 251, 2, 'com_modules.module.271', 'METRHSEIS-PINAKAS Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(226, 18, 252, 253, 2, 'com_modules.module.272', 'EIDOPOIHSEIS-PINAKAS Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(227, 18, 254, 255, 2, 'com_modules.module.273', 'EIDOPOIHSEIS-KANONES Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(228, 18, 256, 257, 2, 'com_modules.module.274', 'EIDOPOIHSEIS-RYTHMISEIS Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(229, 18, 258, 259, 2, 'com_modules.module.275', 'ANEFODIASMOI Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(230, 18, 260, 261, 2, 'com_modules.module.276', 'PROMITHEYTES Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(231, 18, 262, 263, 2, 'com_modules.module.277', 'METRHSEIS-ANAFORES Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(232, 18, 264, 265, 2, 'com_modules.module.278', 'METRISEIS Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(233, 18, 266, 267, 2, 'com_modules.module.279', 'ANAFORES Page Slider Module', '{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),
(235, 18, 268, 269, 2, 'com_modules.module.280', 'ΚΑΥΣΙΜΟ', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(236, 18, 270, 271, 2, 'com_modules.module.281', 'ΜΗΤΡΩΟ ΠΡΟΣΩΠΙΚΟΥ', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(237, 18, 272, 273, 2, 'com_modules.module.282', 'English Menu', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),
(238, 27, 27, 28, 3, 'com_content.article.53', 'Αναφορές Μετρήσεων', '{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_associations`
--

CREATE TABLE `cms_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_banners`
--

CREATE TABLE `cms_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_banners`
--

INSERT INTO `cms_banners` (`id`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `clickurl`, `state`, `catid`, `description`, `custombannercode`, `sticky`, `ordering`, `metakey`, `params`, `own_prefix`, `metakey_prefix`, `purchase_type`, `track_clicks`, `track_impressions`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset`, `created`, `language`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `version`) VALUES
(1, 0, 1, 'Joomla', 'joomla', 0, 5, 0, 'htttp://joomla.org', -2, 24, 'Home of Joomla', '', 1, 0, '', '{\"imageurl\":\"\",\"width\":\"\",\"height\":\"\",\"alt\":\"Home of Joomla\"}', 0, '', 1, 1, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013-04-10 11:44:49', '*', 0, '', '2013-04-10 11:47:34', 462, 6);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_banner_clients`
--

CREATE TABLE `cms_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_banner_tracks`
--

CREATE TABLE `cms_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_banner_tracks`
--

INSERT INTO `cms_banner_tracks` (`track_date`, `track_type`, `banner_id`, `count`) VALUES
('2013-04-10 11:00:00', 1, 1, 7);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_categories`
--

CREATE TABLE `cms_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_categories`
--

INSERT INTO `cms_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 37, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 488, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 488, '2017-11-07 00:03:59', 2, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 363, '2012-07-20 19:31:28', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"target\":\"\",\"image\":\"\"}', '', '', '{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 42, 1, 13, 14, 1, 'blog-roll', 'com_weblinks', 'Blog Roll', 'blog-roll', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 363, '2012-07-20 19:44:04', 0, '*', 1),
(9, 35, 1, 15, 22, 1, 'blog', 'com_content', 'Blog', 'blog', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 2767, '*', 1),
(10, 44, 1, 23, 24, 1, 'template-articles', 'com_content', 'Template Articles', 'template-articles', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-03-30 08:19:43', 0, '0000-00-00 00:00:00', 10, '*', 1),
(11, 51, 1, 25, 26, 1, 'contact-persons', 'com_contact', 'Contact Persons', 'contact-persons', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-05 11:40:47', 990, '2013-12-12 13:00:40', 0, '*', 1),
(12, 52, 1, 27, 28, 1, 'joomla-articles', 'com_content', 'Joomla Articles', 'joomla-articles', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-05 13:50:57', 0, '0000-00-00 00:00:00', 14, '*', 1),
(13, 58, 1, 29, 30, 1, 'second-contacts-category', 'com_contact', 'Second Contacts Category', 'second-contacts-category', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-05 14:28:22', 0, '0000-00-00 00:00:00', 0, '*', 1),
(14, 59, 1, 31, 32, 1, 'sample-data-weblinks', 'com_weblinks', 'Sample-Data Weblinks ', 'sample-data-weblinks', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-05 14:35:24', 0, '0000-00-00 00:00:00', 0, '*', 1),
(15, 60, 1, 33, 34, 1, 'sample-data-news-feeds', 'com_newsfeeds', 'Sample Data News Feeds', 'sample-data-news-feeds', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-05 14:40:14', 0, '0000-00-00 00:00:00', 0, '*', 1),
(21, 75, 9, 18, 19, 2, 'blog/second-category', 'com_content', 'Second Category', 'second-category', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-08 12:30:22', 990, '2014-01-31 08:54:14', 183, '*', 1),
(22, 76, 9, 20, 21, 2, 'blog/third-category', 'com_content', 'Third Category', 'third-category', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-08 12:30:32', 990, '2014-01-31 08:54:27', 219, '*', 1),
(23, 77, 9, 16, 17, 2, 'blog/first-category', 'com_content', 'First Category', 'first-category', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-08 12:30:42', 990, '2014-01-31 08:54:01', 129, '*', 1),
(24, 90, 1, 35, 36, 1, 'banners', 'com_banners', 'Banners', 'banners', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-10 11:43:32', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_contact_details`
--

CREATE TABLE `cms_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_contact_details`
--

INSERT INTO `cms_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `hits`) VALUES
(4, 'Contact Name', 'contact-name', '', '', '', '', '', '', '', '', '', '', 'email@domain.com', 0, 1, 0, '0000-00-00 00:00:00', 3, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":null,\"linkb_name\":\"\",\"linkb\":null,\"linkc_name\":\"\",\"linkc\":null,\"linkd_name\":\"\",\"linkd\":null,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 13, 1, '', '', '', '', '', '*', '2013-04-05 14:29:58', 488, '', '0000-00-00 00:00:00', 0, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 29),
(5, 'Other Contact Name', 'other-contact-name', '', '', '', '', '', '', '', '', '', '', 'email@domain.com', 0, 1, 0, '0000-00-00 00:00:00', 4, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":null,\"linkb_name\":\"\",\"linkb\":null,\"linkc_name\":\"\",\"linkc\":null,\"linkd_name\":\"\",\"linkd\":null,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 13, 1, '', '', '', '', '', '*', '2013-04-05 14:30:11', 488, '', '0000-00-00 00:00:00', 0, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2),
(6, 'Business Enquiries', 'business-enquiries', 'Jason Colella (Managing Director) ', 'Great Company', ' Little Lonsdale ', 'St, Melbourne', 'Australia', ' PO Box 21177', ' (+80) 123 456 789 1', ' (+80) 123 456 789 2', '', 'images/demo_content/contact_images/jason_colella.png', 'j.colella@somecompany.com', 0, 1, 0, '0000-00-00 00:00:00', 5, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_tags\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":false,\"linkb_name\":\"\",\"linkb\":false,\"linkc_name\":\"\",\"linkc\":false,\"linkd_name\":\"\",\"linkd\":false,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 11, 1, '', 'http://www.somecompany.com/', '', '', '', '*', '2013-12-12 13:03:05', 488, '', '2014-01-31 11:03:58', 990, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 6137),
(7, 'General Inquiries', 'general-inquiries', 'Jennifer Grayson (Customer Service)  ', 'Great Company', ' Little Lonsdale ', 'St, Melbourne', 'Australia', ' PO Box 21177', '(+80) 123 456 789 1', '(+80) 123 456 789 2', '', 'images/demo_content/contact_images/jennifer_grayson.png', 'j.grayson@somecompany.com', 0, 1, 0, '0000-00-00 00:00:00', 6, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_tags\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":false,\"linkb_name\":\"\",\"linkb\":false,\"linkc_name\":\"\",\"linkc\":false,\"linkd_name\":\"\",\"linkd\":false,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 11, 1, '', 'http://www.somecompany.com/', '', '', '', '*', '2013-12-12 15:19:48', 488, '', '2014-01-31 11:04:37', 990, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 147),
(8, 'Press Contact', 'press-contact', 'Robert Miller (Spokesperson) ', 'Great Company', ' Little Lonsdale ', 'St, Melbourne', 'Australia', ' PO Box 21177', '(+80) 123 456 789 1', '(+80) 123 456 789 2', '', 'images/demo_content/contact_images/robert_miller.png', 'r.miller@somecompany.com', 0, 1, 0, '0000-00-00 00:00:00', 7, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_tags\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":false,\"linkb_name\":\"\",\"linkb\":false,\"linkc_name\":\"\",\"linkc\":false,\"linkd_name\":\"\",\"linkd\":false,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 11, 1, '', 'http://www.somecompany.com/', '', '', '', '*', '2013-12-12 15:21:44', 488, '', '2014-01-31 11:04:53', 990, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5, 176),
(9, 'Sales Department', 'sales-department', 'Naomi Johnston (Sales Department) ', '    Great Company', ' Little Lonsdale ', 'St, Melbourne', 'Australia', ' PO Box 21177', '(+80) 123 456 789 1', '(+80) 123 456 789 2', '', 'images/demo_content/contact_images/naomi_johnston.png', 'n.johnston@somecompany.com', 0, 1, 0, '0000-00-00 00:00:00', 8, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_tags\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":false,\"linkb_name\":\"\",\"linkb\":false,\"linkc_name\":\"\",\"linkc\":false,\"linkd_name\":\"\",\"linkd\":false,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 11, 1, '', 'http://www.somecompany.com/', '', '', '', '*', '2013-12-12 15:29:13', 488, '', '2014-01-31 11:05:09', 990, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 126),
(10, 'Customer Support', 'customer-support', 'Keith Moran (Support Manager) ', '    Great Company', ' Little Lonsdale ', 'St, Melbourne', 'Australia', ' PO Box 21177', '(+80) 123 456 789 1', ' (+80) 123 456 789 2', '', 'images/demo_content/contact_images/keith_moran.png', 'k.moran@somecompany.com', 0, 1, 0, '0000-00-00 00:00:00', 9, '{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_tags\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":false,\"linkb_name\":\"\",\"linkb\":false,\"linkc_name\":\"\",\"linkc\":false,\"linkd_name\":\"\",\"linkd\":false,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}', 0, 11, 1, '', 'http://www.somecompany.com/', '', '', '', '*', '2013-12-12 15:31:30', 488, '', '2014-01-31 11:04:20', 990, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 83);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_content`
--

CREATE TABLE `cms_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_content`
--

INSERT INTO `cms_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 36, 'Module Positions', 'module-positions', '<p>This simple diagram was designed to show all module positions, which are available in template.</p>\r\n<div class=\"positions-preview\">\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span2\">Toolbar-a</div>\r\n<div class=\"span2 offset6\">Toolbar-b</div>\r\n<div class=\"span2 disabled\">User Toolbar</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span3 logotype disabled\">Logo</div>\r\n<div class=\"span9 menu-preview\">Menu</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Slider</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Banner</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Breadcrumbs</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Top-A <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Top-B <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span3 sidebar\">\r\n<p>Sidebar-Left</p>\r\n</div>\r\n<div class=\"span6\">\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Maintop-A  <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Maintop-B  <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12 disabled component\">\r\n<p>Content Component</p>\r\n</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Mainbottom-A  <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Mainbottom-B  <sup>(flexible)</sup></div>\r\n</div>\r\n</div>\r\n<div class=\"span3 sidebar\">\r\n<p>Sidebar-Right</p>\r\n</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Bottom-A  <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Bottom-Bar</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span10\">Social Bar</div>\r\n<div class=\"span2 disabled\">Social Icons</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Bottom-B  <sup>(flexible)</sup></div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Footer</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12 disabled\">Copyrights</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span10\">ToTop Bar</div>\r\n<div class=\"span2 disabled\">To Top BTN</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Disclaimer</div>\r\n</div>\r\n<div class=\"row-fluid mod-pos\">\r\n<div class=\"span12\">Debug</div>\r\n</div>\r\n</div>\r\n<p> </p>\r\n<p>Template is based on Bootstrap grid layout (12 columns - Fluid Width Layout).<br />Template contain mix of two types of module positions, standard module positions and flexible module positions which are additionally controlled by template.<br />Standard module positions available in template:<strong> toolbar-a, toolbar-b, menu, slider, banner, breadcrumbs, bottom-bar, footer, disclaimer, debug, login, social-bar, to-top-bar</strong>.<br /><br />Flexible module positions available in template: <strong>top-a, top-b, maintop-a, maintop-b, mainbottom-a, mainbottom-b, bottom-a, bottom-b,</strong> <strong> sidebar-left, sidebar-right</strong>.</p>\r\n<p>By default, all modules published in these positions are displayed in columns and grouped in rows, up to 4 modules per row. All modules in row will have an equal widths. Additionally, you can switched desired flexible module position to \"custom widths\", to use custom alternative layout for modules. You can set manually width of every single module. With custom widths option selected you can publish up to 12 modules in a single position, all modules are displayed in a single row.<br /><br />This option utilizes native function introduced in Joomla 3, named \"Bootstrap Size\" and it can be found in advanced settings of every module.</p>', '', 1, 10, '2011-01-01 00:00:01', 488, 'Joomla', '2014-02-06 13:01:46', 990, 0, '0000-00-00 00:00:00', '2012-01-04 16:10:42', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 63, 2, '', '', 1, 4077, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(4, 39, 'Home page article', 'about-your-home-page', '<h4>Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora.</h4>\r\n<p>Torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam.</p>\r\n<p>Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices.</p>\r\n<p><a href=\"#\">Continue reading ...</a></p>\r\n<p> </p>', '', -2, 10, '2011-01-03 00:00:01', 488, 'Joomla', '2013-04-22 17:32:22', 462, 0, '0000-00-00 00:00:00', '2012-01-03 00:00:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"none\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/sampledata\\/homepage-article.jpg\",\"float_fulltext\":\"none\",\"image_fulltext_alt\":\"Home Image\",\"image_fulltext_caption\":\"\"}', '{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"0\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 22, 1, '', '', 1, 8377, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(7, 45, 'Offline page', 'offline-page', '<blockquote>\r\n<p>At screenshot below you can preview how \"offline\" page looks, when Joomla is switched to the offline mode in global configuration.</p>\r\n</blockquote>\r\n', '\r\n<p>Donec auctor leo quis urna porta pharetra. Vivamus quis venenatis nibh. Maecenas erat eros, accumsan vel porttitor ut, tincidunt ut ligula. </p>\r\n<p><img class=\"caption\" title=\"Joomla! Offline Page\" src=\"images/demo_content/offline.jpg\" alt=\"Offline Page\" align=\"middle\" /></p>\r\n<p>Aliquam vitae sem ligula. Nam viverra purus eget tincidunt mollis. Cras non fermentum dui. Curabitur tempor, tellus sit amet congue blandit, nisi magna posuere elit, ac vestibulum urna tortor ac massa. Integer non elit rhoncus, lacinia leo sed, tincidunt mi. Nullam ut libero at magna egestas blandit. Nullam blandit euismod sem, sed consequat orci consectetur nec. Proin eleifend vestibulum nisl eget vehicula. Sed ultrices mollis auctor.</p>\r\n<p>Fusce nec facilisis tortor. Curabitur nibh metus, ornare nec nulla vel, rutrum posuere diam. Fusce vulputate, neque a vestibulum ornare, quam felis condimentum odio, ac dapibus velit dolor sed enim.</p>\r\n<p>Morbi quis fermentum justo. Donec nec lobortis risus. Aliquam tortor arcu, pretium quis porta a, convallis quis felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse dapibus mauris non dignissim posuere. Pellentesque dapibus dui lorem, sed eleifend libero consequat ac.</p>', 1, 10, '2013-03-30 08:20:04', 488, '', '2014-01-31 11:58:58', 990, 0, '0000-00-00 00:00:00', '2013-03-30 08:20:04', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"right\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 37, 7, '', '', 1, 581, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(8, 46, 'Module Variations', 'module-variations', '<p><strong>On this page you can preview all additional styles for modules, which can help you change standard apperance of modules.</strong></p>\r\n', '\r\n<p>In module settings, in field \"module suffix\"  please give desired module suffix name (without apostrophes), for example <strong>border-black-top</strong> , which adds black border above title. You can apply this suffixes to any module in Joomla!.</p>', 1, 10, '2013-03-31 06:54:47', 488, '', '2014-02-01 10:03:15', 990, 0, '0000-00-00 00:00:00', '2013-03-31 06:54:47', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 8, 5, '', '', 1, 6593, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(11, 49, 'Typography', 'typography', '<p> </p>\r\n<div class=\"page-header\">\r\n<h4>Paragraph</h4>\r\n</div>\r\n<p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla.</p>\r\n', '\r\n<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>\r\n<p> </p>\r\n<div class=\"page-header\">\r\n<h2>Headings <small>Style for headings</small></h2>\r\n</div>\r\n<h1>This is heading H1 Lorem ipsum ...</h1>\r\n<h2>This is heading H2 Lorem ipsum ...</h2>\r\n<h3>This is heading H3 Lorem ipsum ...</h3>\r\n<h4>This is heading H4 Lorem ipsum ..</h4>\r\n<h5>This is heading H5 Lorem ipsum ...</h5>\r\n<h6>This is heading h6 Lorem ipsum ...</h6>\r\n<p> </p>\r\n<div class=\"page-header\">\r\n<h2>Emphasis and Highlights <small>Styles for emphasis and highlights</small></h2>\r\n</div>\r\n<p> </p>\r\n<h4>Highlights</h4>\r\n<hr />\r\n<p>Fusce dapibus, <span class=\"highlight-muted\">highlighted text</span> tellus ac cursus commodo, tortor mauris nibh.</p>\r\n<p>Etiam porta <span class=\"highlight-warning\">highlighted text</span> sem malesuada magna mollis euismod.</p>\r\n<p>Aenean eu leo<span class=\"highlight-info\">Highlighted text</span> quam. Pellentesque ornare sem lacinia quam venenatis.</p>\r\n<p>Duis mollis, <span class=\"highlight-success\">Highlighted text</span> est non commodo luctus, nisi erat porttitor ligula.</p>\r\n<pre>&lt;p&gt;Fusce dapibus, <code>&lt;span class=\"highlight-muted\"&gt;highlighted text&lt;/span&gt;</code> tellus ac cursus commodo, tortor mauris nibh.&lt;/p&gt;\r\n&lt;p&gt;Etiam porta &lt;span class=\"highlight-warning\"&gt;highlighted text&lt;/span&gt; sem malesuada magna mollis euismod.&lt;/p&gt;\r\n&lt;p&gt;Aenean eu leo &lt;span class=\"highlight-info\"&gt;Highlighted text&lt;/span&gt; quam. Pellentesque ornare sem lacinia quam venenatis.&lt;/p&gt;\r\n&lt;p&gt;Duis mollis, &lt;span class=\"highlight-success\"&gt;Highlighted text&lt;/span&gt; est non commodo luctus, nisi erat porttitor ligula.&lt;/p&gt;\r\n</pre>\r\n<p> </p>\r\n<h4>Emphasis</h4>\r\n<hr />\r\n<p class=\"muted\">Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.</p>\r\n<p class=\"text-warning\">Etiam porta sem malesuada magna mollis euismod.</p>\r\n<p class=\"text-error\">Donec ullamcorper nulla non metus auctor fringilla.</p>\r\n<p class=\"text-info\">Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis.</p>\r\n<p class=\"text-success\">Duis mollis, est non commodo luctus, nisi erat porttitor ligula.</p>\r\n<pre>&lt;p class=\"muted\"&gt;Fusce dapibus, tellus ac cursus commodo, tortor mauris nibh.&lt;/p&gt;\r\n&lt;p class=\"text-warning\"&gt;Etiam porta sem malesuada magna mollis euismod.&lt;/p&gt;\r\n&lt;p class=\"text-error\"&gt;Donec ullamcorper nulla non metus auctor fringilla.&lt;/p&gt;\r\n&lt;p class=\"text-info\"&gt;Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis.&lt;/p&gt;\r\n&lt;p class=\"text-success\"&gt;Duis mollis, est non commodo luctus, nisi erat porttitor ligula.&lt;/p&gt;\r\n</pre>\r\n<p> </p>\r\n<div class=\"page-header\">\r\n<h2>Alerts <small>Styles for success, warning, and error messages</small></h2>\r\n</div>\r\n<h4>Default alert</h4>\r\n<p>Wrap any text and an optional dismiss button in <code>.alert</code> for a basic warning alert message.</p>\r\n<div class=\"alert\"><button class=\"close\" type=\"button\" data-dismiss=\"alert\">×</button> <strong>Warning!</strong> Best check yo self, you\'re not looking too good.</div>\r\n<pre>&lt;div class=\"alert\"&gt;\r\n  &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\"&gt;&amp;times;&lt;/button&gt;\r\n  &lt;strong&gt;Warning!&lt;/strong&gt; Best check yo self, you\'re not looking too good.\r\n&lt;/div&gt;\r\n</pre>\r\n<p> </p>\r\n<h4>Contextual alternatives</h4>\r\n<hr />\r\n<p>Add optional classes to change an alert\'s connotation.</p>\r\n<h4>Error or danger</h4>\r\n<div class=\"alert alert-error\"><button class=\"close\" type=\"button\" data-dismiss=\"alert\">×</button> <strong>Oh snap!</strong> Change a few things up and try submitting again.</div>\r\n<hr />\r\n<h4>Success</h4>\r\n<div class=\"alert alert-success\"><button class=\"close\" type=\"button\" data-dismiss=\"alert\">×</button> <strong>Well done!</strong> You successfully read this important alert message.</div>\r\n<hr />\r\n<h4>Information</h4>\r\n<div class=\"alert alert-info\"><button class=\"close\" type=\"button\" data-dismiss=\"alert\">×</button> <strong>Heads up!</strong> This alert needs your attention, but it\'s not super important.</div>\r\n<pre>&lt;div class=\"alert alert-error\"&gt;\r\n  ...\r\n&lt;/div&gt;\r\n\r\n&lt;div class=\"alert alert-success\"&gt;\r\n  ...\r\n&lt;/div&gt;\r\n\r\n&lt;div class=\"alert alert-info\"&gt;\r\n  ...\r\n&lt;/div&gt;\r\n</pre>\r\n<p> </p>\r\n<div class=\"page-header\">\r\n<h2>Blockquote</h2>\r\n</div>\r\n<p>For quoting blocks of content from another source within your document.</p>\r\n<h4>Default blockquote</h4>\r\n<p>Wrap <code>&lt;blockquote&gt;</code> around any <abbr title=\"HyperText Markup Language\">HTML</abbr> as the quote. For straight quotes we recommend a <code>&lt;p&gt;</code>.</p>\r\n<p> </p>\r\n<blockquote>\r\n<p>Waesent erat risus, ornare id feugiat vitae, elementum in nibh. Fusce est turpis, tincidunt sit amet pulvinar ut, venenatis nec justo. Quisque sodales interdum pellentesque. Ut molestie euismod erat et euismod. Pellentesque consequat nulla eu sapien suscipit ullamcorper, convallis sit amet quam ... \"</p>\r\n</blockquote>\r\n<pre class=\"prettyprint linenums\">&lt;blockquote&gt;\r\n  &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n&lt;/blockquote&gt;\r\n</pre>\r\n<div class=\"page-header\"><br />\r\n<h2>Buttons</h2>\r\n</div>\r\n<h4>Default buttons</h4>\r\n<p>Button styles can be applied to anything with the <code>.btn</code> class applied. However, typically you\'ll want to apply these to only <code>&lt;a&gt;</code> and <code>&lt;button&gt;</code> elements for the best rendering.</p>\r\n<table class=\"table table-bordered table-striped\">\r\n<thead>\r\n<tr><th>Button</th><th>class=\"\"</th><th>Description</th></tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td><button class=\"btn\" type=\"button\">Default</button></td>\r\n<td><code>btn</code></td>\r\n<td>Standard gray button with gradient</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-primary\" type=\"button\">Primary</button></td>\r\n<td><code>btn btn-primary</code></td>\r\n<td>Provides extra visual weight and identifies the primary action in a set of buttons</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-info\" type=\"button\">Info</button></td>\r\n<td><code>btn btn-info</code></td>\r\n<td>Used as an alternative to the default styles</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-success\" type=\"button\">Success</button></td>\r\n<td><code>btn btn-success</code></td>\r\n<td>Indicates a successful or positive action</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-warning\" type=\"button\">Warning</button></td>\r\n<td><code>btn btn-warning</code></td>\r\n<td>Indicates caution should be taken with this action</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-danger\" type=\"button\">Danger</button></td>\r\n<td><code>btn btn-danger</code></td>\r\n<td>Indicates a dangerous or potentially negative action</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-inverse\" type=\"button\">Inverse</button></td>\r\n<td><code>btn btn-inverse</code></td>\r\n<td>Alternate dark gray button, not tied to a semantic action or use</td>\r\n</tr>\r\n<tr>\r\n<td><button class=\"btn btn-link\" type=\"button\">Link</button></td>\r\n<td><code>btn btn-link</code></td>\r\n<td>Deemphasize a button by making it look like a link while maintaining button behavior</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Cross browser compatibility</h4>\r\n<p>IE9 doesn\'t crop background gradients on rounded corners, so we remove it. Related, IE9 jankifies disabled <code>button</code> elements, rendering text gray with a nasty text-shadow that we cannot fix.</p>\r\n<h4>Button sizes</h4>\r\n<hr />\r\n<p>Fancy larger or smaller buttons? Add <code>.btn-large</code>, <code>.btn-small</code>, or <code>.btn-mini</code> for additional sizes.</p>\r\n<p><button class=\"btn btn-large btn-primary\" type=\"button\">Large button</button> <button class=\"btn btn-large\" type=\"button\">Large button</button></p>\r\n<p><button class=\"btn btn-primary\" type=\"button\">Default button</button> <button class=\"btn\" type=\"button\">Default button</button></p>\r\n<p><button class=\"btn btn-small btn-primary\" type=\"button\">Small button</button> <button class=\"btn btn-small\" type=\"button\">Small button</button></p>\r\n<p><button class=\"btn btn-mini btn-primary\" type=\"button\">Mini button</button> <button class=\"btn btn-mini\" type=\"button\">Mini button</button></p>\r\n<pre>&lt;p&gt;\r\n  &lt;button class=\"btn btn-large btn-primary\" type=\"button\"&gt;Large button&lt;/button&gt;\r\n  &lt;button class=\"btn btn-large\" type=\"button\"&gt;Large button&lt;/button&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n  &lt;button class=\"btn btn-primary\" type=\"button\"&gt;Default button&lt;/button&gt;\r\n  &lt;button class=\"btn\" type=\"button\"&gt;Default button&lt;/button&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n  &lt;button class=\"btn btn-small btn-primary\" type=\"button\"&gt;Small button&lt;/button&gt;\r\n  &lt;button class=\"btn btn-small\" type=\"button\"&gt;Small button&lt;/button&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n  &lt;button class=\"btn btn-mini btn-primary\" type=\"button\"&gt;Mini button&lt;/button&gt;\r\n  &lt;button class=\"btn btn-mini\" type=\"button\"&gt;Mini button&lt;/button&gt;\r\n&lt;/p&gt;\r\n</pre>\r\n<p>Create block level buttons—those that span the full width of a parent— by adding <code>.btn-block</code>.</p>\r\n<div class=\"well\" style=\"max-width: 400px; margin: 0 auto 10px;\"><button class=\"btn btn-large btn-block btn-primary\" type=\"button\">Block level button</button> <button class=\"btn btn-large btn-block\" type=\"button\">Block level button</button></div>\r\n<pre>&lt;button class=\"btn btn-large btn-block btn-primary\" type=\"button\"&gt;Block level button&lt;/button&gt;\r\n&lt;button class=\"btn btn-large btn-block\" type=\"button\"&gt;Block level button&lt;/button&gt;</pre>\r\n<p> </p>\r\n<div class=\"page-header\">\r\n<h2>Dropcap</h2>\r\n</div>\r\n<p>To add a big letter at the beginning of a word, a please add  <code>&lt;span=\"dropcap\"&gt;Letter&lt;/span&gt;</code>  to the first word of paragraph.</p>\r\n<p> </p>\r\n<p><span class=\"dropcap\">W</span>aesent erat risus, ornare id feugiat vitae, elementum in nibh. Fusce est turpis, tincidunt sit amet pulvinar ut, venenatis nec justo.</p>\r\n<p>Quisque sodales interdum pellentesque. Ut molestie euismod erat et euismod. Aenean accumsan porta nisl ac scelerisque. Quisque posuere fermentum mattis. Pellentesque consequat nulla eu sapien suscipit ullamcorper. Aenean mauris erat, mollis sed tempor quis, convallis sit amet quamrat risus, ornare id feugiat vitae, elementum in nibh. Fusce est turpis, tincidunt sit amet pulvinar ut, venenatis nec justo.</p>\r\n<p> </p>', 1, 10, '2013-04-03 07:58:21', 488, '', '2014-01-21 09:08:35', 990, 0, '0000-00-00 00:00:00', '2013-04-03 07:58:21', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 103, 3, '', '', 1, 2748, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(12, 50, 'Article Page Break', 'page-breaks', '<p>Joomla page break offers you an option, to split a long Article into multiple linked pages. In pagebreak plugin settings you can change default style for page breaks. There are two additional styles which can be selected as default style, you can choose accordion style, or tabs style.</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed augue ante, eget commodo neque. Vestibulum elementum turpis at lectus dapibus tincidunt. Vestibulum laoreet faucibus lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam interdum pellentesque quam ut cursus. Proin lobortis diam non nulla facilisis a ornare magna congue. In at turpis ac tortor dignissim congue.</p>\r\n<hr alt=\"First Page Break\" class=\"system-pagebreak\" />\r\n<p>Pellentesque at felis enim. Nullam posuere placerat ante ut aliquam. Pellentesque vitae venenatis est. Duis ligula nibh, sagittis a euismod ut, tempus sagittis nunc. Vestibulum lobortis nisi sit amet odio vestibulum quis pellentesque nibh rhoncus. Vivamus malesuada scelerisque sodales. Mauris convallis luctus ligula, eget scelerisque diam molestie condimentum. Mauris eget tellus lorem.</p>\r\n<div class=\"bs-docs-example\">\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet</li>\r\n<li>Consectetur adipiscing</li>\r\n<li>Nulla volutpat aliquam velit\r\n<ul>\r\n<li>Phasellus iaculis neque</li>\r\n<li>Vestibulum laoreet porttitor sem</li>\r\n<li>Ac tristique libero volutpat at</li>\r\n</ul>\r\n</li>\r\n<li>Faucibus porta lacus fringilla vel</li>\r\n<li>Eget porttitor lorem</li>\r\n</ul>\r\n</div>\r\n<p>Integer sit amet dictum erat. Praesent imperdiet turpis quis tortor molestie eu dictum felis mattis. Fusce eget leo vitae felis luctus auctor id sit amet erat. Nunc est elit, ornare molestie rutrum vel, commodo sit amet tortor. Aenean quam odio, ultrices sed pulvinar et, dignissim in risus. Vivamus lacus lorem, varius eu dignissim ut, scelerisque nec ante. In lobortis tellus quis orci pretium aliquet. Fusce quis velit lacus, ac accumsan leo. Sed eu orci non diam mollis tristique.</p>\r\n<hr alt=\"Second Page Break\" class=\"system-pagebreak\" />\r\n<p>Integer auctor et sapien sit amet suscipit. Vestibulum tempor consectetur urna, at tempor metus congue sit amet. Curabitur bibendum elementum velit eget pellentesque. In pharetra purus libero, eget sodales dolor laoreet in. Aliquam at hendrerit eros. Pellentesque gravida accumsan hendrerit. Morbi non orci eu urna luctus laoreet.</p>\r\n<p>Donec sit amet arcu fringilla, laoreet diam at, aliquam felis. Suspendisse porttitor tristique condimentum. Curabitur a risus tellus. Nullam pellentesque tempus sapien, ut malesuada tortor facilisis eu. Sed porttitor velit eros, sed euismod nibh cursus at. Nullam ullamcorper lorem vel dictum varius. Phasellus non elit sed purus semper viverra. Pellentesque id ultricies mauris. Pellentesque ornare rutrum metus, vel tincidunt nisi porttitor sed. Integer tincidunt, felis ac iaculis euismod, nibh risus laoreet sapien, condimentum auctor nunc dui ut elit. Aenean mollis quam ut urna dignissim, sit amet dignissim nibh laoreet. Nam nisi nisl, pellentesque et urna ut, accumsan ultricies enim. Sed vitae urna ante. Pellentesque ut lacus quis mauris tincidunt sagittis vel eget neque. Sed tristique convallis eros, at feugiat turpis lobortis ut.</p>\r\n<hr alt=\"Third Page Break\" class=\"system-pagebreak\" />\r\n<p>Cras ipsum neque, consequat sed congue ac, ullamcorper eget libero. Curabitur semper risus tincidunt leo malesuada rhoncus. Maecenas interdum, arcu et vehicula adipiscing, dui nulla ullamcorper purus, at pretium odio purus et tortor. Suspendisse consectetur tellus non ligula laoreet vel egestas orci tempus. Cras metus justo, ornare accumsan placerat sed, vehicula in turpis. In consequat nisl et justo faucibus ut porttitor urna adipiscing. Proin elementum lacinia aliquet. Aliquam erat volutpat. Mauris laoreet adipiscing nisi et aliquam. Vestibulum ut ligula turpis. Curabitur ac lectus in odio scelerisque placerat.</p>\r\n<p>Duis commodo mollis enim eget tincidunt. Aliquam erat volutpat. Vestibulum molestie libero a est tristique sollicitudin. Cras pretium, metus auctor dictum aliquet, ante nisi convallis risus, non vehicula dolor libero vel est. Suspendisse sollicitudin, dui vitae vehicula malesuada, elit nunc venenatis sapien, ut dignissim mauris diam et nulla. Fusce pulvinar massa id ipsum accumsan tempus. Praesent turpis lacus, placerat sed pretium ac, varius non justo.</p>\r\n<hr alt=\"Fourth Page Break\" class=\"system-pagebreak\" />\r\n<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel lorem libero, ac blandit leo. Ut mi mi, gravida id viverra vel, elementum quis mi. Quisque eget imperdiet diam. Integer vitae scelerisque lacus. In ac magna vitae enim imperdiet condimentum sed eu arcu. Aliquam vehicula mollis ante, nec suscipit quam cursus et. Quisque fermentum libero sed quam venenatis sit amet tristique odio porttitor. Nullam id diam augue, non sodales mi. Nullam eu nulla velit, vitae ornare nisl.</p>\r\n<p>Morbi porta hendrerit erat ut tempor. Etiam tincidunt fringilla ante ac aliquet. In eget lacus eget dolor commodo venenatis eu vitae lacus. Donec placerat tincidunt neque sit amet ornare. Aenean sit amet dignissim augue. Sed vulputate justo non nulla tincidunt non pellentesque nunc condimentum. Cras mattis massa sit amet dolor imperdiet tristique. Morbi bibendum turpis in ante dictum rhoncus.</p>\r\n<p> </p>', 1, 10, '2013-04-05 06:30:36', 488, '', '2014-01-19 17:48:13', 990, 0, '0000-00-00 00:00:00', '2013-04-05 06:30:36', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 31, 2, '', '', 1, 2235, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(13, 53, 'Archived Article', 'archived-article', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '2012-12-05 15:52:22', 488, '', '2013-04-05 13:55:15', 462, 0, '0000-00-00 00:00:00', '2012-12-05 15:52:22', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 6, '', '', 1, 9, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(14, 54, 'Archived Article 1', 'archived-article-1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '2012-11-13 15:52:00', 488, '', '2013-04-05 13:55:15', 462, 0, '0000-00-00 00:00:00', '2012-11-13 15:52:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 5, '', '', 1, 3, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(15, 55, 'Archived Article 2', 'archived-article-2', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '2012-10-22 15:52:00', 488, '', '2013-04-05 13:55:15', 462, 0, '0000-00-00 00:00:00', '2012-10-22 15:52:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 4, '', '', 1, 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '');
INSERT INTO `cms_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(16, 56, 'Archived Article 3', 'archived-article-3', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '2012-09-19 15:52:00', 488, '', '2013-04-05 13:55:15', 462, 0, '0000-00-00 00:00:00', '2012-09-19 15:52:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 3, '', '', 1, 6, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(17, 57, 'Archived Article 4', 'archived-article-4', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '2011-11-19 15:52:00', 488, '', '2013-04-05 13:58:10', 462, 0, '0000-00-00 00:00:00', '2011-11-19 15:52:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":null,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":null,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":null,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 3, 2, '', '', 1, 3, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(27, 78, 'Nulla pulvinar at interdum', 'nulla-pulvinar-at-interdum', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus est, varius vitae blandit sit amet, eleifend convallis ligula. Sed in sodales leo. Vestibulum vulputate faucibus eros eu porta. Fusce est lorem, commodo quis blandit eget, aliquet eu neque. Vestibulum id viverra arcu. Proin id elit dolor. Nulla facilisi. Nunc dapibus aliquam neque, at aliquam purus vulputate eu. Curabitur rhoncus consectetur eros in ornare.</p>\r\n<p>In vitae diam enim. Donec tortor orci, imperdiet at facilisis sit amet, luctus in orci.</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan bibendum vestibulum. Nullam hendrerit egestas magna, ut dignissim leo dictum non. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam.</p>\r\n<h5>Sed at orci sed augue posuere ornare</h5>\r\n<p>Curabitur at orci mauris, eget dapibus ligula. Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan.</p>\r\n<p>Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<p>Nunc accumsan bibendum vestibulum. Nullam hendrerit egestas magna, ut dignissim leo dictum non. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus est, varius vitae blandit sit amet, eleifend convallis ligula. Sed in sodales leo. Vestibulum vulputate faucibus eros eu porta. Fusce est lorem, commodo quis blandit eget, aliquet eu neque. Vestibulum id viverra arcu. Proin id elit dolor. Nulla facilisi. Nunc dapibus aliquam neque, at aliquam purus vulputate eu. Curabitur rhoncus consectetur eros in ornare.</p>', 1, 21, '2013-04-08 12:36:10', 488, '', '2014-02-01 08:28:57', 990, 0, '0000-00-00 00:00:00', '2013-04-08 12:36:10', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/7.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Image Alt Text\",\"image_intro_caption\":\"Caption text\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/7.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Image Caption, Lorem ispum\",\"image_fulltext_caption\":\"image caption lorem ispum dolor\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 66, 4, '', '', 1, 1034, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', ''),
(29, 80, 'Class aptent taciti ', 'class-aptent-taciti', '<p>Nullam hendrerit egestas magna, ut dignissim leo dictum non. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper.</p>\r\n<p>Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio.</p>\r\n', '\r\n<p>Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<p>Commodo mollis ac vel ipsum. Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus.</p>\r\n<h4>Mauris sed purus eu magna</h4>\r\n<p>Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<h5>Cras vel congue ligula</h5>\r\n<p>Donec ut magna diam. Etiam ac ipsum non purus hendrerit ultricies eget a neque. Ut non ultrices tellus. Vivamus semper ligula eget est tempor feugiat. Sed lobortis tempor mi ut molestie. Maecenas facilisis convallis convallis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque velit nunc, sodales id faucibus sodales, consectetur in nulla.</p>\r\n<p>Sed ac metus eu odio cursus porttitor a eget justo. Sed gravida, leo in semper tristique, quam est faucibus metus, vel sodales sapien odio sit amet lorem. Vestibulum suscipit erat ac est venenatis laoreet. Donec lacinia pharetra est, sit amet blandit metus cursus nec. Cras elementum nunc quis dolor dignissim egestas. Suspendisse laoreet magna a nisi condimentum tempor convallis ante molestie.</p>\r\n<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce pharetra lorem eget diam tempor ut porta turpis lacinia. Suspendisse dignissim metus at dolor facilisis pulvinar. Mauris hendrerit leo ut libero varius ac malesuada odio tincidunt. Nulla et tellus nisi.</p>', 1, 21, '2013-03-15 12:36:00', 488, '', '2014-02-01 08:29:27', 990, 0, '0000-00-00 00:00:00', '2013-03-15 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/4.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"Class aptent taciti \",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/4.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Class aptent taciti \",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 20, 2, '', '', 1, 253, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', ''),
(30, 81, 'Maecenas facilisis', 'maecenas-facilisis', '<p>Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Mauris sed purus eu magna commodo mollis ac vel ipsum. Mauris ac lectus ipsum, ut tincidunt lectus.</p>\r\n<p>Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet.</p>\r\n', '\r\n<p>Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus. Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<p>Mauris ultricies, eros eu tempus rhoncus, elit felis facilisis leo, a fringilla dui elit vitae magna. Sed iaculis velit ac sem consectetur tristique. Suspendisse neque quam, dictum at egestas vel, tempus ut neque. Cras feugiat vulputate gravida. Proin ultricies mollis ipsum, sit amet facilisis elit iaculis in. Suspendisse tempor ullamcorper lacinia. Quisque suscipit molestie lacinia. Nulla eget quam nec erat molestie bibendum at et quam.</p>\r\n<h5>Maecenas facilisis elementum aliquet</h5>\r\n<p>Vivamus ac odio sed sapien lacinia ullamcorper vel non orci. Nullam ut tincidunt ante. Maecenas ac tellus nisl, vitae suscipit magna. Duis lorem metus, posuere at feugiat sed, cursus vitae orci. Integer id lorem eu mi posuere pharetra. Ut vitae enim tortor. Nunc sed enim libero, id pellentesque dolor.</p>\r\n<p>Sed ac metus eu odio cursus porttitor a eget justo. Sed gravida, leo in semper tristique, quam est faucibus metus, vel sodales sapien odio sit amet lorem. Vestibulum suscipit erat ac est venenatis laoreet. Donec lacinia pharetra est, sit amet blandit metus cursus nec. Cras elementum nunc quis dolor dignissim egestas. Suspendisse laoreet magna a nisi condimentum tempor convallis ante molestie. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\r\n<p>Fusce pharetra lorem eget diam tempor ut porta turpis lacinia. Suspendisse dignissim metus at dolor facilisis pulvinar. Mauris hendrerit leo ut libero varius ac malesuada odio tincidunt. Nulla et tellus nisi.</p>', 1, 21, '2013-03-11 12:36:00', 488, '', '2014-01-31 10:07:46', 990, 0, '0000-00-00 00:00:00', '2013-03-11 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/6.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Maecenas facilisis\",\"image_intro_caption\":\"Maecenas facilisis\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/6.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Maecenas facilisis\",\"image_fulltext_caption\":\"Maecenas facilisis\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 15, 1, '', '', 1, 288, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', ''),
(31, 82, 'Donec dictum nisi eget', 'donec-dictum-nisi-eget', '<p>Nunc dapibus aliquam neque, at aliquam purus vulputate eu. Curabitur rhoncus consectetur eros in ornare. In vitae diam enim. Donec tortor orci, imperdiet at facilisis sit amet, luctus in orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan bibendum vestibulum.</p>\r\n', '\r\n<p>Nullam hendrerit egestas magna, ut dignissim leo dictum non.</p>\r\n<h3>Aenean eu justo ipsum, quis venenatis est.</h3>\r\n<p>Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n<p>Ut ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare.</p>\r\n<p>Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<h4>Mauris ac lectus ipsum, ut tincidunt lectus.</h4>\r\n<p>Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus. Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci.</p>\r\n<p>Mauris ultricies, eros eu tempus rhoncus, elit felis facilisis leo, a fringilla dui elit vitae magna. Sed iaculis velit ac sem consectetur tristique. Suspendisse neque quam, dictum at egestas vel, tempus ut neque. Cras feugiat vulputate gravida. Proin ultricies mollis ipsum, sit amet facilisis elit iaculis in. Suspendisse tempor ullamcorper lacinia.</p>', 1, 22, '2013-02-04 12:36:00', 488, '', '2014-01-31 10:38:52', 990, 0, '0000-00-00 00:00:00', '2013-02-04 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/8.jpg\",\"float_intro\":\"none\",\"image_intro_alt\":\"Donec dictum nisi eget\",\"image_intro_caption\":\"Donec dictum nisi eget\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/8.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Donec dictum nisi eget\",\"image_fulltext_caption\":\"Donec dictum nisi eget\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 12, 2, '', '', 1, 143, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(32, 83, 'Donec ut magna', 'donec-ut-magna', '<p>Ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare.</p>\r\n', '\r\n<p>Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n<blockquote>\r\n<p>Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum.</p>\r\n</blockquote>\r\n<p>Mauris sed purus eu magna commodo mollis ac vel ipsum. Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus.</p>\r\n<p>Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<h5>Mauris ultricies, eros eu tempus rhoncus.</h5>\r\n<p>Cras vel congue ligula. Donec ut magna diam. Etiam ac ipsum non purus hendrerit ultricies eget a neque. Ut non ultrices tellus. Vivamus semper ligula eget est tempor feugiat. Sed lobortis tempor mi ut molestie. Maecenas facilisis convallis convallis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque velit nunc, sodales id faucibus sodales, consectetur in nulla.</p>', 1, 22, '2013-02-03 12:36:00', 488, '', '2014-01-31 10:41:22', 990, 0, '0000-00-00 00:00:00', '2013-02-03 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/9.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"Donec ut magna\",\"image_intro_caption\":\"Donec ut magna\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/9.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Donec ut magna\",\"image_fulltext_caption\":\"Donec ut magna\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 7, 1, '', '', 1, 51, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(33, 84, ' Curabitur at mauris', 'curabitur-at-mauris', '<p>Curabitur at orci mauris, eget dapibus ligula. Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla.</p>\r\n', '\r\n<p>Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n<h3>Egestas laoreet nec id sapien.</h3>\r\n<p>Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare.</p>\r\n<p>Mauris sed purus eu magna commodo mollis ac vel ipsum. Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus. Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia.</p>\r\n<h5>Aliquam erat volutpat.</h5>\r\n<p>Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<p>Mauris ultricies, eros eu tempus rhoncus, elit felis facilisis leo, a fringilla dui elit vitae magna. Sed iaculis velit ac sem consectetur tristique. Suspendisse neque quam, dictum at egestas vel, tempus ut neque. Cras feugiat vulputate gravida. Proin ultricies mollis ipsum, sit amet facilisis elit iaculis in. Suspendisse tempor ullamcorper lacinia.</p>\r\n<p>Quisque suscipit molestie lacinia. Nulla eget quam nec erat molestie bibendum at et quam. Maecenas facilisis elementum aliquet. Vivamus ac odio sed sapien lacinia ullamcorper vel non orci. </p>', 1, 22, '2013-02-01 12:36:00', 488, '', '2014-01-31 10:45:29', 990, 0, '0000-00-00 00:00:00', '2013-02-01 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/10.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\" Curabitur at mauris\",\"image_intro_caption\":\" Curabitur at mauris\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/10.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\" Curabitur at mauris\",\"image_fulltext_caption\":\" Curabitur at mauris\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 6, 0, '', '', 1, 51, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', ''),
(34, 85, 'Donec neque metus, tempus', 'donec-neque-metus-tempus', '<p>Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam consectetur nunc nec varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n', '\r\n<p>Ut ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Nulla condimentum pulvinar dolor at interdum.</p>\r\n<h3>Heading H3?</h3>\r\n<p>Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare. Curabitur at orci mauris, eget dapibus ligula. Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<blockquote>\r\n<p>Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet.</p>\r\n</blockquote>\r\n<p>Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<h4>or maybe h4?</h4>\r\n<p>Mauris ultricies, eros eu tempus rhoncus, elit felis facilisis leo, a fringilla dui elit vitae magna. Sed iaculis velit ac sem consectetur tristique. Suspendisse neque quam, dictum at egestas vel, tempus ut neque. Cras feugiat vulputate gravida. Proin ultricies mollis ipsum, sit amet facilisis elit iaculis in. Fusce a arcu eu lectus convallis ultricies a et nulla.</p>\r\n<p>Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper.</p>', 1, 23, '2013-12-21 12:36:00', 488, '', '2014-01-31 10:28:44', 990, 0, '0000-00-00 00:00:00', '2013-12-21 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/1.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Our New Office \",\"image_intro_caption\":\"Caption text\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/1.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Our New Office \",\"image_fulltext_caption\":\"Lorem ispum dolor sit amet ...\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 91, 3, '', '', 1, 380, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(35, 86, ' Aenean eu justo', 'aenean-eu-justo', '<p>Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Ulla dapibus ante vel elit egestas commodo.</p>\r\n<p>Nullam hendrerit egestas magna, ut dignissim leo dictum non. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla.</p>\r\n', '\r\n<p>Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n<p>Ut ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare. Curabitur at orci mauris, eget dapibus ligula.</p>\r\n<pre>body {\r\n	font-size: 14px;\r\n	line-height: 24px;\r\n	color: #808080;\r\n	font-weight: normal;\r\n} </pre>\r\n<p>Mauris sed purus eu magna commodo mollis ac vel ipsum. Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet.</p>\r\n<p>Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus. Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<p>Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Ulla dapibus ante vel elit egestas commodo.</p>', 1, 23, '2013-01-23 12:36:00', 488, '', '2014-02-01 08:31:16', 990, 0, '0000-00-00 00:00:00', '2013-01-23 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/3.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\" Aenean eu justo\",\"image_intro_caption\":\"Sailing Aenean eu justo\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/3.jpg\",\"float_fulltext\":\"right\",\"image_fulltext_alt\":\" Aenean eu justo\",\"image_fulltext_caption\":\"Sailing Aenean eu justo\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 16, 2, '', '', 1, 86, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 1, '*', ''),
(36, 87, 'Nam scelerisque erat quis ', 'nam-scelerisque-erat-quis', '<p>Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Nunc accumsan bibendum vestibulum. Nullam hendrerit egestas magna, ut dignissim leo dictum non.</p>\r\n', '\r\n<p>Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n<h4>Just a simple heading</h4>\r\n<p>Ut ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare. Curabitur at orci mauris, eget dapibus ligula. Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<h5>Another Heading</h5>\r\n<p>Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus. Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>', 1, 23, '2013-01-31 12:36:00', 488, '', '2014-02-07 16:08:45', 990, 0, '0000-00-00 00:00:00', '2013-01-31 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/blog\\/2.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/2.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 43, 1, '', '', 1, 205, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(37, 88, 'Quote of someone famous', 'quote-of-someone-famous', '<blockquote>\r\n<p>Labor is prior to, and independent of, capital. Capital is only the fruit of labor, and could never have existed if labor had not first existed. Labor is the superior of capital, and deserves much the higher consideration.</p>\r\n<small>Abraham Lincoln</small></blockquote>\r\n', '\r\n<p>Ut ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare. Curabitur at orci mauris, eget dapibus ligula.</p>\r\n<p><img class=\"caption\" title=\"Image Caption\" src=\"images/demo_content/image_module/1.jpg\" alt=\"Image Description\" align=\"left\" />Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<p>Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus.</p>\r\n<p>Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<p>Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<p>Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus.</p>\r\n<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>\r\n<p> Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus.</p>', 1, 23, '2013-01-24 12:36:00', 488, '', '2014-02-01 08:30:31', 990, 0, '0000-00-00 00:00:00', '2013-01-24 12:36:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"left\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 34, 0, '', '', 1, 88, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '');
INSERT INTO `cms_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(38, 89, 'Single Article', 'single-article', '<blockquote>\r\n<p>Labor is prior to, and independent of, capital. Capital is only the fruit of labor, and could never have existed if labor had not first existed. Labor is the superior of capital, and deserves much the higher consideration.</p>\r\n<small>Abraham Lincoln</small></blockquote>\r\n', '\r\n<p>Ut ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare. Curabitur at orci mauris, eget dapibus ligula.</p>\r\n<p><img class=\"caption\" title=\"Image Caption\" src=\"images/demo_content/image_module/1.jpg\" alt=\"Image Description\" align=\"left\" />Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<p>Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus.</p>\r\n<p>Duis a enim mi. Sed fringilla, nunc et consequat vulputate, massa augue tempor metus, eget dignissim arcu ante vitae orci. Aenean congue vulputate sapien ut lacinia. Aliquam erat volutpat. <img class=\"caption\" title=\"Another Image + Caption\" src=\"images/demo_content/image_module/3.jpg\" alt=\"Image Description\" align=\"right\" />Cras malesuada, metus rhoncus rutrum ornare, ligula dui ultrices ante, egestas iaculis dui nulla eu augue. In et aliquam turpis. Fusce faucibus vehicula placerat.</p>\r\n<p>Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit.</p>\r\n<p>Mauris ac lectus ipsum, ut tincidunt lectus. Mauris posuere rutrum turpis. Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet. Vestibulum velit est, sollicitudin quis venenatis nec, adipiscing vel tellus.</p>', 1, 10, '2013-04-09 14:18:37', 488, '', '2014-01-30 21:39:50', 990, 488, '2017-11-04 17:30:08', '2013-04-09 14:18:37', '0000-00-00 00:00:00', '{\"image_intro\":\"images\\/demo_content\\/slider\\/slide6.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Alt text for image\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Alt text for image\",\"image_fulltext_caption\":\"Image caption text\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 19, 1, '', '', 1, 252, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(50, 186, 'Archived Article 6', 'archived-article-6', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '2010-11-19 15:52:00', 488, '', '2014-01-31 10:50:27', 990, 0, '0000-00-00 00:00:00', '2010-11-19 15:52:00', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 1, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(51, 187, 'Archived Article 5', 'archived-article-5', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum rhoncus mollis. Duis lobortis massa sit amet purus ultricies quis congue dui suscipit. Proin a odio sapien, in tincidunt arcu. Nulla ac justo metus. Proin tincidunt eros nec massa sodales ultrices. Phasellus ultrices arcu ut orci sodales faucibus. Nulla vehicula varius varius. Proin in nisl nec nisl dictum facilisis. Aenean viverra facilisis neque non tincidunt. Aliquam volutpat, metus vel blandit vestibulum, felis purus facilisis augue, eu eleifend lacus mi ac nisi. Sed porta ornare quam nec lobortis. Nullam faucibus leo non felis rutrum rhoncus. Nunc nec magna nulla, sed ullamcorper tellus. Integer fringilla libero at purus faucibus elementum. Cras laoreet venenatis nibh eget tristique.</p>\r\n', '\r\n<p> Donec eget vestibulum diam. Sed quis diam nunc. Sed commodo est eget lorem scelerisque sed volutpat libero porttitor. Aliquam posuere, massa a ullamcorper mattis, nunc magna gravida magna, a faucibus est lacus non ligula. Cras at sem lectus, eget eleifend erat. Donec vehicula, purus at posuere molestie, dui massa mattis nibh, vitae pulvinar eros sapien dapibus diam. Suspendisse potenti. Maecenas eu ligula neque, vitae dictum sapien. In a placerat quam.</p>\r\n<p>Etiam at ligula lectus, in egestas nisi. Morbi et lorem risus. Curabitur aliquam consectetur lacus vitae fermentum. Donec laoreet orci vel enim congue semper. Aenean ut tellus id leo vehicula consequat. Vestibulum feugiat, odio eu pellentesque tincidunt, tortor velit adipiscing neque, in bibendum diam tellus nec dolor. Mauris vehicula faucibus felis, id scelerisque orci convallis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla congue pharetra faucibus.</p>\r\n<p>Integer consectetur vestibulum tristique. Sed ornare orci vitae odio fermentum non tempor nibh aliquet. Curabitur ac dui urna, id lobortis tellus. Sed nisl ante, accumsan ut fermentum ut, elementum nec arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus ultricies, nulla ut sagittis sagittis, metus nunc rutrum urna, in tristique ipsum eros ut metus. Donec orci augue, sollicitudin eget malesuada ut, laoreet ut libero. In sollicitudin interdum massa, eu commodo augue pharetra nec. Quisque faucibus tincidunt ante, vitae semper purus venenatis sit amet. Fusce eu varius magna. Ut feugiat eleifend sapien, eget malesuada odio sagittis id. Sed eu ipsum aliquam dui aliquet sollicitudin ut nec justo. Maecenas commodo iaculis nisi ac dignissim. Duis dolor dolor, iaculis tempor lacinia id, tempor ornare dui.</p>\r\n<p>Praesent varius dolor et est accumsan volutpat vitae ut orci. Curabitur mollis vestibulum eros vitae accumsan. Quisque et quam suscipit sem auctor rhoncus eget sed libero. Sed nibh massa, vehicula sed tempus eu, sodales vel erat. Duis sed enim vitae tellus eleifend sollicitudin. Curabitur vel arcu erat. Cras in purus elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In adipiscing facilisis cursus. Praesent sapien augue, ultricies vel adipiscing eu, dignissim in sapien. Pellentesque vitae lacus mauris, tincidunt scelerisque justo.</p>', 2, 12, '0000-00-00 00:00:00', 488, '', '2014-01-31 10:51:51', 990, 0, '0000-00-00 00:00:00', '2014-01-31 10:51:31', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 0, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(52, 218, 'Dashboard', 'fuelics-dashboard', '<p>{source} [[?php  include \"webpages/Home.php\"; ?]] {/source}</p>', '', 1, 2, '2014-11-06 14:54:17', 488, '', '2018-05-12 07:37:51', 488, 0, '0000-00-00 00:00:00', '2014-11-06 14:54:17', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"0\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_vote\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"0\",\"show_article_options\":\"0\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 33, 1, '', '', 1, 6587, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', ''),
(53, 238, 'Αναφορές Μετρήσεων', '2018-05-13-11-23-09', '<p>{source} [[?php  include \"webpages/DataReport.php\"; ?]] {/source}</p>', '', 1, 2, '2018-05-13 11:23:09', 488, '', '2018-05-13 12:59:19', 488, 0, '0000-00-00 00:00:00', '2018-05-13 11:23:09', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 4, 0, '', '', 1, 127, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_contentitem_tag_map`
--

CREATE TABLE `cms_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

--
-- Άδειασμα δεδομένων του πίνακα `cms_contentitem_tag_map`
--

INSERT INTO `cms_contentitem_tag_map` (`type_alias`, `core_content_id`, `content_item_id`, `tag_id`, `tag_date`, `type_id`) VALUES
('com_content.article', 13, 7, 7, '2014-01-31 11:58:58', 1),
('com_content.article', 13, 7, 11, '2014-01-31 11:58:58', 1),
('com_content.article', 13, 7, 19, '2014-01-31 11:58:58', 1),
('com_content.article', 1, 27, 5, '2014-02-01 08:28:57', 1),
('com_content.article', 1, 27, 9, '2014-02-01 08:28:57', 1),
('com_content.article', 1, 27, 10, '2014-02-01 08:28:57', 1),
('com_content.article', 1, 27, 17, '2014-02-01 08:28:57', 1),
('com_content.article', 8, 29, 7, '2014-02-01 08:29:27', 1),
('com_content.article', 8, 29, 10, '2014-02-01 08:29:27', 1),
('com_content.article', 7, 30, 9, '2014-01-31 10:07:46', 1),
('com_content.article', 7, 30, 15, '2014-01-31 10:07:46', 1),
('com_content.article', 5, 31, 7, '2014-01-31 10:38:52', 1),
('com_content.article', 5, 31, 10, '2014-01-31 10:38:52', 1),
('com_content.article', 5, 31, 11, '2014-01-31 10:38:52', 1),
('com_content.article', 5, 31, 17, '2014-01-31 10:38:52', 1),
('com_content.article', 6, 32, 7, '2014-01-31 10:41:22', 1),
('com_content.article', 6, 32, 10, '2014-01-31 10:41:22', 1),
('com_content.article', 6, 32, 12, '2014-01-31 10:41:22', 1),
('com_content.article', 6, 32, 13, '2014-01-31 10:41:22', 1),
('com_content.article', 3, 33, 6, '2014-01-31 10:45:29', 1),
('com_content.article', 3, 33, 7, '2014-01-31 10:45:29', 1),
('com_content.article', 3, 33, 8, '2014-01-31 10:45:29', 1),
('com_content.article', 11, 34, 7, '2014-01-31 10:28:44', 1),
('com_content.article', 11, 34, 9, '2014-01-31 10:28:44', 1),
('com_content.article', 11, 34, 13, '2014-01-31 10:28:44', 1),
('com_content.article', 2, 35, 5, '2014-02-01 08:31:16', 1),
('com_content.article', 2, 35, 6, '2014-02-01 08:31:16', 1),
('com_content.article', 2, 35, 7, '2014-02-01 08:31:16', 1),
('com_content.article', 10, 36, 6, '2014-02-07 16:08:46', 1),
('com_content.article', 10, 36, 7, '2014-02-07 16:08:46', 1),
('com_content.article', 10, 36, 16, '2014-02-07 16:08:46', 1),
('com_content.article', 9, 37, 5, '2014-02-01 08:30:32', 1),
('com_content.article', 9, 37, 10, '2014-02-01 08:30:32', 1),
('com_content.article', 9, 37, 16, '2014-02-01 08:30:32', 1),
('com_content.article', 12, 38, 6, '2014-01-30 21:39:51', 1),
('com_content.article', 12, 38, 7, '2014-01-30 21:39:51', 1),
('com_content.article', 12, 38, 13, '2014-01-30 21:39:51', 1),
('com_content.article', 12, 38, 18, '2014-01-30 21:39:51', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_content_frontpage`
--

CREATE TABLE `cms_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_content_frontpage`
--

INSERT INTO `cms_content_frontpage` (`content_id`, `ordering`) VALUES
(20, 9),
(21, 10),
(22, 11),
(26, 12),
(27, 4),
(29, 2),
(30, 3),
(33, 1),
(35, 5),
(40, 8),
(41, 7),
(42, 6);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_content_rating`
--

CREATE TABLE `cms_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_content_rating`
--

INSERT INTO `cms_content_rating` (`content_id`, `rating_sum`, `rating_count`, `lastip`) VALUES
(27, 3, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_content_types`
--

CREATE TABLE `cms_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) NOT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_content_types`
--

INSERT INTO `cms_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\": {\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Weblink', 'com_weblinks.weblink', '{\"special\":{\"dbtable\":\"#__weblinks\",\"key\":\"id\",\"type\":\"Weblink\",\"prefix\":\"WeblinksTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"url\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\": {}}', 'WeblinksHelperRoute::getWeblinkRoute', '{\"formFile\":\"administrator\\/components\\/com_weblinks\\/models\\/forms\\/weblink.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"featured\",\"images\"], \"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(3, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\": {\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(4, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\": {\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(5, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\": {}}', 'UsersHelperRoute::getUserRoute', ''),
(6, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(9, 'Weblinks Category', 'com_weblinks.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'WeblinksHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(10, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(11, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(12, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(13, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(14, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(15, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_core_log_searches`
--

CREATE TABLE `cms_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_ev_easypopup_popups`
--

CREATE TABLE `cms_ev_easypopup_popups` (
  `id` int(11) NOT NULL,
  `popup_name` varchar(255) DEFAULT NULL,
  `popup_descr` text,
  `published` int(11) DEFAULT '0',
  `joomla_usergroup_id` int(11) DEFAULT '-1',
  `popup_source` int(11) DEFAULT '0',
  `popup_source_id` int(11) DEFAULT '0',
  `popup_source_link` text,
  `popup_source_text` text,
  `popup_source_html` text,
  `popup_width` varchar(255) DEFAULT NULL,
  `popup_height` varchar(255) DEFAULT NULL,
  `popup_config_more` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_extensions`
--

CREATE TABLE `cms_extensions` (
  `extension_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_extensions`
--

INSERT INTO `cms_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"0\",\"history_limit\":5,\"show_contact_list\":\"0\",\"presentation_style\":\"plain\",\"show_name\":\"0\",\"show_position\":\"1\",\"show_email\":\"1\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"show_tags\":\"1\",\"contact_icons\":\"1\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"en-GB\",\"site\":\"el-GR\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}', '{\"enabled\":\"0\",\"show_date\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"1\",\"upload_limit\":\"2\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_comp_description\":\"1\",\"comp_description\":\"\",\"show_link_hits\":\"1\",\"show_link_description\":\"1\",\"show_other_cats\":\"0\",\"show_headings\":\"0\",\"show_numbers\":\"0\",\"show_report\":\"1\",\"count_clicks\":\"1\",\"target\":\"0\",\"link_icons\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"0\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_vote\":\"0\",\"show_readmore\":\"0\",\"show_readmore_title\":\"0\",\"readmore_limit\":\"100\",\"show_tags\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"1\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"0\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"1\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"0\",\"num_intro_articles\":\"6\",\"num_columns\":\"2\",\"num_links\":\"2\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"1\",\"useractivation\":\"1\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"1\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"0\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"1\",\"tag_list_image\":\"\",\"show_tag_num_items\":\"1\",\"tag_list_orderby\":\"c.core_title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"1\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"1\",\"tag_list_item_maximum_characters\":100,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"1\",\"all_tags_show_tag_descripion\":\"1\",\"all_tags_tag_maximum_characters\":100,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"0\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{\"name\":\"PHPMailer\",\"type\":\"library\",\"creationDate\":\"2001\",\"author\":\"PHPMailer\",\"copyright\":\"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2013, Jim Jagielski. All Rights Reserved.\",\"authorEmail\":\"jimjag@gmail.com\",\"authorUrl\":\"https:\\/\\/github.com\\/PHPMailer\\/PHPMailer\",\"version\":\"5.2.6\",\"description\":\"LIB_PHPMAILER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mediaversion\":\"170914de44fe45b6933621a5844a81cb\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{\"name\":\"IDNA Convert\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2014-03-09 12:54:48\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2014 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.2.1\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{\"name\":\"PHPass\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"style\":\"xhtml\"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"title\":\"1\",\"article_index\":\"0\",\"article_index_text\":\"\",\"multipage_toc\":\"1\",\"showall\":\"1\",\"style\":\"sliders\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0);
INSERT INTO `cms_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\"}', '{\"position\":\"1\",\"relative\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"3.15\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2014\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\",\"version\":\"4.1.2\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}', '{\"mode\":\"1\",\"skin\":\"0\",\"mobile\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"1\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"hr\":\"1\",\"link\":\"1\",\"media\":\"1\",\"print\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"alignment\":\"1\",\"visualchars\":\"1\",\"visualblocks\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"detect_browser\":\"0\",\"automatic_change\":\"1\",\"item_associations\":\"1\",\"remove_default_prefix\":\"1\",\"lang_cookie\":\"0\",\"alternate_meta\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2009 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"autoregister\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 1, 1, 0, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"0\",\"register-require_website\":\"0\",\"register-require_favoritebook\":\"0\",\"register-require_aboutme\":\"0\",\"register-require_tos\":\"2\",\"register_tos_article\":\"\",\"register-require_dob\":\"2\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_dob\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"Se[ptember 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2013 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 0, 1, 0, '{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\"}', '{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"templateColor\":\"\",\"logoFile\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2013-03-07\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.3.1\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2013-03-07\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.3.1\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"September 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2014 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.3.6\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'AllVideos (by JoomlaWorks)', 'plugin', 'jw_allvideos', 'content', 0, 1, 1, 0, '{\"name\":\"AllVideos (by JoomlaWorks)\",\"type\":\"plugin\",\"creationDate\":\"February 27th, 2013\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"4.5.0\",\"description\":\"JW_PLG_AV_XML_DESC\",\"group\":\"\"}', '{\"playerTemplate\":\"Responsive\",\"vfolder\":\"images\\/videos\",\"vwidth\":\"655\",\"vheight\":\"350\",\"transparency\":\"transparent\",\"background\":\"#010101\",\"controlBarLocation\":\"bottom\",\"backgroundQT\":\"black\",\"afolder\":\"images\\/audio\",\"awidth\":\"650\",\"aheight\":\"24\",\"abackground\":\"#010101\",\"afrontcolor\":\"#FFFFFF\",\"alightcolor\":\"#00ADE3\",\"allowAudioDownloading\":\"0\",\"autoplay\":\"0\",\"gzipScripts\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10028, 'mod_st_slider', 'module', 'mod_st_slider', '', 0, 1, 0, 0, '{\"name\":\"mod_st_slider\",\"type\":\"module\",\"creationDate\":\"12\\/12\\/2012\",\"author\":\"Tomasz Herudzinski 7Studio\",\"copyright\":\"Copyright (C) 2009 - 2013 7Studio Tomasz Herudzinski. All rights reserved.\",\"authorEmail\":\"info@7studio.eu\",\"authorUrl\":\"www.7studio.eu\",\"version\":\"1.1\",\"description\":\"MOD_ST_SLIDER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"slider_width\":\"1300\",\"slider_height\":\"550\",\"image_animation_type\":\"right\",\"slide_autoplay\":\"1\",\"autoplay_duration\":\"4000\",\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"1\",\"slides_counter\":\"1\",\"linked_titles\":\"0\",\"show_readmore\":\"1\",\"readmore_text\":\"read more\",\"resize_images\":\"1\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_text_animation_1\":\"left\",\"slide_text_1\":\"\",\"slide_text_animation_2\":\"left\",\"slide_text_2\":\"\",\"slide_text_animation_3\":\"left\",\"slide_text_3\":\"\",\"slide_text_animation_4\":\"left\",\"slide_text_4\":\"\",\"slide_text_animation_5\":\"left\",\"slide_text_5\":\"\",\"slide_text_animation_6\":\"left\",\"slide_text_6\":\"\",\"slide_text_animation_7\":\"left\",\"slide_text_7\":\"\",\"slide_text_animation_8\":\"left\",\"slide_text_8\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10034, 'mod_st_promo_image', 'module', 'mod_st_promo_image', '', 0, 1, 0, 0, '{\"name\":\"mod_st_promo_image\",\"type\":\"module\",\"creationDate\":\"12\\/12\\/2012\",\"author\":\"Tomasz Herudzinski 7Studio\",\"copyright\":\"Copyright (C) 2009 - 2014 7Studio Tomasz Herudzinski. All rights reserved.\",\"authorEmail\":\"info@7studio.eu\",\"authorUrl\":\"www.7studio.eu\",\"version\":\"1.0\",\"description\":\"MOD_ST_PROMO_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"module_width\":\"231\",\"link_target\":\"0\",\"owncache\":\"1\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 'mod_st_newsflash', 'module', 'mod_st_newsflash', '', 0, 1, 0, 0, '{\"name\":\"mod_st_newsflash\",\"type\":\"module\",\"creationDate\":\"12\\/12\\/2012\",\"author\":\"Tomasz Herudzinski 7Studio\",\"copyright\":\"Copyright (C) 2009 - 2013 7Studio Tomasz Herudzinski. All rights reserved.\",\"authorEmail\":\"info@7studio.eu\",\"authorUrl\":\"www.7studio.eu\",\"version\":\"1.0\",\"description\":\"MOD_ST_NEWSFLASH_XML_DESCRIPTION\",\"group\":\"\"}', '{\"catid\":\"\",\"count\":\"5\",\"ordering\":\"a.publish_up\",\"item_title\":\"0\",\"link_titles\":\"0\",\"readmore\":\"0\",\"show_introtext\":\"1\",\"introtext_limit\":\"100\",\"latest_newstext\":\"\",\"animation_type\":\"0\",\"auto_cycle\":\"1\",\"animation_loop\":\"1\",\"auto_cycle_time\":\"5000\",\"nav_buttons\":\"1\",\"control_nav\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10043, 'com_k2', 'component', 'com_k2', '', 1, 1, 0, 0, '{\"name\":\"COM_K2\",\"type\":\"component\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"Thank you for installing K2 by JoomlaWorks, the powerful content extension for Joomla!\",\"group\":\"\"}', '{\"enable_css\":\"0\",\"jQueryHandling\":\"0\",\"backendJQueryHandling\":\"remote\",\"userName\":\"1\",\"userImage\":\"1\",\"userDescription\":\"1\",\"userURL\":\"1\",\"userEmail\":\"0\",\"userFeedLink\":\"1\",\"userFeedIcon\":\"1\",\"userItemCount\":\"5\",\"userItemTitle\":\"1\",\"userItemTitleLinked\":\"1\",\"userItemDateCreated\":\"1\",\"userItemImage\":\"1\",\"userItemIntroText\":\"1\",\"userItemCategory\":\"0\",\"userItemTags\":\"1\",\"userItemCommentsAnchor\":\"0\",\"userItemReadMore\":\"1\",\"userItemK2Plugins\":\"1\",\"tagItemCount\":\"10\",\"tagItemTitle\":\"1\",\"tagItemTitleLinked\":\"1\",\"tagItemDateCreated\":\"1\",\"tagItemImage\":\"1\",\"tagItemIntroText\":\"1\",\"tagItemCategory\":\"1\",\"tagItemReadMore\":\"1\",\"tagItemExtraFields\":\"0\",\"tagOrdering\":\"\",\"tagFeedLink\":\"1\",\"tagFeedIcon\":\"1\",\"genericItemCount\":\"10\",\"genericItemTitle\":\"1\",\"genericItemTitleLinked\":\"1\",\"genericItemDateCreated\":\"1\",\"genericItemImage\":\"1\",\"genericItemIntroText\":\"1\",\"genericItemCategory\":\"1\",\"genericItemReadMore\":\"1\",\"genericItemExtraFields\":\"0\",\"genericFeedLink\":\"1\",\"genericFeedIcon\":\"1\",\"feedLimit\":\"10\",\"feedItemImage\":\"1\",\"feedImgSize\":\"S\",\"feedItemIntroText\":\"1\",\"feedTextWordLimit\":\"\",\"feedItemFullText\":\"1\",\"feedItemTags\":\"0\",\"feedItemVideo\":\"0\",\"feedItemGallery\":\"0\",\"feedItemAttachments\":\"0\",\"feedBogusEmail\":\"\",\"introTextCleanup\":\"0\",\"introTextCleanupExcludeTags\":\"\",\"introTextCleanupTagAttr\":\"\",\"fullTextCleanup\":\"0\",\"fullTextCleanupExcludeTags\":\"\",\"fullTextCleanupTagAttr\":\"\",\"xssFiltering\":\"0\",\"linkPopupWidth\":\"900\",\"linkPopupHeight\":\"600\",\"imagesQuality\":\"100\",\"itemImageXS\":\"100\",\"itemImageS\":\"200\",\"itemImageM\":\"300\",\"itemImageL\":\"500\",\"itemImageXL\":\"600\",\"itemImageGeneric\":\"300\",\"catImageWidth\":\"231\",\"catImageDefault\":\"0\",\"userImageWidth\":\"160\",\"userImageDefault\":\"1\",\"commenterImgWidth\":\"80\",\"onlineImageEditor\":\"splashup\",\"imageTimestamp\":\"0\",\"imageMemoryLimit\":\"\",\"socialButtonCode\":\"\",\"twitterUsername\":\"\",\"facebookImage\":\"XSmall\",\"comments\":\"2\",\"commentsOrdering\":\"DESC\",\"commentsLimit\":\"10\",\"commentsFormPosition\":\"below\",\"commentsPublishing\":\"0\",\"commentsReporting\":\"2\",\"commentsReportRecipient\":\"\",\"inlineCommentsModeration\":\"0\",\"gravatar\":\"0\",\"antispam\":\"0\",\"recaptchaForRegistered\":\"1\",\"akismetForRegistered\":\"1\",\"commentsFormNotes\":\"1\",\"commentsFormNotesText\":\"\",\"frontendEditing\":\"1\",\"showImageTab\":\"1\",\"showImageGalleryTab\":\"1\",\"showVideoTab\":\"1\",\"showExtraFieldsTab\":\"1\",\"showAttachmentsTab\":\"1\",\"showK2Plugins\":\"1\",\"sideBarDisplayFrontend\":\"0\",\"mergeEditors\":\"1\",\"sideBarDisplay\":\"1\",\"attachmentsFolder\":\"\",\"hideImportButton\":\"0\",\"googleSearch\":\"0\",\"googleSearchContainer\":\"k2GoogleSearchContainer\",\"K2UserProfile\":\"0\",\"K2UserGroup\":\"11\",\"redirect\":\"126\",\"adminSearch\":\"simple\",\"cookieDomain\":\"\",\"taggingSystem\":\"1\",\"lockTags\":\"0\",\"showTagFilter\":\"0\",\"k2TagNorm\":\"0\",\"k2TagNormCase\":\"lower\",\"k2TagNormAdditionalReplacements\":\"\",\"recaptcha_public_key\":\"\",\"recaptcha_private_key\":\"\",\"recaptcha_theme\":\"clean\",\"recaptchaOnRegistration\":\"0\",\"akismetApiKey\":\"\",\"stopForumSpam\":\"0\",\"stopForumSpamApiKey\":\"\",\"showItemsCounterAdmin\":\"1\",\"showChildCatItems\":\"1\",\"disableCompactOrdering\":\"0\",\"metaDescLimit\":\"150\",\"enforceSEFReplacements\":\"0\",\"SEFReplacements\":\"\\u00c0|A, \\u00c1|A, \\u00c2|A, \\u00c3|A, \\u00c4|A, \\u00c5|A, \\u00e0|a, \\u00e1|a, \\u00e2|a, \\u00e3|a, \\u00e4|a, \\u00e5|a, \\u0100|A, \\u0101|a, \\u0102|A, \\u0103|a, \\u0104|A, \\u0105|a, \\u00c7|C, \\u00e7|c, \\u0106|C, \\u0107|c, \\u0108|C, \\u0109|c, \\u010a|C, \\u010b|c, \\u010c|C, \\u010d|c, \\u00d0|D, \\u00f0|d, \\u010e|D, \\u010f|d, \\u0110|D, \\u0111|d, \\u00c8|E, \\u00c9|E, \\u00ca|E, \\u00cb|E, \\u00e8|e, \\u00e9|e, \\u00ea|e, \\u00eb|e, \\u0112|E, \\u0113|e, \\u0114|E, \\u0115|e, \\u0116|E, \\u0117|e, \\u0118|E, \\u0119|e, \\u011a|E, \\u011b|e, \\u011c|G, \\u011d|g, \\u011e|G, \\u011f|g, \\u0120|G, \\u0121|g, \\u0122|G, \\u0123|g, \\u0124|H, \\u0125|h, \\u0126|H, \\u0127|h, \\u00cc|I, \\u00cd|I, \\u00ce|I, \\u00cf|I, \\u00ec|i, \\u00ed|i, \\u00ee|i, \\u00ef|i, \\u0128|I, \\u0129|i, \\u012a|I, \\u012b|i, \\u012c|I, \\u012d|i, \\u012e|I, \\u012f|i, \\u0130|I, \\u0131|i, \\u0134|J, \\u0135|j, \\u0136|K, \\u0137|k, \\u0138|k, \\u0139|L, \\u013a|l, \\u013b|L, \\u013c|l, \\u013d|L, \\u013e|l, \\u013f|L, \\u0140|l, \\u0141|L, \\u0142|l, \\u00d1|N, \\u00f1|n, \\u0143|N, \\u0144|n, \\u0145|N, \\u0146|n, \\u0147|N, \\u0148|n, \\u0149|n, \\u014a|N, \\u014b|n, \\u00d2|O, \\u00d3|O, \\u00d4|O, \\u00d5|O, \\u00d6|O, \\u00d8|O, \\u00f2|o, \\u00f3|o, \\u00f4|o, \\u00f5|o, \\u00f6|o, \\u00f8|o, \\u014c|O, \\u014d|o, \\u014e|O, \\u014f|o, \\u0150|O, \\u0151|o, \\u0154|R, \\u0155|r, \\u0156|R, \\u0157|r, \\u0158|R, \\u0159|r, \\u015a|S, \\u015b|s, \\u015c|S, \\u015d|s, \\u015e|S, \\u015f|s, \\u0160|S, \\u0161|s, \\u017f|s, \\u0162|T, \\u0163|t, \\u0164|T, \\u0165|t, \\u0166|T, \\u0167|t, \\u00d9|U, \\u00da|U, \\u00db|U, \\u00dc|U, \\u00f9|u, \\u00fa|u, \\u00fb|u, \\u00fc|u, \\u0168|U, \\u0169|u, \\u016a|U, \\u016b|u, \\u016c|U, \\u016d|u, \\u016e|U, \\u016f|u, \\u0170|U, \\u0171|u, \\u0172|U, \\u0173|u, \\u0174|W, \\u0175|w, \\u00dd|Y, \\u00fd|y, \\u00ff|y, \\u0176|Y, \\u0177|y, \\u0178|Y, \\u0179|Z, \\u017a|z, \\u017b|Z, \\u017c|z, \\u017d|Z, \\u017e|z, \\u03b1|a, \\u03b2|b, \\u03b3|g, \\u03b4|d, \\u03b5|e, \\u03b6|z, \\u03b7|h, \\u03b8|th, \\u03b9|i, \\u03ba|k, \\u03bb|l, \\u03bc|m, \\u03bd|n, \\u03be|x, \\u03bf|o, \\u03c0|p, \\u03c1|r, \\u03c3|s, \\u03c4|t, \\u03c5|y, \\u03c6|f, \\u03c7|ch, \\u03c8|ps, \\u03c9|w, \\u0391|A, \\u0392|B, \\u0393|G, \\u0394|D, \\u0395|E, \\u0396|Z, \\u0397|H, \\u0398|Th, \\u0399|I, \\u039a|K, \\u039b|L, \\u039c|M, \\u039e|X, \\u039f|O, \\u03a0|P, \\u03a1|R, \\u03a3|S, \\u03a4|T, \\u03a5|Y, \\u03a6|F, \\u03a7|Ch, \\u03a8|Ps, \\u03a9|W, \\u03ac|a, \\u03ad|e, \\u03ae|h, \\u03af|i, \\u03cc|o, \\u03cd|y, \\u03ce|w, \\u0386|A, \\u0388|E, \\u0389|H, \\u038a|I, \\u038c|O, \\u038e|Y, \\u038f|W, \\u03ca|i, \\u0390|i, \\u03cb|y, \\u03c2|s, \\u0410|A, \\u04d0|A, \\u04d2|A, \\u04d8|E, \\u04da|E, \\u04d4|E, \\u0411|B, \\u0412|V, \\u0413|G, \\u0490|G, \\u0403|G, \\u0492|G, \\u04f6|G, y|Y, \\u0414|D, \\u0415|E, \\u0400|E, \\u0401|YO, \\u04d6|E, \\u04bc|E, \\u04be|E, \\u0404|YE, \\u0416|ZH, \\u04c1|DZH, \\u0496|ZH, \\u04dc|DZH, \\u0417|Z, \\u0498|Z, \\u04de|DZ, \\u04e0|DZ, \\u0405|DZ, \\u0418|I, \\u040d|I, \\u04e4|I, \\u04e2|I, \\u0406|I, \\u0407|JI, \\u04c0|I, \\u0419|Y, \\u048a|Y, \\u0408|J, \\u041a|K, \\u049a|Q, \\u049e|Q, \\u04a0|K, \\u04c3|Q, \\u049c|K, \\u041b|L, \\u04c5|L, \\u0409|L, \\u041c|M, \\u04cd|M, \\u041d|N, \\u04c9|N, \\u04a2|N, \\u04c7|N, \\u04a4|N, \\u040a|N, \\u041e|O, \\u04e6|O, \\u04e8|O, \\u04ea|O, \\u04a8|O, \\u041f|P, \\u04a6|PF, \\u0420|P, \\u048e|P, \\u0421|S, \\u04aa|S, \\u0422|T, \\u04ac|TH, \\u040b|T, \\u040c|K, \\u0423|U, \\u040e|U, \\u04f2|U, \\u04f0|U, \\u04ee|U, \\u04ae|U, \\u04b0|U, \\u0424|F, \\u0425|H, \\u04b2|H, \\u04ba|H, \\u0426|TS, \\u04b4|TS, \\u0427|CH, \\u04f4|CH, \\u04b6|CH, \\u04cb|CH, \\u04b8|CH, \\u040f|DZ, \\u0428|SH, \\u0429|SHT, \\u042a|A, \\u042b|Y, \\u04f8|Y, \\u042c|Y, \\u048c|Y, \\u042d|E, \\u04ec|E, \\u042e|YU, \\u042f|YA, \\u0430|a, \\u04d1|a, \\u04d3|a, \\u04d9|e, \\u04db|e, \\u04d5|e, \\u0431|b, \\u0432|v, \\u0433|g, \\u0491|g, \\u0453|g, \\u0493|g, \\u04f7|g, y|y, \\u0434|d, \\u0435|e, \\u0450|e, \\u0451|yo, \\u04d7|e, \\u04bd|e, \\u04bf|e, \\u0454|ye, \\u0436|zh, \\u04c2|dzh, \\u0497|zh, \\u04dd|dzh, \\u0437|z, \\u0499|z, \\u04df|dz, \\u04e1|dz, \\u0455|dz, \\u0438|i, \\u045d|i, \\u04e5|i, \\u04e3|i, \\u0456|i, \\u0457|ji, \\u04c0|i, \\u0439|y, \\u048b|y, \\u0458|j, \\u043a|k, \\u049b|q, \\u049f|q, \\u04a1|k, \\u04c4|q, \\u049d|k, \\u043b|l, \\u04c6|l, \\u0459|l, \\u043c|m, \\u04ce|m, \\u043d|n, \\u04ca|n, \\u04a3|n, \\u04c8|n, \\u04a5|n, \\u045a|n, \\u043e|o, \\u04e7|o, \\u04e9|o, \\u04eb|o, \\u04a9|o, \\u043f|p, \\u04a7|pf, \\u0440|p, \\u048f|p, \\u0441|s, \\u04ab|s, \\u0442|t, \\u04ad|th, \\u045b|t, \\u045c|k, \\u0443|u, \\u045e|u, \\u04f3|u, \\u04f1|u, \\u04ef|u, \\u04af|u, \\u04b1|u, \\u0444|f, \\u0445|h, \\u04b3|h, \\u04bb|h, \\u0446|ts, \\u04b5|ts, \\u0447|ch, \\u04f5|ch, \\u04b7|ch, \\u04cc|ch, \\u04b9|ch, \\u045f|dz, \\u0448|sh, \\u0449|sht, \\u044a|a, \\u044b|y, \\u04f9|y, \\u044c|y, \\u048d|y, \\u044d|e, \\u04ed|e, \\u044e|yu, \\u044f|ya\",\"k2Sef\":\"0\",\"k2SefLabelCat\":\"content\",\"k2SefLabelTag\":\"tag\",\"k2SefLabelUser\":\"author\",\"k2SefLabelSearch\":\"search\",\"k2SefLabelDate\":\"date\",\"k2SefLabelItem\":\"0\",\"k2SefLabelItemCustomPrefix\":\"\",\"k2SefInsertItemId\":\"1\",\"k2SefItemIdTitleAliasSep\":\"dash\",\"k2SefUseItemTitleAlias\":\"1\",\"k2SefInsertCatId\":\"1\",\"k2SefCatIdTitleAliasSep\":\"dash\",\"k2SefUseCatTitleAlias\":\"1\",\"sh404SefLabelCat\":\"\",\"sh404SefLabelUser\":\"blog\",\"sh404SefLabelItem\":\"2\",\"sh404SefTitleAlias\":\"alias\",\"sh404SefModK2ContentFeedAlias\":\"feed\",\"sh404SefInsertItemId\":\"0\",\"sh404SefInsertUniqueItemId\":\"0\",\"cbIntegration\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10044, 'plg_finder_k2', 'plugin', 'k2', 'finder', 0, 0, 1, 0, '{\"name\":\"plg_finder_k2\",\"type\":\"plugin\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"PLG_FINDER_K2_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10045, 'Search - K2', 'plugin', 'k2', 'search', 0, 1, 1, 0, '{\"name\":\"Search - K2\",\"type\":\"plugin\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_THIS_PLUGIN_EXTENDS_THE_DEFAULT_JOOMLA_SEARCH_FUNCTIONALITY_TO_K2_CONTENT\",\"group\":\"\"}', '{\"search_limit\":\"50\",\"search_tags\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10046, 'System - K2', 'plugin', 'k2', 'system', 0, 1, 1, 0, '{\"name\":\"System - K2\",\"type\":\"plugin\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_THE_K2_SYSTEM_PLUGIN_IS_USED_TO_ASSIST_THE_PROPER_FUNCTIONALITY_OF_THE_K2_COMPONENT_SITE_WIDE_MAKE_SURE_ITS_ALWAYS_PUBLISHED_WHEN_THE_K2_COMPONENT_IS_INSTALLED\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10047, 'User - K2', 'plugin', 'k2', 'user', 0, 1, 1, 0, '{\"name\":\"User - K2\",\"type\":\"plugin\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_A_USER_SYNCHRONIZATION_PLUGIN_FOR_K2\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10048, 'Josetta - K2 Categories', 'plugin', 'k2category', 'josetta_ext', 0, 1, 1, 0, '{\"name\":\"Josetta - K2 Categories\",\"type\":\"plugin\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10049, 'Josetta - K2 Items', 'plugin', 'k2item', 'josetta_ext', 0, 1, 1, 0, '{\"name\":\"Josetta - K2 Items\",\"type\":\"plugin\",\"creationDate\":\"June 7th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10050, 'K2 Comments', 'module', 'mod_k2_comments', '', 0, 1, 0, 0, '{\"name\":\"K2 Comments\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"MOD_K2_COMMENTS_DESCRIPTION\",\"group\":\"\"}', '{\"moduleclass_sfx\":\"\",\"module_usage\":\"\",\"\":\"K2_TOP_COMMENTERS\",\"catfilter\":\"0\",\"category_id\":\"\",\"comments_limit\":\"5\",\"comments_word_limit\":\"10\",\"commenterName\":\"1\",\"commentAvatar\":\"1\",\"commentAvatarWidthSelect\":\"custom\",\"commentAvatarWidth\":\"50\",\"commentDate\":\"1\",\"commentDateFormat\":\"absolute\",\"commentLink\":\"1\",\"itemTitle\":\"1\",\"itemCategory\":\"1\",\"feed\":\"1\",\"commenters_limit\":\"5\",\"commenterNameOrUsername\":\"1\",\"commenterAvatar\":\"1\",\"commenterAvatarWidthSelect\":\"custom\",\"commenterAvatarWidth\":\"50\",\"commenterLink\":\"1\",\"commenterCommentsCounter\":\"1\",\"commenterLatestComment\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10051, 'K2 Content', 'module', 'mod_k2_content', '', 0, 1, 0, 0, '{\"name\":\"K2 Content\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_MOD_K2_CONTENT_DESCRIPTION\",\"group\":\"\"}', '{\"moduleclass_sfx\":\"\",\"getTemplate\":\"Default\",\"source\":\"filter\",\"\":\"K2_OTHER_OPTIONS\",\"catfilter\":\"0\",\"category_id\":\"\",\"getChildren\":\"0\",\"itemCount\":\"5\",\"itemsOrdering\":\"\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"\",\"items\":\"\",\"itemTitle\":\"1\",\"itemAuthor\":\"1\",\"itemAuthorAvatar\":\"1\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"1\",\"itemIntroText\":\"1\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"1\",\"itemImgSize\":\"Small\",\"itemVideo\":\"1\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemAttachments\":\"1\",\"itemTags\":\"1\",\"itemCategory\":\"1\",\"itemDateCreated\":\"1\",\"itemHits\":\"1\",\"itemReadMore\":\"1\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"1\",\"feed\":\"1\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10052, 'K2 Tools', 'module', 'mod_k2_tools', '', 0, 1, 0, 0, '{\"name\":\"K2 Tools\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_TOOLS\",\"group\":\"\"}', '{\"moduleclass_sfx\":\"\",\"module_usage\":\"0\",\"\":\"K2_CUSTOM_CODE_SETTINGS\",\"archiveItemsCounter\":\"1\",\"archiveCategory\":\"\",\"authors_module_category\":\"\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"1\",\"root_id2\":\"\",\"catfilter\":\"0\",\"category_id\":\"\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":\"0\",\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `cms_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10053, 'K2 Users', 'module', 'mod_k2_users', '', 0, 1, 0, 0, '{\"name\":\"K2 Users\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_MOD_K2_USERS_DESCRTIPTION\",\"group\":\"\"}', '{\"moduleclass_sfx\":\"\",\"getTemplate\":\"Default\",\"source\":\"0\",\"\":\"K2_DISPLAY_OPTIONS\",\"filter\":\"1\",\"K2UserGroup\":\"\",\"ordering\":\"1\",\"limit\":\"4\",\"userIDs\":\"\",\"userName\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"userDescription\":\"1\",\"userDescriptionWordLimit\":\"\",\"userURL\":\"1\",\"userEmail\":\"0\",\"userFeed\":\"1\",\"userItemCount\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10054, 'K2 User', 'module', 'mod_k2_user', '', 0, 1, 0, 0, '{\"name\":\"K2 User\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_MOD_K2_USER_DESCRIPTION\",\"group\":\"\"}', '{\"moduleclass_sfx\":\"\",\"pretext\":\"\",\"\":\"K2_LOGIN_LOGOUT_REDIRECTION\",\"name\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"menu\":\"\",\"login\":\"\",\"logout\":\"\",\"usesecure\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10055, 'K2 Quick Icons (admin)', 'module', 'mod_k2_quickicons', '', 1, 1, 2, 0, '{\"name\":\"K2 Quick Icons (admin)\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_QUICKICONS_FOR_USE_IN_THE_JOOMLA_CONTROL_PANEL_DASHBOARD_PAGE\",\"group\":\"\"}', '{\"modCSSStyling\":\"1\",\"modLogo\":\"1\",\"cache\":\"0\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10056, 'K2 Stats (admin)', 'module', 'mod_k2_stats', '', 1, 1, 2, 0, '{\"name\":\"K2 Stats (admin)\",\"type\":\"module\",\"creationDate\":\"February 28th, 2014\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2014 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"please-use-the-contact-form@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.8\",\"description\":\"K2_STATS_FOR_USE_IN_THE_K2_DASHBOARD_PAGE\",\"group\":\"\"}', '{\"latestItems\":\"1\",\"popularItems\":\"1\",\"mostCommentedItems\":\"1\",\"latestComments\":\"1\",\"statistics\":\"1\",\"cache\":\"0\",\"cache_time\":\"900\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10057, 'mod_fabrik_form', 'module', 'mod_fabrik_form', '', 0, 1, 0, 0, '{\"name\":\"mod_fabrik_form\",\"type\":\"module\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"MOD_FABRIK_FORM_XML_DESCRIPTION\",\"group\":\"\"}', '{\"formid\":\"0\",\"row_id\":\"0\",\"usekey\":\"\",\"template\":\"default\",\"formmodule_useajax\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10058, 'mod_fabrik_list', 'module', 'mod_fabrik_list', '', 0, 1, 0, 0, '{\"name\":\"mod_fabrik_list\",\"type\":\"module\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"MOD_FABRIK_LIST_XML_DESCRIPTION\",\"group\":\"\"}', '{\"useajax\":\"0\",\"ajax_links\":\"\",\"radomizerecords\":\"0\",\"limit\":\"0\",\"show_nav\":\"\",\"fabriklayout\":\"\",\"show-title\":\"\",\"show_into\":\"1\",\"show_outro\":\"1\",\"show_filters\":\"1\",\"resetfilters\":\"0\",\"clearfilters\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10059, 'plg_fabrik_system', 'plugin', 'fabrik', 'system', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_system\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Fabrikar.com\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.pollen-8.co.uk\",\"version\":\"3.2\",\"description\":\"PLG_FABRIK_SYSTEM_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10060, 'plg_fabrik', 'plugin', 'fabrik', 'content', 0, 1, 1, 0, '{\"name\":\"plg_fabrik\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Pollen 8 Design Ltd\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FABRIK_DESCRIPTION\",\"group\":\"\"}', '{\"botRegex\":\"fabrik\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10061, 'plg_fabrik_cron_email', 'plugin', 'email', 'fabrik_cron', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_cron_email\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FABRIK_CRON_EMAIL_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10062, 'plg_fabrik_cron_php', 'plugin', 'php', 'fabrik_cron', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_cron_php\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FABRIK_CRON_PHP_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10063, 'plg_fabrik_element_button', 'plugin', 'button', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_button\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_BUTTON_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10064, 'plg_fabrik_element_checkbox', 'plugin', 'checkbox', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_checkbox\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_CHECKBOX_DESCRIPTION\",\"group\":\"\"}', '{\"defaultFieldType\":\"TEXT\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10065, 'plg_fabrik_element_databasejoin', 'plugin', 'databasejoin', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_databasejoin\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_DATABASEJOIN_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10066, 'plg_fabrik_element_date', 'plugin', 'date', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_date\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_DATE_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10067, 'plg_fabrik_element_display', 'plugin', 'display', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_display\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Hugh Messenger\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_DISPLAY_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10068, 'plg_fabrik_element_dropdown', 'plugin', 'dropdown', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_dropdown\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_DROPDOWN_DESCRIPTION\",\"group\":\"\"}', '{\"defaultFieldType\":\"TEXT\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10069, 'plg_fabrik_element_field', 'plugin', 'field', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_field\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_FIELD_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10070, 'plg_fabrik_element_fileupload', 'plugin', 'fileupload', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_fileupload\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_FILEUPLOAD_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10071, 'plg_fabrik_element_googlemap', 'plugin', 'googlemap', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_googlemap\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_GOOGLEMAP_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10072, 'plg_fabrik_element_image', 'plugin', 'image', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_image\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_IMAGE_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10073, 'plg_fabrik_element_internalid', 'plugin', 'internalid', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_internalid\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_INTERNALID_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10074, 'plg_fabrik_element_link', 'plugin', 'link', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_link\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_LINK_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10075, 'plg_fabrik_element_radiobutton', 'plugin', 'radiobutton', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_radiobutton\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_RADIOBUTTON_DESCRIPTION\",\"group\":\"\"}', '{\"defaultFieldType\":\"TEXT\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10076, 'plg_fabrik_element_textarea', 'plugin', 'textarea', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_textarea\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_TEXTAREA_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10077, 'plg_fabrik_element_user', 'plugin', 'user', 'fabrik_element', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_element_user\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_ELEMENT_USER_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10078, 'plg_fabrik_form_email', 'plugin', 'email', 'fabrik_form', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_form_email\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FORM_EMAIL_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10079, 'plg_fabrik_form_php', 'plugin', 'php', 'fabrik_form', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_form_php\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FORM_PHP_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10080, 'plg_fabrik_form_receipt', 'plugin', 'receipt', 'fabrik_form', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_form_receipt\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FORM_RECEIPT_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10081, 'plg_fabrik_form_redirect', 'plugin', 'redirect', 'fabrik_form', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_form_redirect\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_FORM_REDIRECT_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10082, 'plg_fabrik_list_copy', 'plugin', 'copy', 'fabrik_list', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_list_copy\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_LIST_COPY_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10083, 'plg_fabrik_list_php', 'plugin', 'php', 'fabrik_list', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_list_php\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_LIST_PHP_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10084, 'plg_fabrik_validationrule_isgreaterorlessthan', 'plugin', 'isgreaterorlessthan', 'fabrik_validationrule', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_validationrule_isgreaterorlessthan\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VALIDATIONRULE_ISGREATERORLESSTHAN_DESCRIPTION\",\"group\":\"\"}', '{\"icon\":\"star\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10085, 'plg_fabrik_validationrule_notempty', 'plugin', 'notempty', 'fabrik_validationrule', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_validationrule_notempty\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VALIDATIONRULE_NOTEMPTY_DESCRIPTION\",\"group\":\"\"}', '{\"icon\":\"eye-open\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10086, 'plg_fabrik_validationrule_php', 'plugin', 'php', 'fabrik_validationrule', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_validationrule_php\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Hugh Messenger\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"hugh.messenger@gmail.com\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VALIDATIONRULE_PHP_DESCRIPTION\",\"group\":\"\"}', '{\"icon\":\"star\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10087, 'plg_fabrik_validationrule_regex', 'plugin', 'regex', 'fabrik_validationrule', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_validationrule_regex\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VALIDATIONRULE_REGEX_DESCRIPTION\",\"group\":\"\"}', '{\"icon\":\"star\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10088, 'plg_fabrik_validationrule_isemail', 'plugin', 'isemail', 'fabrik_validationrule', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_validationrule_isemail\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VALIDATIONRULE_ISEMAIL_DESCRIPTION\",\"group\":\"\"}', '{\"icon\":\"envelope\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10089, 'plg_fabrik_visualization_calendar', 'plugin', 'calendar', 'fabrik_visualization', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_visualization_calendar\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VISUALIZATION_CALENDAR_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10090, 'plg_fabrik_visualization_chart', 'plugin', 'chart', 'fabrik_visualization', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_visualization_chart\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VISUALIZATION_CHART_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10091, 'plg_fabrik_visualization_googlemap', 'plugin', 'googlemap', 'fabrik_visualization', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_visualization_googlemap\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VISUALIZATION_GOOGLEMAP_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10092, 'plg_fabrik_visualization_media', 'plugin', 'media', 'fabrik_visualization', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_visualization_media\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Hugh Messenger\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"hugh.messenger@gmail.com\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VISUALIZATION_MEDIA_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10093, 'plg_fabrik_visualization_slideshow', 'plugin', 'slideshow', 'fabrik_visualization', 0, 1, 1, 0, '{\"name\":\"plg_fabrik_visualization_slideshow\",\"type\":\"plugin\",\"creationDate\":\"August 2014\",\"author\":\"Hugh Messenger\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"hugh.messenger@gmail.com\",\"authorUrl\":\"www.fabrikar.com\",\"version\":\"3.2\",\"description\":\"PLG_VISUALIZATION_SLIDESHOW_DESCRIPTION\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10094, 'com_fabrik', 'component', 'com_fabrik', '', 1, 1, 0, 0, '{\"name\":\"com_fabrik\",\"type\":\"component\",\"creationDate\":\"August 2014\",\"author\":\"Rob Clayburn\",\"copyright\":\"Copyright (C) 2005-2014 fabrikar.com - All rights reserved.\",\"authorEmail\":\"rob@pollen-8.co.uk\",\"authorUrl\":\"www.pollen-8.co.uk\",\"version\":\"3.2\",\"description\":\"COM_FABRIK_XML_DESCRIPTION\",\"group\":\"\"}', '{\"enable_big_selects\":\"0\",\"google_api_key\":\"\",\"google_buisness_client_id\":\"\",\"google_buisness_signature\":\"\",\"unpublish_clones\":\"0\",\"fbConf_alter_existing_db_cols\":\"1\",\"filter_build_method\":\"1\",\"filter_list_max\":\"100\",\"enable_single_sorting\":\"0\",\"user_elements_as_related_data\":\"0\",\"list_pdf\":\"0\",\"actionMethod\":\"floating\",\"int\":\"field\",\"decimal\":\"field\",\"tinyint\":\"field\",\"smallint\":\"field\",\"mediumint\":\"field\",\"bigint\":\"field\",\"varchar\":\"field\",\"text\":\"textarea\",\"tinytext\":\"textarea\",\"mediumtext\":\"textarea\",\"longtext\":\"textarea\",\"datetime\":\"date\",\"date\":\"date\",\"timestamp\":\"date\",\"time\":\"field\",\"spoofcheck_on_formsubmission\":\"1\",\"fbConf_wysiwyg_label\":\"0\",\"form_print\":\"0\",\"form_email\":\"0\",\"form_pdf\":\"0\",\"error_icon\":\"warning\",\"use_mediabox\":\"0\",\"mediabox_style\":\"Dark\",\"include_lightbox_js\":\"1\",\"tipfx\":\"linear\",\"tipfx_ease\":\"easeIn\",\"tipfx_duration\":\"500\",\"tipfx_distance\":\"50\",\"tipfx_fadein\":\"0\",\"autocomplete_min_trigger_chars\":\"1\",\"requirejs_base_uri\":\"\",\"use_fabrikdebug\":\"0\",\"pdf_debug\":\"0\",\"fabrik_sef_prepend_menu_title\":\"0\",\"fabrik_sef_tablename_on_forms\":\"0\",\"fabrik_sef_format_records\":\"param_id\",\"fabrik_sef_customtxt_form\":\"\",\"fabrik_sef_customtxt_new\":\"\",\"fabrik_sef_customtxt_edit\":\"\",\"fabrik_sef_customtxt_details\":\"\",\"fabrik_sef_customtxt_own\":\"\",\"fabrik_sef_format_viz\":\"param_id\",\"fabrik_sef_customtxt_viz\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10095, 'fabrik', 'package', 'pkg_fabrik', '', 0, 1, 1, 0, '{\"name\":\"Fabrik Package\",\"type\":\"package\",\"creationDate\":\"August 2014\",\"author\":\"Fabrik\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"3.2\",\"description\":\"Fabrik Package\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10096, 'HLI', 'template', 'hli', '', 0, 1, 1, 0, '{\"name\":\"HLI\",\"type\":\"template\",\"creationDate\":\"10\\/12\\/2013\",\"author\":\"Tomasz Herudzinski 7Studio\",\"copyright\":\"Copyright (C) 2008 - 2014 Tomasz Herudzinski 7Studio\",\"authorEmail\":\"info@7studio.eu\",\"authorUrl\":\"\",\"version\":\"1.2\",\"description\":\" <h2 style=\\\"color:#000000;\\\">HLI Template ver. 1.2.0<\\/h2><p>HLI is a minimal, flexible, fully responsive template for Joomla! 3.X CMS, designed and developed by <a href=\\\"http:\\/\\/www.7studio.eu\\\" target=\\\"_blank\\\">7Studio<\\/a>.<\\/p><p> Available for purchase exclusively at <a href=\\\"http:\\/\\/themeforest.net\\/user\\/7Studio\\\" target=\\\"_blank\\\">ThemeForest<\\/a>.<\\/p><p>If you need help related to this Template, please contact us directly at <a href=\\\"http:\\/\\/themeforest.net\\/user\\/7Studio\\\" target=\\\"_blank\\\">ThemeForest<\\/a><\\/p>.\\n\\t\",\"group\":\"\"}', '{\"logoFile\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"logoMarginTop\":\"70\",\"logoMarginBottom\":\"50\",\"templateStyle\":\"1\",\"templateBodyColor\":\"#808080\",\"templateBackgroundColor\":\"#dedede\",\"customColors\":\"0\",\"linkColor\":\"#6ba60f\",\"accentColor\":\"#7bb421\",\"lightAccentColor\":\"#e1eecd\",\"backgroundImage\":\"0\",\"templateBackgroundImage\":\"\",\"backgroundImageRepeat\":\"no-repeat\",\"backgroundImagePosition\":\"center top\",\"backgroundAttachment\":\"scroll\",\"bodyFont\":\"helvetica\",\"bodyFontSize\":\"14\",\"headingsFont\":\"helvetica\",\"googleFonts\":\"0\",\"googleFontName\":\"\",\"googleFontSelectors\":\"\",\"googleFontsSecond\":\"0\",\"googleFontNameSecond\":\"\",\"googleFontSelectorsSecond\":\"\",\"templateWidth\":\"1000\",\"templatePadding\":\"50\",\"sidebarLeftWidth\":\"3\",\"sidebarRightWidth\":\"3\",\"menuMarginTop\":\"96\",\"submenuWidth\":\"225\",\"topaModules\":\"st_style\",\"topbModules\":\"st_style\",\"maintopaModules\":\"st_style\",\"maintopbModules\":\"st_style\",\"mainbottomaModules\":\"st_style\",\"mainbottombModules\":\"st_style\",\"bottomaModules\":\"st_style\",\"bottombModules\":\"st_style\",\"userLogin\":\"1\",\"loginText\":\"Login\",\"logoutText\":\"Logout\",\"userRegistration\":\"1\",\"registerText\":\"Register\",\"profileText\":\"Profile\",\"templateFavicon\":\"\",\"toTop\":\"1\",\"copyrights\":\"1\",\"copyrightsText\":\"\",\"googleAnalitycs\":\"0\",\"googleAnalitycsCode\":\"\",\"socialIcons\":\"0\",\"linkTwitter\":\"\",\"linkFacebook\":\"\",\"linkDribbble\":\"\",\"linkSkype\":\"\",\"linkGooglePlus\":\"\",\"linkFlickr\":\"\",\"linkYoutube\":\"\",\"linkVimeo\":\"\",\"linkLinkedIn\":\"\",\"templateResponsive\":\"1\",\"titleSpans\":\"1\",\"k2CSS\":\"1\",\"customCSS\":\"0\",\"customCSScode\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10097, 'Hellenic', 'language', 'el-GR', '', 0, 1, 0, 0, '{\"name\":\"Hellenic\",\"type\":\"language\",\"creationDate\":\"2014-07-30\",\"author\":\"Greek translation team : joomla.gr\",\"copyright\":\"Copyright (C) 2005 - 2013 joomla.gr \\u03ba\\u03b1\\u03b9 Open Source Matters. All rights reserved.\",\"authorEmail\":\"joomla@joomla.gr\",\"authorUrl\":\"http:\\/\\/www.joomla.gr\",\"version\":\"3.3.3.1\",\"description\":\"Greek language pack for Joomla! 3.3.3\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10098, 'Greek', 'language', 'el-GR', '', 1, 1, 0, 0, '{\"name\":\"Greek\",\"type\":\"language\",\"creationDate\":\"2014-07-30\",\"author\":\"Greek translation team : joomla.gr\",\"copyright\":\"Copyright (C) 2005 - 2013 joomla.gr \\u03ba\\u03b1\\u03b9 Open Source Matters. All rights reserved.\",\"authorEmail\":\"joomla@joomla.gr\",\"authorUrl\":\"http:\\/\\/www.joomla.gr\",\"version\":\"3.3.3.1\",\"description\":\"Greek language pack for Joomla! 3.3.3\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10099, 'el-GR', 'package', 'pkg_el-GR', '', 0, 1, 1, 0, '{\"name\":\"Greek Language Pack\",\"type\":\"package\",\"creationDate\":\"2014-07-30\",\"author\":\"Greek translation team : joomla.gr\",\"copyright\":\"Copyright (C) 2005 - 2013 joomla.gr \\u03ba\\u03b1\\u03b9 Open Source Matters. All rights reserved.\",\"authorEmail\":\"joomla@joomla.gr\",\"authorUrl\":\"http:\\/\\/www.joomla.gr\",\"version\":\"3.3.3.1\",\"description\":\"Greek language pack for Joomla! 3.3.3 - \\u0391\\u03c1\\u03c7\\u03b5\\u03af\\u03b1 \\u03b5\\u03bb\\u03bb\\u03b7\\u03bd\\u03b9\\u03ba\\u03ae\\u03c2 \\u03b3\\u03bb\\u03ce\\u03c3\\u03c3\\u03b1\\u03c2 \\u03b3\\u03b9\\u03b1 \\u03c4\\u03b7\\u03bd \\u03ad\\u03ba\\u03b4\\u03bf\\u03c3\\u03b7 Joomla! 3.3.3 \\u03b1\\u03c0\\u03cc \\u03c4\\u03b7\\u03bd \\u03bf\\u03bc\\u03ac\\u03b4\\u03b1 \\u03c4\\u03bf\\u03c5 joomla.gr\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10100, 'DirectPHP', 'plugin', 'DirectPHP', 'content', 0, 0, 1, 0, '{\"name\":\"DirectPHP\",\"type\":\"plugin\",\"creationDate\":\"Oct 2011\",\"author\":\"kksou\",\"copyright\":\"(C) kksou.com. All Rights Reserved.\",\"authorEmail\":\"support@kksou.com\",\"authorUrl\":\"www.kksou.com\\/php-gtk2\\/\",\"version\":\"3.0\",\"description\":\"This plugin allows direct embedding of PHP commands right inside Joomla content page for dynamic contents. To see examples of using this plugin, please refer to: http:\\/\\/www.kksou.com\\/php-gtk2\\/Joomla\\/DirectPHP-plugin.php\",\"group\":\"\"}', '{\"using_no_editor\":\"0\",\"block_list\":\"basename, chgrp, chmod, chown, clearstatcache, copy, delete, dirname, disk_free_space, disk_total_space, diskfreespace, fclose, feof, fflush, fgetc, fgetcsv, fgets, fgetss, file_exists, file_get_contents, file_put_contents, file, fileatime, filectime, filegroup, fileinode, filemtime, fileowner, fileperms, filesize, filetype, flock, fnmatch, fopen, fpassthru, fputcsv, fputs, fread, fscanf, fseek, fstat, ftell, ftruncate, fwrite, glob, lchgrp, lchown, link, linkinfo, lstat, move_uploaded_file, opendir, parse_ini_file, pathinfo, pclose, popen, readfile, readdir, readllink, realpath, rename, rewind, rmdir, set_file_buffer, stat, symlink, tempnam, tmpfile, touch, umask, unlink, fsockopen, system, exec, passthru, escapeshellcmd, pcntl_exec, proc_open, proc_close, mkdir, rmdir\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10101, 'PLG_SYSTEM_NNFRAMEWORK', 'plugin', 'nnframework', 'system', 0, 1, 1, 0, '{\"name\":\"PLG_SYSTEM_NNFRAMEWORK\",\"type\":\"plugin\",\"creationDate\":\"October 2014\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2014 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"http:\\/\\/www.nonumber.nl\",\"version\":\"14.10.7\",\"description\":\"PLG_SYSTEM_NNFRAMEWORK_DESC\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10102, 'PLG_SYSTEM_SOURCERER', 'plugin', 'sourcerer', 'system', 0, 1, 1, 0, '{\"name\":\"PLG_SYSTEM_SOURCERER\",\"type\":\"plugin\",\"creationDate\":\"October 2014\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2014 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"http:\\/\\/www.nonumber.nl\",\"version\":\"4.4.6FREE\",\"description\":\"PLG_SYSTEM_SOURCERER_DESC\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10103, 'PLG_EDITORS-XTD_SOURCERER', 'plugin', 'sourcerer', 'editors-xtd', 0, 0, 1, 0, '{\"name\":\"PLG_EDITORS-XTD_SOURCERER\",\"type\":\"plugin\",\"creationDate\":\"October 2014\",\"author\":\"NoNumber (Peter van Westen)\",\"copyright\":\"Copyright \\u00a9 2014 NoNumber All Rights Reserved\",\"authorEmail\":\"peter@nonumber.nl\",\"authorUrl\":\"http:\\/\\/www.nonumber.nl\",\"version\":\"4.4.6FREE\",\"description\":\"PLG_EDITORS-XTD_SOURCERER_DESC\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10109, '_jw_allvideos', 'plugin', '_jw_allvideos', 'content', 0, 1, 1, 0, '{\"name\":\"AllVideos (by JoomlaWorks)\",\"type\":\"plugin\",\"creationDate\":\"February 27th, 2013\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"4.5.0\",\"description\":\"JW_PLG_AV_XML_DESC\",\"group\":\"\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10110, 'definitions', 'plugin', 'definitions', 'josetta_ext', 0, 1, 1, 0, 'false', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10111, 'fields_common', 'plugin', 'fields_common', 'josetta_ext', 0, 1, 1, 0, 'false', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10112, 'definitions', 'plugin', 'definitions', 'josetta_ext', 0, 1, 1, 0, 'false', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10113, 'fields_common', 'plugin', 'fields_common', 'josetta_ext', 0, 1, 1, 0, 'false', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10126, 'Content - Simple Pop-Up', 'plugin', 'simplepopup', 'content', 0, 1, 1, 0, '{\"name\":\"Content - Simple Pop-Up\",\"type\":\"plugin\",\"creationDate\":\"2011-05-14\",\"author\":\"Anders Was\\u00e9n\",\"copyright\":\"Copyright 2011 (C) Anders Was\\u00e9n. All rights reserved.\",\"authorEmail\":\"awasen@gmail.com\",\"authorUrl\":\"http:\\/\\/wasen.net\",\"version\":\"2.1\",\"description\":\"Simple Pop-Up - It will display a FancyBox Pop-Up on any page where added in an article...\",\"group\":\"\"}', '{\"spu_aligntext\":\"center\",\"spu_boxwidth\":\"400\",\"spu_boxheight\":\"auto\",\"spu_autodimensions\":\"false\",\"spu_cookie\":\"0\",\"spu_style\":\"fancybox\",\"spu_lblimage\":\"Image # of #\",\"spu_lblclose\":\"CLOSE\",\"spu_showlblimage\":\"1\",\"spu_showpdfdl\":\"0\",\"spu_jqueryinclude\":\"0\",\"spu_jquery\":\"0\",\"upload_jqueryver\":\"1.7.2\",\"upload_jqueryj3\":\"1\",\"spu_debug\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_connections`
--

CREATE TABLE `cms_fabrik_connections` (
  `id` int(6) NOT NULL,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `default` int(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_connections`
--

INSERT INTO `cms_fabrik_connections` (`id`, `host`, `user`, `password`, `database`, `description`, `published`, `checked_out`, `checked_out_time`, `default`, `params`) VALUES
(1, 'localhost', 'col10127_user', '25402D36 6572E502F 02574', 'col10127_harvester', 'site database', 1, 0, '0000-00-00 00:00:00', 1, '{\"encryptedPw\":true}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_cron`
--

CREATE TABLE `cms_fabrik_cron` (
  `id` int(6) NOT NULL,
  `label` varchar(100) NOT NULL,
  `frequency` smallint(6) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(6) NOT NULL,
  `created_by_alias` varchar(30) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` varchar(30) NOT NULL,
  `checked_out` int(6) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `lastrun` datetime NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_elements`
--

CREATE TABLE `cms_fabrik_elements` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `group_id` int(4) NOT NULL,
  `plugin` varchar(100) NOT NULL,
  `label` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `width` int(4) NOT NULL,
  `height` int(4) NOT NULL DEFAULT '0',
  `default` text NOT NULL,
  `hidden` int(1) NOT NULL,
  `eval` int(1) NOT NULL,
  `ordering` int(4) NOT NULL,
  `show_in_list_summary` int(1) DEFAULT NULL,
  `filter_type` varchar(20) DEFAULT NULL,
  `filter_exact_match` int(1) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `link_to_detail` int(1) NOT NULL DEFAULT '0',
  `primary_key` int(1) NOT NULL DEFAULT '0',
  `auto_increment` int(1) NOT NULL DEFAULT '0',
  `access` int(1) NOT NULL DEFAULT '0',
  `use_in_page_title` int(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(6) NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_elements`
--

INSERT INTO `cms_fabrik_elements` (`id`, `name`, `group_id`, `plugin`, `label`, `checked_out`, `checked_out_time`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `width`, `height`, `default`, `hidden`, `eval`, `ordering`, `show_in_list_summary`, `filter_type`, `filter_exact_match`, `published`, `link_to_detail`, `primary_key`, `auto_increment`, `access`, `use_in_page_title`, `parent_id`, `params`) VALUES
(1, 'id', 1, 'internalid', 'id', 0, '0000-00-00 00:00:00', '2014-11-05 20:27:49', 488, 'admin', '2014-11-05 21:12:05', 488, 3, 0, '', 1, 0, 1, 0, '', 1, 1, 1, 1, 1, 1, 0, 0, '{\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"5\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"5\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"5\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"5\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(2, 'date_time', 1, 'date', 'Ημερομηνία', 0, '0000-00-00 00:00:00', '2014-11-05 20:27:49', 488, 'admin', '2018-05-12 08:53:28', 488, 0, 0, '', 1, 0, 2, 0, '', 1, 1, 1, 0, 0, 1, 0, 0, '{\"bootstrap_class\":\"input-large\",\"date_showtime\":\"0\",\"date_time_format\":\"H:i\",\"bootstrap_time_class\":\"input-medium\",\"date_store_as_local\":\"0\",\"date_table_format\":\"d-m-Y\",\"date_form_format\":\"d-m-Y\",\"date_defaulttotoday\":\"1\",\"date_alwaystoday\":\"0\",\"date_firstday\":\"0\",\"date_allow_typing_in_field\":\"1\",\"date_csv_offset_tz\":\"0\",\"date_advanced\":\"0\",\"date_allow_func\":\"\",\"date_allow_php_func\":\"\",\"date_observe\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"5\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"5\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"5\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"5\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(171, 'notify_temp_min', 26, 'field', 'Ελάχιστη θερμοκρασία ειδοποίησης (°C)', 0, '0000-00-00 00:00:00', '2018-05-12 09:00:50', 488, 'admin', '2018-05-12 09:42:42', 488, 0, 0, '', 0, 0, 1, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"decimal\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"notempty-message\":[\"\\u03a4\\u03bf \\u03c0\\u03b5\\u03b4\\u03af\\u03bf \\u03b5\\u03af\\u03bd\\u03b1\\u03b9 \\u03c5\\u03c0\\u03bf\\u03c7\\u03c1\\u03b5\\u03c9\\u03c4\\u03b9\\u03ba\\u03cc!\"],\"notempty-validation_condition\":[\"\"],\"tip_text\":[\"\"],\"validations\":{\"plugin\":[\"notempty\"],\"plugin_published\":[\"1\"],\"validate_in\":[\"both\"],\"validation_on\":[\"both\"],\"show_icon\":[\"1\"]}}'),
(172, 'notify_temp_max', 26, 'field', 'Μέγιστη θερμοκρασία ειδοποίησης (°C)', 0, '0000-00-00 00:00:00', '2018-05-12 09:01:47', 488, 'admin', '2018-05-12 09:43:40', 488, 0, 0, '', 0, 0, 2, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"decimal\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"notempty-message\":[\"\\u03a4\\u03bf \\u03c0\\u03b5\\u03b4\\u03af\\u03bf \\u03b5\\u03af\\u03bd\\u03b1\\u03b9 \\u03c5\\u03c0\\u03bf\\u03c7\\u03c1\\u03b5\\u03c9\\u03c4\\u03b9\\u03ba\\u03cc!\"],\"notempty-validation_condition\":[\"\"],\"tip_text\":[\"\"],\"validations\":{\"plugin\":[\"notempty\"],\"plugin_published\":[\"1\"],\"validate_in\":[\"both\"],\"validation_on\":[\"both\"],\"show_icon\":[\"1\"]}}'),
(175, 'temp', 1, 'field', 'Θερμοκρασία', 0, '0000-00-00 00:00:00', '2018-05-12 17:46:28', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 6, 0, '', 1, 0, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(176, 'humidity', 1, 'field', 'Υγρασία', 0, '0000-00-00 00:00:00', '2018-05-12 17:47:02', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 7, 0, '', 1, 0, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(177, 'battery', 1, 'field', 'Μπαταρία', 0, '0000-00-00 00:00:00', '2018-05-12 17:47:26', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 8, 0, '', 1, 0, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(180, 'sensor_time', 1, 'field', 'Ημερομηνία Αισθητήρα', 0, '0000-00-00 00:00:00', '2018-05-12 17:50:52', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 10, 0, '', 1, 0, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(179, 'server_time', 1, 'field', 'Ημερομηνία API', 0, '0000-00-00 00:00:00', '2018-05-12 17:49:14', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 9, 0, '', 1, 0, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(173, 'device_id', 1, 'field', 'Αναγνωριστικό Συσκευής', 0, '0000-00-00 00:00:00', '2018-05-12 15:25:49', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 4, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"notempty-message\":[\"\\u03a4\\u03bf \\u03c0\\u03b5\\u03b4\\u03af\\u03bf \\u03b5\\u03af\\u03bd\\u03b1\\u03b9 \\u03c5\\u03c0\\u03bf\\u03c7\\u03c1\\u03b5\\u03c9\\u03c4\\u03b9\\u03ba\\u03cc!\"],\"notempty-validation_condition\":[\"\"],\"tip_text\":[\"\"],\"validations\":{\"plugin\":[\"notempty\"],\"plugin_published\":[\"1\"],\"validate_in\":[\"both\"],\"validation_on\":[\"both\"],\"show_icon\":[\"1\"]}}'),
(167, 'location_details', 1, 'textarea', 'Περιγραφή', 0, '0000-00-00 00:00:00', '2018-05-12 08:53:11', 488, 'admin', '2018-05-12 09:06:55', 488, 0, 0, '', 0, 0, 5, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"bootstrap_class\":\"input-xlarge\",\"width\":\"60\",\"height\":\"6\",\"textarea_showlabel\":\"1\",\"textarea_placeholder\":\"\",\"use_wysiwyg\":\"0\",\"wysiwyg_extra_buttons\":\"1\",\"textarea-showmax\":\"0\",\"textarea-maxlength\":\"255\",\"textarea_limit_type\":\"char\",\"textarea-tagify\":\"0\",\"textarea_tagifyurl\":\"\",\"textarea-truncate-where\":\"0\",\"textarea-truncate\":\"0\",\"textarea-hover\":\"1\",\"textarea_hover_location\":\"top\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(163, 'post_date', 24, 'field', '', 0, '0000-00-00 00:00:00', '2018-01-11 14:14:57', 488, 'admin', '0000-00-00 00:00:00', 0, 0, 0, '', 1, 0, 5, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"1\",\"readonly\":\"1\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"notempty-message\":[\"\"],\"notempty-validation_condition\":[\"\"],\"tip_text\":[\"\"],\"validations\":{\"plugin\":[\"notempty\"],\"plugin_published\":[\"1\"],\"validate_in\":[\"both\"],\"validation_on\":[\"both\"],\"show_icon\":[\"1\"]}}'),
(162, 'selected_fuel_tank', 24, 'databasejoin', 'Επιλογή Δεξαμενής', 0, '0000-00-00 00:00:00', '2018-01-11 12:32:11', 488, 'admin', '2018-02-07 14:37:24', 488, 0, 0, '', 0, 0, 4, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"database_join_display_type\":\"dropdown\",\"join_conn_id\":\"1\",\"join_db_name\":\"custom_fuel_registry\",\"join_key_column\":\"tank_code\",\"join_val_column\":\"location\",\"join_val_column_concat\":\"\",\"database_join_where_sql\":\"\",\"database_join_where_access\":\"1\",\"database_join_where_when\":\"3\",\"database_join_join_sql\":\"\",\"database_join_show_please_select\":\"0\",\"database_join_noselectionvalue\":\"\",\"database_join_noselectionlabel\":\"\",\"databasejoin_popupform\":\"11\",\"fabrikdatabasejoin_frontend_add\":\"0\",\"join_popupwidth\":\"\",\"databasejoin_readonly_link\":\"0\",\"fabrikdatabasejoin_frontend_select\":\"0\",\"dbjoin_options_per_row\":\"4\",\"dbjoin_multilist_size\":\"6\",\"dbjoin_autocomplete_size\":\"20\",\"bootstrap_class\":\"input-large\",\"dabase_join_label_eval\":\"\",\"join_desc_column\":\"\",\"dbjoin_autocomplete_how\":\"contains\",\"clean_concat\":\"0\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(161, 'to_date', 24, 'date', 'Έως', 0, '0000-00-00 00:00:00', '2018-01-11 12:30:42', 488, 'admin', '2018-02-07 15:16:07', 488, 0, 0, '', 0, 0, 3, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"bootstrap_class\":\"input-medium\",\"date_showtime\":\"0\",\"date_time_format\":\"H:i\",\"bootstrap_time_class\":\"input-medium\",\"date_store_as_local\":\"0\",\"date_table_format\":\"d-m-Y\",\"date_form_format\":\"d-m-Y\",\"date_defaulttotoday\":\"0\",\"date_alwaystoday\":\"0\",\"date_firstday\":\"0\",\"date_allow_typing_in_field\":\"1\",\"date_csv_offset_tz\":\"0\",\"date_advanced\":\"0\",\"date_allow_func\":\"\",\"date_allow_php_func\":\"\",\"date_observe\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(160, 'from_date', 24, 'date', 'Από', 0, '0000-00-00 00:00:00', '2018-01-11 12:29:16', 488, 'admin', '2018-02-07 14:32:06', 488, 0, 0, '', 0, 0, 2, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"bootstrap_class\":\"input-medium\",\"date_showtime\":\"0\",\"date_time_format\":\"H:i\",\"bootstrap_time_class\":\"input-medium\",\"date_store_as_local\":\"0\",\"date_table_format\":\"d-m-Y\",\"date_form_format\":\"d-m-Y\",\"date_defaulttotoday\":\"0\",\"date_alwaystoday\":\"0\",\"date_firstday\":\"0\",\"date_allow_typing_in_field\":\"1\",\"date_csv_offset_tz\":\"0\",\"date_advanced\":\"0\",\"date_allow_func\":\"\",\"date_allow_php_func\":\"\",\"date_observe\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(159, 'report_type', 24, 'dropdown', 'Τύπος Αναφοράς', 0, '0000-00-00 00:00:00', '2018-01-11 12:27:41', 488, 'admin', '2018-02-07 14:36:43', 488, 0, 0, '', 0, 0, 1, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"sub_options\":{\"sub_values\":[\"current_fuel_volumes\",\"fuel_volumes_history\",\"fuel_consumption_history\"],\"sub_labels\":[\"\\u03a4\\u03c1\\u03ad\\u03c7\\u03bf\\u03c5\\u03c3\\u03b5\\u03c2 \\u03a3\\u03c4\\u03ac\\u03b8\\u03bc\\u03b5\\u03c2 \\u039a\\u03b1\\u03c5\\u03c3\\u03af\\u03bc\\u03bf\\u03c5\",\"\\u0399\\u03c3\\u03c4\\u03bf\\u03c1\\u03b9\\u03ba\\u03cc \\u03a3\\u03c4\\u03ac\\u03b8\\u03bc\\u03b5\\u03c9\\u03bd \\u039a\\u03b1\\u03c5\\u03c3\\u03af\\u03bc\\u03bf\\u03c5\",\"\\u0399\\u03c3\\u03c4\\u03bf\\u03c1\\u03b9\\u03ba\\u03cc \\u039a\\u03b1\\u03c4\\u03b1\\u03bd\\u03b1\\u03bb\\u03ce\\u03c3\\u03b5\\u03c9\\u03bd \\u039a\\u03b1\\u03c5\\u03c3\\u03af\\u03bc\\u03bf\\u03c5\"]},\"multiple\":\"0\",\"dropdown_multisize\":\"3\",\"allow_frontend_addtodropdown\":\"0\",\"dd-allowadd-onlylabel\":\"0\",\"dd-savenewadditions\":\"0\",\"options_split_str\":\"\",\"dropdown_populate\":\"\",\"bootstrap_class\":\"input-medium\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(115, 'mandate_file', 15, 'fileupload', 'Αρχείο Εντολής', 0, '0000-00-00 00:00:00', '2017-12-12 16:23:11', 488, 'admin', '2017-12-12 16:27:53', 488, 0, 0, '', 0, 0, 1, 0, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"ul_max_file_size\":\"2048\",\"ul_file_types\":\"\",\"ul_directory\":\"files\\/heating_oil_mandates\",\"ul_email_file\":\"0\",\"random_filename\":\"0\",\"length_random_filename\":\"8\",\"ul_file_increment\":\"1\",\"upload_allow_folderselect\":\"0\",\"upload_delete_image\":\"1\",\"default_image\":\"\",\"make_link\":\"1\",\"fu_show_image_in_table\":\"1\",\"fu_show_image\":\"0\",\"fu_show_image_in_email\":\"1\",\"image_library\":\"gd2\",\"fu_main_max_width\":\"448\",\"fu_main_max_height\":\"336\",\"fu_title_element\":\"\",\"restrict_lightbox\":\"1\",\"make_thumbnail\":\"0\",\"thumb_dir\":\"files\\/heating_oil_mandates\\/thumbs\",\"thumb_prefix\":\"th\",\"thumb_suffix\":\"\",\"thumb_max_width\":\"448\",\"thumb_max_height\":\"336\",\"fileupload_crop\":\"0\",\"fileupload_crop_dir\":\"images\\/stories\\/crop\",\"fileupload_crop_width\":\"200\",\"fileupload_crop_height\":\"100\",\"win_width\":\"400\",\"win_height\":\"400\",\"fileupload_storage_type\":\"filesystemstorage\",\"fileupload_aws_accesskey\":\"\",\"fileupload_aws_secretkey\":\"\",\"fileupload_aws_location\":\"\",\"fileupload_ssl\":\"0\",\"fileupload_aws_bucketname\":\"\",\"fileupload_s3_serverpath\":\"1\",\"fileupload_amazon_acl\":\"2\",\"fileupload_skip_check\":\"0\",\"fileupload_amazon_auth_url\":\"60\",\"ajax_upload\":\"0\",\"ajax_runtime\":\"html5,html4\",\"ajax_max\":\"4\",\"ajax_dropbox_width\":\"400\",\"ajax_dropbox_height\":\"200\",\"ajax_chunk_size\":\"0\",\"fu_use_download_script\":\"0\",\"fu_download_acl\":\"\",\"fu_download_noaccess_image\":\"\",\"fu_download_noaccess_url\":\"\",\"fu_download_access_image\":\"\",\"fu_download_hit_counter\":\"\",\"fu_download_log\":\"0\",\"ul_export_encode_csv\":\"relative\",\"ul_export_encode_json\":\"relative\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(169, 'location_y', 25, 'field', 'Y', 0, '0000-00-00 00:00:00', '2018-05-12 08:56:13', 488, 'admin', '2018-05-12 10:57:00', 488, 0, 0, '', 0, 0, 2, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"4\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(168, 'location_x', 25, 'field', 'X', 0, '0000-00-00 00:00:00', '2018-05-12 08:55:43', 488, 'admin', '2018-05-12 10:56:49', 488, 0, 0, '', 0, 0, 1, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"4\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}'),
(170, 'location_z', 25, 'field', 'Z', 0, '0000-00-00 00:00:00', '2018-05-12 08:57:12', 488, 'admin', '2018-05-12 10:57:11', 488, 0, 0, '', 0, 0, 3, 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"4\",\"field_use_number_format\":\"1\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"validations\":[]}');
INSERT INTO `cms_fabrik_elements` (`id`, `name`, `group_id`, `plugin`, `label`, `checked_out`, `checked_out_time`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `width`, `height`, `default`, `hidden`, `eval`, `ordering`, `show_in_list_summary`, `filter_type`, `filter_exact_match`, `published`, `link_to_detail`, `primary_key`, `auto_increment`, `access`, `use_in_page_title`, `parent_id`, `params`) VALUES
(166, 'location_name', 1, 'field', '\'Ονομα Τοποθεσίας', 0, '0000-00-00 00:00:00', '2018-05-12 08:52:13', 488, 'admin', '2018-05-12 10:58:02', 488, 0, 0, '', 0, 0, 3, 1, 'field', 0, 1, 0, 0, 0, 1, 0, 0, '{\"placeholder\":\"\",\"password\":\"0\",\"maxlength\":\"255\",\"disable\":\"0\",\"readonly\":\"0\",\"autocomplete\":\"1\",\"speech\":\"0\",\"bootstrap_class\":\"input-medium\",\"text_format\":\"text\",\"integer_length\":\"11\",\"decimal_length\":\"2\",\"field_use_number_format\":\"0\",\"field_thousand_sep\":\",\",\"field_decimal_sep\":\".\",\"text_format_string\":\"\",\"text_input_mask\":\"\",\"render_as_qrcode\":\"0\",\"guess_linktype\":\"0\",\"link_target_options\":\"default\",\"rel\":\"\",\"link_title\":\"\",\"show_in_rss_feed\":\"0\",\"show_label_in_rss_feed\":\"0\",\"use_as_rss_enclosure\":\"0\",\"rollover\":\"\",\"tipseval\":\"0\",\"tiplocation\":\"top-left\",\"labelindetails\":\"1\",\"labelinlist\":\"0\",\"comment\":\"\",\"edit_access\":\"1\",\"view_access\":\"1\",\"view_access_user\":\"\",\"list_view_access\":\"1\",\"encrypt\":\"0\",\"can_order\":\"0\",\"alt_list_heading\":\"\",\"custom_link\":\"\",\"custom_link_indetails\":\"1\",\"use_as_row_class\":\"0\",\"include_in_list_query\":\"1\",\"always_render\":\"0\",\"icon_folder\":\"0\",\"icon_hovertext\":\"1\",\"icon_file\":\"\",\"filter_length\":\"20\",\"filter_access\":\"1\",\"full_words_only\":\"0\",\"filter_required\":\"0\",\"filter_build_method\":\"0\",\"filter_groupby\":\"text\",\"inc_in_adv_search\":\"1\",\"filter_class\":\"input-medium\",\"filter_responsive_class\":\"\",\"tablecss_header_class\":\"\",\"tablecss_header\":\"\",\"tablecss_cell_class\":\"\",\"tablecss_cell\":\"\",\"sum_on\":\"0\",\"sum_label\":\"Sum\",\"sum_access\":\"1\",\"sum_split\":\"\",\"avg_on\":\"0\",\"avg_label\":\"Average\",\"avg_access\":\"1\",\"avg_round\":\"0\",\"avg_split\":\"\",\"median_on\":\"0\",\"median_label\":\"Median\",\"median_access\":\"1\",\"median_split\":\"\",\"count_on\":\"0\",\"count_label\":\"Count\",\"count_condition\":\"\",\"count_access\":\"1\",\"count_split\":\"\",\"custom_calc_on\":\"0\",\"custom_calc_label\":\"Custom\",\"custom_calc_query\":\"\",\"custom_calc_access\":\"1\",\"custom_calc_split\":\"\",\"custom_calc_php\":\"\",\"notempty-message\":[\"\\u03a4\\u03bf \\u03c0\\u03b5\\u03b4\\u03af\\u03bf \\u03b5\\u03af\\u03bd\\u03b1\\u03b9 \\u03c5\\u03c0\\u03bf\\u03c7\\u03c1\\u03b5\\u03c9\\u03c4\\u03b9\\u03ba\\u03cc!\"],\"notempty-validation_condition\":[\"\"],\"tip_text\":[\"\"],\"validations\":{\"plugin\":[\"notempty\"],\"plugin_published\":[\"1\"],\"validate_in\":[\"both\"],\"validation_on\":[\"both\"],\"show_icon\":[\"1\"]}}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_formgroup`
--

CREATE TABLE `cms_fabrik_formgroup` (
  `id` int(6) NOT NULL,
  `form_id` int(4) NOT NULL,
  `group_id` int(4) NOT NULL,
  `ordering` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_formgroup`
--

INSERT INTO `cms_fabrik_formgroup` (`id`, `form_id`, `group_id`, `ordering`) VALUES
(1, 1, 1, 1),
(25, 12, 24, 1),
(6, 1, 6, 3),
(27, 1, 26, 5),
(26, 1, 25, 4);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_forms`
--

CREATE TABLE `cms_fabrik_forms` (
  `id` int(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  `record_in_database` int(4) NOT NULL,
  `error` varchar(150) NOT NULL,
  `intro` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset_button_label` varchar(100) NOT NULL,
  `submit_button_label` varchar(100) NOT NULL,
  `form_template` varchar(255) DEFAULT NULL,
  `view_only_template` varchar(255) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_forms`
--

INSERT INTO `cms_fabrik_forms` (`id`, `label`, `record_in_database`, `error`, `intro`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset_button_label`, `submit_button_label`, `form_template`, `view_only_template`, `published`, `private`, `params`) VALUES
(1, 'Μητρώο Τοποθεσιών', 1, 'Some parts of your form have not been correctly filled in', '', '2014-11-05 00:00:00', 488, 'admin', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Reset', 'ΑΠΟΘΗΚΕΥΣΗ', 'bootstrap_tabs', 'bootstrap_tabs', 1, 0, '{\"outro\":\"\",\"copy_button\":\"0\",\"copy_button_label\":\"Save as copy\",\"copy_icon\":\"\",\"copy_icon_location\":\"before\",\"reset_button\":\"0\",\"reset_button_label\":\"Reset\",\"reset_icon\":\"\",\"reset_icon_location\":\"before\",\"apply_button\":\"0\",\"apply_button_label\":\"Apply\",\"apply_icon\":\"\",\"apply_icon_location\":\"before\",\"goback_button\":\"1\",\"goback_button_label\":\"\\u0395\\u03a0\\u0399\\u03a3\\u03a4\\u03a1\\u039f\\u03a6\\u0397 \\/ \\u0391\\u039a\\u03a5\\u03a1\\u03a9\\u03a3\\u0397\",\"goback_icon\":\"\",\"goback_icon_location\":\"before\",\"submit_button\":\"1\",\"submit_button_label\":\"\\u0391\\u03a0\\u039f\\u0398\\u0397\\u039a\\u0395\\u03a5\\u03a3\\u0397\",\"save_icon\":\"\",\"save_icon_location\":\"before\",\"submit_on_enter\":\"0\",\"delete_button\":\"0\",\"delete_button_label\":\"\\u0394\\u0399\\u0391\\u0393\\u03a1\\u0391\\u03a6\\u0397\",\"delete_icon\":\"\",\"delete_icon_location\":\"before\",\"ajax_validations\":\"0\",\"submit-success-msg\":\"\",\"suppress_msgs\":\"0\",\"show_loader_on_submit\":\"0\",\"spoof_check\":\"1\",\"multipage_save\":\"0\",\"note\":\"\",\"labels_above\":\"0\",\"labels_above_details\":\"0\",\"pdf_template\":\"\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"letter\",\"admin_form_template\":\"\",\"admin_details_template\":\"\",\"show-title\":\"0\",\"print\":\"\",\"email\":\"\",\"pdf\":\"\",\"show-referring-table-releated-data\":\"0\",\"tiplocation\":\"tip\",\"process-jplugins\":\"2\",\"cck_category\":\"2\",\"plugins\":[],\"plugin_locations\":[],\"plugin_events\":[]}'),
(12, 'Αναφορές Δεξαμενών Καυσίμων', 0, '', '', '0000-00-00 00:00:00', 0, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Reset', 'Save', 'bootstrap', 'bootstrap', 1, 0, '{\"outro\":\"\",\"copy_button\":\"0\",\"copy_button_label\":\"Save as copy\",\"copy_icon\":\"\",\"copy_icon_location\":\"before\",\"reset_button\":\"0\",\"reset_button_label\":\"Reset\",\"reset_icon\":\"\",\"reset_icon_location\":\"before\",\"apply_button\":\"1\",\"apply_button_label\":\"\\u0395\\u03ba\\u03c4\\u03ad\\u03bb\\u03b5\\u03c3\\u03b7\",\"apply_icon\":\"\",\"apply_icon_location\":\"after\",\"goback_button\":\"0\",\"goback_button_label\":\"Go back\",\"goback_icon\":\"\",\"goback_icon_location\":\"before\",\"submit_button\":\"0\",\"submit_button_label\":\"Save\",\"save_icon\":\"\",\"save_icon_location\":\"before\",\"submit_on_enter\":\"1\",\"delete_button\":\"0\",\"delete_button_label\":\"Delete\",\"delete_icon\":\"\",\"delete_icon_location\":\"before\",\"ajax_validations\":\"0\",\"submit-success-msg\":\"\",\"suppress_msgs\":\"0\",\"show_loader_on_submit\":\"0\",\"spoof_check\":\"1\",\"multipage_save\":\"0\",\"note\":\"\",\"labels_above\":\"1\",\"labels_above_details\":\"0\",\"pdf_template\":\"\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"letter\",\"admin_form_template\":\"\",\"admin_details_template\":\"\",\"show-title\":\"0\",\"print\":\"\",\"email\":\"\",\"pdf\":\"\",\"show-referring-table-releated-data\":\"0\",\"tiplocation\":\"tip\",\"process-jplugins\":\"2\",\"cck_category\":\"2\",\"plugin_state\":[\"1\"],\"only_process_curl\":[\"getEndContent\"],\"form_php_file\":[\"-1\"],\"form_php_require_once\":[\"0\"],\"curl_code\":[\"include (\\\"CUSTOM\\/reports\\/fuelReport.php\\\");\"],\"plugins\":[\"php\"],\"plugin_locations\":[\"both\"],\"plugin_events\":[\"both\"]}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_form_sessions`
--

CREATE TABLE `cms_fabrik_form_sessions` (
  `id` int(6) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `user_id` int(6) NOT NULL,
  `form_id` int(6) NOT NULL,
  `row_id` int(10) NOT NULL,
  `last_page` int(4) NOT NULL,
  `referring_url` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_form_sessions`
--

INSERT INTO `cms_fabrik_form_sessions` (`id`, `hash`, `user_id`, `form_id`, `row_id`, `last_page`, `referring_url`, `data`, `time_date`) VALUES
(9, '488:12:1', 488, 12, 1, 0, 'https://collaborators.eu/index.php/reports', 'a:33:{s:14:\"___report_type\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:12:\"___from_date\";s:10:\"06-02-2018\";s:10:\"___to_date\";s:10:\"05-02-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:20:\"89300500203298162143\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:68:\"https://collaborators.eu/index.php/2/notification-configurations\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:0:\"\";s:32:\"dd5c4c165b45a3317b639c61044d2fd3\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:16:\"___from_date_raw\";s:10:\"06-02-2018\";s:14:\"___to_date_raw\";s:10:\"05-02-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:20:\"89300500203298162143\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:8:\"494:12:1\";s:16:\" 6 9 4 955 0 A 9\";s:32:\"56f5b6eb565f35cf85e451d653b39556\";s:32:\"79276300138d84980dcce75659219a6d\";s:32:\"a637f4b33be303ad1a844ab56f2a9641\";s:32:\"9441a79ef9e94244ba641d2e0321d9f4\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(10, '490:12:1', 490, 12, 1, 0, 'https://collaborators.eu/index.php/reports', 'a:32:{s:14:\"___report_type\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:12:\"___from_date\";s:10:\"08-03-2018\";s:10:\"___to_date\";s:10:\"15-03-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:20:\"89300500203298162143\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:65:\"https://collaborators.eu/index.php/measurements/details/11/18\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:1:\"0\";s:32:\"a583b34b6cbe8f76b29e687ba68d7296\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:16:\"___from_date_raw\";s:10:\"08-03-2018\";s:14:\"___to_date_raw\";s:10:\"15-03-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:20:\"89300500203298162143\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:32:\"56f5b6eb565f35cf85e451d653b39556\";s:32:\"8e26a0b8c044caf473a428f737e504c2\";s:8:\"490:12:1\";s:16:\" 05F54 9 0 6 9 3\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(11, '493:12:1', 493, 12, 1, 0, 'http://collaborators.eu/index.php/reports', 'a:32:{s:14:\"___report_type\";a:1:{i:0;s:24:\"fuel_consumption_history\";}s:12:\"___from_date\";s:10:\"08-01-2018\";s:10:\"___to_date\";s:10:\"17-01-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:68:\"http://collaborators.eu/index.php/measurements/details/11/16\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:1:\"0\";s:32:\"e93d3fbbb28a608828ce954e68f941de\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:24:\"fuel_consumption_history\";}s:16:\"___from_date_raw\";s:10:\"08-01-2018\";s:14:\"___to_date_raw\";s:10:\"17-01-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:32:\"e92dab10cb882ba5d22a20a86e169317\";s:32:\"25199a37ae9ed30622f9defd9c5c95eb\";s:8:\"493:12:1\";s:16:\"56 B57 C 9 55855\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(14, '496:12:1', 496, 12, 1, 0, 'http://collaborators.eu/index.php/reports', 'a:32:{s:14:\"___report_type\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:12:\"___from_date\";s:10:\"25-01-2018\";s:10:\"___to_date\";s:10:\"26-01-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:68:\"http://collaborators.eu/index.php/measurements/details/11/16\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:0:\"\";s:32:\"00286f90eb34b410f2bd7f9f38d61d93\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:16:\"___from_date_raw\";s:10:\"25-01-2018\";s:14:\"___to_date_raw\";s:10:\"26-01-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:8:\"491:12:1\";s:16:\" 7 C 4 954 0 E 5\";s:32:\"e92dab10cb882ba5d22a20a86e169317\";s:32:\"e64607eac06c942e1a0c0867c2561232\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(12, '491:12:1', 491, 12, 1, 0, 'http://collaborators.eu/index.php/reports', 'a:32:{s:14:\"___report_type\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:12:\"___from_date\";s:10:\"01-01-2018\";s:10:\"___to_date\";s:10:\"17-01-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:49:\"http://collaborators.eu/index.php/reports\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:0:\"\";s:32:\"2143a72ea92fec32344d798a50b07d6e\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:16:\"___from_date_raw\";s:10:\"01-01-2018\";s:14:\"___to_date_raw\";s:10:\"17-01-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:32:\"e92dab10cb882ba5d22a20a86e169317\";s:32:\"865a75438cd8d18f31ec2a66b38602e4\";s:8:\"491:12:1\";s:16:\" 3 152 A 1565C50\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(13, '492:12:1', 492, 12, 1, 0, 'http://collaborators.eu/index.php/reports', 'a:32:{s:14:\"___report_type\";a:1:{i:0;s:20:\"current_fuel_volumes\";}s:12:\"___from_date\";s:0:\"\";s:10:\"___to_date\";s:0:\"\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:68:\"http://collaborators.eu/index.php/measurements/details/11/16\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:0:\"\";s:32:\"a40c061716ea2674129ebaf52d25765c\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"current_fuel_volumes\";}s:16:\"___from_date_raw\";s:0:\"\";s:14:\"___to_date_raw\";s:0:\"\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:8:\"492:12:1\";s:16:\"57585059 957 2 3\";s:32:\"e92dab10cb882ba5d22a20a86e169317\";s:32:\"16b98944280b0b3684b649b2f02d7bb6\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(15, '495:12:1', 495, 12, 1, 0, 'http://collaborators.eu/index.php/reports', 'a:31:{s:14:\"___report_type\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:12:\"___from_date\";s:10:\"15-01-2018\";s:10:\"___to_date\";s:10:\"25-01-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:68:\"http://collaborators.eu/index.php/measurements/details/11/16\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:0:\"\";s:32:\"9e2eccde058790779dd59ca74ceab797\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:16:\"___from_date_raw\";s:10:\"15-01-2018\";s:14:\"___to_date_raw\";s:10:\"25-01-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:17:\"SNV066EC.X2_00005\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:32:\"e92dab10cb882ba5d22a20a86e169317\";s:32:\"1d7384183a970486d193b298dc1139bc\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00'),
(16, '494:12:1', 494, 12, 1, 0, 'https://collaborators.eu/index.php/reports', 'a:36:{s:14:\"___report_type\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:12:\"___from_date\";s:10:\"01-02-2018\";s:10:\"___to_date\";s:10:\"07-02-2018\";s:21:\"___selected_fuel_tank\";a:1:{i:0;s:20:\"89300500201602667070\";}s:12:\"___post_date\";s:0:\"\";s:6:\"listid\";s:0:\"\";s:7:\"listref\";s:0:\"\";s:5:\"rowid\";s:1:\"1\";s:6:\"Itemid\";s:3:\"275\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"task\";s:12:\"form.process\";s:8:\"isMambot\";s:0:\"\";s:6:\"formid\";s:2:\"12\";s:12:\"returntoform\";s:1:\"0\";s:15:\"fabrik_referrer\";s:38:\"https://collaborators.eu/index.php\";s:11:\"fabrik_ajax\";s:1:\"0\";s:7:\"package\";s:6:\"fabrik\";s:9:\"packageId\";s:0:\"\";s:32:\"c131cd9440cfd1fa6c1edae66fc4c72f\";s:1:\"1\";s:6:\"format\";s:4:\"html\";s:19:\"fabrik_repeat_group\";a:1:{i:24;s:1:\"1\";}s:5:\"apply\";s:0:\"\";s:18:\"___report_type_raw\";a:1:{i:0;s:20:\"fuel_volumes_history\";}s:16:\"___from_date_raw\";s:10:\"01-02-2018\";s:14:\"___to_date_raw\";s:10:\"07-02-2018\";s:25:\"___selected_fuel_tank_raw\";a:1:{i:0;s:20:\"89300500201602667070\";}s:16:\"___post_date_raw\";s:0:\"\";s:8:\"__pk_val\";s:0:\"\";s:8:\"494:12:1\";s:16:\" 6 9 4 955 0 A 9\";s:32:\"a637f4b33be303ad1a844ab56f2a9641\";s:32:\"9441a79ef9e94244ba641d2e0321d9f4\";s:8:\"488:12:1\";s:16:\" 6 8 8 955 0 A 9\";s:3:\"_ga\";s:25:\"GA1.2.85427575.1518014740\";s:4:\"_gid\";s:27:\"GA1.2.1790848982.1518014740\";s:32:\"56f5b6eb565f35cf85e451d653b39556\";s:32:\"7bb2e200d0233337d685a3ae5942e7dc\";s:4:\"lang\";s:7:\"reports\";s:4:\"view\";s:4:\"form\";}', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_groups`
--

CREATE TABLE `cms_fabrik_groups` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `css` text NOT NULL,
  `label` varchar(100) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `is_join` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_groups`
--

INSERT INTO `cms_fabrik_groups` (`id`, `name`, `css`, `label`, `published`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `is_join`, `private`, `params`) VALUES
(1, 'Μητρώο Τοποθεσιών >> Γενικά Στοιχεία', '', 'Γενικά Στοιχεία', 1, '2014-11-05 20:27:49', 488, 'admin', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(24, 'Αναφορές Δεξαμενών', '', 'Αναφορές Δεξαμενών Καυσίμων', 1, '0000-00-00 00:00:00', 0, '', '0000-00-00 00:00:00', 0, 488, '2018-02-07 15:17:04', 0, 0, '{\"split_page\":\"0\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"4\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(6, 'Χαρακτηριστικά', '', 'ΧΑΡΑΚΤΗΡΙΣΤΙΚΑ', 0, '2014-11-05 20:40:58', 488, 'admin', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(26, 'Μητρώο Τοποθεσιών >> Ρυθμίσεις Ειδοποιήσεων', '', 'Ρυθμίσεις Ειδοποιήσεων', 1, '2018-05-12 08:46:53', 488, 'admin', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(25, 'Μητρώο Τοποθεσιών >> Συντεταγμένες', '', 'Συντεταγμένες', 1, '2018-05-12 08:45:58', 488, 'admin', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_joins`
--

CREATE TABLE `cms_fabrik_joins` (
  `id` int(6) NOT NULL,
  `list_id` int(6) NOT NULL,
  `element_id` int(6) NOT NULL,
  `join_from_table` varchar(255) NOT NULL,
  `table_join` varchar(255) NOT NULL,
  `table_key` varchar(255) NOT NULL,
  `table_join_key` varchar(255) NOT NULL,
  `join_type` varchar(255) NOT NULL,
  `group_id` int(10) NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_joins`
--

INSERT INTO `cms_fabrik_joins` (`id`, `list_id`, `element_id`, `join_from_table`, `table_join`, `table_key`, `table_join_key`, `join_type`, `group_id`, `params`) VALUES
(4, 0, 40, '', 'custom_fuel_registry', 'tank_summarized', 'id', 'left', 5, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(6, 0, 49, '', 'custom_fuel_registry', 'related_tank', 'id', 'left', 2, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(7, 0, 56, '', 'custom_fuel_registry', 'tank', 'id', 'left', 8, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(8, 0, 95, '', 'custom_supplier_registry', 'supplier', 'id', 'left', 10, '{\"join-label\":\"full_name\",\"type\":\"element\",\"pk\":\"`custom_supplier_registry`.`id`\"}'),
(9, 0, 117, '', 'personnel', 'recipient', 'id', 'left', 17, '{\"join-label\":\"\",\"type\":\"element\",\"pk\":\"`personnel`.`id`\"}'),
(10, 0, 118, '', 'personnel', 'member_1', 'id', 'left', 17, '{\"join-label\":\"\",\"type\":\"element\",\"pk\":\"`personnel`.`id`\"}'),
(11, 0, 119, '', 'personnel', 'member_2', 'id', 'left', 17, '{\"join-label\":\"\",\"type\":\"element\",\"pk\":\"`personnel`.`id`\"}'),
(12, 0, 120, '', 'personnel', 'member_3', 'id', 'left', 17, '{\"join-label\":\"\",\"type\":\"element\",\"pk\":\"`personnel`.`id`\"}'),
(13, 0, 130, '', 'custom_fuel_registry', 'connected_tank_id', 'id', 'left', 22, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(14, 0, 131, '', 'custom_fuel_registry', 'connected_tank_id', 'id', 'left', 22, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(15, 0, 142, '', 'custom_fuel_registry', 'connected_tank_id', 'id', 'left', 23, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(16, 0, 143, '', 'custom_fuel_registry', 'connected_tank_id', 'id', 'left', 23, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}'),
(17, 0, 162, '', 'custom_fuel_registry', 'selected_fuel_tank', 'tank_code', 'left', 24, '{\"join-label\":\"location\",\"type\":\"element\",\"pk\":\"`custom_fuel_registry`.`id`\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_jsactions`
--

CREATE TABLE `cms_fabrik_jsactions` (
  `id` int(6) NOT NULL,
  `element_id` int(10) NOT NULL,
  `action` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_jsactions`
--

INSERT INTO `cms_fabrik_jsactions` (`id`, `element_id`, `action`, `code`, `params`) VALUES
(128, 128, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_element_custom_fuel_registry___similar_tank_count\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-same\",\"js_published\":\"1\"}'),
(228, 47, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_element_custom_fuel_registry___similar_tank_count\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-same\",\"js_published\":\"1\"}'),
(126, 133, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_element_custom_fuel_registry___similar_tank_count\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-same\",\"js_published\":\"1\"}'),
(244, 61, 'load', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(243, 61, 'load', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(242, 61, 'load', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(241, 61, 'change', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(240, 61, 'change', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(239, 61, 'change', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(238, 61, 'change', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(237, 61, 'change', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(236, 61, 'change', '', '{\"js_e_event\":\"hide\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"no\",\"js_published\":\"1\"}'),
(235, 61, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"yes\",\"js_published\":\"1\"}'),
(234, 61, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"yes\",\"js_published\":\"1\"}'),
(233, 61, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"yes\",\"js_published\":\"1\"}'),
(232, 61, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"yes\",\"js_published\":\"1\"}'),
(231, 61, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"yes\",\"js_published\":\"1\"}'),
(230, 61, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group9\",\"js_e_condition\":\"==\",\"js_e_value\":\"yes\",\"js_published\":\"1\"}'),
(221, 11, 'load', 'jQuery(document).ready(function()\r\n{\r\n    jQuery(&quot;#group1 #custom_fuel_registry___capacity&quot;).on(&quot;input&quot;, function()\r\n    {\r\n        jQuery(&quot;#group6 #custom_fuel_registry___capacity&quot;).val(jQuery(this).val());\r\n    });\r\n});', '{\"js_e_event\":\"\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"\",\"js_e_value\":\"\",\"js_published\":\"1\"}'),
(120, 127, 'load', 'jQuery(document).ready(function()\r\n{\r\n    jQuery(&quot;#group1 #custom_fuel_registry___capacity&quot;).on(&quot;input&quot;, function()\r\n    {\r\n        jQuery(&quot;#group6 #custom_fuel_registry___capacity&quot;).val(jQuery(this).val());\r\n    });\r\n});', '{\"js_e_event\":\"\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"\",\"js_e_value\":\"\",\"js_published\":\"1\"}'),
(220, 46, 'load', 'jQuery(document).ready(function()\r\n{\r\n    jQuery(&quot;#group1 #custom_fuel_registry___capacity&quot;).on(&quot;input&quot;, function()\r\n    {\r\n        jQuery(&quot;#group6 #custom_fuel_registry___capacity&quot;).val(jQuery(this).val());\r\n    });\r\n});', '{\"js_e_event\":\"\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"\",\"js_e_value\":\"\",\"js_published\":\"1\"}'),
(229, 12, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_element_custom_fuel_registry___similar_tank_count\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-same\",\"js_published\":\"1\"}'),
(124, 128, 'select', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group6\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-different\",\"js_published\":\"1\"}'),
(118, 132, 'load', 'jQuery(document).ready(function()\r\n{\r\n    jQuery(&quot;#group1 #custom_fuel_registry___capacity&quot;).on(&quot;input&quot;, function()\r\n    {\r\n        jQuery(&quot;#group6 #custom_fuel_registry___capacity&quot;).val(jQuery(this).val());\r\n    });\r\n});', '{\"js_e_event\":\"\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"\",\"js_e_value\":\"\",\"js_published\":\"1\"}'),
(227, 12, 'select', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-different\",\"js_published\":\"1\"}'),
(122, 133, 'select', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group6\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-different\",\"js_published\":\"1\"}'),
(226, 47, 'select', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-different\",\"js_published\":\"1\"}'),
(130, 139, 'load', 'jQuery(document).ready(function()\r\n{\r\n    jQuery(&quot;#group1 #custom_fuel_registry___capacity&quot;).on(&quot;input&quot;, function()\r\n    {\r\n        jQuery(&quot;#group6 #custom_fuel_registry___capacity&quot;).val(jQuery(this).val());\r\n    });\r\n});', '{\"js_e_event\":\"\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"\",\"js_e_value\":\"\",\"js_published\":\"1\"}'),
(131, 140, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_element_custom_fuel_registry___similar_tank_count\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-same\",\"js_published\":\"1\"}'),
(132, 140, 'select', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group6\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-different\",\"js_published\":\"1\"}'),
(133, 144, 'load', 'jQuery(document).ready(function()\r\n{\r\n    jQuery(&quot;#group1 #custom_fuel_registry___capacity&quot;).on(&quot;input&quot;, function()\r\n    {\r\n        jQuery(&quot;#group6 #custom_fuel_registry___capacity&quot;).val(jQuery(this).val());\r\n    });\r\n});', '{\"js_e_event\":\"\",\"js_e_trigger\":\"fabrik_trigger_group_group1\",\"js_e_condition\":\"\",\"js_e_value\":\"\",\"js_published\":\"1\"}'),
(134, 145, 'change', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_element_custom_fuel_registry___similar_tank_count\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-same\",\"js_published\":\"1\"}'),
(135, 145, 'select', '', '{\"js_e_event\":\"show\",\"js_e_trigger\":\"fabrik_trigger_group_group6\",\"js_e_condition\":\"==\",\"js_e_value\":\"multiple-different\",\"js_published\":\"1\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_lists`
--

CREATE TABLE `cms_fabrik_lists` (
  `id` int(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  `introduction` text NOT NULL,
  `form_id` int(4) NOT NULL,
  `db_table_name` varchar(255) NOT NULL,
  `db_primary_key` varchar(255) NOT NULL,
  `auto_inc` int(1) NOT NULL,
  `connection_id` int(6) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(4) NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(4) NOT NULL,
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `access` int(4) NOT NULL,
  `hits` int(4) NOT NULL,
  `rows_per_page` int(5) NOT NULL,
  `template` varchar(255) NOT NULL,
  `order_by` varchar(255) NOT NULL,
  `order_dir` varchar(255) NOT NULL DEFAULT 'ASC',
  `filter_action` varchar(30) NOT NULL,
  `group_by` varchar(255) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_fabrik_lists`
--

INSERT INTO `cms_fabrik_lists` (`id`, `label`, `introduction`, `form_id`, `db_table_name`, `db_primary_key`, `auto_inc`, `connection_id`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `published`, `publish_up`, `publish_down`, `access`, `hits`, `rows_per_page`, `template`, `order_by`, `order_dir`, `filter_action`, `group_by`, `private`, `params`) VALUES
(1, 'Μητρώο Τοποθεσιών', '', 1, 'agro_location_registry', '`agro_location_registry`.`id`', 1, 1, '2014-11-05 00:00:00', 0, '', '2018-05-12 23:24:58', 488, 488, '2018-05-12 23:24:58', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1551, 10, 'bootstrap', '[\"1\"]', '[\"ASC\"]', 'submitform', '', 0, '{\"show-table-filters\":\"1\",\"advanced-filter\":\"0\",\"search-mode\":\"0\",\"search-mode-advanced\":\"0\",\"search_elements\":\"\",\"list_search_elements\":\"null\",\"search-all-label\":\"All\",\"require-filter\":\"0\",\"filter-dropdown-method\":\"0\",\"toggle_cols\":\"0\",\"list_filter_cols\":\"1\",\"empty_data_msg\":\"\",\"outro\":\"\",\"list_ajax\":\"1\",\"show-table-add\":\"1\",\"show-table-nav\":\"1\",\"show_displaynum\":\"1\",\"showall-records\":\"1\",\"show-total\":\"0\",\"sef-slug\":\"\",\"admin_template\":\"\",\"show-title\":\"0\",\"pdf\":\"\",\"pdf_template\":\"\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"a4\",\"bootstrap_stripped_class\":\"1\",\"bootstrap_bordered_class\":\"0\",\"bootstrap_condensed_class\":\"0\",\"bootstrap_hover_class\":\"1\",\"responsive_elements\":\"\",\"responsive_class\":\"\",\"list_responsive_elements\":\"null\",\"tabs_field\":\"\",\"tabs_max\":\"10\",\"tabs_all\":\"1\",\"list_ajax_links\":\"0\",\"actionMethod\":\"default\",\"detailurl\":\"\",\"detaillabel\":\"\",\"editurl\":\"\",\"editlabel\":\"\",\"checkboxLocation\":\"end\",\"addurl\":\"\",\"addlabel\":\"\",\"popup_width\":\"\",\"popup_height\":\"\",\"popup_offset_x\":\"\",\"popup_offset_y\":\"\",\"note\":\"\",\"alter_existing_db_cols\":\"default\",\"process-jplugins\":\"1\",\"enable_single_sorting\":\"default\",\"collation\":\"latin1_swedish_ci\",\"force_collate\":\"\",\"list_disable_caching\":\"0\",\"distinct\":\"0\",\"group_by_access\":\"1\",\"group_by_order\":\"\",\"group_by_template\":\"\",\"group_by_order_dir\":\"DESC\",\"group_by_start_collapsed\":\"0\",\"group_by_collapse_others\":\"0\",\"prefilter_query\":\"\",\"join-display\":\"default\",\"delete-joined-rows\":\"0\",\"show_related_add\":\"0\",\"show_related_info\":\"0\",\"rss\":\"0\",\"feed_title\":\"\",\"feed_date\":\"\",\"feed_image_src\":\"\",\"rsslimit\":\"150\",\"rsslimitmax\":\"2500\",\"csv_import_frontend\":\"3\",\"csv_export_frontend\":\"3\",\"csvfullname\":\"0\",\"csv_export_step\":\"100\",\"newline_csv_export\":\"nl2br\",\"csv_custom_qs\":\"\",\"csv_frontend_selection\":\"0\",\"incfilters\":\"0\",\"csv_format\":\"0\",\"csv_which_elements\":\"selected\",\"show_in_csv\":\"\",\"csv_elements\":\"null\",\"csv_include_data\":\"1\",\"csv_include_raw_data\":\"1\",\"csv_include_calculations\":\"0\",\"csv_encoding\":\"\",\"search_use\":\"0\",\"search_title\":\"\",\"search_description\":\"\",\"search_date\":\"\",\"search_link_type\":\"details\",\"allow_view_details\":\"1\",\"allow_edit_details\":\"3\",\"allow_edit_details2\":\"\",\"allow_add\":\"3\",\"allow_delete\":\"3\",\"allow_delete2\":\"\",\"allow_drop\":\"3\",\"isview\":\"0\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_log`
--

CREATE TABLE `cms_fabrik_log` (
  `id` int(10) NOT NULL,
  `timedate_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` smallint(3) NOT NULL,
  `referring_url` varchar(255) NOT NULL,
  `message_source` varchar(255) NOT NULL,
  `message_type` char(60) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_packages`
--

CREATE TABLE `cms_fabrik_packages` (
  `id` int(11) NOT NULL,
  `external_ref` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `component_name` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(6) NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_validations`
--

CREATE TABLE `cms_fabrik_validations` (
  `id` int(6) NOT NULL,
  `element_id` int(4) NOT NULL,
  `validation_plugin` varchar(100) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `client_side_validation` int(1) NOT NULL DEFAULT '0',
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_fabrik_visualizations`
--

CREATE TABLE `cms_fabrik_visualizations` (
  `id` int(6) NOT NULL,
  `plugin` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `intro_text` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `published` int(1) NOT NULL,
  `access` int(6) NOT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_filters`
--

CREATE TABLE `cms_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links`
--

CREATE TABLE `cms_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links`
--

INSERT INTO `cms_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(45, 'index.php?option=com_content&view=article&id=52', 'index.php?option=com_content&view=article&id=52:fuelics-dashboard&catid=2:uncategorised&lang=gr&Itemid=101', 'ΑΡΧΙΚΗ', '{source} [[?php include \"webpages/Home.php\"; ?]] {/source}', '2018-05-12 10:37:52', 'c36fb00e891aa341aaa3a04e79205473', 1, 1, 1, 'el-GR', '2014-11-06 14:54:17', '0000-00-00 00:00:00', '2014-11-06 14:54:17', '0000-00-00 00:00:00', 0, 0, 4, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31393a7b733a31313a22002a00656c656d656e7473223b613a32343a7b733a323a226964223b733a323a223532223b733a353a22616c696173223b733a31373a226675656c6963732d64617368626f617264223b733a373a2273756d6d617279223b733a36373a223c703e7b736f757263657d205b5b3f70687020c2a0696e636c756465202277656270616765732f486f6d652e706870223b203f5d5d207b2f736f757263657d3c2f703e223b733a343a22626f6479223b733a303a22223b733a353a226361746964223b733a313a2232223b733a31303a22637265617465645f6279223b733a333a22343838223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031382d30352d31322030373a33373a3531223b733a31313a226d6f6469666965645f6279223b733a333a22343838223b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a37343a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2230223b733a31313a226c696e6b5f7469746c6573223b733a313a2230223b733a31303a2273686f775f696e74726f223b733a313a2230223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2230223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2230223b733a393a2273686f775f766f7465223b733a313a2230223b733a31333a2273686f775f726561646d6f7265223b733a313a2230223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2230223b733a31343a22726561646d6f72655f6c696d6974223b733a333a22313030223b733a393a2273686f775f74616773223b733a313a2230223b733a31303a2273686f775f69636f6e73223b733a313a2230223b733a31353a2273686f775f7072696e745f69636f6e223b733a313a2230223b733a31353a2273686f775f656d61696c5f69636f6e223b733a313a2230223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b733a313a2231223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2230223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2230223b733a31323a22736176655f686973746f7279223b733a313a2230223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b733a313a2230223b733a31383a226e756d5f696e74726f5f61727469636c6573223b733a313a2236223b733a31313a226e756d5f636f6c756d6e73223b733a313a2232223b733a393a226e756d5f6c696e6b73223b733a313a2232223b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b7d7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a343a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b733a31303a22787265666572656e6365223b733a303a22223b7d7d733a373a2276657273696f6e223b733a323a223333223b733a383a226f72646572696e67223b733a313a2231223b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b733a313a2231223b733a31303a226361745f616363657373223b733a313a2231223b733a343a22736c7567223b733a32303a2235323a6675656c6963732d64617368626f617264223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a31303a2253757065722055736572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a343a2270617468223b733a35343a22696e6465782e7068702f322d756e63617465676f72697365642f35322d6675656c6963732d64617368626f6172643f6c616e673d6772223b733a31303a226d657461617574686f72223b4e3b7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a343a7b733a343a2254797065223b613a313a7b733a373a2241727469636c65223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a363a22417574686f72223b613a313a7b733a31303a2253757065722055736572223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a2253757065722055736572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a31333a22556e63617465676f7269736564223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a224c616e6775616765223b613a313a7b733a353a22656c2d4752223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a353a22656c2d4752223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d3532223b733a353a22726f757465223b733a3130363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d35323a6675656c6963732d64617368626f6172642663617469643d323a756e63617465676f7269736564266c616e673d6772264974656d69643d313031223b733a353a227469746c65223b733a31323a22ce91cea1cea7ce99ce9ace97223b733a31313a226465736372697074696f6e223b733a35383a227b736f757263657d205b5b3f70687020696e636c756465202277656270616765732f486f6d652e706870223b203f5d5d207b2f736f757263657d223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b693a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a353a22656c2d4752223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d31312d30362031343a35343a3137223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22323031342d31312d30362031343a35343a3137223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a343b733a31353a2264656661756c744c616e6775616765223b733a353a22656c2d4752223b7d),
(49, 'index.php?option=com_content&view=article&id=53', 'index.php?option=com_content&view=article&id=53:2018-05-13-11-23-09&catid=2:uncategorised&lang=gr&Itemid=276', 'Αναφορές Μετρήσεων', '{source} [[?php include \"webpages/DataReport.php\"; ?]] {/source}', '2018-05-13 15:59:19', '6d75c6f1d248a6adf76e87a8aef09670', 1, 1, 1, 'el-GR', '2018-05-13 11:23:09', '0000-00-00 00:00:00', '2018-05-13 11:23:09', '0000-00-00 00:00:00', 0, 0, 4, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31393a7b733a31313a22002a00656c656d656e7473223b613a32343a7b733a323a226964223b733a323a223533223b733a353a22616c696173223b733a31393a22323031382d30352d31332d31312d32332d3039223b733a373a2273756d6d617279223b733a37333a223c703e7b736f757263657d205b5b3f70687020c2a0696e636c756465202277656270616765732f446174615265706f72742e706870223b203f5d5d207b2f736f757263657d3c2f703e223b733a343a22626f6479223b733a303a22223b733a353a226361746964223b733a313a2232223b733a31303a22637265617465645f6279223b733a333a22343838223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031382d30352d31332031323a35393a3139223b733a31313a226d6f6469666965645f6279223b733a333a22343838223b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a37343a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2230223b733a31313a226c696e6b5f7469746c6573223b733a313a2230223b733a31303a2273686f775f696e74726f223b733a313a2230223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2230223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2230223b733a393a2273686f775f766f7465223b733a313a2230223b733a31333a2273686f775f726561646d6f7265223b733a313a2230223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2230223b733a31343a22726561646d6f72655f6c696d6974223b733a333a22313030223b733a393a2273686f775f74616773223b733a313a2230223b733a31303a2273686f775f69636f6e73223b733a313a2230223b733a31353a2273686f775f7072696e745f69636f6e223b733a313a2230223b733a31353a2273686f775f656d61696c5f69636f6e223b733a313a2230223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b733a313a2231223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2230223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b733a313a2230223b733a31383a226e756d5f696e74726f5f61727469636c6573223b733a313a2236223b733a31313a226e756d5f636f6c756d6e73223b733a313a2232223b733a393a226e756d5f6c696e6b73223b733a313a2232223b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b7d7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a343a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b733a31303a22787265666572656e6365223b733a303a22223b7d7d733a373a2276657273696f6e223b733a313a2234223b733a383a226f72646572696e67223b733a313a2230223b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b733a313a2231223b733a31303a226361745f616363657373223b733a313a2231223b733a343a22736c7567223b733a32323a2235333a323031382d30352d31332d31312d32332d3039223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a31303a2253757065722055736572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a343a2270617468223b733a36333a22696e6465782e7068702f7265706f72742f322d756e63617465676f72697365642f35332d323031382d30352d31332d31312d32332d30393f6c616e673d6772223b733a31303a226d657461617574686f72223b4e3b7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a343a7b733a343a2254797065223b613a313a7b733a373a2241727469636c65223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a363a22417574686f72223b613a313a7b733a31303a2253757065722055736572223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a2253757065722055736572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a31333a22556e63617465676f7269736564223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a224c616e6775616765223b613a313a7b733a353a22656c2d4752223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a353a22656c2d4752223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d3533223b733a353a22726f757465223b733a3130383a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d35333a323031382d30352d31332d31312d32332d30392663617469643d323a756e63617465676f7269736564266c616e673d6772264974656d69643d323736223b733a353a227469746c65223b733a33353a22ce91cebdceb1cf86cebfcf81ceadcf8220ce9cceb5cf84cf81ceaecf83ceb5cf89cebd223b733a31313a226465736372697074696f6e223b733a36343a227b736f757263657d205b5b3f70687020696e636c756465202277656270616765732f446174615265706f72742e706870223b203f5d5d207b2f736f757263657d223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b693a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a353a22656c2d4752223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031382d30352d31332031313a32333a3039223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22323031382d30352d31332031313a32333a3039223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a343b733a31353a2264656661756c744c616e6775616765223b733a353a22656c2d4752223b7d);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms0`
--

CREATE TABLE `cms_finder_links_terms0` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_terms0`
--

INSERT INTO `cms_finder_links_terms0` (`link_id`, `term_id`, `weight`) VALUES
(45, 1322, 0.56004),
(49, 1322, 0.56004),
(45, 1338, 0.56),
(49, 1338, 0.56),
(45, 1339, 0.93331),
(49, 1339, 0.93331),
(45, 1340, 1.12),
(49, 1340, 1.12),
(45, 1341, 0.79992),
(49, 1341, 0.79992),
(45, 1342, 3.19992),
(49, 1342, 3.19992);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms1`
--

CREATE TABLE `cms_finder_links_terms1` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms2`
--

CREATE TABLE `cms_finder_links_terms2` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_terms2`
--

INSERT INTO `cms_finder_links_terms2` (`link_id`, `term_id`, `weight`) VALUES
(45, 1327, 0.18669),
(45, 1328, 0.88669),
(45, 1329, 1.05);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms3`
--

CREATE TABLE `cms_finder_links_terms3` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms4`
--

CREATE TABLE `cms_finder_links_terms4` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms5`
--

CREATE TABLE `cms_finder_links_terms5` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms6`
--

CREATE TABLE `cms_finder_links_terms6` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms7`
--

CREATE TABLE `cms_finder_links_terms7` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_terms7`
--

INSERT INTO `cms_finder_links_terms7` (`link_id`, `term_id`, `weight`) VALUES
(45, 1343, 1.04004),
(49, 1343, 1.04004),
(45, 1344, 0.64008),
(49, 1344, 0.64008);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms8`
--

CREATE TABLE `cms_finder_links_terms8` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_terms8`
--

INSERT INTO `cms_finder_links_terms8` (`link_id`, `term_id`, `weight`) VALUES
(45, 1323, 1.2),
(45, 1325, 0.9334),
(45, 1326, 3.1334),
(45, 1330, 0.32669),
(49, 1330, 0.32669),
(45, 1331, 1.07331),
(49, 1331, 1.07331),
(45, 1332, 1.19),
(45, 1333, 0.6666),
(49, 1333, 0.6666),
(45, 1334, 0.28),
(49, 1334, 0.28),
(45, 1335, 0.95669),
(49, 1335, 0.95669),
(45, 1336, 1.16669),
(49, 1336, 1.16669),
(45, 1337, 0.93331),
(49, 1337, 0.93331),
(49, 1461, 0.46669),
(49, 1462, 1.02669),
(49, 1463, 1.19),
(49, 1464, 1.33);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_terms9`
--

CREATE TABLE `cms_finder_links_terms9` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_termsa`
--

CREATE TABLE `cms_finder_links_termsa` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_termsa`
--

INSERT INTO `cms_finder_links_termsa` (`link_id`, `term_id`, `weight`) VALUES
(45, 1348, 0.68),
(49, 1467, 0.90661),
(49, 1468, 2.72),
(49, 1469, 1.02);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_termsb`
--

CREATE TABLE `cms_finder_links_termsb` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_termsc`
--

CREATE TABLE `cms_finder_links_termsc` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_termsc`
--

INSERT INTO `cms_finder_links_termsc` (`link_id`, `term_id`, `weight`) VALUES
(49, 1445, 0.4),
(49, 1446, 2.3334),
(49, 1447, 2.5334),
(49, 1448, 0.4),
(49, 1449, 0.4),
(49, 1450, 2.3334),
(49, 1451, 2.5334),
(49, 1452, 0.4),
(49, 1453, 2.3334),
(49, 1454, 2.5334),
(49, 1455, 0.8),
(49, 1456, 2.4666),
(49, 1457, 2.6666),
(49, 1458, 0.4),
(49, 1459, 2.3334);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_termsd`
--

CREATE TABLE `cms_finder_links_termsd` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_termse`
--

CREATE TABLE `cms_finder_links_termse` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_termse`
--

INSERT INTO `cms_finder_links_termse` (`link_id`, `term_id`, `weight`) VALUES
(45, 1321, 0.34),
(45, 1324, 0.39996),
(49, 1324, 0.39996),
(49, 1460, 0.34);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_links_termsf`
--

CREATE TABLE `cms_finder_links_termsf` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_links_termsf`
--

INSERT INTO `cms_finder_links_termsf` (`link_id`, `term_id`, `weight`) VALUES
(45, 1345, 0.37331),
(49, 1345, 0.37331),
(45, 1346, 1.00331),
(45, 1347, 1.09669),
(49, 1465, 1.14331),
(49, 1466, 1.23669);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_taxonomy`
--

CREATE TABLE `cms_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_taxonomy`
--

INSERT INTO `cms_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0),
(2, 1, 'Type', 1, 1, 0),
(4, 1, 'Author', 1, 1, 0),
(6, 1, 'Category', 1, 1, 0),
(8, 1, 'Language', 1, 1, 0),
(138, 2, 'Article', 1, 1, 0),
(139, 4, 'Super User', 1, 1, 0),
(140, 6, 'Uncategorised', 1, 1, 0),
(141, 8, 'el-GR', 1, 1, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_taxonomy_map`
--

CREATE TABLE `cms_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_taxonomy_map`
--

INSERT INTO `cms_finder_taxonomy_map` (`link_id`, `node_id`) VALUES
(45, 138),
(45, 139),
(45, 140),
(45, 141),
(49, 138),
(49, 139),
(49, 140),
(49, 141);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_terms`
--

CREATE TABLE `cms_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_terms`
--

INSERT INTO `cms_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`, `language`) VALUES
(1321, '52', '52', 0, 0, 0.2, '', 1, 'el'),
(1322, 'article', 'article', 0, 0, 0.4667, 'A6324', 2, 'el'),
(1323, 'dashboard', 'dashboard', 0, 0, 0.6, 'D2163', 1, 'el'),
(1324, 'el-gr', 'el-gr', 0, 0, 0.3333, 'E426', 2, 'el'),
(1325, 'fuelics', 'fuelics', 0, 0, 0.4667, 'F420', 1, 'el'),
(1326, 'fuelics dashboard', 'fuelics dashboard', 0, 1, 1.5667, 'F4232163', 1, 'el'),
(1327, 'home', 'home', 0, 0, 0.2667, 'H500', 1, 'el'),
(1328, 'home php', 'home php', 0, 1, 1.2667, 'H510', 1, 'el'),
(1329, 'home php source', 'home php source', 0, 1, 1.5, 'H51262', 1, 'el'),
(1330, 'include', 'include', 0, 0, 0.4667, 'I5243', 2, 'el'),
(1331, 'include webpages', 'include webpages', 0, 1, 1.5333, 'I524312', 2, 'el'),
(1332, 'include webpages home', 'include webpages home', 0, 1, 1.7, 'I5243125', 1, 'el'),
(1333, 'index', 'index', 0, 0, 0.3333, 'I532', 2, 'el'),
(1334, 'php', 'php', 0, 0, 0.2, 'P000', 2, 'el'),
(1335, 'php include', 'php include', 0, 1, 1.3667, 'P5243', 2, 'el'),
(1336, 'php include webpages', 'php include webpages', 0, 1, 1.6667, 'P524312', 2, 'el'),
(1337, 'php source', 'php source', 0, 1, 1.3333, 'P262', 2, 'el'),
(1338, 'source', 'source', 0, 0, 0.4, 'S620', 2, 'el'),
(1339, 'source php', 'source php', 0, 1, 1.3333, 'S621', 2, 'el'),
(1340, 'source php include', 'source php include', 0, 1, 1.6, 'S6215243', 2, 'el'),
(1341, 'super', 'super', 0, 0, 0.3333, 'S160', 2, 'el'),
(1342, 'super user', 'super user', 0, 1, 1.3333, 'S1626', 2, 'el'),
(1343, 'uncategorised', 'uncategorised', 0, 0, 0.8667, 'U5232623', 2, 'el'),
(1344, 'user', 'user', 0, 0, 0.2667, 'U260', 2, 'el'),
(1345, 'webpages', 'webpages', 0, 0, 0.5333, 'W120', 2, 'el'),
(1346, 'webpages home', 'webpages home', 0, 1, 1.4333, 'W125', 1, 'el'),
(1347, 'webpages home php', 'webpages home php', 0, 1, 1.5667, 'W1251', 1, 'el'),
(1348, 'αρχικη', 'αρχικη', 0, 0, 0.4, 'α000', 1, 'el'),
(1445, '05', '05', 0, 0, 0.2, '', 1, 'el'),
(1446, '05 13', '05 13', 0, 1, 1.1667, '', 1, 'el'),
(1447, '05 13 11', '05 13 11', 0, 1, 1.2667, '', 1, 'el'),
(1448, '09', '09', 0, 0, 0.2, '', 1, 'el'),
(1449, '11', '11', 0, 0, 0.2, '', 1, 'el'),
(1450, '11 23', '11 23', 0, 1, 1.1667, '', 1, 'el'),
(1451, '11 23 09', '11 23 09', 0, 1, 1.2667, '', 1, 'el'),
(1452, '13', '13', 0, 0, 0.2, '', 1, 'el'),
(1453, '13 11', '13 11', 0, 1, 1.1667, '', 1, 'el'),
(1454, '13 11 23', '13 11 23', 0, 1, 1.2667, '', 1, 'el'),
(1455, '2018', '2018', 0, 0, 0.4, '', 1, 'el'),
(1456, '2018 05', '2018 05', 0, 1, 1.2333, '', 1, 'el'),
(1457, '2018 05 13', '2018 05 13', 0, 1, 1.3333, '', 1, 'el'),
(1458, '23', '23', 0, 0, 0.2, '', 1, 'el'),
(1459, '23 09', '23 09', 0, 1, 1.1667, '', 1, 'el'),
(1460, '53', '53', 0, 0, 0.2, '', 1, 'el'),
(1461, 'datareport', 'datareport', 0, 0, 0.6667, 'D6163', 1, 'el'),
(1462, 'datareport php', 'datareport php', 0, 1, 1.4667, 'D61631', 1, 'el'),
(1463, 'datareport php source', 'datareport php source', 0, 1, 1.7, 'D61631262', 1, 'el'),
(1464, 'include webpages datareport', 'include webpages datareport', 0, 1, 1.9, 'I52431236163', 1, 'el'),
(1465, 'webpages datareport', 'webpages datareport', 0, 1, 1.6333, 'W1236163', 1, 'el'),
(1466, 'webpages datareport php', 'webpages datareport php', 0, 1, 1.7667, 'W12361631', 1, 'el'),
(1467, 'αναφορές', 'αναφορές', 0, 0, 0.5333, 'α000', 1, 'el'),
(1468, 'αναφορές μετρήσεων', 'αναφορές μετρήσεων', 0, 1, 1.6, 'α000', 1, 'el'),
(1469, 'μετρήσεων', 'μετρήσεων', 0, 0, 0.6, 'μ000', 1, 'el');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_terms_common`
--

CREATE TABLE `cms_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_terms_common`
--

INSERT INTO `cms_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren\'t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn\'t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_tokens`
--

CREATE TABLE `cms_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_tokens_aggregate`
--

CREATE TABLE `cms_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL,
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL,
  `total_weight` float UNSIGNED NOT NULL,
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_finder_types`
--

CREATE TABLE `cms_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_finder_types`
--

INSERT INTO `cms_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Tag', ''),
(2, 'Category', ''),
(3, 'Contact', ''),
(4, 'Article', ''),
(5, 'News Feed', ''),
(6, 'Web Link', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_attachments`
--

CREATE TABLE `cms_k2_attachments` (
  `id` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleAttribute` text NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_attachments`
--

INSERT INTO `cms_k2_attachments` (`id`, `itemID`, `filename`, `title`, `titleAttribute`, `hits`) VALUES
(1, 1, 'sample_attachment.pdf', 'Technical Details ', 'sample_attachment.pdf', 0),
(2, 1, 'sample_attachment_1.pdf', 'Product Sheet (PDF) ', 'sample_attachment_1.pdf', 0),
(3, 2, 'sample_attachment_2.pdf', 'Product Sheet (PDF) ', 'sample_attachment_2.pdf', 0),
(4, 2, 'sample_attachment_3.pdf', 'Installation manual ', 'sample_attachment_3.pdf', 0),
(5, 2, 'sample_attachment_4.pdf', 'Detailed Technical Specification ', 'sample_attachment_4.pdf', 0),
(6, 3, 'sample_attachment_5.pdf', 'Product Sheet (PDF) ', 'sample_attachment_5.pdf', 0),
(7, 3, 'sample_attachment_6.pdf', 'Installation manual ', 'sample_attachment_6.pdf', 0),
(8, 4, 'sample_attachment_7.pdf', 'Product Sheet (PDF) ', 'sample_attachment_7.pdf', 0),
(9, 4, 'sample_attachment_8.pdf', 'Installation manual', 'sample_attachment_8.pdf', 0),
(10, 5, 'sample_attachment_9.pdf', 'Product Sheet (PDF)', 'sample_attachment_9.pdf', 0),
(11, 5, 'sample_attachment_10.pdf', 'Installation manual', 'sample_attachment_10.pdf', 0),
(12, 5, 'sample_attachment_11.pdf', 'Third Document (PDF)', 'sample_attachment_11.pdf', 0),
(13, 6, 'sample_attachment_12.pdf', 'Detailed Technical Specification ', 'sample_attachment_12.pdf', 0),
(14, 6, 'sample_attachment_13.pdf', 'Product Sheet (PDF) ', 'sample_attachment_13.pdf', 0),
(15, 6, 'sample_attachment_14.pdf', 'Installation manual', 'sample_attachment_14.pdf', 0),
(16, 7, 'sample_attachment_15.pdf', 'Product Sheet (PDF) ', 'sample_attachment_15.pdf', 0),
(17, 7, 'sample_attachment_16.pdf', 'Installation manual', 'sample_attachment_16.pdf', 0),
(18, 7, 'sample_attachment_17.pdf', 'Detailed Technical Specification ', 'sample_attachment_17.pdf', 0),
(19, 8, 'sample_attachment_18.pdf', 'Detailed Technical Specification ', 'sample_attachment_18.pdf', 0),
(20, 8, 'sample_attachment_19.pdf', 'Product Sheet (PDF)', 'sample_attachment_19.pdf', 0),
(21, 8, 'sample_attachment_20.pdf', 'Installation manual', 'sample_attachment_20.pdf', 0),
(22, 9, 'sample_attachment_21.pdf', 'Detailed Technical Specification', 'sample_attachment_21.pdf', 0),
(23, 9, 'sample_attachment_22.pdf', 'Product Sheet (PDF)', 'sample_attachment_22.pdf', 0),
(24, 9, 'sample_attachment_23.pdf', 'Installation manual', 'sample_attachment_23.pdf', 0),
(25, 10, 'sample_attachment_24.pdf', 'Product Sheet (PDF)', 'sample_attachment_24.pdf', 0),
(26, 10, 'sample_attachment_25.pdf', 'Installation manual', 'sample_attachment_25.pdf', 0),
(27, 10, 'sample_attachment_26.pdf', 'Third Document (PDF)', 'sample_attachment_26.pdf', 0),
(28, 11, 'sample_attachment_27.pdf', 'Product Sheet (PDF)', 'sample_attachment_27.pdf', 0),
(29, 11, 'sample_attachment_28.pdf', 'Installation manual', 'sample_attachment_28.pdf', 0),
(30, 11, 'sample_attachment_29.pdf', 'Detailed Technical Specification', 'sample_attachment_29.pdf', 0),
(31, 12, 'sample_attachment_30.pdf', 'Detailed Technical Specification', 'sample_attachment_30.pdf', 0),
(32, 12, 'sample_attachment_31.pdf', 'Product Sheet (PDF)', 'sample_attachment_31.pdf', 0),
(33, 12, 'sample_attachment_32.pdf', 'Installation manual', 'sample_attachment_32.pdf', 0),
(34, 13, 'sample_attachment_33.pdf', 'Product Sheet (PDF)', 'sample_attachment_33.pdf', 0),
(35, 13, 'sample_attachment_34.pdf', 'Installation manual', 'sample_attachment_34.pdf', 0),
(36, 13, 'sample_attachment_35.pdf', 'Third Document (PDF)', 'sample_attachment_35.pdf', 0),
(37, 14, 'sample_attachment_36.pdf', 'Product Sheet (PDF)', 'sample_attachment_36.pdf', 0),
(38, 14, 'sample_attachment_37.pdf', 'Installation manual', 'sample_attachment_37.pdf', 0),
(39, 15, 'sample_attachment_38.pdf', 'Product Sheet (PDF)', 'sample_attachment_38.pdf', 0),
(40, 15, 'sample_attachment_39.pdf', 'Installation manual', 'sample_attachment_39.pdf', 0),
(41, 16, 'sample_attachment_40.pdf', 'Product Sheet (PDF)', 'sample_attachment_40.pdf', 0),
(42, 16, 'sample_attachment_41.pdf', 'Detailed Technical Specification', 'sample_attachment_41.pdf', 0),
(43, 16, 'sample_attachment_42.pdf', 'Informacja o wyborze najkorzystniejszej oferty - konferencja Promocja regionu poprzez sport', 'sample_attachment_42.pdf', 0),
(44, 17, 'sample_attachment_43.pdf', 'Technical Details', 'sample_attachment_43.pdf', 0),
(45, 17, 'sample_attachment_44.pdf', 'Product Sheet (PDF)', 'sample_attachment_44.pdf', 0),
(46, 18, 'sample_attachment_45.pdf', 'Detailed Technical Specification', 'sample_attachment_45.pdf', 0),
(47, 18, 'sample_attachment_46.pdf', 'Product Sheet (PDF)', 'sample_attachment_46.pdf', 0),
(48, 18, 'sample_attachment_47.pdf', 'Installation manual', 'sample_attachment_47.pdf', 0),
(49, 19, 'sample_attachment_48.pdf', 'Detailed Technical Specification', 'sample_attachment_48.pdf', 1),
(50, 19, 'sample_attachment_49.pdf', 'Product Sheet (PDF)', 'sample_attachment_49.pdf', 0),
(51, 19, 'sample_attachment_50.pdf', 'Installation manual', 'sample_attachment_50.pdf', 0),
(52, 20, 'sample_attachment_51.pdf', 'Product Sheet (PDF)', 'sample_attachment_51.pdf', 0),
(53, 20, 'sample_attachment_52.pdf', 'Installation manual', 'sample_attachment_52.pdf', 0),
(54, 20, 'sample_attachment_53.pdf', 'Third Document (PDF)', 'sample_attachment_53.pdf', 0),
(55, 21, 'sample_attachment_54.pdf', 'Product Sheet (PDF)', 'sample_attachment_54.pdf', 0),
(56, 21, 'sample_attachment_55.pdf', 'Installation manual', 'sample_attachment_55.pdf', 0),
(57, 21, 'sample_attachment_56.pdf', 'Detailed Technical Specification', 'sample_attachment_56.pdf', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_categories`
--

CREATE TABLE `cms_k2_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `extraFieldsGroup` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_categories`
--

INSERT INTO `cms_k2_categories` (`id`, `name`, `alias`, `description`, `parent`, `extraFieldsGroup`, `published`, `access`, `ordering`, `image`, `params`, `trash`, `plugins`, `language`) VALUES
(1, 'Products Catalog', 'products-catalog', '', 0, 0, 1, 1, 1, '', '{\"inheritFrom\":\"0\",\"theme\":\"\",\"num_leading_items\":\"0\",\"num_leading_columns\":\"1\",\"leadingImgSize\":\"Large\",\"num_primary_items\":\"9\",\"num_primary_columns\":\"3\",\"primaryImgSize\":\"Small\",\"num_secondary_items\":\"0\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Large\",\"num_links\":\"0\",\"num_links_columns\":\"1\",\"linksImgSize\":\"none\",\"catCatalogMode\":\"1\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"publishUp\",\"catPagination\":\"2\",\"catPaginationResults\":\"1\",\"catTitle\":\"0\",\"catTitleItemCounter\":\"0\",\"catDescription\":\"0\",\"catImage\":\"0\",\"catFeedLink\":\"1\",\"catFeedIcon\":\"0\",\"subCategories\":\"1\",\"subCatColumns\":\"3\",\"subCatOrdering\":\"\",\"subCatTitle\":\"1\",\"subCatTitleItemCounter\":\"1\",\"subCatDescription\":\"1\",\"subCatImage\":\"1\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"320\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"1\",\"catItemFeaturedNotice\":\"1\",\"catItemAuthor\":\"0\",\"catItemDateCreated\":\"0\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"0\",\"catItemIntroTextWordLimit\":\"\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"0\",\"catItemTags\":\"0\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"0\",\"catItemCommentsAnchor\":\"1\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"0\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"1\",\"itemAuthor\":\"0\",\"itemFontResizer\":\"1\",\"itemPrintButton\":\"1\",\"itemEmailButton\":\"1\",\"itemSocialButton\":\"1\",\"itemVideoAnchor\":\"1\",\"itemImageGalleryAnchor\":\"1\",\"itemCommentsAnchor\":\"0\",\"itemRating\":\"1\",\"itemImage\":\"1\",\"itemImgSize\":\"Large\",\"itemImageMainCaption\":\"1\",\"itemImageMainCredits\":\"1\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"1\",\"itemDateModified\":\"0\",\"itemHits\":\"1\",\"itemCategory\":\"1\",\"itemTags\":\"1\",\"itemAttachments\":\"1\",\"itemAttachmentsCounter\":\"1\",\"itemVideo\":\"1\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemImageGallery\":\"1\",\"itemNavigation\":\"1\",\"itemComments\":\"1\",\"itemTwitterButton\":\"0\",\"itemFacebookButton\":\"0\",\"itemGooglePlusOneButton\":\"0\",\"itemAuthorBlock\":\"0\",\"itemAuthorImage\":\"1\",\"itemAuthorDescription\":\"1\",\"itemAuthorURL\":\"0\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"0\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"1\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"1\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"Small\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}', 0, '', '*'),
(2, 'Wooden Parquet', 'wooden-parquet', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>', 1, 1, 1, 1, 1, '2.jpg', '{\"inheritFrom\":\"1\",\"theme\":\"\",\"num_leading_items\":\"2\",\"num_leading_columns\":\"1\",\"leadingImgSize\":\"Large\",\"num_primary_items\":\"4\",\"num_primary_columns\":\"2\",\"primaryImgSize\":\"Medium\",\"num_secondary_items\":\"4\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Small\",\"num_links\":\"4\",\"num_links_columns\":\"1\",\"linksImgSize\":\"XSmall\",\"catCatalogMode\":\"0\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"\",\"catPagination\":\"2\",\"catPaginationResults\":\"1\",\"catTitle\":\"1\",\"catTitleItemCounter\":\"1\",\"catDescription\":\"1\",\"catImage\":\"1\",\"catFeedLink\":\"1\",\"catFeedIcon\":\"1\",\"subCategories\":\"1\",\"subCatColumns\":\"2\",\"subCatOrdering\":\"\",\"subCatTitle\":\"1\",\"subCatTitleItemCounter\":\"1\",\"subCatDescription\":\"1\",\"subCatImage\":\"1\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"1\",\"catItemFeaturedNotice\":\"0\",\"catItemAuthor\":\"1\",\"catItemDateCreated\":\"1\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"1\",\"catItemIntroTextWordLimit\":\"\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"1\",\"catItemTags\":\"1\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"1\",\"catItemCommentsAnchor\":\"1\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"1\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"1\",\"itemAuthor\":\"1\",\"itemFontResizer\":\"1\",\"itemPrintButton\":\"1\",\"itemEmailButton\":\"1\",\"itemSocialButton\":\"1\",\"itemVideoAnchor\":\"1\",\"itemImageGalleryAnchor\":\"1\",\"itemCommentsAnchor\":\"1\",\"itemRating\":\"1\",\"itemImage\":\"1\",\"itemImgSize\":\"Large\",\"itemImageMainCaption\":\"1\",\"itemImageMainCredits\":\"1\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"1\",\"itemDateModified\":\"1\",\"itemHits\":\"1\",\"itemCategory\":\"1\",\"itemTags\":\"1\",\"itemAttachments\":\"1\",\"itemAttachmentsCounter\":\"1\",\"itemVideo\":\"1\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemImageGallery\":\"1\",\"itemNavigation\":\"1\",\"itemComments\":\"1\",\"itemTwitterButton\":\"1\",\"itemFacebookButton\":\"1\",\"itemGooglePlusOneButton\":\"1\",\"itemAuthorBlock\":\"1\",\"itemAuthorImage\":\"1\",\"itemAuthorDescription\":\"1\",\"itemAuthorURL\":\"1\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"1\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"1\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"1\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"0\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}', 0, '', '*'),
(3, 'Classic Parquet', 'classic-parquet', '<p>Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur.</p>', 1, 1, 1, 1, 2, '3.jpg', '{\"inheritFrom\":\"1\",\"theme\":\"\",\"num_leading_items\":\"2\",\"num_leading_columns\":\"1\",\"leadingImgSize\":\"Large\",\"num_primary_items\":\"4\",\"num_primary_columns\":\"2\",\"primaryImgSize\":\"Medium\",\"num_secondary_items\":\"4\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Small\",\"num_links\":\"4\",\"num_links_columns\":\"1\",\"linksImgSize\":\"XSmall\",\"catCatalogMode\":\"0\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"\",\"catPagination\":\"2\",\"catPaginationResults\":\"1\",\"catTitle\":\"1\",\"catTitleItemCounter\":\"1\",\"catDescription\":\"1\",\"catImage\":\"1\",\"catFeedLink\":\"1\",\"catFeedIcon\":\"1\",\"subCategories\":\"1\",\"subCatColumns\":\"2\",\"subCatOrdering\":\"\",\"subCatTitle\":\"1\",\"subCatTitleItemCounter\":\"1\",\"subCatDescription\":\"1\",\"subCatImage\":\"1\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"1\",\"catItemFeaturedNotice\":\"0\",\"catItemAuthor\":\"1\",\"catItemDateCreated\":\"1\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"1\",\"catItemIntroTextWordLimit\":\"\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"1\",\"catItemTags\":\"1\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"1\",\"catItemCommentsAnchor\":\"1\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"1\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"1\",\"itemAuthor\":\"1\",\"itemFontResizer\":\"1\",\"itemPrintButton\":\"1\",\"itemEmailButton\":\"1\",\"itemSocialButton\":\"1\",\"itemVideoAnchor\":\"1\",\"itemImageGalleryAnchor\":\"1\",\"itemCommentsAnchor\":\"1\",\"itemRating\":\"1\",\"itemImage\":\"1\",\"itemImgSize\":\"Large\",\"itemImageMainCaption\":\"1\",\"itemImageMainCredits\":\"1\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"1\",\"itemDateModified\":\"1\",\"itemHits\":\"1\",\"itemCategory\":\"1\",\"itemTags\":\"1\",\"itemAttachments\":\"1\",\"itemAttachmentsCounter\":\"1\",\"itemVideo\":\"1\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemImageGallery\":\"1\",\"itemNavigation\":\"1\",\"itemComments\":\"1\",\"itemTwitterButton\":\"1\",\"itemFacebookButton\":\"1\",\"itemGooglePlusOneButton\":\"1\",\"itemAuthorBlock\":\"1\",\"itemAuthorImage\":\"1\",\"itemAuthorDescription\":\"1\",\"itemAuthorURL\":\"1\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"1\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"1\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"1\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"0\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}', 0, '', '*'),
(4, 'Solid Wood Parquet', 'solid-wood-parquet', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>', 1, 1, 1, 1, 3, '4.jpg', '{\"inheritFrom\":\"1\",\"theme\":\"\",\"num_leading_items\":\"2\",\"num_leading_columns\":\"1\",\"leadingImgSize\":\"Large\",\"num_primary_items\":\"4\",\"num_primary_columns\":\"2\",\"primaryImgSize\":\"Medium\",\"num_secondary_items\":\"4\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Small\",\"num_links\":\"4\",\"num_links_columns\":\"1\",\"linksImgSize\":\"XSmall\",\"catCatalogMode\":\"0\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"\",\"catPagination\":\"2\",\"catPaginationResults\":\"1\",\"catTitle\":\"1\",\"catTitleItemCounter\":\"1\",\"catDescription\":\"1\",\"catImage\":\"1\",\"catFeedLink\":\"1\",\"catFeedIcon\":\"1\",\"subCategories\":\"1\",\"subCatColumns\":\"2\",\"subCatOrdering\":\"\",\"subCatTitle\":\"1\",\"subCatTitleItemCounter\":\"1\",\"subCatDescription\":\"1\",\"subCatImage\":\"1\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"1\",\"catItemFeaturedNotice\":\"0\",\"catItemAuthor\":\"1\",\"catItemDateCreated\":\"1\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"1\",\"catItemIntroTextWordLimit\":\"\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"1\",\"catItemTags\":\"1\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"1\",\"catItemCommentsAnchor\":\"1\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"1\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"1\",\"itemAuthor\":\"1\",\"itemFontResizer\":\"1\",\"itemPrintButton\":\"1\",\"itemEmailButton\":\"1\",\"itemSocialButton\":\"1\",\"itemVideoAnchor\":\"1\",\"itemImageGalleryAnchor\":\"1\",\"itemCommentsAnchor\":\"1\",\"itemRating\":\"1\",\"itemImage\":\"1\",\"itemImgSize\":\"Large\",\"itemImageMainCaption\":\"1\",\"itemImageMainCredits\":\"1\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"1\",\"itemDateModified\":\"1\",\"itemHits\":\"1\",\"itemCategory\":\"1\",\"itemTags\":\"1\",\"itemAttachments\":\"1\",\"itemAttachmentsCounter\":\"1\",\"itemVideo\":\"1\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemImageGallery\":\"1\",\"itemNavigation\":\"1\",\"itemComments\":\"1\",\"itemTwitterButton\":\"1\",\"itemFacebookButton\":\"1\",\"itemGooglePlusOneButton\":\"1\",\"itemAuthorBlock\":\"1\",\"itemAuthorImage\":\"1\",\"itemAuthorDescription\":\"1\",\"itemAuthorURL\":\"1\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"1\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"1\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"1\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"0\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}', 0, '', '*');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_comments`
--

CREATE TABLE `cms_k2_comments` (
  `id` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `commentText` text NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `commentURL` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_extra_fields`
--

CREATE TABLE `cms_k2_extra_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_extra_fields`
--

INSERT INTO `cms_k2_extra_fields` (`id`, `name`, `value`, `type`, `group`, `published`, `ordering`) VALUES
(1, 'SKU Number', '[{\"name\":null,\"value\":\"\",\"target\":null,\"alias\":\"SKUNumber\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 1),
(2, 'Hardness', '[{\"name\":null,\"value\":\"Hard Wood\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 2),
(3, 'Finish', '[{\"name\":null,\"value\":\"semi-glossy lacquer\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 3),
(4, 'Dimensions LxWxH [mm]', '[{\"name\":null,\"value\":\"32 mm x 1800 mm x 600 mm\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 4),
(5, 'Number of boards in pack', '[{\"name\":null,\"value\":\"24\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 5),
(6, 'Pack weight [kg]', '[{\"name\":null,\"value\":\"18kg\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 6),
(7, 'm2 in one pack', '[{\"name\":null,\"value\":\"1,45m2\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 7),
(8, 'Warranty', '[{\"name\":null,\"value\":\"36m\",\"target\":null,\"alias\":\"\",\"required\":0,\"showNull\":0}]', 'textfield', 1, 1, 8);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_extra_fields_groups`
--

CREATE TABLE `cms_k2_extra_fields_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_extra_fields_groups`
--

INSERT INTO `cms_k2_extra_fields_groups` (`id`, `name`) VALUES
(1, 'Wooden Floors - Additional Informations');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_items`
--

CREATE TABLE `cms_k2_items` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `video` text,
  `gallery` varchar(255) DEFAULT NULL,
  `extra_fields` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `extra_fields_search` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `featured` smallint(6) NOT NULL DEFAULT '0',
  `featured_ordering` int(11) NOT NULL DEFAULT '0',
  `image_caption` text NOT NULL,
  `image_credits` varchar(255) NOT NULL,
  `video_caption` text NOT NULL,
  `video_credits` varchar(255) NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL,
  `params` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `metakey` text NOT NULL,
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_items`
--

INSERT INTO `cms_k2_items` (`id`, `title`, `alias`, `catid`, `published`, `introtext`, `fulltext`, `video`, `gallery`, `extra_fields`, `extra_fields_search`, `created`, `created_by`, `created_by_alias`, `checked_out`, `checked_out_time`, `modified`, `modified_by`, `publish_up`, `publish_down`, `trash`, `access`, `ordering`, `featured`, `featured_ordering`, `image_caption`, `image_credits`, `video_caption`, `video_credits`, `hits`, `params`, `metadesc`, `metadata`, `metakey`, `plugins`, `language`) VALUES
(1, 'Oak Diamond', 'oak-diamond', 2, 1, '<p>In vitae aliquet libero. Morbi eu massa non dui fringilla venenatis. Aenean nisi lorem, pharetra id diam ut, pulvinar molestie massa. Vestibulum tincidunt justo in dui venenatis tristique. Donec hendrerit dui dolor, a vulputate diam congue in. Phasellus a ipsum elit. Fusce eu placerat nibh, a condimentum tellus.</p>\r\n<p>Aenean auctor placerat ornare. Nam eu diam semper, vehicula nisi congue, pellentesque est. Praesent egestas posuere erat. Duis ipsum odio, eleifend quis turpis ut, ultricies sodales lacus. Suspendisse laoreet odio ut orci viverra malesuada. Maecenas risus leo.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-004\"},{\"id\":\"2\",\"value\":\"Hard wood (C03)\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"10kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-004 Hard wood (C03) semi-glossy lacquer 24 mm x 1800 mm x 600 mm 12 10kg 1,45m2 72m ', '2014-02-17 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 15:33:29', 488, '2014-02-18 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, 0, 0, '', '', '', '', 6, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(2, 'Wooden Parquet (Dark Oak)', 'wooden-parquet-dark-oak', 2, 1, '<p>Fusce auctor mollis urna, ut imperdiet elit. Morbi bibendum feugiat facilisis. In hac habitasse platea dictumst. Sed at nibh lectus. Donec consectetur hendrerit orci, id iaculis tortor tincidunt vitae. Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur. Etiam est velit, pretium eget urna vitae, fermentum malesuada ipsum.</p>\r\n<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-001\"},{\"id\":\"2\",\"value\":\"Hard wood (C03)\"},{\"id\":\"3\",\"value\":\"glossy lacquer\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-001 Hard wood (C03) glossy lacquer 24 mm x 1800 mm x 600 mm 24 24kg 7,25m2 72m ', '2014-02-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 15:33:45', 488, '2014-02-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 2, 1, 1, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(3, 'Classic Oak (bright)', 'classic-oak-bright', 2, 1, '<p>Nulla a pulvinar sem, et semper nisl. Maecenas ultricies id nulla et vestibulum. Praesent scelerisque laoreet sem id porta. Donec nec varius mi. Nullam ornare dignissim tincidunt. Nam rhoncus mauris nulla, cursus eleifend ante dictum non. Mauris ante nunc, faucibus eu dolor cursus, lacinia imperdiet dui.</p>\r\n<p>Proin vel dapibus mi. Ut vitae justo lorem. Donec vestibulum molestie orci, ut volutpat sapien. In vitae aliquet libero. Morbi eu massa non dui fringilla venenatis. Aenean nisi lorem, pharetra id diam ut, pulvinar molestie massa.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-005\"},{\"id\":\"2\",\"value\":\"Hard wood (C05)\"},{\"id\":\"3\",\"value\":\"glossy lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-005 Hard wood (C05) glossy lacquer 32 mm x 1800 mm x 600 mm 12 18kg 7,25m2 72m ', '2014-01-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 15:33:57', 488, '2014-01-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 3, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(4, 'Hardwood Dark Parquet', 'hardwood-dark-parquet', 2, 1, '<p>Fusce eu placerat nibh, a condimentum tellus. Aenean auctor placerat ornare. Nam eu diam semper, vehicula nisi congue, pellentesque est. Praesent egestas posuere erat. Duis ipsum odio, eleifend quis turpis ut, ultricies sodales lacus. Suspendisse laoreet odio ut orci viverra malesuada.</p>\r\n<p>Maecenas risus leo, pulvinar id iaculis non, eleifend vel ipsum. Suspendisse vitae blandit tortor, in commodo odio. Proin quis turpis eget tortor dictum ullamcorper auctor vel turpis. Fusce auctor mollis urna, ut imperdiet elit. Morbi bibendum feugiat facilisis.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-006\"},{\"id\":\"2\",\"value\":\"Hard wood (C05)\"},{\"id\":\"3\",\"value\":\"glossy lacquer\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"10kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-006 Hard wood (C05) glossy lacquer 24 mm x 1800 mm x 600 mm 12 10kg 1,45m2 72m ', '2014-01-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 15:34:10', 488, '2014-01-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 4, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(5, 'Classic Oak Tiles', 'classic-oak-tiles', 2, 1, '<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan nisi tincidunt, porta sagittis justo.</p>\r\n<p>Nullam placerat neque diam, at laoreet est rutrum nec. In nec bibendum libero. Praesent volutpat enim nec eros facilisis, a pulvinar felis congue. Curabitur ornare sit amet diam a sollicitudin. Nam lacus dui, tincidunt at imperdiet at, hendrerit ac erat.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-007\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"10kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-007 Hard Wood semi-glossy 32 mm x 1800 mm x 600 mm 12 10kg 1,45m2 72m ', '2014-01-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 15:34:21', 488, '2014-01-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 5, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(6, 'Light Oak Diamond', 'light-oak-diamond', 2, 1, '<p>Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur. Etiam est velit, pretium eget urna vitae, fermentum malesuada ipsum. Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius.</p>\r\n<p>Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan nisi tincidunt, porta sagittis justo. Nullam placerat neque diam, at laoreet est rutrum nec. In nec bibendum libero.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-009\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer (limited gold edition)\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-009 Hard Wood semi-glossy lacquer (limited gold edition) 32 mm x 1800 mm x 600 mm 24 24kg 7,25m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:41:31', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 6, 0, 0, '', '', '', '', 2, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(7, 'Parquet Red Oak (002)', 'parquet-red-oak-002', 2, 1, '<p>Nullam congue odio quis eleifend euismod. Aenean est nisi, fringilla quis tincidunt eget, lacinia sit amet metus. Duis quis nisi neque. Proin pharetra ligula ligula, sit amet dapibus orci dignissim nec. Nulla a pulvinar sem, et semper nisl. Maecenas ultricies id nulla et vestibulum. Praesent scelerisque laoreet sem id porta.</p>\r\n<p>Donec nec varius mi. Nullam ornare dignissim tincidunt. Nam rhoncus mauris nulla, cursus eleifend ante dictum non. Mauris ante nunc, faucibus eu dolor cursus, lacinia imperdiet dui. Proin vel dapibus mi. Ut vitae justo lorem.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-010\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-010 Hard Wood semi-glossy 24 mm x 1800 mm x 600 mm 12 18kg 7,25m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:41:26', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 7, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(8, 'Hardwood Parquet', 'hardwood-parquet', 2, 1, '<p>Fusce auctor mollis urna, ut imperdiet elit. Morbi bibendum feugiat facilisis. In hac habitasse platea dictumst. Sed at nibh lectus. Donec consectetur hendrerit orci, id iaculis tortor tincidunt vitae. Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur. Etiam est velit, pretium eget urna vitae, fermentum malesuada ipsum.</p>\r\n<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-015\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"Matte lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'GH-I435-015 Hard Wood Matte lacquer 32 mm x 1800 mm x 600 mm 24 24kg 7,25m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:41:20', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 8, 0, 0, '', '', '', '', 7, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(9, 'Parquet Dark Oak', 'parquet-dark-oak', 2, 1, '<p>Donec hendrerit dui dolor, a vulputate diam congue in. Phasellus a ipsum elit. Fusce eu placerat nibh, a condimentum tellus. Aenean auctor placerat ornare. Nam eu diam semper, vehicula nisi congue, pellentesque est. Praesent egestas posuere erat. Duis ipsum odio, eleifend quis turpis ut, ultricies sodales lacus.</p>\r\n<p>Suspendisse laoreet odio ut orci viverra malesuada. Maecenas risus leo, pulvinar id iaculis non, eleifend vel ipsum. Suspendisse vitae blandit tortor, in commodo odio. Proin quis turpis eget tortor dictum ullamcorper auctor vel turpis.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-016\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-016 Hard Wood semi-glossy lacquer 32 mm x 1800 mm x 600 mm 24 24kg 1,45m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:41:14', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 9, 1, 2, '', '', '', '', 4, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(10, 'Parquet Red Oak', 'parquet-red-oak', 2, 1, '<p>Maecenas ultricies id nulla et vestibulum. Praesent scelerisque laoreet sem id porta. Donec nec varius mi. Nullam ornare dignissim tincidunt. Nam rhoncus mauris nulla, cursus eleifend ante dictum non. Mauris ante nunc, faucibus eu dolor cursus, lacinia imperdiet dui. Proin vel dapibus mi.</p>\r\n<p>Ut vitae justo lorem. Donec vestibulum molestie orci, ut volutpat sapien. In vitae aliquet libero. Morbi eu massa non dui fringilla venenatis. Aenean nisi lorem, pharetra id diam ut, pulvinar molestie massa.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-012\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'GH-I435-012 Hard Wood semi-glossy 24 mm x 1800 mm x 600 mm 12 18kg 7,25m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:41:09', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 10, 0, 0, '', '', '', '', 1, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(11, 'Parquet Red Oak (01)', 'parquet-red-oak-01', 3, 1, '<p>Nullam congue odio quis eleifend euismod. Aenean est nisi, fringilla quis tincidunt eget, lacinia sit amet metus. Duis quis nisi neque. Proin pharetra ligula ligula, sit amet dapibus orci dignissim nec. Nulla a pulvinar sem, et semper nisl. Maecenas ultricies id nulla et vestibulum. Praesent scelerisque laoreet sem id porta.</p>\r\n<p>Donec nec varius mi. Nullam ornare dignissim tincidunt. Nam rhoncus mauris nulla, cursus eleifend ante dictum non. Mauris ante nunc, faucibus eu dolor cursus, lacinia imperdiet dui. Proin vel dapibus mi. Ut vitae justo lorem.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"ZH-I435-010\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'ZH-I435-010 Hard Wood semi-glossy 24 mm x 1800 mm x 600 mm 12 18kg 7,25m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:44:42', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, 1, 3, '', '', '', '', 4, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(12, 'Light Oak Diamond (01)', 'light-oak-diamond-01', 3, 1, '<p>Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur. Etiam est velit, pretium eget urna vitae, fermentum malesuada ipsum. Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius.</p>\r\n<p>Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan nisi tincidunt, porta sagittis justo. Nullam placerat neque diam, at laoreet est rutrum nec. In nec bibendum libero.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"ZH-I435-009\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"semi-glossy lacquer (limited gold edition)\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'ZH-I435-009 Hard Wood semi-glossy lacquer semi-glossy lacquer (limited gold edition) 24 24kg 7,25m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:46:26', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 2, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(13, 'Classic Oak Tiles (01)', 'classic-oak-tiles-01', 3, 1, '<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan nisi tincidunt, porta sagittis justo.</p>\r\n<p>Nullam placerat neque diam, at laoreet est rutrum nec. In nec bibendum libero. Praesent volutpat enim nec eros facilisis, a pulvinar felis congue. Curabitur ornare sit amet diam a sollicitudin. Nam lacus dui, tincidunt at imperdiet at, hendrerit ac erat.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-007\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"10kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-007 Hard Wood semi-glossy 32 mm x 1800 mm x 600 mm 12 10kg 1,45m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:48:27', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 3, 0, 0, '', '', '', '', 1, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(14, 'Hardwood Dark Parquet (01)', 'hardwood-dark-parquet-01', 3, 1, '<p>Fusce eu placerat nibh, a condimentum tellus. Aenean auctor placerat ornare. Nam eu diam semper, vehicula nisi congue, pellentesque est. Praesent egestas posuere erat. Duis ipsum odio, eleifend quis turpis ut, ultricies sodales lacus. Suspendisse laoreet odio ut orci viverra malesuada.</p>\r\n<p>Maecenas risus leo, pulvinar id iaculis non, eleifend vel ipsum. Suspendisse vitae blandit tortor, in commodo odio. Proin quis turpis eget tortor dictum ullamcorper auctor vel turpis. Fusce auctor mollis urna, ut imperdiet elit. Morbi bibendum feugiat facilisis.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"GH-I435-006\"},{\"id\":\"2\",\"value\":\"Hard wood (C05)\"},{\"id\":\"3\",\"value\":\"glossy lacquer\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"10kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'GH-I435-006 Hard wood (C05) glossy lacquer 24 mm x 1800 mm x 600 mm 12 10kg 1,45m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:49:57', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 4, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*');
INSERT INTO `cms_k2_items` (`id`, `title`, `alias`, `catid`, `published`, `introtext`, `fulltext`, `video`, `gallery`, `extra_fields`, `extra_fields_search`, `created`, `created_by`, `created_by_alias`, `checked_out`, `checked_out_time`, `modified`, `modified_by`, `publish_up`, `publish_down`, `trash`, `access`, `ordering`, `featured`, `featured_ordering`, `image_caption`, `image_credits`, `video_caption`, `video_credits`, `hits`, `params`, `metadesc`, `metadata`, `metakey`, `plugins`, `language`) VALUES
(15, 'Classic Oak (bright - 01)', 'classic-oak-bright-01', 3, 1, '<p>Nulla a pulvinar sem, et semper nisl. Maecenas ultricies id nulla et vestibulum. Praesent scelerisque laoreet sem id porta. Donec nec varius mi. Nullam ornare dignissim tincidunt. Nam rhoncus mauris nulla, cursus eleifend ante dictum non. Mauris ante nunc, faucibus eu dolor cursus, lacinia imperdiet dui.</p>\r\n<p>Proin vel dapibus mi. Ut vitae justo lorem. Donec vestibulum molestie orci, ut volutpat sapien. In vitae aliquet libero. Morbi eu massa non dui fringilla venenatis. Aenean nisi lorem, pharetra id diam ut, pulvinar molestie massa.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"ZH-I435-006\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'ZH-I435-006 Hard Wood semi-glossy lacquer 32 mm x 1800 mm x 600 mm 24 18kg 1,45m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:51:10', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 5, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(16, 'Wooden Parquet (Oak 01)', 'wooden-parquet-oak-01', 3, 1, '<p>Fusce auctor mollis urna, ut imperdiet elit. Morbi bibendum feugiat facilisis. In hac habitasse platea dictumst. Sed at nibh lectus. Donec consectetur hendrerit orci, id iaculis tortor tincidunt vitae. Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur. Etiam est velit, pretium eget urna vitae, fermentum malesuada ipsum.</p>\r\n<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"ZH-I435-005\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'ZH-I435-005 Hard Wood semi-glossy lacquer 32 mm x 1800 mm x 600 mm 24 18kg 1,45m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:52:32', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 6, 0, 0, '', '', '', '', 0, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(17, 'Oak Diamond (01)', 'oak-diamond-01', 3, 1, '<p>In vitae aliquet libero. Morbi eu massa non dui fringilla venenatis. Aenean nisi lorem, pharetra id diam ut, pulvinar molestie massa. Vestibulum tincidunt justo in dui venenatis tristique. Donec hendrerit dui dolor, a vulputate diam congue in. Phasellus a ipsum elit. Fusce eu placerat nibh, a condimentum tellus.</p>\r\n<p>Aenean auctor placerat ornare. Nam eu diam semper, vehicula nisi congue, pellentesque est. Praesent egestas posuere erat. Duis ipsum odio, eleifend quis turpis ut, ultricies sodales lacus. Suspendisse laoreet odio ut orci viverra malesuada. Maecenas risus leo.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"ZH-I435-005\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'ZH-I435-005 Hard Wood semi-glossy lacquer 32 mm x 1800 mm x 600 mm 24 18kg 1,45m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:54:00', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 7, 1, 4, '', '', '', '', 1, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(18, 'Parquet Dark Oak (02)', 'parquet-dark-oak-02', 4, 1, '<p>Donec hendrerit dui dolor, a vulputate diam congue in. Phasellus a ipsum elit. Fusce eu placerat nibh, a condimentum tellus. Aenean auctor placerat ornare. Nam eu diam semper, vehicula nisi congue, pellentesque est. Praesent egestas posuere erat. Duis ipsum odio, eleifend quis turpis ut, ultricies sodales lacus.</p>\r\n<p>Suspendisse laoreet odio ut orci viverra malesuada. Maecenas risus leo, pulvinar id iaculis non, eleifend vel ipsum. Suspendisse vitae blandit tortor, in commodo odio. Proin quis turpis eget tortor dictum ullamcorper auctor vel turpis.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"XH-I435-016\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'XH-I435-016 Hard Wood semi-glossy lacquer 32 mm x 1800 mm x 600 mm 24 24kg 1,45m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:55:53', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 1, 1, 5, '', '', '', '', 4, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(19, 'Hardwood Parquet (02)', 'hardwood-parquet-02', 4, 1, '<p>Fusce auctor mollis urna, ut imperdiet elit. Morbi bibendum feugiat facilisis. In hac habitasse platea dictumst. Sed at nibh lectus. Donec consectetur hendrerit orci, id iaculis tortor tincidunt vitae. Donec sagittis nunc id nisi rhoncus, eu rutrum dolor consectetur. Etiam est velit, pretium eget urna vitae, fermentum malesuada ipsum.</p>\r\n<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"XH-I435-015\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"Matte lacquer\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"24\"},{\"id\":\"6\",\"value\":\"24kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'XH-I435-015 Hard Wood Matte lacquer 32 mm x 1800 mm x 600 mm 24 24kg 7,25m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:57:18', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 2, 0, 0, '', '', '', '', 1, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(20, 'Parquet Red Oak (02)', 'parquet-red-oak-02', 4, 1, '<p>Maecenas ultricies id nulla et vestibulum. Praesent scelerisque laoreet sem id porta. Donec nec varius mi. Nullam ornare dignissim tincidunt. Nam rhoncus mauris nulla, cursus eleifend ante dictum non. Mauris ante nunc, faucibus eu dolor cursus, lacinia imperdiet dui. Proin vel dapibus mi.</p>\r\n<p>Ut vitae justo lorem. Donec vestibulum molestie orci, ut volutpat sapien. In vitae aliquet libero. Morbi eu massa non dui fringilla venenatis. Aenean nisi lorem, pharetra id diam ut, pulvinar molestie massa.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"XH-I435-012\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"24 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"18kg\"},{\"id\":\"7\",\"value\":\"7,25m2\"},{\"id\":\"8\",\"value\":\"36m\"}]', 'XH-I435-012 Hard Wood semi-glossy 24 mm x 1800 mm x 600 mm 12 18kg 7,25m2 36m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 09:58:45', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 3, 0, 0, '', '', '', '', 1, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*'),
(21, 'Classic Oak Tiles (02)', 'classic-oak-tiles-02', 4, 1, '<p>Vivamus eget magna a orci pellentesque egestas. Ut quis elementum turpis. Donec et ante dui. Etiam aliquam odio sed justo molestie, sed auctor ipsum varius. Quisque felis odio, mollis eu ante pharetra, porttitor pharetra nunc. Sed risus magna, cursus accumsan nisi tincidunt, porta sagittis justo.</p>\r\n<p>Nullam placerat neque diam, at laoreet est rutrum nec. In nec bibendum libero. Praesent volutpat enim nec eros facilisis, a pulvinar felis congue. Curabitur ornare sit amet diam a sollicitudin. Nam lacus dui, tincidunt at imperdiet at, hendrerit ac erat.</p>', '', NULL, NULL, '[{\"id\":\"1\",\"value\":\"XH-I435-007\"},{\"id\":\"2\",\"value\":\"Hard Wood\"},{\"id\":\"3\",\"value\":\"semi-glossy\"},{\"id\":\"4\",\"value\":\"32 mm x 1800 mm x 600 mm\"},{\"id\":\"5\",\"value\":\"12\"},{\"id\":\"6\",\"value\":\"10kg\"},{\"id\":\"7\",\"value\":\"1,45m2\"},{\"id\":\"8\",\"value\":\"72m\"}]', 'XH-I435-007 Hard Wood semi-glossy 32 mm x 1800 mm x 600 mm 12 10kg 1,45m2 72m ', '2014-03-22 00:00:00', 488, '', 0, '0000-00-00 00:00:00', '2014-03-22 10:00:38', 488, '2014-03-22 00:00:00', '0000-00-00 00:00:00', 0, 1, 4, 0, 0, '', '', '', '', 2, '{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}', '', 'robots=\nauthor=', '', '', '*');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_rating`
--

CREATE TABLE `cms_k2_rating` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_tags`
--

CREATE TABLE `cms_k2_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_tags`
--

INSERT INTO `cms_k2_tags` (`id`, `name`, `published`) VALUES
(1, 'Oak,', 1),
(2, 'Diamnod', 1),
(3, 'Classic', 1),
(4, 'Tiles', 1),
(5, 'Dark', 1),
(6, 'Hardwood', 1),
(7, 'Light', 1),
(8, 'Red', 1),
(9, 'Parquet', 1),
(10, 'Solid Wood', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_tags_xref`
--

CREATE TABLE `cms_k2_tags_xref` (
  `id` int(11) NOT NULL,
  `tagID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_tags_xref`
--

INSERT INTO `cms_k2_tags_xref` (`id`, `tagID`, `itemID`) VALUES
(32, 3, 10),
(33, 8, 10),
(34, 1, 9),
(35, 5, 9),
(36, 4, 9),
(37, 6, 8),
(38, 9, 8),
(39, 8, 7),
(40, 3, 7),
(41, 2, 6),
(42, 1, 6),
(43, 7, 6),
(59, 3, 11),
(60, 8, 11),
(64, 7, 12),
(65, 1, 12),
(66, 2, 12),
(70, 4, 13),
(71, 1, 13),
(72, 7, 13),
(76, 4, 14),
(77, 6, 14),
(78, 5, 14),
(82, 3, 15),
(83, 7, 15),
(84, 1, 15),
(88, 6, 16),
(89, 1, 16),
(90, 5, 16),
(96, 4, 17),
(97, 3, 17),
(98, 2, 17),
(99, 1, 17),
(100, 9, 17),
(105, 4, 18),
(106, 5, 18),
(107, 1, 18),
(108, 10, 18),
(111, 10, 19),
(112, 6, 19),
(116, 8, 20),
(117, 3, 20),
(118, 10, 20),
(124, 4, 21),
(125, 7, 21),
(126, 1, 21),
(127, 10, 21),
(128, 3, 21),
(129, 1, 1),
(130, 2, 1),
(131, 3, 1),
(132, 4, 1),
(133, 5, 2),
(134, 1, 2),
(135, 6, 2),
(136, 1, 3),
(137, 7, 3),
(138, 3, 3),
(139, 5, 4),
(140, 6, 4),
(141, 4, 4),
(142, 1, 5),
(143, 7, 5),
(144, 4, 5);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_users`
--

CREATE TABLE `cms_k2_users` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_users`
--

INSERT INTO `cms_k2_users` (`id`, `userID`, `userName`, `gender`, `description`, `image`, `url`, `group`, `plugins`, `ip`, `hostname`, `notes`) VALUES
(1, 488, NULL, 'm', '', NULL, NULL, 9, '', '', '', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_k2_user_groups`
--

CREATE TABLE `cms_k2_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_k2_user_groups`
--

INSERT INTO `cms_k2_user_groups` (`id`, `name`, `permissions`) VALUES
(10, 'Site Owner', '{\"comment\":\"1\",\"frontEdit\":\"1\",\"add\":\"1\",\"editOwn\":\"1\",\"editAll\":\"1\",\"publish\":\"1\",\"editPublished\":\"0\",\"inheritance\":\"1\",\"categories\":\"all\"}'),
(11, 'Registered', '{\"comment\":\"1\",\"frontEdit\":\"0\",\"add\":\"0\",\"editOwn\":\"0\",\"editAll\":\"0\",\"publish\":\"0\",\"editPublished\":\"0\",\"inheritance\":\"0\",\"categories\":\"all\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_languages`
--

CREATE TABLE `cms_languages` (
  `lang_id` int(11) UNSIGNED NOT NULL,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_languages`
--

INSERT INTO `cms_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1),
(2, 'el-GR', 'Greek', 'Greek', 'gr', 'el', '', '', '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_menu`
--

CREATE TABLE `cms_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_menu`
--

INSERT INTO `cms_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 117, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 39, 44, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 40, 41, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 42, 43, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 49, 54, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 50, 51, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 52, 53, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 55, 60, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 56, 57, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 58, 59, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 73, 74, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 63, 64, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 65, 70, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 66, 67, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 68, 69, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 61, 62, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 71, 72, 0, '*', 1),
(23, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 33, 34, 0, '', 1),
(101, 'mainmenu', 'ΑΡΧΙΚΗ', 'home', '', 'home', 'index.php?option=com_content&view=article&id=52', 'component', 1, 1, 1, 22, 488, '2018-05-12 05:10:38', 0, 1, '', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\\u0391\\u03a1\\u03a7\\u0399\\u039a\\u0397\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 11, 12, 1, '*', 0),
(103, 'authormenu', 'Change Password', 'change-password', '', 'change-password', 'index.php?option=com_users&view=profile&layout=edit', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 35, 36, 0, '*', 0),
(104, 'authormenu', 'Create Article', 'create-article', '', 'create-article', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{\"enable_category\":\"0\",\"catid\":\"9\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 37, 38, 0, '*', 0),
(106, 'authormenu', 'Site Administrator', '2012-01-04-15-46-42', '', '2012-01-04-15-46-42', 'administrator', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 3, '', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}', 45, 46, 0, '*', 0),
(107, 'authormenu', 'Log out', 'log-out', '', 'log-out', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"login_redirect_url\":\"\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"logout_redirect_url\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 47, 48, 0, '*', 0),
(154, 'legal', 'Disclaimer', '2013-04-06-09-07-46', '', '2013-04-06-09-07-46', '#', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}', 23, 24, 0, '*', 0),
(155, 'legal', 'Terms of use', '2013-04-06-09-07-47', '', '2013-04-06-09-07-47', '#', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}', 25, 26, 0, '*', 0),
(156, 'legal', 'Legal', '2013-04-06-09-07-48', '', '2013-04-06-09-07-48', '#', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}', 21, 22, 0, '*', 0),
(157, 'legal', 'Copyrights', '2013-04-06-09-07-49', '', '2013-04-06-09-07-49', '#', 'url', -2, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}', 27, 28, 0, '*', 0),
(187, 'legal', 'Tags', 'tags', '', 'tags', 'index.php?option=com_tags&view=tags&parent_id=&tag_list_language_filter=', 'component', -2, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"tag_columns\":4,\"all_tags_description\":\"\",\"all_tags_show_description_image\":\"\",\"all_tags_description_image\":\"\",\"all_tags_orderby\":\"\",\"all_tags_orderby_direction\":\"\",\"all_tags_show_tag_image\":\"\",\"all_tags_show_tag_description\":\"\",\"all_tags_tag_maximum_characters\":0,\"all_tags_show_tag_hits\":\"\",\"maximum\":200,\"filter_field\":\"\",\"show_pagination_limit\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_feed_link\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 29, 30, 0, '*', 0),
(207, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 31, 32, 0, '*', 1),
(233, 'main', 'COM_K2', 'com-k2', '', 'com-k2', 'index.php?option=com_k2', 'component', 0, 1, 1, 10043, 0, '0000-00-00 00:00:00', 0, 1, '../media/k2/assets/images/system/k2_16x16.png', 0, '', 75, 96, 0, '', 1),
(234, 'main', 'K2_ITEMS', 'k2-items', '', 'com-k2/k2-items', 'index.php?option=com_k2&view=items', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 76, 77, 0, '', 1),
(235, 'main', 'K2_CATEGORIES', 'k2-categories', '', 'com-k2/k2-categories', 'index.php?option=com_k2&view=categories', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 78, 79, 0, '', 1),
(236, 'main', 'K2_TAGS', 'k2-tags', '', 'com-k2/k2-tags', 'index.php?option=com_k2&view=tags', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 80, 81, 0, '', 1),
(237, 'main', 'K2_COMMENTS', 'k2-comments', '', 'com-k2/k2-comments', 'index.php?option=com_k2&view=comments', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 82, 83, 0, '', 1),
(238, 'main', 'K2_USERS', 'k2-users', '', 'com-k2/k2-users', 'index.php?option=com_k2&view=users', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 84, 85, 0, '', 1),
(239, 'main', 'K2_USER_GROUPS', 'k2-user-groups', '', 'com-k2/k2-user-groups', 'index.php?option=com_k2&view=usergroups', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 86, 87, 0, '', 1),
(240, 'main', 'K2_EXTRA_FIELDS', 'k2-extra-fields', '', 'com-k2/k2-extra-fields', 'index.php?option=com_k2&view=extrafields', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 88, 89, 0, '', 1),
(241, 'main', 'K2_EXTRA_FIELD_GROUPS', 'k2-extra-field-groups', '', 'com-k2/k2-extra-field-groups', 'index.php?option=com_k2&view=extrafieldsgroups', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 90, 91, 0, '', 1),
(242, 'main', 'K2_MEDIA_MANAGER', 'k2-media-manager', '', 'com-k2/k2-media-manager', 'index.php?option=com_k2&view=media', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 92, 93, 0, '', 1),
(243, 'main', 'K2_INFORMATION', 'k2-information', '', 'com-k2/k2-information', 'index.php?option=com_k2&view=info', 'component', 0, 233, 2, 10043, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 94, 95, 0, '', 1),
(251, 'main', 'Fabrik', 'fabrik', '', 'fabrik', 'index.php?option=com_fabrik', 'component', 0, 1, 1, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/fabrik.png', 0, '', 97, 114, 0, '', 1),
(252, 'main', 'com_fabrik_lists', 'com-fabrik-lists', '', 'fabrik/com-fabrik-lists', 'index.php?option=com_fabrik&view=lists', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/lists.png', 0, '', 98, 99, 0, '', 1),
(253, 'main', 'com_fabrik_forms', 'com-fabrik-forms', '', 'fabrik/com-fabrik-forms', 'index.php?option=com_fabrik&view=forms', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/forms.png', 0, '', 100, 101, 0, '', 1),
(254, 'main', 'com_fabrik_groups', 'com-fabrik-groups', '', 'fabrik/com-fabrik-groups', 'index.php?option=com_fabrik&view=groups', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/groups.png', 0, '', 102, 103, 0, '', 1),
(255, 'main', 'com_fabrik_elements', 'com-fabrik-elements', '', 'fabrik/com-fabrik-elements', 'index.php?option=com_fabrik&view=elements', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/elements.png', 0, '', 104, 105, 0, '', 1),
(256, 'main', 'com_fabrik_visualizations', 'com-fabrik-visualizations', '', 'fabrik/com-fabrik-visualizations', 'index.php?option=com_fabrik&view=visualizations', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/visualizations.png', 0, '', 106, 107, 0, '', 1),
(257, 'main', 'com_fabrik_packages', 'com-fabrik-packages', '', 'fabrik/com-fabrik-packages', 'index.php?option=com_fabrik&view=packages', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/packages.png', 0, '', 108, 109, 0, '', 1),
(258, 'main', 'com_fabrik_connections', 'com-fabrik-connections', '', 'fabrik/com-fabrik-connections', 'index.php?option=com_fabrik&view=connections', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/connections.png', 0, '', 110, 111, 0, '', 1),
(259, 'main', 'com_fabrik_schedule', 'com-fabrik-schedule', '', 'fabrik/com-fabrik-schedule', 'index.php?option=com_fabrik&view=crons', 'component', 0, 251, 2, 10094, 0, '0000-00-00 00:00:00', 0, 1, '../administrator/components/com_fabrik/images/schedules.png', 0, '', 112, 113, 0, '', 1),
(260, 'mainmenu', 'ΤΟΠΟΘΕΣΙΕΣ', 'location', '', 'location', 'index.php?option=com_fabrik&view=list&listid=1', 'component', 1, 1, 1, 10094, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"calculations\":\"0\",\"listlayout\":\"\",\"resetfilters\":\"0\",\"list_elements\":\"null\",\"prefilters\":\"null\",\"rows_per_page\":\"10\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 13, 14, 0, '*', 0),
(264, 'mainmenu', 'Λίστα Ειδοποιήσεων', 'notifications', '', '2/notifications', '', 'separator', 0, 265, 2, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"menu_image\":\"\",\"menu_text\":1}', 18, 19, 0, '*', 0),
(265, 'mainmenu', 'ΕΙΔΟΠΟΙΗΣΕΙΣ', '2', '', '2', '', 'separator', 1, 1, 1, 0, 488, '2018-02-07 09:50:15', 0, 1, '', 0, '{\"menu_image\":\"\",\"menu_text\":1}', 17, 20, 0, '*', 0),
(276, 'mainmenu', 'ΑΝΑΦΟΡΕΣ', 'report', '', 'report', 'index.php?option=com_content&view=article&id=53', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{\"show_title\":\"\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_vote\":\"0\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"show_tags\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 115, 116, 0, '*', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_menu_types`
--

CREATE TABLE `cms_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_menu_types`
--

INSERT INTO `cms_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'authormenu', 'Author Menu', ''),
(3, 'legal', 'Legal', 'Legal');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_messages`
--

CREATE TABLE `cms_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_messages_cfg`
--

CREATE TABLE `cms_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_modules`
--

CREATE TABLE `cms_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_modules`
--

INSERT INTO `cms_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(2, 0, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 0, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', 1, '*'),
(4, 0, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', 1, '*'),
(8, 0, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 0, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 0, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}', 1, '*'),
(12, 0, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', 1, '*'),
(13, 0, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 0, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 0, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 127, 'Login Form', '', '', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 1, '{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"1\",\"usesecure\":\"0\",\"usetext\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(17, 126, 'Breadcrumbs', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_breadcrumbs', 1, 1, '{\"showHere\":\"1\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showLast\":\"1\",\"separator\":\" -\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(79, 221, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(92, 132, 'Smart Search Module', '', '', 1, 'toolbar-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_finder', 1, 0, '{\"searchfilter\":\"\",\"show_autosuggest\":\"1\",\"show_advanced\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"field_size\":25,\"alt_label\":\"\",\"show_label\":\"0\",\"label_pos\":\"top\",\"show_button\":\"1\",\"button_pos\":\"right\",\"opensearch\":\"1\",\"opensearch_title\":\"\",\"set_itemid\":\"133\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(93, 142, 'Default Module', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 4, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(94, 144, '\"border-black\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-black\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(95, 143, '\"border-color\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 2, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(96, 139, '\"border-box\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 4, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-box\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(97, 160, '\"dark-box\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 1, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"dark-box\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(98, 140, '\"color-box\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 2, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-box\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(99, 0, '\"border-top\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-top\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(100, 0, '\"border-black-top\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-black-top\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(101, 0, '\"border-color-top\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-color-top\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(102, 141, '\"color\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 3, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(103, 147, '\"color-title\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin. Sed fermentum consequat posuere. </p>', 1, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-title\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(104, 146, '\"dark-title\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 3, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"dark-title\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(105, 161, '\"gray-title\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. </p>', 1, 'mainbottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"gray-title\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(106, 137, '\"gray-box\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 3, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"gray-box\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(107, 149, '\"menu1\"  Menu Class Suffix', '', '', 2, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{\"menutype\":\"mainmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"menu1\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(147, 121, 'Quick Contact', '', '<div class=\"module-content\">\r\n<div class=\"custom\"> </div>\r\n<div style=\"text-align: right;\"><img src=\"images/powered-by-SenseOne-1.png\" alt=\"\" /></div>\r\n</div>', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"hidden-phone\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(152, 124, 'Blog Categories', '', '', 1, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_categories', 1, 1, '{\"parent\":\"9\",\"show_description\":\"0\",\"numitems\":\"1\",\"show_children\":\"1\",\"count\":\"0\",\"maxlevel\":\"0\",\"layout\":\"_:default\",\"item_heading\":\"5\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(160, 153, 'Archived Articles', '', '', 5, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_archive', 1, 1, '{\"count\":\"3\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(190, 151, 'Who\'s Online', '', '', 1, 'social-bar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_whosonline', 1, 1, '{\"showmode\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"filter_groups\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(193, 129, 'Popular Tags', '', '', 3, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_tags_popular', 1, 1, '{\"maximum\":\"12\",\"timeframe\":\"alltime\",\"order_value\":\"count\",\"order_direction\":\"1\",\"display_count\":0,\"no_results_text\":\"0\",\"minsize\":1,\"maxsize\":2,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(208, 120, 'Main Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{\"menutype\":\"mainmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(212, 136, 'Joomla Pages Banner', '', '<h3 style=\"text-align: right;\">Joomla! Pages</h3>', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"images\\/demo_content\\/banners\\/banner-joomla.jpg\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(214, 145, '\"border-gray-top\" suffix', '', '<p>Quisque hendrerit massa eget nulla tempor vulputate. Phasellus ac quam justo, vitae iaculis eros. Sed fermentum consequat posuere. Integer convallis volutpat urna, ut dignissim leo rhoncus sollicitudin.</p>', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"border-gray-top\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(216, 156, 'Template Pages Banner', '', '<h3 style=\"text-align: right;\">Template Pages</h3>', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"images\\/demo_content\\/banners\\/banner-template.jpg\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(217, 157, 'Contact Us Banner', '', '<h3 style=\"text-align: right;\">Contact Us</h3>', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"images\\/demo_content\\/banners\\/banner-contact.jpg\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(218, 158, 'Top Toolbar Contact Phone Number', '', '<p>Lorem ispum dolor sit amet?   -   <span style=\"color: #222222;\">(+80) 123 456 789</span></p>', 1, 'toolbar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(219, 159, 'Home Page Slider Module', '', '', 1, 'slider', 488, '2018-05-12 08:13:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0389 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u0393\\u0395\\u039d\\u0399\\u039a\\u039f\\u03a3 \\u03a0\\u0399\\u039d\\u0391\\u039a\\u0391\\u03a3 \\u03a0\\u039b\\u0397\\u03a1\\u039f\\u03a6\\u039f\\u03a1\\u0399\\u03a9\\u039d\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(230, 176, 'Wooden Wall Panels', '', '', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_promo_image', 1, 0, '{\"module_image\":\"images\\/demo_content\\/image_module\\/1.jpg\",\"caption_color\":\"color\",\"module_title\":\"Wooden\",\"module_subtitle\":\"Wall Panels (new)\",\"module_url\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"readmore_text\":\"See All Products\",\"link_target\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(231, 177, 'Tools & Accesories Module', '', '', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_promo_image', 1, 0, '{\"module_image\":\"images\\/demo_content\\/image_module\\/2.jpg\",\"caption_color\":\"color\",\"module_title\":\"Tools\",\"module_subtitle\":\"& Accesories\",\"module_url\":\"index.php\\/template\\/module-variations\",\"readmore_text\":\"More About Tools\",\"link_target\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(232, 178, 'Wooden Floors Module', '', '', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_promo_image', 1, 0, '{\"module_image\":\"images\\/demo_content\\/image_module\\/3.jpg\",\"caption_color\":\"color\",\"module_title\":\"Wooden\",\"module_subtitle\":\"Floors (Featured)\",\"module_url\":\"index.php\\/products-k2\\/categories\\/classic-parquet\\/item\\/11-parquet-red-oak-01\",\"readmore_text\":\"Watch Product\",\"link_target\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(233, 179, 'Finishing Elements Module', '', '', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_promo_image', 1, 0, '{\"module_image\":\"images\\/demo_content\\/image_module\\/4.jpg\",\"caption_color\":\"color\",\"module_title\":\"Finishing\",\"module_subtitle\":\"Elements\",\"module_url\":\"index.php\\/joomla\\/content-component\\/single-article\",\"readmore_text\":\"Read More ...\",\"link_target\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(236, 182, 'Products Pages Banner', '', '<h3 style=\"text-align: right;\">K2 Catalog</h3>', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"images\\/demo_content\\/banners\\/banner-products.jpg\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(237, 183, 'News Pages Banner', '', '<h3 style=\"text-align: right;\">Latest News</h3>', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"images\\/demo_content\\/banners\\/banner-joomla.jpg\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(239, 189, 'What Makes Us Different?', '', '<h3>About Us</h3>\r\n<ul>\r\n<li><a href=\"#\">About Company</a></li>\r\n<li><a href=\"#\">Press Releases</a></li>\r\n<li><a href=\"#\">Corporate Indentity</a></li>\r\n<li><a href=\"#\">History</a></li>\r\n<li><a href=\"#\">Contact For Media</a></li>\r\n<li><a href=\"#\">Inspiration</a></li>\r\n</ul>', 1, 'maintop-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(243, 193, '\"big-title\" Module Suffix', '', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. It has been the industry\'s standard dummy text ever since the 1500s ...</p>', 1, 'mainbottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"big-title\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(245, 195, 'Contact Us', '', '<h3>Your Brand</h3>\r\n<p>HLI Template,       <br />Little Lonsdale St,      <br />Melbourne Victoria 8011,      <br />PO Box 21177  Australia<br /><br /><a href=\"index.php/contact-us\">Contact Us</a></p>', 1, 'maintop-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(251, 201, 'Available Worldwide', '', '<p><img class=\"caption pull-left\" title=\"364 Retailers Worldwide\" src=\"images/demo_content/world_map.png\" alt=\"World Map\" /></p>', 1, 'maintop-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(252, 202, 'Products Catalog \'14', '', '<h1>\'2014</h1>\r\n<p>Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without <a href=\"index.php/joomla/content-component/single-article\">revolutionary ROI</a>.</p>', 1, 'maintop-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(253, 203, 'Latest News Module', '', '', 1, 'bottom-bar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_newsflash', 1, 0, '{\"catid\":[\"23\",\"21\",\"22\"],\"count\":\"5\",\"ordering\":\"a.publish_up\",\"item_title\":\"0\",\"link_titles\":\"1\",\"readmore\":\"1\",\"show_introtext\":\"1\",\"introtext_limit\":\"100\",\"latest_newstext\":\"Latst News\",\"animation_type\":\"0\",\"auto_cycle\":\"1\",\"animation_loop\":\"1\",\"auto_cycle_time\":\"5000\",\"nav_buttons\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(254, 204, 'Disclaimer Menu', '', '', 1, 'disclaimer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 0, '{\"menutype\":\"legal\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(255, 206, 'K2 Comments', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_comments', 1, 1, '', 0, '*'),
(256, 207, 'Recent Products', '', '', 4, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_content', 1, 1, '{\"moduleclass_sfx\":\"border-top\",\"getTemplate\":\"Default\",\"source\":\"filter\",\"catfilter\":\"0\",\"getChildren\":\"0\",\"itemCount\":\"1\",\"itemsOrdering\":\"\",\"FeaturedItems\":\"2\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"0\",\"itemTitle\":\"1\",\"itemAuthor\":\"0\",\"itemAuthorAvatar\":\"0\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"0\",\"itemIntroText\":\"0\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"1\",\"itemImgSize\":\"Small\",\"itemVideo\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemAttachments\":\"0\",\"itemTags\":\"0\",\"itemCategory\":\"0\",\"itemDateCreated\":\"0\",\"itemHits\":\"0\",\"itemReadMore\":\"0\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"0\",\"feed\":\"0\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"103\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(257, 208, 'Product Categories', '', '', 1, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_tools', 1, 1, '{\"moduleclass_sfx\":\"\",\"module_usage\":\"4\",\"archiveItemsCounter\":\"1\",\"archiveCategory\":\"0\",\"authors_module_category\":\"0\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"0\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"1\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"1\",\"root_id2\":\"0\",\"catfilter\":\"0\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":[\"0\"],\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(258, 209, 'K2 Users', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_users', 1, 1, '', 0, '*'),
(259, 210, 'K2 User', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_user', 1, 1, '', 0, '*'),
(260, 211, 'K2 Quick Icons (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_quickicons', 1, 1, '', 1, '*'),
(261, 212, 'K2 Stats (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_stats', 1, 1, '', 1, '*'),
(262, 213, 'Tagged Under', '', '', 1, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_tools', 1, 1, '{\"moduleclass_sfx\":\"\",\"module_usage\":\"7\",\"archiveItemsCounter\":\"1\",\"archiveCategory\":\"0\",\"authors_module_category\":\"0\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"0\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"1\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"1\",\"root_id2\":\"0\",\"catfilter\":\"0\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":[\"0\"],\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(263, 214, 'Archive', '', '', 1, 'sidebar-left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_tools', 1, 1, '{\"moduleclass_sfx\":\"\",\"module_usage\":\"0\",\"archiveItemsCounter\":\"1\",\"archiveCategory\":\"0\",\"authors_module_category\":\"0\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"0\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"1\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"1\",\"root_id2\":\"0\",\"catfilter\":\"0\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":[\"0\"],\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(264, 215, 'Fabrik Form Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_fabrik_form', 1, 1, '', 0, '*'),
(265, 216, 'Fabrik List Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_fabrik_list', 1, 1, '', 0, '*'),
(266, 219, 'Other Page Slider Module (2)', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d\",\"slide_text_1\":\"\\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"right\",\"slide_title_2\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d\",\"slide_text_2\":\"\\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_link_2\":\"index.php\\/template\\/module-variations\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(267, 220, 'Select Language', '', '', 1, 'sidebar-right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_languages', 1, 0, '{\"header_text\":\"\",\"footer_text\":\"\",\"dropdown\":\"0\",\"image\":\"1\",\"inline\":\"1\",\"show_active\":\"1\",\"full_name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(270, 224, 'DEXAMENES Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0389 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(271, 225, 'METRHSEIS-PINAKAS Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u039c\\u0395\\u03a4\\u03a1\\u0397\\u03a3\\u0395\\u03a9\\u039d -  \\u03a0\\u0399\\u039d\\u0391\\u039a\\u0391\\u03a3\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(272, 226, 'EIDOPOIHSEIS-PINAKAS Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0389 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u0395\\u0399\\u0394\\u039f\\u03a0\\u039f\\u0399\\u0397\\u03a3\\u0395\\u0399\\u03a3\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(273, 227, 'EIDOPOIHSEIS-KANONES Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u0395\\u0399\\u0394\\u039f\\u03a0\\u039f\\u0399\\u0397\\u03a3\\u0395\\u03a9\\u039d - \\u039a\\u0391\\u039d\\u039f\\u039d\\u0395\\u03a3\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*');
INSERT INTO `cms_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(274, 228, 'EIDOPOIHSEIS-RYTHMISEIS Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0389 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u03a1\\u03a5\\u0398\\u039c\\u0399\\u03a3\\u0395\\u0399\\u03a3 \\u0395\\u0399\\u0394\\u039f\\u03a0\\u039f\\u0399\\u0397\\u03a3\\u0395\\u03a9\\u039d\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(275, 229, 'ANEFODIASMOI Page Slider Module', '', '', 1, 'slider', 488, '2018-05-12 08:14:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u0391\\u039d\\u0395\\u03a6\\u039f\\u0394\\u0399\\u0391\\u03a3\\u039c\\u03a9\\u039d\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(276, 230, 'PROMITHEYTES Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u03a0\\u03a1\\u039f\\u039c\\u0397\\u0398\\u0395\\u03a5\\u03a4\\u03a9\\u039d\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(277, 231, 'METRHSEIS-ANAFORES Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u039c\\u0395\\u03a4\\u03a1\\u0397\\u03a3\\u0395\\u03a9\\u039d - \\u0391\\u039d\\u0391\\u03a6\\u039f\\u03a1\\u0395\\u03a3\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u03a9\\u039d\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(278, 232, 'METRISEIS Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0389 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u039c\\u0395\\u03a4\\u03a1\\u0397\\u03a3\\u0395\\u0399\\u03a3\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(279, 233, 'ANAFORES Page Slider Module', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"fade\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"0\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"1\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"More\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0389 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u0391\\u039d\\u0391\\u03a6\\u039f\\u03a1\\u0395\\u03a3\",\"slide_link_1\":\"index.php\\/products-k2\\/categories\\/wooden-parquet\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"right\",\"slide_title_3\":\"We strive for perfection\",\"slide_text_3\":\"Perfect accuracy\",\"slide_link_3\":\"index.php\\/joomla\\/content-component\\/single-article\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"Lorem Ipsum is simply dummy text\",\"slide_text_4\":\"ever since the 1500s\",\"slide_link_4\":\"index.php\\/contact-us\\/9-sales-department\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(280, 235, 'ΚΑΥΣΙΜΟ', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"right\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"1\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"0\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"read more\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\",\"slide_link_1\":\"\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"left\",\"slide_title_3\":\"\",\"slide_text_3\":\"\",\"slide_link_3\":\"\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"\",\"slide_text_4\":\"\",\"slide_link_4\":\"\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(281, 236, 'ΜΗΤΡΩΟ ΠΡΟΣΩΠΙΚΟΥ', '', '', 1, 'slider', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_st_slider', 1, 1, '{\"slider_width\":1100,\"slider_height\":100,\"image_animation_type\":\"right\",\"resize_images\":\"1\",\"image_quality\":\"90\",\"slide_autoplay\":\"1\",\"autoplay_duration\":5000,\"slide_pause\":\"1\",\"reverse_animation\":\"0\",\"slider_buttons\":\"0\",\"linked_titles\":\"0\",\"show_readmore\":\"0\",\"readmore_text\":\"read more\",\"silde_order_1\":\"1\",\"silde_order_2\":\"2\",\"silde_order_3\":\"3\",\"silde_order_4\":\"4\",\"silde_order_5\":\"5\",\"silde_order_6\":\"6\",\"silde_order_7\":\"7\",\"silde_order_8\":\"8\",\"slide_image_1\":\"\",\"slide_text_animation_1\":\"right\",\"slide_title_1\":\"\\u0395\\u03a6\\u0391\\u03a1\\u039c\\u039f\\u0393\\u0397 \\u0394\\u0395\\u039e\\u0391\\u039c\\u0395\\u039d\\u03a9\\u039d \\u039a\\u0391\\u03a5\\u03a3\\u0399\\u039c\\u039f\\u03a5\",\"slide_text_1\":\"\\u039c\\u0397\\u03a4\\u03a1\\u03a9\\u039f \\u03a0\\u03a1\\u039f\\u03a3\\u03a9\\u03a0\\u0399\\u039a\\u039f\\u03a5\",\"slide_link_1\":\"\",\"slide_image_2\":\"\",\"slide_text_animation_2\":\"left\",\"slide_title_2\":\"\",\"slide_text_2\":\"\",\"slide_link_2\":\"\",\"slide_image_3\":\"\",\"slide_text_animation_3\":\"left\",\"slide_title_3\":\"\",\"slide_text_3\":\"\",\"slide_link_3\":\"\",\"slide_image_4\":\"\",\"slide_text_animation_4\":\"left\",\"slide_title_4\":\"\",\"slide_text_4\":\"\",\"slide_link_4\":\"\",\"slide_image_5\":\"\",\"slide_text_animation_5\":\"left\",\"slide_title_5\":\"\",\"slide_text_5\":\"\",\"slide_link_5\":\"\",\"slide_image_6\":\"\",\"slide_text_animation_6\":\"left\",\"slide_title_6\":\"\",\"slide_text_6\":\"\",\"slide_link_6\":\"\",\"slide_image_7\":\"\",\"slide_text_animation_7\":\"left\",\"slide_title_7\":\"\",\"slide_text_7\":\"\",\"slide_link_7\":\"\",\"slide_image_8\":\"\",\"slide_text_animation_8\":\"left\",\"slide_title_8\":\"\",\"slide_text_8\":\"\",\"slide_link_8\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_modules_menu`
--

CREATE TABLE `cms_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_modules_menu`
--

INSERT INTO `cms_modules_menu` (`moduleid`, `menuid`) VALUES
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(92, 0),
(93, 114),
(94, 114),
(95, 114),
(96, 114),
(97, 114),
(98, 114),
(99, 114),
(100, 114),
(101, 114),
(102, 114),
(103, 114),
(104, 114),
(105, 114),
(106, 114),
(107, 114),
(147, 0),
(152, 177),
(160, 177),
(190, 0),
(193, 177),
(208, 0),
(212, 119),
(212, 120),
(212, 121),
(212, 122),
(212, 124),
(212, 125),
(212, 126),
(212, 127),
(212, 128),
(212, 129),
(212, 130),
(212, 131),
(212, 132),
(212, 133),
(212, 134),
(212, 135),
(212, 136),
(212, 137),
(212, 138),
(212, 139),
(212, 140),
(212, 141),
(212, 142),
(212, 143),
(212, 144),
(212, 184),
(212, 185),
(212, 186),
(214, 114),
(216, 111),
(216, 112),
(216, 113),
(216, 114),
(216, 115),
(216, 116),
(216, 117),
(217, 118),
(218, 0),
(219, 101),
(230, 101),
(231, 101),
(232, 101),
(233, 101),
(236, 199),
(236, 221),
(236, 244),
(236, 245),
(236, 246),
(236, 247),
(236, 248),
(236, 249),
(236, 250),
(237, 177),
(239, 101),
(243, 114),
(244, 0),
(245, 101),
(246, 101),
(251, 101),
(252, 101),
(253, 101),
(254, 0),
(256, 177),
(257, 199),
(257, 221),
(257, 244),
(257, 245),
(257, 246),
(257, 247),
(257, 248),
(257, 249),
(260, 0),
(261, 0),
(262, 199),
(262, 221),
(262, 244),
(262, 245),
(262, 246),
(262, 247),
(262, 248),
(262, 249),
(263, 199),
(263, 221),
(263, 244),
(263, 245),
(263, 246),
(263, 247),
(263, 248),
(263, 249),
(266, 260),
(266, 261),
(266, 262),
(266, 263),
(266, 264),
(266, 266),
(266, 267),
(266, 268),
(267, 0),
(270, 260),
(271, 263),
(272, 264),
(273, 266),
(274, 267),
(275, 261),
(276, 262),
(277, 268),
(278, 270),
(279, 271),
(279, 275),
(280, 273),
(281, 274),
(282, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_newsfeeds`
--

CREATE TABLE `cms_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `images` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_newsfeeds`
--

INSERT INTO `cms_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`, `access`, `language`, `params`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `xreference`, `publish_up`, `publish_down`, `description`, `version`, `hits`, `images`) VALUES
(15, 1, 'Joomla! Announcements ', 'joomla-announcements', 'http://www.joomla.org/announcements.feed?type=rss', 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0, 1, '*', '{\"show_feed_image\":\"\",\"show_feed_description\":\"\",\"show_item_description\":\"\",\"feed_character_count\":\"0\",\"newsfeed_layout\":\"\",\"feed_display_order\":\"\"}', '2013-04-05 14:40:59', 488, '', '2013-04-05 14:41:04', 462, '', '', '{\"robots\":\"\",\"rights\":\"\"}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 2, 40, '{\"image_first\":\"\",\"float_first\":\"\",\"image_first_alt\":\"\",\"image_first_caption\":\"\",\"image_second\":\"\",\"float_second\":\"\",\"image_second_alt\":\"\",\"image_second_caption\":\"\"}'),
(15, 2, 'Joomla! Connect ', 'joomla-connect', 'http://feeds.joomla.org/JoomlaConnect', 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0, 1, '*', '{\"show_feed_image\":\"\",\"show_feed_description\":\"\",\"show_item_description\":\"\",\"feed_character_count\":\"0\",\"newsfeed_layout\":\"\",\"feed_display_order\":\"\"}', '2013-04-05 14:41:19', 488, '', '0000-00-00 00:00:00', 0, '', '', '{\"robots\":\"\",\"rights\":\"\"}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 11, '{\"image_first\":\"\",\"float_first\":\"\",\"image_first_alt\":\"\",\"image_first_caption\":\"\",\"image_second\":\"\",\"float_second\":\"\",\"image_second_alt\":\"\",\"image_second_caption\":\"\"}'),
(15, 3, 'Joomla! Security News ', 'joomla-security-news', 'http://feeds.joomla.org/JoomlaSecurityNews', 1, 5, 3600, 0, '0000-00-00 00:00:00', 3, 0, 1, '*', '{\"show_feed_image\":\"\",\"show_feed_description\":\"\",\"show_item_description\":\"\",\"feed_character_count\":\"0\",\"newsfeed_layout\":\"\",\"feed_display_order\":\"\"}', '2013-04-05 14:41:36', 488, '', '0000-00-00 00:00:00', 0, '', '', '{\"robots\":\"\",\"rights\":\"\"}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, 6, '{\"image_first\":\"\",\"float_first\":\"\",\"image_first_alt\":\"\",\"image_first_caption\":\"\",\"image_second\":\"\",\"float_second\":\"\",\"image_second_alt\":\"\",\"image_second_caption\":\"\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_overrider`
--

CREATE TABLE `cms_overrider` (
  `id` int(10) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_postinstall_messages`
--

CREATE TABLE `cms_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_postinstall_messages`
--

INSERT INTO `cms_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 0),
(2, 700, 'COM_CPANEL_MSG_EACCELERATOR_TITLE', 'COM_CPANEL_MSG_EACCELERATOR_BODY', 'COM_CPANEL_MSG_EACCELERATOR_BUTTON', 'com_cpanel', 1, 'action', 'admin://components/com_admin/postinstall/eaccelerator.php', 'admin_postinstall_eaccelerator_action', 'admin://components/com_admin/postinstall/eaccelerator.php', 'admin_postinstall_eaccelerator_condition', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_PHPVERSION_TITLE', 'COM_CPANEL_MSG_PHPVERSION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/phpversion.php', 'admin_postinstall_phpversion_condition', '3.2.2', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_redirect_links`
--

CREATE TABLE `cms_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_redirect_links`
--

INSERT INTO `cms_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://collaborators.eu/index.php/gr/notifications', '', '', '', 1, 0, '2015-02-19 22:04:27', '0000-00-00 00:00:00'),
(2, 'http://collaborators.eu/index.php/gr/notifications/form/2/5', '', 'http://collaborators.eu/index.php/gr/', '', 1, 0, '2015-02-19 22:14:53', '0000-00-00 00:00:00'),
(3, 'http://collaborators.eu/index.php/gr/2/2015-02-20-04-57-54', '', 'http://collaborators.eu/index.php/gr/2/2015-02-20-04-57-54', '', 1, 0, '2015-02-20 04:58:51', '0000-00-00 00:00:00'),
(4, 'http://collaborators.eu/index.php/gr/notifications/form/2/194', '', 'http://collaborators.eu/index.php/gr/', '', 3, 0, '2015-02-20 06:25:19', '0000-00-00 00:00:00'),
(5, 'http://collaborators.eu/index.php/gr/notifications/form/2/197', '', 'http://collaborators.eu/index.php/gr/', '', 1, 0, '2015-02-20 06:26:15', '0000-00-00 00:00:00'),
(6, 'http://collaborators.eu/index.php/gr/notifications/form/2/198', '', 'http://collaborators.eu/index.php/gr/', '', 1, 0, '2015-02-20 06:26:19', '0000-00-00 00:00:00'),
(7, 'http://collaborators.eu/index.php/gr/2/', '', 'http://collaborators.eu/index.php/gr/2/notification-configurations', '', 76, 0, '2015-02-20 09:27:03', '0000-00-00 00:00:00'),
(8, 'http://collaborators.eu/index.php/gr/images/ajax-loader.gif', '', 'http://collaborators.eu/index.php/gr/index.php', '', 28, 0, '2015-03-04 18:10:14', '0000-00-00 00:00:00'),
(9, 'http://collaborators.eu/index.php/gr/summaries/details/5/8', '', 'http://collaborators.eu/index.php/gr/2/notifications?resetfilters=0&clearordering=0&clearfilters=0', '', 3, 0, '2015-04-06 18:23:14', '0000-00-00 00:00:00'),
(10, 'http://collaborators.eu/index.php/gr/summaries/details/5/6', '', 'http://collaborators.eu/index.php/gr/2/notifications', '', 3, 0, '2015-04-06 18:25:39', '0000-00-00 00:00:00'),
(11, 'http://collaborators.eu/index.php/gr/summaries/index.php', '', 'http://collaborators.eu/index.php/gr/summaries/reports', '', 3, 0, '2015-04-10 19:04:04', '0000-00-00 00:00:00'),
(12, 'http://collaborators.eu/index.php/gr/\\', '', '', '', 1, 0, '2015-04-10 19:04:25', '0000-00-00 00:00:00'),
(13, 'http://collaborators.eu/index.php/gr/summaries/details/5/7', '', 'http://collaborators.eu/index.php/gr/2/notifications/form/2/117', '', 1, 0, '2015-04-13 18:23:50', '0000-00-00 00:00:00'),
(14, 'http://collaborators.eu/index.php/gr/summaries/details/5/2', '', 'http://collaborators.eu/index.php/gr/2/notifications', '', 4, 0, '2015-04-14 15:29:19', '0000-00-00 00:00:00'),
(15, 'http://collaborators.eu/index.php/gr/2016-12-15-14-03-27', '', 'http://collaborators.eu/index.php/gr/2016-12-15-14-08-22', '', 5, 0, '2017-11-04 17:11:53', '0000-00-00 00:00:00'),
(16, 'http://collaborators.eu/index.php/gr/', '', 'http://collaborators.eu/index.php/gr/suppliers', '', 1, 0, '2017-11-04 17:31:48', '0000-00-00 00:00:00'),
(17, 'http://collaborators.eu/index.php/gr/tests', '', 'http://collaborators.eu/index.php/gr/', '', 2, 0, '2017-11-08 15:34:08', '0000-00-00 00:00:00'),
(18, 'http://collaborators.eu/index.php/gr/fuel-supplies', '', 'http://collaborators.eu/index.php/gr/suppliers', '', 1, 0, '2017-11-09 21:12:33', '0000-00-00 00:00:00'),
(19, 'https://collaborators.eu/index.php/gr/2/', '', 'https://collaborators.eu/index.php/gr/2/notification-configurations', '', 1, 0, '2017-11-11 19:57:08', '0000-00-00 00:00:00'),
(20, 'http://collaborators.eu/index.php/gr/CUSTOM/style.css', '', 'http://collaborators.eu/index.php/gr/', '', 1, 0, '2017-11-13 10:20:57', '0000-00-00 00:00:00'),
(21, 'http://collaborators.eu/index.php/gr/images/error_32.png', '', 'http://collaborators.eu/index.php/gr/', '', 7, 0, '2017-11-13 13:58:34', '0000-00-00 00:00:00'),
(22, 'http://collaborators.eu/index.php/en/function.imagepng', '', 'http://collaborators.eu/index.php/en/', '', 1, 0, '2017-11-18 22:33:40', '0000-00-00 00:00:00'),
(23, 'http://collaborators.eu/index.php/en/2/', '', 'http://collaborators.eu/index.php/en/2/notification-configurations', '', 2, 0, '2017-11-20 14:16:20', '0000-00-00 00:00:00'),
(24, 'http://collaborators.eu/index.php/en/gr', '', '', '', 3, 0, '2017-11-22 10:26:16', '0000-00-00 00:00:00'),
(25, 'http://collaborators.eu/index.php/gr/eng', '', '', '', 2, 0, '2017-11-22 14:01:40', '0000-00-00 00:00:00'),
(26, 'http://collaborators.eu/index.php/en/fuelReport.php', '', 'http://collaborators.eu/index.php/en/2016-12-15-14-08-22', '', 7, 0, '2017-12-12 11:52:25', '0000-00-00 00:00:00'),
(27, 'http://collaborators.eu/index.php/en/2017-12-12-13-10-44', '', 'http://collaborators.eu/index.php/en/suppliers', '', 1, 0, '2017-12-12 13:20:25', '0000-00-00 00:00:00'),
(28, 'http://collaborators.eu/index.php/en/tanks', '', 'http://collaborators.eu/index.php/en/', '', 1, 0, '2017-12-13 13:53:15', '0000-00-00 00:00:00'),
(29, 'http://collaborators.eu/index.php/en/images/error_32.png', '', 'http://collaborators.eu/index.php/en/', '', 3, 0, '2017-12-13 14:47:38', '0000-00-00 00:00:00'),
(30, 'http://collaborators.eu/index.php/2/', '', 'http://collaborators.eu/index.php/2/notification-configurations', '', 17, 0, '2018-01-10 10:24:33', '0000-00-00 00:00:00'),
(31, 'http://collaborators.eu/index.php/γρ', '', '', '', 1, 0, '2018-01-10 14:52:29', '0000-00-00 00:00:00'),
(32, 'http://collaborators.eu/index.php/2016-12-15-14-08-22', '', 'http://collaborators.eu/index.php/measurements', '', 1, 0, '2018-01-11 12:27:53', '0000-00-00 00:00:00'),
(33, 'http://collaborators.eu/index.php/2/\'http://collaborators.eu/index.php/2016-12-15-14-03-27/details/11/16\'', '', 'http://collaborators.eu/index.php/2/notifications', '', 4, 0, '2018-01-15 11:07:03', '0000-00-00 00:00:00'),
(34, 'http://collaborators.eu/index.php/2/index.php/measurements/details/11/16', '', 'http://collaborators.eu/index.php/2/notifications', '', 1, 0, '2018-01-15 11:21:58', '0000-00-00 00:00:00'),
(35, 'http://collaborators.eu/index.php/administrator', '', '', '', 2, 0, '2018-01-15 11:42:50', '0000-00-00 00:00:00'),
(36, 'http://collaborators.eu/index.php/2/collaborators.eu/index.php/measurements/details/11/16', '', 'http://collaborators.eu/index.php/2/notifications', '', 1, 0, '2018-02-06 11:22:25', '0000-00-00 00:00:00'),
(37, 'https://collaborators.eu/index.php/test', '', '', '', 1, 0, '2018-02-07 14:41:10', '0000-00-00 00:00:00'),
(38, 'http://collaborators.eu/index.php/tanks', '', 'http://collaborators.eu/index.php', '', 1, 0, '2018-05-12 09:38:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_schemas`
--

CREATE TABLE `cms_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_schemas`
--

INSERT INTO `cms_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.3.6-2014-09-30'),
(10094, '3.0.6');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_session`
--

CREATE TABLE `cms_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `guest` tinyint(4) UNSIGNED DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_session`
--

INSERT INTO `cms_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('3kidjqh85g85d2ft620a0576i4', 0, 1, '1526220601', '__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1526220601;s:18:\"session.timer.last\";i:1526220601;s:17:\"session.timer.now\";i:1526220601;s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\\0\\0\\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:12:\"requireReset\";N;s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";N;s:14:\"\\0\\0\\0_authLevels\";N;s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"95bc85418d45e393554d2a7cd8a68e25\";}', 0, ''),
('6a1hnvq6k7upqhkit8olk6t8t5', 0, 0, '1526219619', '__default|a:9:{s:15:\"session.counter\";i:100;s:19:\"session.timer.start\";i:1526212525;s:18:\"session.timer.last\";i:1526219615;s:17:\"session.timer.now\";i:1526219619;s:22:\"session.client.browser\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":1:{s:10:\"com_fabrik\";O:8:\"stdClass\":1:{s:7:\"package\";s:6:\"fabrik\";}}}s:4:\"user\";O:5:\"JUser\":27:{s:9:\"\\0\\0\\0isRoot\";b:1;s:2:\"id\";s:3:\"488\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:32:\"ioannapolyxronou+admin@gmail.com\";s:8:\"password\";s:60:\"$2y$10$o6VuseCU953eC0Tp8qncTOsYt2wcZG4luPahccqJEryTvD5i/dz4i\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2018-05-09 10:44:57\";s:13:\"lastvisitDate\";s:19:\"2018-05-13 11:25:23\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\\0\\0\\0_authLevels\";a:5:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:6;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"53f03e19bb3b53b973d1880f55321b9d\";s:22:\"com_fabrik.form.1.data\";a:32:{s:27:\"agro_location_registry___id\";s:2:\"23\";s:31:\"agro_location_registry___id_raw\";s:2:\"23\";s:34:\"agro_location_registry___date_time\";s:19:\"2018-05-12 00:00:00\";s:38:\"agro_location_registry___date_time_raw\";s:19:\"2018-05-12 00:00:00\";s:38:\"agro_location_registry___location_name\";s:20:\"Αγρόκτημα 1\";s:42:\"agro_location_registry___location_name_raw\";s:20:\"Αγρόκτημα 1\";s:34:\"agro_location_registry___device_id\";s:1:\"1\";s:38:\"agro_location_registry___device_id_raw\";s:1:\"1\";s:41:\"agro_location_registry___location_details\";s:38:\"Δοκιμαστική Εγγραφή.\";s:45:\"agro_location_registry___location_details_raw\";s:38:\"Δοκιμαστική Εγγραφή.\";s:35:\"agro_location_registry___location_x\";s:9:\"38.900485\";s:39:\"agro_location_registry___location_x_raw\";s:9:\"38.900485\";s:35:\"agro_location_registry___location_y\";s:17:\"22.43525599999998\";s:39:\"agro_location_registry___location_y_raw\";s:17:\"22.43525599999998\";s:35:\"agro_location_registry___location_z\";s:6:\"0.0000\";s:39:\"agro_location_registry___location_z_raw\";s:6:\"0.0000\";s:40:\"agro_location_registry___notify_temp_min\";s:4:\"0.00\";s:44:\"agro_location_registry___notify_temp_min_raw\";s:4:\"0.00\";s:40:\"agro_location_registry___notify_temp_max\";s:5:\"32.00\";s:44:\"agro_location_registry___notify_temp_max_raw\";s:5:\"32.00\";s:4:\"slug\";s:2:\"23\";s:8:\"__pk_val\";s:2:\"23\";s:8:\"timezone\";s:15:\"Europe/Helsinki\";s:32:\"0d4605c26b23346300cddccc192a33b1\";s:26:\"9vk0katqadkl2ju6q3uatlssb1\";s:32:\"11241b5f109754c8e4e1fb1b6dfe31a9\";s:26:\"6a1hnvq6k7upqhkit8olk6t8t5\";s:6:\"Itemid\";s:3:\"260\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"view\";s:4:\"form\";s:6:\"formid\";s:1:\"1\";s:5:\"rowid\";s:2:\"23\";s:6:\"format\";s:4:\"html\";s:4:\"lang\";s:8:\"location\";}}', 488, 'admin'),
('9pr864o4bh9r35fdgchdb59vh5', 0, 1, '1526220001', '__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1526220001;s:18:\"session.timer.last\";i:1526220001;s:17:\"session.timer.now\";i:1526220001;s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\\0\\0\\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:12:\"requireReset\";N;s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";N;s:14:\"\\0\\0\\0_authLevels\";N;s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"6dc58276fe03c7e252e377228afd212a\";}', 0, ''),
('9vk0katqadkl2ju6q3uatlssb1', 1, 0, '1526219424', '__default|a:8:{s:15:\"session.counter\";i:37;s:19:\"session.timer.start\";i:1526216286;s:18:\"session.timer.last\";i:1526219086;s:17:\"session.timer.now\";i:1526219424;s:22:\"session.client.browser\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":4:{s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:13:\"com_installer\";O:8:\"stdClass\":2:{s:7:\"message\";s:0:\"\";s:17:\"extension_message\";s:0:\"\";}s:9:\"com_menus\";O:8:\"stdClass\":2:{s:5:\"items\";O:8:\"stdClass\":3:{s:8:\"menutype\";s:8:\"mainmenu\";s:10:\"limitstart\";i:0;s:4:\"list\";a:4:{s:9:\"direction\";s:3:\"asc\";s:5:\"limit\";s:2:\"20\";s:8:\"ordering\";s:5:\"a.lft\";s:5:\"start\";d:0;}}s:4:\"edit\";O:8:\"stdClass\":1:{s:4:\"item\";O:8:\"stdClass\":4:{s:2:\"id\";a:0:{}s:4:\"data\";N;s:4:\"type\";N;s:4:\"link\";N;}}}s:11:\"com_content\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:7:\"article\";O:8:\"stdClass\":2:{s:2:\"id\";a:0:{}s:4:\"data\";N;}}}}}s:4:\"user\";O:5:\"JUser\":28:{s:9:\"\\0\\0\\0isRoot\";b:1;s:2:\"id\";s:3:\"488\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:32:\"ioannapolyxronou+admin@gmail.com\";s:8:\"password\";s:60:\"$2y$10$o6VuseCU953eC0Tp8qncTOsYt2wcZG4luPahccqJEryTvD5i/dz4i\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2018-05-09 10:44:57\";s:13:\"lastvisitDate\";s:19:\"2018-05-13 11:55:33\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\\0\\0\\0_authLevels\";a:5:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:6;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";s:3:\"gid\";i:1000;}s:13:\"session.token\";s:32:\"31370fd8cfbce43be977a87ec1e0e002\";}', 488, 'admin'),
('b7k7eso74542kice6754pk17o6', 0, 1, '1526219401', '__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1526219401;s:18:\"session.timer.last\";i:1526219401;s:17:\"session.timer.now\";i:1526219401;s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\\0\\0\\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:12:\"requireReset\";N;s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";N;s:14:\"\\0\\0\\0_authLevels\";N;s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"9344411de5572d414aec773de47a5ace\";}', 0, ''),
('cr7rpnlbc99blmojtc2ueavvm6', 0, 1, '1526218201', '__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1526218201;s:18:\"session.timer.last\";i:1526218201;s:17:\"session.timer.now\";i:1526218201;s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\\0\\0\\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:12:\"requireReset\";N;s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";N;s:14:\"\\0\\0\\0_authLevels\";N;s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"785ebbe43e4442d6b2532e1cce3a2138\";}', 0, ''),
('g3e62sfq4v8f9plceqbem5lui5', 0, 0, '1526220139', '__default|a:8:{s:15:\"session.counter\";i:22;s:19:\"session.timer.start\";i:1526215668;s:18:\"session.timer.last\";i:1526218632;s:17:\"session.timer.now\";i:1526220139;s:22:\"session.client.browser\";s:110:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":1:{s:10:\"com_fabrik\";O:8:\"stdClass\":1:{s:7:\"package\";s:6:\"fabrik\";}}}s:4:\"user\";O:5:\"JUser\":27:{s:9:\"\\0\\0\\0isRoot\";b:0;s:2:\"id\";s:3:\"490\";s:4:\"name\";s:13:\"Collaborators\";s:8:\"username\";s:13:\"collaborators\";s:5:\"email\";s:26:\"ioannapolyxronou@gmail.com\";s:8:\"password\";s:60:\"$2y$10$vD4mfVvG5U1j6X37EilnzOVkr8Cz1/q3oJtBoFrySdZnIAUsIa.Ai\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"0\";s:12:\"registerDate\";s:19:\"2018-05-09 10:44:57\";s:13:\"lastvisitDate\";s:19:\"2018-05-13 11:55:36\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:1:{i:2;s:1:\"2\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:1;i:2;}s:14:\"\\0\\0\\0_authLevels\";a:3:{i:0;i:1;i:1;i:1;i:2;i:2;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"fa8f5ee7fc2725c57009c00c1eeccf41\";}', 490, 'collaborators'),
('jk5m981u9kkldopoku2skdng45', 0, 0, '1526221453', '__default|a:9:{s:15:\"session.counter\";i:10;s:19:\"session.timer.start\";i:1526220883;s:18:\"session.timer.last\";i:1526221419;s:17:\"session.timer.now\";i:1526221453;s:22:\"session.client.browser\";s:114:\"Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":1:{s:10:\"com_fabrik\";O:8:\"stdClass\":1:{s:7:\"package\";s:6:\"fabrik\";}}}s:4:\"user\";O:5:\"JUser\":27:{s:9:\"\\0\\0\\0isRoot\";b:0;s:2:\"id\";s:3:\"490\";s:4:\"name\";s:13:\"Collaborators\";s:8:\"username\";s:13:\"collaborators\";s:5:\"email\";s:26:\"ioannapolyxronou@gmail.com\";s:8:\"password\";s:60:\"$2y$10$vD4mfVvG5U1j6X37EilnzOVkr8Cz1/q3oJtBoFrySdZnIAUsIa.Ai\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"0\";s:12:\"registerDate\";s:19:\"2018-05-09 10:44:57\";s:13:\"lastvisitDate\";s:19:\"2018-05-13 13:05:03\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:1:{i:2;s:1:\"2\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:1;i:2;}s:14:\"\\0\\0\\0_authLevels\";a:3:{i:0;i:1;i:1;i:1;i:2;i:2;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"88ffdf46a1292a72c9c753739f957ea8\";s:22:\"com_fabrik.form.1.data\";a:30:{s:27:\"agro_location_registry___id\";s:2:\"23\";s:31:\"agro_location_registry___id_raw\";s:2:\"23\";s:34:\"agro_location_registry___date_time\";s:19:\"2018-05-12 00:00:00\";s:38:\"agro_location_registry___date_time_raw\";s:19:\"2018-05-12 00:00:00\";s:38:\"agro_location_registry___location_name\";s:20:\"Αγρόκτημα 1\";s:42:\"agro_location_registry___location_name_raw\";s:20:\"Αγρόκτημα 1\";s:34:\"agro_location_registry___device_id\";s:1:\"1\";s:38:\"agro_location_registry___device_id_raw\";s:1:\"1\";s:41:\"agro_location_registry___location_details\";s:38:\"Δοκιμαστική Εγγραφή.\";s:45:\"agro_location_registry___location_details_raw\";s:38:\"Δοκιμαστική Εγγραφή.\";s:35:\"agro_location_registry___location_x\";s:9:\"38.900485\";s:39:\"agro_location_registry___location_x_raw\";s:9:\"38.900485\";s:35:\"agro_location_registry___location_y\";s:17:\"22.43525599999998\";s:39:\"agro_location_registry___location_y_raw\";s:17:\"22.43525599999998\";s:35:\"agro_location_registry___location_z\";s:6:\"0.0000\";s:39:\"agro_location_registry___location_z_raw\";s:6:\"0.0000\";s:40:\"agro_location_registry___notify_temp_min\";s:4:\"0.00\";s:44:\"agro_location_registry___notify_temp_min_raw\";s:4:\"0.00\";s:40:\"agro_location_registry___notify_temp_max\";s:5:\"32.00\";s:44:\"agro_location_registry___notify_temp_max_raw\";s:5:\"32.00\";s:4:\"slug\";s:2:\"23\";s:8:\"__pk_val\";s:2:\"23\";s:32:\"11241b5f109754c8e4e1fb1b6dfe31a9\";s:26:\"jk5m981u9kkldopoku2skdng45\";s:6:\"Itemid\";s:3:\"260\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"view\";s:7:\"details\";s:6:\"formid\";s:1:\"1\";s:5:\"rowid\";s:2:\"23\";s:6:\"format\";s:4:\"html\";s:4:\"lang\";s:8:\"location\";}}', 490, 'collaborators'),
('mesvoqo81t99p70vsha2e8fnj7', 0, 1, '1526221201', '__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1526221201;s:18:\"session.timer.last\";i:1526221201;s:17:\"session.timer.now\";i:1526221201;s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\\0\\0\\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:12:\"requireReset\";N;s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";N;s:14:\"\\0\\0\\0_authLevels\";N;s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"979fa1250289e86bcc8309a16048229a\";}', 0, ''),
('rjf8qurhvaou52pvukffqc9k91', 0, 1, '1526218802', '__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1526218802;s:18:\"session.timer.last\";i:1526218802;s:17:\"session.timer.now\";i:1526218802;s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\\0\\0\\0isRoot\";N;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:12:\"requireReset\";N;s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":0:{}}s:14:\"\\0\\0\\0_authGroups\";N;s:14:\"\\0\\0\\0_authLevels\";N;s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"4d2cb3cf498a42cb574e05aeef276233\";}', 0, ''),
('s7mlmk56ghr3cf0p36p19vch60', 0, 0, '1526219421', '__default|a:9:{s:15:\"session.counter\";i:28;s:19:\"session.timer.start\";i:1526216684;s:18:\"session.timer.last\";i:1526219413;s:17:\"session.timer.now\";i:1526219421;s:22:\"session.client.browser\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0\";s:8:\"registry\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":1:{s:10:\"com_fabrik\";O:8:\"stdClass\":1:{s:7:\"package\";s:6:\"fabrik\";}}}s:4:\"user\";O:5:\"JUser\":27:{s:9:\"\\0\\0\\0isRoot\";b:0;s:2:\"id\";s:3:\"490\";s:4:\"name\";s:13:\"Collaborators\";s:8:\"username\";s:13:\"collaborators\";s:5:\"email\";s:26:\"ioannapolyxronou@gmail.com\";s:8:\"password\";s:60:\"$2y$10$vD4mfVvG5U1j6X37EilnzOVkr8Cz1/q3oJtBoFrySdZnIAUsIa.Ai\";s:14:\"password_clear\";s:0:\"\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"0\";s:12:\"registerDate\";s:19:\"2018-05-09 10:44:57\";s:13:\"lastvisitDate\";s:19:\"2018-05-13 13:03:06\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:92:\"{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}\";s:6:\"groups\";a:1:{i:2;s:1:\"2\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:12:\"requireReset\";s:1:\"0\";s:10:\"\\0\\0\\0_params\";O:24:\"Joomla\\Registry\\Registry\":1:{s:7:\"\\0\\0\\0data\";O:8:\"stdClass\":6:{s:11:\"admin_style\";s:0:\"\";s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:0:\"\";}}s:14:\"\\0\\0\\0_authGroups\";a:2:{i:0;i:1;i:1;i:2;}s:14:\"\\0\\0\\0_authLevels\";a:3:{i:0;i:1;i:1;i:1;i:2;i:2;}s:15:\"\\0\\0\\0_authActions\";N;s:12:\"\\0\\0\\0_errorMsg\";N;s:10:\"\\0\\0\\0_errors\";a:0:{}s:3:\"aid\";i:0;s:6:\"otpKey\";s:0:\"\";s:4:\"otep\";s:0:\"\";}s:13:\"session.token\";s:32:\"c1a9134560e30faab9cdd9d64841e3d0\";s:22:\"com_fabrik.form.1.data\";a:30:{s:27:\"agro_location_registry___id\";s:2:\"23\";s:31:\"agro_location_registry___id_raw\";s:2:\"23\";s:34:\"agro_location_registry___date_time\";s:19:\"2018-05-12 00:00:00\";s:38:\"agro_location_registry___date_time_raw\";s:19:\"2018-05-12 00:00:00\";s:38:\"agro_location_registry___location_name\";s:20:\"Αγρόκτημα 1\";s:42:\"agro_location_registry___location_name_raw\";s:20:\"Αγρόκτημα 1\";s:34:\"agro_location_registry___device_id\";s:1:\"1\";s:38:\"agro_location_registry___device_id_raw\";s:1:\"1\";s:41:\"agro_location_registry___location_details\";s:38:\"Δοκιμαστική Εγγραφή.\";s:45:\"agro_location_registry___location_details_raw\";s:38:\"Δοκιμαστική Εγγραφή.\";s:35:\"agro_location_registry___location_x\";s:9:\"38.900485\";s:39:\"agro_location_registry___location_x_raw\";s:9:\"38.900485\";s:35:\"agro_location_registry___location_y\";s:17:\"22.43525599999998\";s:39:\"agro_location_registry___location_y_raw\";s:17:\"22.43525599999998\";s:35:\"agro_location_registry___location_z\";s:6:\"0.0000\";s:39:\"agro_location_registry___location_z_raw\";s:6:\"0.0000\";s:40:\"agro_location_registry___notify_temp_min\";s:4:\"0.00\";s:44:\"agro_location_registry___notify_temp_min_raw\";s:4:\"0.00\";s:40:\"agro_location_registry___notify_temp_max\";s:5:\"32.00\";s:44:\"agro_location_registry___notify_temp_max_raw\";s:5:\"32.00\";s:4:\"slug\";s:2:\"23\";s:8:\"__pk_val\";s:2:\"23\";s:32:\"11241b5f109754c8e4e1fb1b6dfe31a9\";s:26:\"s7mlmk56ghr3cf0p36p19vch60\";s:6:\"Itemid\";s:3:\"260\";s:6:\"option\";s:10:\"com_fabrik\";s:4:\"view\";s:7:\"details\";s:6:\"formid\";s:1:\"1\";s:5:\"rowid\";s:2:\"23\";s:6:\"format\";s:4:\"html\";s:4:\"lang\";s:8:\"location\";}}', 490, 'collaborators');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_tags`
--

CREATE TABLE `cms_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_tags`
--

INSERT INTO `cms_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 29, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 488, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 1, 2, 1, 'blog', 'Blog', 'blog', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '{\"author\":\"\",\"robots\":\"\",\"tags\":null}', 488, '2013-04-25 07:10:25', '', 462, '2013-04-25 07:15:08', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '', 9, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 3, 4, 1, 'design', 'Design', 'design', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '{\"author\":\"\",\"robots\":\"\",\"tags\":null}', 488, '2013-04-25 07:10:25', '', 462, '2013-04-25 07:15:16', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '', 6, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 5, 6, 1, 'joomla', 'Joomla', 'joomla', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:10:25', '', 0, '0000-00-00 00:00:00', '', '', 53, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 7, 8, 1, 'minimal', 'Minimal', 'minimal', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:10:56', '', 0, '0000-00-00 00:00:00', '', '', 1, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 9, 10, 1, 'inspirations', 'Inspirations', 'inspirations', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:11:19', '', 0, '0000-00-00 00:00:00', '', '', 13, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 11, 12, 1, 'hardwood', 'Hardwood', 'hardwood', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"tag_layout\":\"\",\"tag_link_class\":\"label label-info\",\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-25 07:11:40', '', 990, '2014-02-01 08:20:15', '', '', 65, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 13, 14, 1, 'template', 'Template', 'template', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:11:40', '', 0, '0000-00-00 00:00:00', '', '', 1, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 15, 16, 1, 'magna', 'Magna', 'magna', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:12:17', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 17, 18, 1, 'tags', 'Tags', 'tags', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:12:17', '', 0, '0000-00-00 00:00:00', '', '', 5, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 19, 20, 1, 'dark-oak', 'Dark Oak', 'dark-oak', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"tag_layout\":\"\",\"tag_link_class\":\"label label-info\",\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 488, '2013-04-25 07:13:07', '', 990, '2014-02-01 08:20:31', '', '', 2, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 21, 22, 1, 'lorem-ipsum', 'Lorem Ipsum', 'lorem-ipsum', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-04-25 07:13:44', '', 0, '0000-00-00 00:00:00', '', '', 3, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, 23, 24, 1, 'company-news', 'Company News', 'company-news', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2013-12-21 13:41:58', '', 0, '0000-00-00 00:00:00', '', '', 22, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 25, 26, 1, 'single-article', 'single article', 'single-article', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2014-01-30 21:13:42', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 27, 28, 1, 'offline', 'Offline', 'offline', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 488, '2014-01-31 11:25:06', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_template_styles`
--

CREATE TABLE `cms_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_template_styles`
--

INSERT INTO `cms_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{\"wrapperSmall\":53,\"wrapperLarge\":72,\"logo\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"left\",\"templatecolor\":\"nature\"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),
(7, 'protostar', 0, '0', 'Protostar', '{\"templateColor\":\"#08C\",\"templateBackgroundColor\":\"#F4F6F7\",\"logoFile\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),
(8, 'isis', 1, '1', 'isis - Default', '{\"templateColor\":\"#13294A\",\"headerColor\":\"#184A7D\",\"sidebarColor\":\"#0088cc\",\"logoFile\":\"\",\"admin_menus\":1,\"displayHeader\":1,\"statusFixed\":1,\"stickyToolbar\":1}'),
(16, 'hli', 0, '1', 'HLI - Default', '{\"logoFile\":\"images\\/logo.PNG\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"logoMarginTop\":70,\"logoMarginBottom\":50,\"templateStyle\":\"1\",\"templateBodyColor\":\"#808080\",\"templateBackgroundColor\":\"#dedede\",\"customColors\":\"0\",\"linkColor\":\"#6ba60f\",\"accentColor\":\"#7bb421\",\"lightAccentColor\":\"#e1eecd\",\"backgroundImage\":\"1\",\"templateBackgroundImage\":\"\",\"backgroundImageRepeat\":\"no-repeat\",\"backgroundImagePosition\":\"center top\",\"backgroundAttachment\":\"fixed\",\"bodyFont\":\"helvetica\",\"bodyFontSize\":14,\"headingsFont\":\"helvetica\",\"googleFonts\":\"0\",\"googleFontName\":\"\",\"googleFontSelectors\":\"\",\"googleFontsSecond\":\"0\",\"googleFontNameSecond\":\"\",\"googleFontSelectorsSecond\":\"\",\"templateWidth\":1000,\"templatePadding\":50,\"sidebarLeftWidth\":\"3\",\"sidebarRightWidth\":\"3\",\"menuMarginTop\":96,\"submenuWidth\":225,\"topaModules\":\"st_style\",\"topbModules\":\"st_style\",\"maintopaModules\":\"st_style\",\"maintopbModules\":\"st_style\",\"mainbottomaModules\":\"st_style\",\"mainbottombModules\":\"st_style\",\"bottomaModules\":\"st_style\",\"bottombModules\":\"st_style\",\"userLogin\":\"1\",\"loginText\":\"Login\",\"logoutText\":\"Logout\",\"userRegistration\":\"1\",\"registerText\":\"Register\",\"profileText\":\"Profile\",\"templateFavicon\":\"\",\"toTop\":\"1\",\"copyrights\":\"1\",\"copyrightsText\":\"Central Hackathon 2018\",\"googleAnalitycs\":\"0\",\"googleAnalitycsCode\":\"\",\"socialIcons\":\"0\",\"linkTwitter\":\"\",\"linkFacebook\":\"\",\"linkDribbble\":\"\",\"linkSkype\":\"\",\"linkGooglePlus\":\"\",\"linkFlickr\":\"\",\"linkYoutube\":\"\",\"linkVimeo\":\"\",\"linkLinkedIn\":\"\",\"templateResponsive\":\"0\",\"titleSpans\":\"1\",\"k2CSS\":\"1\",\"customCSS\":\"0\",\"customCSScode\":\"\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_ucm_base`
--

CREATE TABLE `cms_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_ucm_base`
--

INSERT INTO `cms_ucm_base` (`ucm_id`, `ucm_item_id`, `ucm_type_id`, `ucm_language_id`) VALUES
(1, 27, 1, 0),
(2, 35, 1, 0),
(3, 33, 1, 0),
(4, 28, 1, 0),
(5, 31, 1, 0),
(6, 32, 1, 0),
(7, 30, 1, 0),
(8, 29, 1, 0),
(9, 37, 1, 0),
(10, 36, 1, 0),
(11, 34, 1, 0),
(12, 38, 1, 0),
(13, 7, 1, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_ucm_content`
--

CREATE TABLE `cms_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields';

--
-- Άδειασμα δεδομένων του πίνακα `cms_ucm_content`
--

INSERT INTO `cms_ucm_content` (`core_content_id`, `core_type_alias`, `core_title`, `core_alias`, `core_body`, `core_state`, `core_checked_out_time`, `core_checked_out_user_id`, `core_access`, `core_params`, `core_featured`, `core_metadata`, `core_created_user_id`, `core_created_by_alias`, `core_created_time`, `core_modified_user_id`, `core_modified_time`, `core_language`, `core_publish_up`, `core_publish_down`, `core_content_item_id`, `asset_id`, `core_images`, `core_urls`, `core_hits`, `core_version`, `core_ordering`, `core_metakey`, `core_metadesc`, `core_catid`, `core_xreference`, `core_type_id`) VALUES
(1, 'com_content.article', 'Nulla pulvinar at interdum', 'nulla-pulvinar-at-interdum', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus est, varius vitae blandit sit amet, eleifend convallis ligula. Sed in sodales leo. Vestibulum vulputate faucibus eros eu porta. Fusce est lorem, commodo quis blandit eget, aliquet eu neque. Vestibulum id viverra arcu. Proin id elit dolor. Nulla facilisi. Nunc dapibus aliquam neque, at aliquam purus vulputate eu. Curabitur rhoncus consectetur eros in ornare.</p>\r\n<p>In vitae diam enim. Donec tortor orci, imperdiet at facilisis sit amet, luctus in orci.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-04-08 12:36:10', 990, '2014-02-01 08:28:57', '*', '2013-04-08 12:36:10', '0000-00-00 00:00:00', 27, 104, '{\"image_intro\":\"images\\/demo_content\\/blog\\/7.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Image Alt Text\",\"image_intro_caption\":\"Caption text\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/7.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Image Caption, Lorem ispum\",\"image_fulltext_caption\":\"image caption lorem ispum dolor\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 1033, 66, 4, '', '', 21, '', 1),
(2, 'com_content.article', ' Aenean eu justo', 'aenean-eu-justo', '<p>Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Ulla dapibus ante vel elit egestas commodo.</p>\r\n<p>Nullam hendrerit egestas magna, ut dignissim leo dictum non. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-01-23 12:36:00', 990, '2014-02-01 08:31:16', '*', '2013-01-23 12:36:00', '0000-00-00 00:00:00', 35, 106, '{\"image_intro\":\"images\\/demo_content\\/blog\\/3.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\" Aenean eu justo\",\"image_intro_caption\":\"Sailing Aenean eu justo\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/3.jpg\",\"float_fulltext\":\"right\",\"image_fulltext_alt\":\" Aenean eu justo\",\"image_fulltext_caption\":\"Sailing Aenean eu justo\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 79, 16, 2, '', '', 23, '', 1),
(3, 'com_content.article', ' Curabitur at mauris', 'curabitur-at-mauris', '<p>Curabitur at orci mauris, eget dapibus ligula. Sed porttitor urna sit amet massa porta pellentesque. Sed eget est erat. Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-02-01 12:36:00', 990, '2014-01-31 10:45:29', '*', '2013-02-01 12:36:00', '0000-00-00 00:00:00', 33, 107, '{\"image_intro\":\"images\\/demo_content\\/blog\\/10.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\" Curabitur at mauris\",\"image_intro_caption\":\" Curabitur at mauris\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/10.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\" Curabitur at mauris\",\"image_fulltext_caption\":\" Curabitur at mauris\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 45, 6, 0, '', '', 22, '', 1),
(4, 'com_content.article', 'Aliquam consectetur interdum', 'aliquam-consectetur-interdum', '<p>Aenean eu justo ipsum, quis venenatis est. Vivamus purus est, varius vitae blandit sit amet, eleifend convallis ligula. Sed in sodales leo. Vestibulum vulputate faucibus eros eu porta. Fusce est lorem, commodo quis blandit eget, aliquet eu neque. Vestibulum id viverra arcu. Proin id elit dolor. Curabitur rhoncus consectetur eros in ornare. In vitae diam enim.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan bibendum vestibulum. Nullam hendrerit egestas magna, ut dignissim leo dictum non.</p>\r\n', -2, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-03-08 12:36:00', 990, '2014-01-31 10:14:55', '*', '2013-03-08 12:36:00', '0000-00-00 00:00:00', 28, 108, '{\"image_intro\":\"images\\/demo_content\\/blog\\/7.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Aliquam consectetur nec\",\"image_intro_caption\":\"Aliquam consectetur nec\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/7.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Aliquam consectetur nec\",\"image_fulltext_caption\":\"Aliquam consectetur nec\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 220, 16, 3, '', '', 21, '', 1),
(5, 'com_content.article', 'Donec dictum nisi eget', 'donec-dictum-nisi-eget', '<p>Nunc dapibus aliquam neque, at aliquam purus vulputate eu. Curabitur rhoncus consectetur eros in ornare. In vitae diam enim. Donec tortor orci, imperdiet at facilisis sit amet, luctus in orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan bibendum vestibulum.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-02-04 12:36:00', 990, '2014-01-31 10:38:52', '*', '2013-02-04 12:36:00', '0000-00-00 00:00:00', 31, 109, '{\"image_intro\":\"images\\/demo_content\\/blog\\/8.jpg\",\"float_intro\":\"none\",\"image_intro_alt\":\"Donec dictum nisi eget\",\"image_intro_caption\":\"Donec dictum nisi eget\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/8.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Donec dictum nisi eget\",\"image_fulltext_caption\":\"Donec dictum nisi eget\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 134, 12, 2, '', '', 22, '', 1),
(6, 'com_content.article', 'Donec ut magna', 'donec-ut-magna', '<p>Ut lacus eu quam egestas laoreet nec id sapien. Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio. Donec dictum nisi eget dui mollis viverra. Nulla condimentum pulvinar dolor at interdum. Proin placerat tincidunt aliquam. Sed at orci sed augue posuere ornare.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-02-03 12:36:00', 990, '2014-01-31 10:41:22', '*', '2013-02-03 12:36:00', '0000-00-00 00:00:00', 32, 110, '{\"image_intro\":\"images\\/demo_content\\/blog\\/9.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"Donec ut magna\",\"image_intro_caption\":\"Donec ut magna\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/9.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Donec ut magna\",\"image_fulltext_caption\":\"Donec ut magna\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 45, 7, 1, '', '', 22, '', 1),
(7, 'com_content.article', 'Maecenas facilisis', 'maecenas-facilisis', '<p>Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Mauris sed purus eu magna commodo mollis ac vel ipsum. Mauris ac lectus ipsum, ut tincidunt lectus.</p>\r\n<p>Aenean molestie mattis neque nec laoreet. Nulla pulvinar posuere urna, vel volutpat purus sollicitudin non. Sed egestas condimentum magna, eu aliquam diam hendrerit sit amet.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-03-11 12:36:00', 990, '2014-01-31 10:07:46', '*', '2013-03-11 12:36:00', '0000-00-00 00:00:00', 30, 111, '{\"image_intro\":\"images\\/demo_content\\/blog\\/6.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Maecenas facilisis\",\"image_intro_caption\":\"Maecenas facilisis\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/6.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Maecenas facilisis\",\"image_fulltext_caption\":\"Maecenas facilisis\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 276, 15, 1, '', '', 21, '', 1),
(8, 'com_content.article', 'Class aptent taciti ', 'class-aptent-taciti', '<p>Nullam hendrerit egestas magna, ut dignissim leo dictum non. Aenean eu justo ipsum, quis venenatis est. Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper.</p>\r\n<p>Donec neque metus, tempus eu egestas sit amet, suscipit et tortor. Nam arcu tortor, accumsan a sodales sit amet, pharetra vitae odio.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-03-15 12:36:00', 990, '2014-02-01 08:29:27', '*', '2013-03-15 12:36:00', '0000-00-00 00:00:00', 29, 112, '{\"image_intro\":\"images\\/demo_content\\/blog\\/4.jpg\",\"float_intro\":\"\",\"image_intro_alt\":\"Class aptent taciti \",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/4.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Class aptent taciti \",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 251, 20, 2, '', '', 21, '', 1),
(9, 'com_content.article', 'Quote of someone famous', 'quote-of-someone-famous', '<blockquote>\r\n<p>Labor is prior to, and independent of, capital. Capital is only the fruit of labor, and could never have existed if labor had not first existed. Labor is the superior of capital, and deserves much the higher consideration.</p>\r\n<small>Abraham Lincoln</small></blockquote>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-01-24 12:36:00', 990, '2014-02-01 08:30:31', '*', '2013-01-24 12:36:00', '0000-00-00 00:00:00', 37, 113, '{\"image_intro\":\"\",\"float_intro\":\"left\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 84, 34, 0, '', '', 23, '', 1),
(10, 'com_content.article', 'Nam scelerisque erat quis ', 'nam-scelerisque-erat-quis', '<p>Donec semper lacus ac mi luctus accumsan. Nam scelerisque erat quis lectus gravida lobortis. Nulla dapibus ante vel elit egestas commodo egestas sem elementum. Nulla commodo metus nec tellus pretium sit amet varius mi semper. Quisque sit amet metus sed augue dignissim faucibus sit amet et elit. Nunc accumsan bibendum vestibulum. Nullam hendrerit egestas magna, ut dignissim leo dictum non.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-01-31 12:36:00', 990, '2014-02-07 16:08:45', '*', '2013-01-31 12:36:00', '0000-00-00 00:00:00', 36, 114, '{\"image_intro\":\"images\\/demo_content\\/blog\\/2.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/2.jpg\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 202, 43, 1, '', '', 23, '', 1),
(11, 'com_content.article', 'Donec neque metus, tempus', 'donec-neque-metus-tempus', '<p>Fusce a arcu eu lectus convallis ultricies a et nulla. Nullam consectetur nunc nec varius massa bibendum enim vestibulum nec lobortis lacus consectetur. Vestibulum interdum varius urna vel semper. Aliquam consectetur nunc nec eros pharetra facilisis. Vestibulum laoreet ullamcorper nulla non pharetra.</p>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-12-21 12:36:00', 990, '2014-01-31 10:28:44', '*', '2013-12-21 12:36:00', '0000-00-00 00:00:00', 34, 115, '{\"image_intro\":\"images\\/demo_content\\/blog\\/1.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Our New Office \",\"image_intro_caption\":\"Caption text\",\"image_fulltext\":\"images\\/demo_content\\/blog\\/1.jpg\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"Our New Office \",\"image_fulltext_caption\":\"Lorem ispum dolor sit amet ...\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 331, 91, 3, '', '', 23, '', 1),
(12, 'com_content.article', 'Single Article', 'single-article', '<blockquote>\r\n<p>Labor is prior to, and independent of, capital. Capital is only the fruit of labor, and could never have existed if labor had not first existed. Labor is the superior of capital, and deserves much the higher consideration.</p>\r\n<small>Abraham Lincoln</small></blockquote>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-04-09 14:18:37', 990, '2014-01-30 21:39:50', '*', '2013-04-09 14:18:37', '0000-00-00 00:00:00', 38, 185, '{\"image_intro\":\"images\\/demo_content\\/slider\\/slide6.jpg\",\"float_intro\":\"left\",\"image_intro_alt\":\"Alt text for image\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"left\",\"image_fulltext_alt\":\"Alt text for image\",\"image_fulltext_caption\":\"Image caption text\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 170, 19, 1, '', '', 10, '', 1),
(13, 'com_content.article', 'Offline page', 'offline-page', '<blockquote>\r\n<p>At screenshot below you can preview how \"offline\" page looks, when Joomla is switched to the offline mode in global configuration.</p>\r\n</blockquote>\r\n', 1, '', 0, 1, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_layout\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 488, '', '2013-03-30 08:20:04', 990, '2014-01-31 11:58:58', '*', '2013-03-30 08:20:04', '0000-00-00 00:00:00', 7, 188, '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"right\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', 556, 37, 7, '', '', 10, '', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_ucm_history`
--

CREATE TABLE `cms_ucm_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) UNSIGNED NOT NULL,
  `ucm_type_id` int(10) UNSIGNED NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_updates`
--

CREATE TABLE `cms_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available Updates';

--
-- Άδειασμα δεδομένων του πίνακα `cms_updates`
--

INSERT INTO `cms_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.6.5', '', 'https://update.joomla.org/core/sts/extension_sts.xml', '', '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_update_sites`
--

CREATE TABLE `cms_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Sites';

--
-- Άδειασμα δεδομένων του πίνακα `cms_update_sites`
--

INSERT INTO `cms_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1526219086, ''),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 0, 0, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 0, 0, ''),
(5, 'AllVideos', 'extension', 'http://www.joomlaworks.net/updates/jw_allvideos.xml', 0, 0, ''),
(6, 'K2 Updates', 'extension', 'http://getk2.org/update.xml', 0, 0, ''),
(7, 'Fabrik31', 'collection', 'http://fabrikar.com/update/fabrik31/package_list.xml', 0, 0, ''),
(8, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 0, ''),
(9, 'NoNumber Sourcerer', 'extension', 'http://download.nonumber.nl/updates.php?e=sourcerer&type=.zip', 1, 0, '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_update_sites_extensions`
--

CREATE TABLE `cms_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Άδειασμα δεδομένων του πίνακα `cms_update_sites_extensions`
--

INSERT INTO `cms_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(3, 10099),
(5, 10025),
(6, 10043),
(7, 10094),
(7, 10095),
(8, 28),
(9, 10102),
(9, 10103);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_usergroups`
--

CREATE TABLE `cms_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_usergroups`
--

INSERT INTO `cms_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(488, 'Super User', 'admin', 'ioannapolyxronou+admin@gmail.com', '$2y$10$o6VuseCU953eC0Tp8qncTOsYt2wcZG4luPahccqJEryTvD5i/dz4i', 0, 1, '2018-05-09 10:44:57', '2018-05-13 12:58:14', '0', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}', '0000-00-00 00:00:00', 0, '', '', 0),
(490, 'Collaborators', 'collaborators', 'ioannapolyxronou@gmail.com', '$2y$10$vD4mfVvG5U1j6X37EilnzOVkr8Cz1/q3oJtBoFrySdZnIAUsIa.Ai', 0, 0, '2018-05-09 10:44:57', '2018-05-13 14:16:30', '', '{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_user_keys`
--

CREATE TABLE `cms_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_user_notes`
--

CREATE TABLE `cms_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_user_profiles`
--

CREATE TABLE `cms_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

--
-- Άδειασμα δεδομένων του πίνακα `cms_user_profiles`
--

INSERT INTO `cms_user_profiles` (`user_id`, `profile_key`, `profile_value`, `ordering`) VALUES
(488, 'profile.aboutme', '\"\"', 10),
(488, 'profile.address1', '\"\"', 1),
(488, 'profile.address2', '\"\"', 2),
(488, 'profile.city', '\"\"', 3),
(488, 'profile.country', '\"\"', 5),
(488, 'profile.dob', '\"\"', 11),
(488, 'profile.favoritebook', '\"\"', 9),
(488, 'profile.phone', '\"\"', 7),
(488, 'profile.postal_code', '\"\"', 6),
(488, 'profile.region', '\"\"', 4),
(488, 'profile.website', 'false', 8),
(490, 'profile.aboutme', '\"\"', 10),
(490, 'profile.address1', '\"\"', 1),
(490, 'profile.address2', '\"\"', 2),
(490, 'profile.city', '\"\"', 3),
(490, 'profile.country', '\"\"', 5),
(490, 'profile.dob', '\"\"', 11),
(490, 'profile.favoritebook', '\"\"', 9),
(490, 'profile.phone', '\"\"', 7),
(490, 'profile.postal_code', '\"\"', 6),
(490, 'profile.region', '\"\"', 4),
(490, 'profile.website', 'false', 8);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_user_usergroup_map`
--

CREATE TABLE `cms_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_user_usergroup_map`
--

INSERT INTO `cms_user_usergroup_map` (`user_id`, `group_id`) VALUES
(488, 8),
(490, 2);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_viewlevels`
--

CREATE TABLE `cms_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_viewlevels`
--

INSERT INTO `cms_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]'),
(5, 'Guest', 0, '[9]'),
(6, 'Super Users', 0, '[8]');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cms_weblinks`
--

CREATE TABLE `cms_weblinks` (
  `id` int(10) UNSIGNED NOT NULL,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `images` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `cms_weblinks`
--

INSERT INTO `cms_weblinks` (`id`, `catid`, `title`, `alias`, `url`, `description`, `hits`, `state`, `checked_out`, `checked_out_time`, `ordering`, `access`, `params`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `images`) VALUES
(1, 8, 'Joomla! Community', 'joomla-community', 'http://community.joomla.org/blogs/community.html', '', 2, 1, 0, '0000-00-00 00:00:00', 1, 1, '{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}', '*', '2011-01-01 00:00:01', 488, 'Joomla', '0000-00-00 00:00:00', 0, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, ''),
(2, 8, 'Joomla! Leadership Blog', 'joomla-leadership-blog', 'http://community.joomla.org/blogs/leadership.html', '', 0, 1, 0, '0000-00-00 00:00:00', 2, 1, '{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}', '*', '2011-01-01 00:00:01', 488, 'Joomla', '0000-00-00 00:00:00', 0, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, ''),
(3, 14, 'Joomla! Community ', 'joomla-community', 'http://community.joomla.org/blogs/community.html', '', 0, 1, 0, '0000-00-00 00:00:00', 3, 1, '{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}', '*', '2013-04-05 14:35:53', 488, '', '2013-04-05 14:36:51', 462, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '{\"image_first\":\"\",\"float_first\":\"\",\"image_first_alt\":\"\",\"image_first_caption\":\"\",\"image_second\":\"\",\"float_second\":\"\",\"image_second_alt\":\"\",\"image_second_caption\":\"\"}'),
(4, 14, 'Joomla! ', 'joomla', 'http://www.joomla.org/', '', 1, 1, 0, '0000-00-00 00:00:00', 4, 1, '{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}', '*', '2013-04-05 14:36:34', 488, '', '0000-00-00 00:00:00', 0, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '{\"image_first\":\"\",\"float_first\":\"\",\"image_first_alt\":\"\",\"image_first_caption\":\"\",\"image_second\":\"\",\"float_second\":\"\",\"image_second_alt\":\"\",\"image_second_caption\":\"\"}'),
(5, 14, 'Joomla! - Forums ', 'joomla-forums', 'http://forum.joomla.org/', '<p><span class=\"category\">Joomla! - Forums</span></p>', 0, 1, 0, '0000-00-00 00:00:00', 5, 1, '{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}', '*', '2013-04-05 14:37:39', 488, '', '0000-00-00 00:00:00', 0, '', '', '{\"robots\":\"\",\"rights\":\"\"}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '{\"image_first\":\"\",\"float_first\":\"\",\"image_first_alt\":\"\",\"image_first_caption\":\"\",\"image_second\":\"\",\"float_second\":\"\",\"image_second_alt\":\"\",\"image_second_caption\":\"\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `custom_events_and_alerts_meta`
--

CREATE TABLE `custom_events_and_alerts_meta` (
  `id` int(11) NOT NULL,
  `checkDate` datetime NOT NULL,
  `isViewed` int(11) DEFAULT '0',
  `event_and_alert_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `custom_fuel_meta_days`
--

CREATE TABLE `custom_fuel_meta_days` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicleId` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `day_date` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `consumption` float NOT NULL,
  `average_volume` float NOT NULL,
  `average_temperature` float NOT NULL,
  `average_battery` float NOT NULL,
  `record_creation_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `agro_dataset`
--
ALTER TABLE `agro_dataset`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `agro_location_registry`
--
ALTER TABLE `agro_location_registry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fb_filter_location_name_INDEX` (`location_name`(10));

--
-- Ευρετήρια για πίνακα `agro_meta_daily_data`
--
ALTER TABLE `agro_meta_daily_data`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_assets`
--
ALTER TABLE `cms_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Ευρετήρια για πίνακα `cms_associations`
--
ALTER TABLE `cms_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Ευρετήρια για πίνακα `cms_banners`
--
ALTER TABLE `cms_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_banner_clients`
--
ALTER TABLE `cms_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`);

--
-- Ευρετήρια για πίνακα `cms_banner_tracks`
--
ALTER TABLE `cms_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Ευρετήρια για πίνακα `cms_categories`
--
ALTER TABLE `cms_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`),
  ADD KEY `idx_language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_contact_details`
--
ALTER TABLE `cms_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Ευρετήρια για πίνακα `cms_content`
--
ALTER TABLE `cms_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Ευρετήρια για πίνακα `cms_contentitem_tag_map`
--
ALTER TABLE `cms_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_tag` (`tag_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Ευρετήρια για πίνακα `cms_content_frontpage`
--
ALTER TABLE `cms_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Ευρετήρια για πίνακα `cms_content_rating`
--
ALTER TABLE `cms_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Ευρετήρια για πίνακα `cms_content_types`
--
ALTER TABLE `cms_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`);

--
-- Ευρετήρια για πίνακα `cms_ev_easypopup_popups`
--
ALTER TABLE `cms_ev_easypopup_popups`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_extensions`
--
ALTER TABLE `cms_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_connections`
--
ALTER TABLE `cms_fabrik_connections`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_cron`
--
ALTER TABLE `cms_fabrik_cron`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_elements`
--
ALTER TABLE `cms_fabrik_elements`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_formgroup`
--
ALTER TABLE `cms_fabrik_formgroup`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_forms`
--
ALTER TABLE `cms_fabrik_forms`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_form_sessions`
--
ALTER TABLE `cms_fabrik_form_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_groups`
--
ALTER TABLE `cms_fabrik_groups`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_joins`
--
ALTER TABLE `cms_fabrik_joins`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_jsactions`
--
ALTER TABLE `cms_fabrik_jsactions`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_lists`
--
ALTER TABLE `cms_fabrik_lists`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_log`
--
ALTER TABLE `cms_fabrik_log`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_packages`
--
ALTER TABLE `cms_fabrik_packages`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_validations`
--
ALTER TABLE `cms_fabrik_validations`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_fabrik_visualizations`
--
ALTER TABLE `cms_fabrik_visualizations`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_finder_filters`
--
ALTER TABLE `cms_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Ευρετήρια για πίνακα `cms_finder_links`
--
ALTER TABLE `cms_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms0`
--
ALTER TABLE `cms_finder_links_terms0`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms1`
--
ALTER TABLE `cms_finder_links_terms1`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms2`
--
ALTER TABLE `cms_finder_links_terms2`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms3`
--
ALTER TABLE `cms_finder_links_terms3`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms4`
--
ALTER TABLE `cms_finder_links_terms4`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms5`
--
ALTER TABLE `cms_finder_links_terms5`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms6`
--
ALTER TABLE `cms_finder_links_terms6`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms7`
--
ALTER TABLE `cms_finder_links_terms7`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms8`
--
ALTER TABLE `cms_finder_links_terms8`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_terms9`
--
ALTER TABLE `cms_finder_links_terms9`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_termsa`
--
ALTER TABLE `cms_finder_links_termsa`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_termsb`
--
ALTER TABLE `cms_finder_links_termsb`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_termsc`
--
ALTER TABLE `cms_finder_links_termsc`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_termsd`
--
ALTER TABLE `cms_finder_links_termsd`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_termse`
--
ALTER TABLE `cms_finder_links_termse`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_links_termsf`
--
ALTER TABLE `cms_finder_links_termsf`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Ευρετήρια για πίνακα `cms_finder_taxonomy`
--
ALTER TABLE `cms_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `state` (`state`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `access` (`access`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Ευρετήρια για πίνακα `cms_finder_taxonomy_map`
--
ALTER TABLE `cms_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Ευρετήρια για πίνακα `cms_finder_terms`
--
ALTER TABLE `cms_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term` (`term`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`);

--
-- Ευρετήρια για πίνακα `cms_finder_terms_common`
--
ALTER TABLE `cms_finder_terms_common`
  ADD KEY `idx_word_lang` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Ευρετήρια για πίνακα `cms_finder_tokens`
--
ALTER TABLE `cms_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_context` (`context`);

--
-- Ευρετήρια για πίνακα `cms_finder_tokens_aggregate`
--
ALTER TABLE `cms_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Ευρετήρια για πίνακα `cms_finder_types`
--
ALTER TABLE `cms_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Ευρετήρια για πίνακα `cms_k2_attachments`
--
ALTER TABLE `cms_k2_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemID` (`itemID`);

--
-- Ευρετήρια για πίνακα `cms_k2_categories`
--
ALTER TABLE `cms_k2_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`published`,`access`,`trash`),
  ADD KEY `parent` (`parent`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `published` (`published`),
  ADD KEY `access` (`access`),
  ADD KEY `trash` (`trash`),
  ADD KEY `language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_k2_comments`
--
ALTER TABLE `cms_k2_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `published` (`published`),
  ADD KEY `latestComments` (`published`,`commentDate`);

--
-- Ευρετήρια για πίνακα `cms_k2_extra_fields`
--
ALTER TABLE `cms_k2_extra_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group` (`group`),
  ADD KEY `published` (`published`),
  ADD KEY `ordering` (`ordering`);

--
-- Ευρετήρια για πίνακα `cms_k2_extra_fields_groups`
--
ALTER TABLE `cms_k2_extra_fields_groups`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_k2_items`
--
ALTER TABLE `cms_k2_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item` (`published`,`publish_up`,`publish_down`,`trash`,`access`),
  ADD KEY `catid` (`catid`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `featured` (`featured`),
  ADD KEY `featured_ordering` (`featured_ordering`),
  ADD KEY `hits` (`hits`),
  ADD KEY `created` (`created`),
  ADD KEY `language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_k2_rating`
--
ALTER TABLE `cms_k2_rating`
  ADD PRIMARY KEY (`itemID`);

--
-- Ευρετήρια για πίνακα `cms_k2_tags`
--
ALTER TABLE `cms_k2_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`);

--
-- Ευρετήρια για πίνακα `cms_k2_tags_xref`
--
ALTER TABLE `cms_k2_tags_xref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagID` (`tagID`),
  ADD KEY `itemID` (`itemID`);

--
-- Ευρετήρια για πίνακα `cms_k2_users`
--
ALTER TABLE `cms_k2_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `group` (`group`);

--
-- Ευρετήρια για πίνακα `cms_k2_user_groups`
--
ALTER TABLE `cms_k2_user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_languages`
--
ALTER TABLE `cms_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_image` (`image`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Ευρετήρια για πίνακα `cms_menu`
--
ALTER TABLE `cms_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`),
  ADD KEY `idx_path` (`path`(255)),
  ADD KEY `idx_language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_menu_types`
--
ALTER TABLE `cms_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Ευρετήρια για πίνακα `cms_messages`
--
ALTER TABLE `cms_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Ευρετήρια για πίνακα `cms_messages_cfg`
--
ALTER TABLE `cms_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Ευρετήρια για πίνακα `cms_modules`
--
ALTER TABLE `cms_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_modules_menu`
--
ALTER TABLE `cms_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Ευρετήρια για πίνακα `cms_newsfeeds`
--
ALTER TABLE `cms_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Ευρετήρια για πίνακα `cms_overrider`
--
ALTER TABLE `cms_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `cms_postinstall_messages`
--
ALTER TABLE `cms_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Ευρετήρια για πίνακα `cms_redirect_links`
--
ALTER TABLE `cms_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_link_old` (`old_url`),
  ADD KEY `idx_link_modifed` (`modified_date`);

--
-- Ευρετήρια για πίνακα `cms_schemas`
--
ALTER TABLE `cms_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Ευρετήρια για πίνακα `cms_session`
--
ALTER TABLE `cms_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`);

--
-- Ευρετήρια για πίνακα `cms_tags`
--
ALTER TABLE `cms_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`),
  ADD KEY `idx_language` (`language`);

--
-- Ευρετήρια για πίνακα `cms_template_styles`
--
ALTER TABLE `cms_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_home` (`home`);

--
-- Ευρετήρια για πίνακα `cms_ucm_base`
--
ALTER TABLE `cms_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Ευρετήρια για πίνακα `cms_ucm_content`
--
ALTER TABLE `cms_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Ευρετήρια για πίνακα `cms_ucm_history`
--
ALTER TABLE `cms_ucm_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Ευρετήρια για πίνακα `cms_updates`
--
ALTER TABLE `cms_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Ευρετήρια για πίνακα `cms_update_sites`
--
ALTER TABLE `cms_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Ευρετήρια για πίνακα `cms_update_sites_extensions`
--
ALTER TABLE `cms_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Ευρετήρια για πίνακα `cms_usergroups`
--
ALTER TABLE `cms_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Ευρετήρια για πίνακα `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_block` (`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Ευρετήρια για πίνακα `cms_user_keys`
--
ALTER TABLE `cms_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD UNIQUE KEY `series_2` (`series`),
  ADD UNIQUE KEY `series_3` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Ευρετήρια για πίνακα `cms_user_notes`
--
ALTER TABLE `cms_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Ευρετήρια για πίνακα `cms_user_profiles`
--
ALTER TABLE `cms_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Ευρετήρια για πίνακα `cms_user_usergroup_map`
--
ALTER TABLE `cms_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Ευρετήρια για πίνακα `cms_viewlevels`
--
ALTER TABLE `cms_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Ευρετήρια για πίνακα `cms_weblinks`
--
ALTER TABLE `cms_weblinks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Ευρετήρια για πίνακα `custom_events_and_alerts_meta`
--
ALTER TABLE `custom_events_and_alerts_meta`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `custom_fuel_meta_days`
--
ALTER TABLE `custom_fuel_meta_days`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicleId` (`vehicleId`,`day_date`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `agro_dataset`
--
ALTER TABLE `agro_dataset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8387;

--
-- AUTO_INCREMENT για πίνακα `agro_location_registry`
--
ALTER TABLE `agro_location_registry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT για πίνακα `agro_meta_daily_data`
--
ALTER TABLE `agro_meta_daily_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT για πίνακα `cms_assets`
--
ALTER TABLE `cms_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT για πίνακα `cms_banners`
--
ALTER TABLE `cms_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `cms_banner_clients`
--
ALTER TABLE `cms_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_categories`
--
ALTER TABLE `cms_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT για πίνακα `cms_contact_details`
--
ALTER TABLE `cms_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `cms_content`
--
ALTER TABLE `cms_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT για πίνακα `cms_content_types`
--
ALTER TABLE `cms_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT για πίνακα `cms_ev_easypopup_popups`
--
ALTER TABLE `cms_ev_easypopup_popups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `cms_extensions`
--
ALTER TABLE `cms_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10127;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_connections`
--
ALTER TABLE `cms_fabrik_connections`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_cron`
--
ALTER TABLE `cms_fabrik_cron`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_elements`
--
ALTER TABLE `cms_fabrik_elements`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_formgroup`
--
ALTER TABLE `cms_fabrik_formgroup`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_forms`
--
ALTER TABLE `cms_fabrik_forms`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_form_sessions`
--
ALTER TABLE `cms_fabrik_form_sessions`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_groups`
--
ALTER TABLE `cms_fabrik_groups`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_joins`
--
ALTER TABLE `cms_fabrik_joins`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_jsactions`
--
ALTER TABLE `cms_fabrik_jsactions`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_lists`
--
ALTER TABLE `cms_fabrik_lists`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_log`
--
ALTER TABLE `cms_fabrik_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_packages`
--
ALTER TABLE `cms_fabrik_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_validations`
--
ALTER TABLE `cms_fabrik_validations`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_fabrik_visualizations`
--
ALTER TABLE `cms_fabrik_visualizations`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_finder_filters`
--
ALTER TABLE `cms_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_finder_links`
--
ALTER TABLE `cms_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT για πίνακα `cms_finder_taxonomy`
--
ALTER TABLE `cms_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT για πίνακα `cms_finder_terms`
--
ALTER TABLE `cms_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1476;

--
-- AUTO_INCREMENT για πίνακα `cms_finder_types`
--
ALTER TABLE `cms_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_attachments`
--
ALTER TABLE `cms_k2_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_categories`
--
ALTER TABLE `cms_k2_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_comments`
--
ALTER TABLE `cms_k2_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_extra_fields`
--
ALTER TABLE `cms_k2_extra_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_extra_fields_groups`
--
ALTER TABLE `cms_k2_extra_fields_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_items`
--
ALTER TABLE `cms_k2_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_tags`
--
ALTER TABLE `cms_k2_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_tags_xref`
--
ALTER TABLE `cms_k2_tags_xref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_users`
--
ALTER TABLE `cms_k2_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `cms_k2_user_groups`
--
ALTER TABLE `cms_k2_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT για πίνακα `cms_languages`
--
ALTER TABLE `cms_languages`
  MODIFY `lang_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT για πίνακα `cms_menu`
--
ALTER TABLE `cms_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT για πίνακα `cms_menu_types`
--
ALTER TABLE `cms_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `cms_messages`
--
ALTER TABLE `cms_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_modules`
--
ALTER TABLE `cms_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT για πίνακα `cms_newsfeeds`
--
ALTER TABLE `cms_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `cms_overrider`
--
ALTER TABLE `cms_overrider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT για πίνακα `cms_postinstall_messages`
--
ALTER TABLE `cms_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `cms_redirect_links`
--
ALTER TABLE `cms_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT για πίνακα `cms_tags`
--
ALTER TABLE `cms_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT για πίνακα `cms_template_styles`
--
ALTER TABLE `cms_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT για πίνακα `cms_ucm_content`
--
ALTER TABLE `cms_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT για πίνακα `cms_ucm_history`
--
ALTER TABLE `cms_ucm_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_updates`
--
ALTER TABLE `cms_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT για πίνακα `cms_update_sites`
--
ALTER TABLE `cms_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `cms_usergroups`
--
ALTER TABLE `cms_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=495;

--
-- AUTO_INCREMENT για πίνακα `cms_user_keys`
--
ALTER TABLE `cms_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_user_notes`
--
ALTER TABLE `cms_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `cms_viewlevels`
--
ALTER TABLE `cms_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT για πίνακα `cms_weblinks`
--
ALTER TABLE `cms_weblinks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT για πίνακα `custom_events_and_alerts_meta`
--
ALTER TABLE `custom_events_and_alerts_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `custom_fuel_meta_days`
--
ALTER TABLE `custom_fuel_meta_days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3570;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
