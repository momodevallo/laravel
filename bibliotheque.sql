-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : ven. 16 mai 2025 à 15:05
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnements`
--

DROP TABLE IF EXISTS `abonnements`;
CREATE TABLE IF NOT EXISTS `abonnements` (
  `id_abonnement` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_type_abonnement` int(11) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_abonnement`),
  KEY `i_fk_abonnements_utilisateurs` (`id_utilisateur`),
  KEY `i_fk_abonnements_type_abonnements` (`id_type_abonnement`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='table abonnements';

--
-- Déchargement des données de la table `abonnements`
--

INSERT INTO `abonnements` (`id_abonnement`, `id_utilisateur`, `id_type_abonnement`, `date_debut`, `date_fin`) VALUES
(1, 1, 1, '2024-01-20 00:00:00', '2025-01-20 00:00:00'),
(2, 2, 1, '2024-01-10 00:00:00', '2025-01-10 00:00:00'),
(3, 3, 2, '2024-02-15 00:00:00', '2025-02-15 00:00:00'),
(4, 4, 3, '2024-03-10 00:00:00', '2024-09-10 00:00:00'),
(5, 5, 4, '2024-01-20 00:00:00', '2024-07-20 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

DROP TABLE IF EXISTS `auteurs`;
CREATE TABLE IF NOT EXISTS `auteurs` (
  `id_auteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  PRIMARY KEY (`id_auteur`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auteurs`
--

INSERT INTO `auteurs` (`id_auteur`, `nom`, `prenom`) VALUES
(24, 'Hugo', 'Victor'),
(25, 'Camus', 'Albert'),
(26, 'Orwell', 'George'),
(27, 'Saint-Exupéry', 'Antoine'),
(28, 'Bradbury', 'Ray'),
(30, 'Noah Harari', 'Yuval'),
(31, 'Coelho', 'Paulo');

-- --------------------------------------------------------

--
-- Structure de la table `auteur_ouvrages`
--

DROP TABLE IF EXISTS `auteur_ouvrages`;
CREATE TABLE IF NOT EXISTS `auteur_ouvrages` (
  `id_auteurouvrage` int(11) NOT NULL AUTO_INCREMENT,
  `id_auteur` int(11) NOT NULL,
  `id_ouvrage` int(11) NOT NULL,
  PRIMARY KEY (`id_auteurouvrage`),
  UNIQUE KEY `id_auteur` (`id_auteur`,`id_ouvrage`),
  KEY `i_fk_auteur_ouvrages_auteurs` (`id_auteur`),
  KEY `i_fk_auteur_ouvrages_ouvrages` (`id_ouvrage`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auteur_ouvrages`
--

INSERT INTO `auteur_ouvrages` (`id_auteurouvrage`, `id_auteur`, `id_ouvrage`) VALUES
(17, 24, 34),
(18, 25, 35),
(25, 25, 60),
(27, 25, 63),
(19, 26, 36),
(23, 26, 61),
(26, 26, 62),
(20, 27, 37),
(24, 27, 59),
(21, 28, 38),
(28, 31, 64);

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_ouvrage` int(11) NOT NULL,
  `id_utilisateur` bigint(20) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `statut` enum('en_attente','valide') DEFAULT 'en_attente',
  `note` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `i_fk_commentaires_ouvrages` (`id_ouvrage`),
  KEY `i_fk_commentaires_utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id_commentaire`, `id_ouvrage`, `id_utilisateur`, `date_creation`, `statut`, `note`) VALUES
(23, 30, NULL, NULL, 'en_attente', 5),
(24, 30, NULL, NULL, 'valide', 4);

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

DROP TABLE IF EXISTS `editeurs`;
CREATE TABLE IF NOT EXISTS `editeurs` (
  `id_editeur` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text DEFAULT NULL,
  PRIMARY KEY (`id_editeur`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `editeurs`
--

INSERT INTO `editeurs` (`id_editeur`, `libelle`) VALUES
(4, 'Hachette'),
(28, 'Larousse'),
(74, 'Gallimard');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE IF NOT EXISTS `emprunts` (
  `id_emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `id_ouvrage` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_emprunt` datetime DEFAULT NULL,
  `date_retour_prevue` datetime DEFAULT NULL,
  `date_retour_reel` datetime DEFAULT NULL,
  PRIMARY KEY (`id_emprunt`),
  KEY `i_fk_emprunts_ouvrages` (`id_ouvrage`),
  KEY `i_fk_emprunts_utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunts`
--

INSERT INTO `emprunts` (`id_emprunt`, `id_ouvrage`, `id_utilisateur`, `date_emprunt`, `date_retour_prevue`, `date_retour_reel`) VALUES
(1, 1, 2, '2024-02-01 00:00:00', '2024-02-15 00:00:00', '2024-02-14 00:00:00'),
(2, 2, 4, '2024-02-10 00:00:00', '2024-02-24 00:00:00', NULL),
(3, 3, 5, '2024-03-05 00:00:00', '2024-03-19 00:00:00', '2024-03-18 00:00:00'),
(4, 4, 1, '2024-03-07 00:00:00', '2024-03-21 00:00:00', NULL),
(5, 5, 3, '2024-03-10 00:00:00', '2024-03-24 00:00:00', '2024-03-22 00:00:00'),
(9, 8, 8, '2025-03-27 00:00:00', '2025-04-17 00:00:00', NULL),
(11, 55, 6, '2025-04-08 00:00:00', '2025-04-29 00:00:00', NULL);

--
-- Déclencheurs `emprunts`
--
DROP TRIGGER IF EXISTS `set_date_retour_prevue`;
DELIMITER $$
CREATE TRIGGER `set_date_retour_prevue` BEFORE INSERT ON `emprunts` FOR EACH ROW BEGIN
    
    IF NEW.date_emprunt IS NOT NULL THEN
        SET NEW.date_retour_prevue = DATE_ADD(NEW.date_emprunt, INTERVAL 21 DAY);
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `set_date_retour_prevue_update`;
DELIMITER $$
CREATE TRIGGER `set_date_retour_prevue_update` BEFORE UPDATE ON `emprunts` FOR EACH ROW BEGIN
    
    IF NEW.date_emprunt IS NOT NULL AND NEW.date_emprunt <> OLD.date_emprunt THEN
        
        SET NEW.date_retour_prevue = DATE_ADD(NEW.date_emprunt, INTERVAL 21 DAY);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id_genre`, `libelle`) VALUES
