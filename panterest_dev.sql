-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 04 mai 2021 à 22:52
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `panterest_dev`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210421204830', '2021-05-02 14:32:33', 26),
('DoctrineMigrations\\Version20210422083623', '2021-05-02 14:32:33', 19),
('DoctrineMigrations\\Version20210430213836', '2021-05-02 14:32:33', 19),
('DoctrineMigrations\\Version20210502113439', '2021-05-02 14:32:33', 99),
('DoctrineMigrations\\Version20210502140504', '2021-05-02 14:32:33', 51),
('DoctrineMigrations\\Version20210504220208', '2021-05-04 22:04:06', 101);

-- --------------------------------------------------------

--
-- Structure de la table `pins`
--

DROP TABLE IF EXISTS `pins`;
CREATE TABLE IF NOT EXISTS `pins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F0FE980A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pins`
--

INSERT INTO `pins` (`id`, `title`, `description`, `created_at`, `updated_at`, `image_name`, `user_id`) VALUES
(1, 'Pin 1', 'Desciption 1', '2021-05-02 17:07:06', '2021-05-02 17:07:06', NULL, 1),
(2, 'Pin 2', 'Ma superbe description', '2021-05-02 17:19:48', '2021-05-02 17:19:48', NULL, 2),
(3, 'Pin 3', 'Ceci est ma troisième épingle. Yay !!!', '2021-05-02 17:54:13', '2021-05-04 09:12:20', 'pexels-pixabay-358457-60910ff431529125184078.jpg', 2),
(11, 'Ma jolie épingle', 'Ceci est ma jolie épingle !!!', '2021-05-04 12:59:19', '2021-05-04 12:59:35', 'pexels-alex-757239-609145376f952017574474.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `roles`, `password`, `created_at`, `updated_at`, `is_verified`) VALUES
(1, 'John', 'Doe', 'john@doe.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$RVlVSGZPek95dUk3UXVwaQ$a/U43xw9UReqG8oZlhOcnZPOb+I/dcEX5T486G3QumM', '2021-05-02 16:53:55', '2021-05-02 16:53:55', 0),
(2, 'Jane', 'Doe', 'jane@doe.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$RVlVSGZPek95dUk3UXVwaQ$a/U43xw9UReqG8oZlhOcnZPOb+I/dcEX5T486G3QumM', '2021-05-02 16:58:48', '2021-05-02 16:58:48', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pins`
--
ALTER TABLE `pins`
  ADD CONSTRAINT `FK_3F0FE980A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
