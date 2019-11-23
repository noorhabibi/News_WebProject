-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 12:05 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `idcategory` int(10) UNSIGNED NOT NULL,
  `title` varchar(80) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`idcategory`, `title`, `description`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(1, 'Economy', 'Economy news from all around the world', '2015-08-02 09:42:51', 'web', '0000-00-00 00:00:00', 'web'),
(2, 'Sports', 'Are you a sports fanatic?', '2015-08-02 09:43:10', 'web', '0000-00-00 00:00:00', 'web'),
(3, 'Technology', 'All the cutting edge technology news', '2015-08-02 09:43:34', 'web', '0000-00-00 00:00:00', 'web'),
(4, 'World', 'What\'s going on out there?', '2015-08-02 09:43:51', 'web', '0000-00-00 00:00:00', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `idpost` int(10) UNSIGNED NOT NULL,
  `iduser` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `body` text COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`idpost`, `iduser`, `title`, `body`, `image`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(24, 5, 'Computer', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', '67c0daef25589f4a5ee4a3c2ae574bfd.jpg', '2019-11-13 10:52:25', 'web', '0000-00-00 00:00:00', 'web'),
(25, 5, 'programming', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', '339a828361c9ec278468d43deb6565be.jpg', '2019-11-13 10:53:11', 'web', '0000-00-00 00:00:00', 'web'),
(27, 5, 'village', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', 'a6f3f9fc1f706f9501f6ae05c71051bf.jpg', '2019-11-13 10:55:00', 'web', '0000-00-00 00:00:00', 'web'),
(28, 5, 'worlds', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', 'b8c9373394dc2642cf328320e7fa6174.jpg', '2019-11-13 10:55:35', 'web', '0000-00-00 00:00:00', 'web'),
(30, 5, 'Football', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', 'ce3f55698b15fbf1fe856b676ceb62fe.jpg', '2019-11-13 10:58:36', 'web', '0000-00-00 00:00:00', 'web'),
(31, 5, 'Balls', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', 'eaa36f49eb74839ae0503b2fd00a8bbd.jpg', '2019-11-13 10:59:01', 'web', '0000-00-00 00:00:00', 'web'),
(32, 5, 'University', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', '75f288f5f97b43d136cb0e7cd7f0e654.jpg', '2019-11-13 10:59:33', 'web', '0000-00-00 00:00:00', 'web'),
(33, 5, 'Company', 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.\r\nTo make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.', 'c31d04faf3b92713ed09748d5e487e41.jpg', '2019-11-13 11:00:36', 'web', '0000-00-00 00:00:00', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `idpost_category` int(10) UNSIGNED NOT NULL,
  `idpost` int(10) UNSIGNED NOT NULL,
  `idcategory` int(10) UNSIGNED NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`idpost_category`, `idpost`, `idcategory`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(21, 24, 3, '2019-11-13 10:52:26', '5', '0000-00-00 00:00:00', 'web'),
(22, 25, 3, '2019-11-13 10:53:12', '5', '0000-00-00 00:00:00', 'web'),
(24, 27, 4, '2019-11-13 10:55:00', '5', '0000-00-00 00:00:00', 'web'),
(25, 28, 4, '2019-11-13 10:55:35', '5', '0000-00-00 00:00:00', 'web'),
(27, 30, 2, '2019-11-13 10:58:36', '5', '0000-00-00 00:00:00', 'web'),
(28, 31, 2, '2019-11-13 10:59:01', '5', '0000-00-00 00:00:00', 'web'),
(29, 32, 1, '2019-11-13 10:59:33', '5', '0000-00-00 00:00:00', 'web'),
(30, 33, 1, '2019-11-13 11:00:36', '5', '0000-00-00 00:00:00', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `idpost_tag` int(10) UNSIGNED NOT NULL,
  `idpost` int(10) UNSIGNED NOT NULL,
  `idtag` int(10) UNSIGNED NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`idpost_tag`, `idpost`, `idtag`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(22, 24, 11, '2019-11-13 10:52:26', '5', '0000-00-00 00:00:00', 'web'),
(23, 25, 15, '2019-11-13 10:53:11', '5', '0000-00-00 00:00:00', 'web'),
(25, 27, 16, '2019-11-13 10:55:00', '5', '0000-00-00 00:00:00', 'web'),
(26, 28, 2, '2019-11-13 10:55:35', '5', '0000-00-00 00:00:00', 'web'),
(28, 30, 13, '2019-11-13 10:58:36', '5', '0000-00-00 00:00:00', 'web'),
(29, 31, 18, '2019-11-13 10:59:01', '5', '0000-00-00 00:00:00', 'web'),
(30, 32, 19, '2019-11-13 10:59:33', '5', '0000-00-00 00:00:00', 'web'),
(31, 33, 20, '2019-11-13 11:00:36', '5', '0000-00-00 00:00:00', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `idprofile` int(10) UNSIGNED NOT NULL,
  `iduser` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`idprofile`, `iduser`, `first_name`, `last_name`, `display_name`, `gravatar_email`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(6, 5, 'Noorahamd', 'Habibi', '', 'Noorahmad.cs@gmail.com', '2019-11-13 10:49:56', 'web', '0000-00-00 00:00:00', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `idtag` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`idtag`, `title`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(1, 'news', '2015-08-02 10:08:11', 'web', '0000-00-00 00:00:00', 'web'),
(2, 'world', '2015-08-02 10:08:11', 'web', '0000-00-00 00:00:00', 'web'),
(3, 'economy', '2015-08-02 10:39:54', 'web', '0000-00-00 00:00:00', 'web'),
(4, 'sport', '2015-08-02 10:44:33', 'web', '0000-00-00 00:00:00', 'web'),
(5, 'space', '2015-08-02 11:58:50', '1', '0000-00-00 00:00:00', 'web'),
(6, 'science', '2015-08-02 11:58:51', '1', '0000-00-00 00:00:00', 'web'),
(7, 'war', '2015-08-02 12:00:04', '1', '0000-00-00 00:00:00', 'web'),
(8, 'sports', '2015-08-02 20:44:55', '2', '0000-00-00 00:00:00', 'web'),
(9, 'lorem', '2015-08-02 20:44:55', '2', '0000-00-00 00:00:00', 'web'),
(10, 'technology', '2015-08-02 20:45:49', '2', '0000-00-00 00:00:00', 'web'),
(11, 'computer', '2019-11-13 10:47:33', '4', '0000-00-00 00:00:00', 'web'),
(12, 'network', '2019-11-13 10:48:08', '4', '0000-00-00 00:00:00', 'web'),
(13, 'football', '2019-11-13 10:48:32', '4', '0000-00-00 00:00:00', 'web'),
(14, 'program', '2019-11-13 10:50:15', '4', '0000-00-00 00:00:00', 'web'),
(15, 'programs', '2019-11-13 10:53:11', '5', '0000-00-00 00:00:00', 'web'),
(16, 'village', '2019-11-13 10:55:00', '5', '0000-00-00 00:00:00', 'web'),
(17, 'river', '2019-11-13 10:56:52', '5', '0000-00-00 00:00:00', 'web'),
(18, 'balls', '2019-11-13 10:59:01', '5', '0000-00-00 00:00:00', 'web'),
(19, 'university', '2019-11-13 10:59:33', '5', '0000-00-00 00:00:00', 'web'),
(20, 'company', '2019-11-13 11:00:36', '5', '0000-00-00 00:00:00', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `iduser` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) CHARACTER SET latin1 NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) CHARACTER SET latin1 DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`iduser`, `email`, `password`, `code`, `status`, `add_date`, `added_by`, `edit_date`, `edited_by`) VALUES
(5, 'Noorahmad.cs@gmail.com', '807a8c7de49594ba34a7b9055baaade5', '5b05453ffe926752559b9eb5422d2aad', 0, '2019-11-13 10:46:31', 'web', '2019-11-13 07:19:55', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idcategory`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`idpost`),
  ADD KEY `FK_posts_user` (`iduser`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`idpost_category`),
  ADD KEY `FK_post_categories_post` (`idpost`),
  ADD KEY `FK_post_categories_category` (`idcategory`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`idpost_tag`),
  ADD KEY `FK_post_tags_post` (`idpost`),
  ADD KEY `FK_post_tags_tag` (`idtag`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`idprofile`),
  ADD KEY `unique_iduser` (`iduser`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`idtag`),
  ADD UNIQUE KEY `unique_title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_code` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `idcategory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `idpost` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `idpost_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `idpost_tag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `idprofile` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `idtag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_posts_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `FK_post_categories_category` FOREIGN KEY (`idcategory`) REFERENCES `categories` (`idcategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_post_categories_post` FOREIGN KEY (`idpost`) REFERENCES `posts` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `FK_post_tags_post` FOREIGN KEY (`idpost`) REFERENCES `posts` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_post_tags_tag` FOREIGN KEY (`idtag`) REFERENCES `tags` (`idtag`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `FK_profiles_users` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