(1, 'Science fiction'),
(2, 'Revue'),
(3, 'Bande dessinée'),
(4, 'Roman'),
(5, 'Biographie'),
(6, 'Essai'),
(7, 'Nouvelle'),
(8, 'Poésie'),
(9, 'Théâtre'),
(10, 'Recueil');

-- --------------------------------------------------------

--
-- Structure de la table `genre_ouvrages`
--

DROP TABLE IF EXISTS `genre_ouvrages`;
CREATE TABLE IF NOT EXISTS `genre_ouvrages` (
  `id_genreouvrage` int(11) NOT NULL AUTO_INCREMENT,
  `id_ouvrage` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  PRIMARY KEY (`id_genreouvrage`),
  UNIQUE KEY `id_ouvrage` (`id_ouvrage`,`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genre_ouvrages`
--

INSERT INTO `genre_ouvrages` (`id_genreouvrage`, `id_ouvrage`, `id_genre`) VALUES
(1, 1, 6),
(2, 2, 10),
(3, 3, 4),
(9, 3, 5),
(4, 4, 6),
(5, 5, 4),
(46, 7, 4),
(12, 8, 1),
(13, 8, 2),
(14, 8, 3),
(15, 8, 4),
(16, 8, 5),
(17, 8, 6),
(18, 8, 7),
(19, 8, 8),
(20, 8, 9),
(21, 8, 10),
(10, 8, 11),
(22, 8, 12),
(23, 8, 13),
(24, 8, 14),
(25, 8, 15),
(26, 8, 16),
(27, 8, 17),
(11, 8, 18),
(28, 8, 19),
(29, 8, 20),
(30, 9, 3),
(31, 10, 5),
(32, 11, 14),
(33, 12, 6),
(34, 13, 7),
(47, 14, 2),
(35, 14, 5),
(36, 15, 7),
(37, 16, 1),
(38, 17, 13),
(49, 18, 5),
(39, 18, 6),
(40, 19, 2),
(41, 20, 2),
(43, 21, 17),
(44, 22, 3),
(45, 23, 6),
(48, 24, 3),
(64, 25, 7),
(50, 25, 10),
(51, 26, 1),
(70, 26, 7),
(67, 27, 2),
(58, 27, 3),
(59, 27, 4),
(65, 28, 1),
(66, 28, 2),
(56, 29, 5),
(68, 30, 9),
(69, 31, 7),
(71, 32, 1),
(88, 33, 2),
(74, 34, 2),
(77, 35, 9),
(79, 36, 2),
(80, 37, 2),
(81, 38, 9),
(82, 39, 2),
(86, 40, 2),
(91, 59, 8),
(92, 60, 4),
(90, 61, 5),
(93, 62, 5),
(94, 63, 2),
(95, 64, 4);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ouvrages`
--

DROP TABLE IF EXISTS `ouvrages`;
CREATE TABLE IF NOT EXISTS `ouvrages` (
  `id_ouvrage` int(11) NOT NULL AUTO_INCREMENT,
  `id_editeur` int(11) NOT NULL,
  `code_isbn` varchar(13) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `type` enum('livre','magazine','ebook') DEFAULT 'livre',
  PRIMARY KEY (`id_ouvrage`),
  KEY `i_fk_ouvrages_editeurs` (`id_editeur`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ouvrages`
--

INSERT INTO `ouvrages` (`id_ouvrage`, `id_editeur`, `code_isbn`, `titre`, `type`) VALUES
(59, 4, '207061275', 'Le Petit Prince', 'livre'),
(61, 4, '207036818', 'Fahrenheit 451', 'livre'),
(63, 4, '9782070360420', 'La Peste', 'ebook'),
(64, 74, '9780061122415', 'L\'Alchimiste', 'livre');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `id_ouvrage` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_reservation` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `i_fk_reservations_ouvrages` (`id_ouvrage`),
  KEY `i_fk_reservations_utilisateurs` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id_reservation`, `id_ouvrage`, `id_utilisateur`, `date_reservation`) VALUES
(18, 59, 50, '2005-11-27 12:56:00'),
(19, 60, 988, '2025-05-12 15:13:00'),
(20, 61, 988, '2025-05-12 04:08:00');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_abonnements`
--

DROP TABLE IF EXISTS `type_abonnements`;
CREATE TABLE IF NOT EXISTS `type_abonnements` (
  `id_type_abonnement` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text DEFAULT NULL,
  `prix` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_type_abonnement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_abonnements`
--

INSERT INTO `type_abonnements` (`id_type_abonnement`, `nom`, `prix`) VALUES
(1, 'Adulte résident', 20.00),
(2, 'Adulte non résident', 40.00),
(3, 'Etudiant', 10.00),
(4, 'Enfant', 7.00);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `statut` enum('en attente','inactif','actif') DEFAULT 'en attente',
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `date_naissance` datetime DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mot_de_passe` text DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `ville` text DEFAULT NULL,
  `reception_newsletter` smallint(6) DEFAULT 0,
  `role` enum('gestionnaire','utilisateur') DEFAULT 'utilisateur',
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `statut`, `nom`, `prenom`, `date_naissance`, `email`, `mot_de_passe`, `adresse`, `code_postal`, `ville`, `reception_newsletter`, `role`) VALUES
(989, 'actif', 'Hamila', 'Mohamed', '2005-02-22 00:00:00', 'mohamed@gmail.com', '$2y$12$OPLP.aw6TciMedfnizGYzeK3k8PgBFhLTCx9E0jZFHWX3oaLyodgq', 'chemin saint estienne dorve', '06220', 'Vallauris', 0, 'gestionnaire'),
(990, 'actif', 'User', 'Hassa', '2001-01-02 00:00:00', 'user@gmail.com', '$2y$12$xOFXUAmqJ1lsPo/JDR370.i6tcqQj.rIolBjsGrdQJu1q/Zyk9Uqa', 'user du hassa', '06250', 'Cannes', 0, 'utilisateur');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auteur_ouvrages`
--
ALTER TABLE `auteur_ouvrages`
  ADD CONSTRAINT `fk_auteur_ouvrages_auteurs` FOREIGN KEY (`id_auteur`) REFERENCES `auteurs` (`id_auteur`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
