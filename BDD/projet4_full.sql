-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 03 nov. 2019 à 11:59
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet4_mwd6`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `ville` varchar(70) DEFAULT NULL,
  `pays` varchar(45) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`utilisateur_id`),
  KEY `fk_adresse_utilisateur1_idx` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `adresse`, `code_postal`, `ville`, `pays`, `latitude`, `longitude`, `description`, `utilisateur_id`) VALUES
(1, '13-1 Avenue Malvesin', 92400, 'Courbevoie', 'France', '48.90156700', '2.27171000', 'maison', 2),
(2, '15 rue Victor Hugo', 92400, 'Courbevoie', 'France', '48.89364300', '2.25428200', 'travail', 4),
(3, '13-1 Avenue Malvesin', 92400, 'Courbevoie', 'France', '48.90156700', '2.27171000', 'maison', 2),
(4, '21 rue jean Bonal', 92250, 'La Garenne-Colombes', 'France', '48.90741000', '2.25226500', 'maison', 4),
(5, '7 Allée des 3 musiciens', 92000, 'Nanterre', 'France', '48.88973200', '2.22040000', 'appart', 5);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_paiement` date DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `prix_total` int(11) DEFAULT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `statut_commande_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`utilisateur_id`,`livreur_id`,`statut_commande_id`,`adresse_id`),
  KEY `fk_commande_utilisateur1_idx` (`utilisateur_id`),
  KEY `fk_commande_livreur1_idx` (`livreur_id`),
  KEY `fk_commande_statut_commande1_idx` (`statut_commande_id`),
  KEY `fk_commande_adresse1_idx` (`adresse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date_paiement`, `date_livraison`, `prix_total`, `utilisateur_id`, `livreur_id`, `statut_commande_id`, `adresse_id`) VALUES
(1, '2019-10-26', '2019-10-26', 17, 2, 2, 3, 1),
(2, '2019-10-27', '2019-10-27', 13, 2, 2, 3, 3),
(3, '2019-10-27', '2019-10-27', 11, 4, 1, 3, 2),
(4, '2019-10-28', '2019-10-28', 38, 4, 1, 3, 4),
(5, '2019-10-28', '2019-10-28', 21, 5, 1, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`commande_id`,`produit_id`),
  KEY `fk_commande_produit_commande1_idx` (`commande_id`),
  KEY `fk_commande_produit_produit1_idx` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande_produit`
--

INSERT INTO `commande_produit` (`id`, `quantite`, `commande_id`, `produit_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 7),
(3, 1, 2, 3),
(4, 1, 2, 10),
(5, 1, 3, 4),
(6, 1, 3, 9),
(7, 2, 4, 5),
(8, 2, 4, 11),
(9, 1, 5, 5),
(10, 1, 5, 12);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `statut_livreur_id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`statut_livreur_id`,`utilisateur_id`),
  KEY `fk_livreur_statut_livreur1_idx` (`statut_livreur_id`),
  KEY `fk_livreur_utilisateur1_idx` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `latitude`, `longitude`, `statut_livreur_id`, `utilisateur_id`) VALUES
(1, '48.90419600', '2.28108260', 2, 1),
(2, '48.90534000', '2.26456500', 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(45) DEFAULT NULL,
  `nom_commun` varchar(255) DEFAULT NULL,
  `description` longtext,
  `photo` varchar(45) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `date_disponibilite` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `reference`, `nom_commun`, `description`, `photo`, `prix`, `date_disponibilite`) VALUES
(1, 'PLA2610_FALA01', 'Falafels', 'Délicieuses boulettes de pois chiches que l\'on peut déguster dans les restaurants libanais : il est tout à fait possible de se les faire livré !\r\nIngrédients : poids chiches, oignon, farine, sel, cumin, coriandre, paprika, persil, huile d\'olive.', NULL, 13, '2019-10-26'),
(2, 'PLA2610_POULET01', 'Poulet tandoori', 'Le poulet tandoori c\'est LE grand classique de la cuisine indienne que l\'on ne mange qu\'au resto...\r\nIngrédients : poulet, citron, sel, yaourt, épices, menthe, piment.', NULL, 11, '2019-10-26'),
(3, 'PLA2710_SAMOUSSA01', 'Samoussas au boeuf', 'Quand on a envie de saveurs exotiques, on commande souvent des samoussas... Mais voici les ingrédients (sans vous dévoiler la technique) des notres : ognions, ail, boeuf haché (français), lait de coco, gingembre, curry, purée de piment, sel, feuille de brick, salade.', NULL, 9, '2019-10-27'),
(4, 'PLA2710_NOUILLESCHIN01', 'Nouilles chinoises', 'Faire voyager nos papilles pour pas cher, quoi de plus facile que de commander un plat de nouilles ?\r\nVoici les ingrédients de nos nouilles : huile, jeune pousse de soja, gingembre haché, fleur de brocolis, filets de poulet, carottes, oignon, sauce soja, épices. La cuisson est réalisée grâce au wok !', NULL, 7, '2019-10-27'),
(5, 'PLA2810_COUSCOUSLEGPOUL1', 'couscous légumes poulet', 'Ah le couscous... Il est, avec le tajine, un des plats le plus emblématiques de la cuisine traditionnelle du Maghreb et, plus largement, des cuisines juives d\'Afrique du Nord, de la cuisine africaine, et du régime méditerranéen. Il est cuisiné selon de multiples déclinaisons régionales et culturelles locales : Découvrez le notre !\r\nIngrédients : Semoule, oignon, tomates, courgettes, carottes, pois chiche, poulet, sel, poivre, coriandre, huile d\\\'olive', NULL, 14, '2019-10-28'),
(6, 'PLA2810_PENNES01', 'Pennes tomate mozzarella et jambon de parme', 'Et si, pour l’heure tant attendue du repas, vous réalisiez une salade de pâtes à l’italienne ? Facile & pratique à transporter, pour des pique-niques improvisés ou simplement au bureau, ces délicieuses pennes tomate mozzarella et jambon de parme, au basilic et à la tomate ainsi qu\'à la vinaigrette vont vous mettre en appétit et vous rassasier comme il le faut. \r\nIngrédients : pâtes, mozzarella, jambon de parme, tomates, basilic, parmesan, herbes de Provence, huile d\\\'olive, vinaigre balsamique, sel, poivre.', NULL, 9, '2019-10-28'),
(7, 'DES2610_CAKE01', 'Cake sucré', 'Le cake sucré fait toujours l\'unanimité au moment du goûter ou en dessert !A commencer par le traditionnel quatre-quarts. Ce cake doit son nom à ses proportions : un quart de farine, un autre quart de sucre, un troisième de beurre et un dernier quart d’œuf. Bête comme chou !\r\nA déguster avec le café ou glisser dans le tiroir du bureau, pour combler les petits creux de la journée.', NULL, 4, '2019-10-26'),
(8, 'DES2610_CHEESECAKE01', 'Cheesecake', 'Découvrez notre incontournable cheesecake. Réalisez à la façon new yorkaise, moelleux à souhait !Avec sa base en spéculoos et son bon goût de fromage frais, le cheesecake fait fondre de bonheur plus d\'un gourmand. Nous Déclinons la traditionnelle recette du cheesecake américain en remplaçant le fromage frais de type Philadephia par du mascarpone, de la ricotta ou encore du fromage blanc. Il est également possible de préparer un cheesecake sans cuisson, en utilisant de la gélatine alimentaire. Parfumé ou citron ou à la vanille, le cheesecake conclut avec douceur un repas léger... mais il s\'apprécie à tout moment de la journée !', NULL, 5, '2019-10-26'),
(9, 'DES2710_CLAFOUTIS01', 'Clafoutis', 'Qui peut résister au moelleux d\'un clafoutis dégusté encore tiède ? Personne ! D\'autant plus que les recettes de clafoutis sont à déguster toute l\'année ! L\'été, on déguste volontiers un clafoutis à la cerise, aux abricots ou mirabelles. L\'automne, on se tourne vers une recette de clafoutis à la poire ou bien à la pomme, aussi appelée \"flognarde\". Durant tout l\'hiver, on se régale avec un clafoutis aux prunes séchées, le fameux \"far aux pruneaux\" breton. Et pendant toute l\'année, on s\'en met plein les papilles !', NULL, 4, '2019-10-27'),
(10, 'DES2710_COULIS01', 'Coulis, sauce caramel chutney et fruits', 'Au caramel et aux fruits, ces excellents coulis accompagneront vos plats avec élégance.\r\nFruits : banane, orange, fraise, pamplemousse, kiwi', NULL, 4, '2019-10-27'),
(11, 'DES2810_CRUMBLEPOIRE01', 'Crumble aux poires et au chocolat', 'Il se la joue moelleux et croustillant... laissez-nous vous présenter le fabuleux crumble aux poires gourmandes !Ce plat d\\\'origine britannique se compose d\'une pâte à crumble dont vous trouverez ici la recette. En dessert, le crumble se prépare avec des poires et du chocolat. Le terme crumble signifie littéralement \"tomber en miettes\" en anglais, en référence à son apparence sablée. Une information à partager avec ceux qui goûteront votre savoureux crumble !', NULL, 5, '2019-10-28'),
(12, 'DES2810_MOUSSEBLANC01', 'Mousse au chocolat blanc', 'Légère et aérienne, évadez-vous avec notre mousse au chocolat blanc émanant directement des Cieux...', NULL, 7, '2019-10-28');

-- --------------------------------------------------------

--
-- Structure de la table `sac_livreur`
--

DROP TABLE IF EXISTS `sac_livreur`;
CREATE TABLE IF NOT EXISTS `sac_livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `produit_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`produit_id`,`livreur_id`),
  KEY `fk_sac_livreur_produit1_idx` (`produit_id`),
  KEY `fk_sac_livreur_livreur1_idx` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sac_livreur`
--

INSERT INTO `sac_livreur` (`id`, `quantite`, `produit_id`, `livreur_id`) VALUES
(1, 5, 5, 2),
(2, 3, 11, 2),
(3, 3, 4, 1),
(4, 4, 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id`, `label`) VALUES
(1, 'validée'),
(2, 'en cours de livraison'),
(3, 'livrée');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

DROP TABLE IF EXISTS `statut_livreur`;
CREATE TABLE IF NOT EXISTS `statut_livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`id`, `label`) VALUES
(1, 'occupé'),
(2, 'libre');

-- --------------------------------------------------------

--
-- Structure de la table `type_utilisateur`
--

DROP TABLE IF EXISTS `type_utilisateur`;
CREATE TABLE IF NOT EXISTS `type_utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_utilisateur`
--

INSERT INTO `type_utilisateur` (`id`, `label`) VALUES
(1, 'administrateur'),
(2, 'livreur'),
(3, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) DEFAULT NULL,
  `prenom` varchar(70) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `type_utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`type_utilisateur_id`),
  KEY `fk_utilisateur_type_utilisateur_idx` (`type_utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `password`, `type_utilisateur_id`) VALUES
(1, 'Pomerlau', 'Roch', 'Roch.pom@gmail.com', 'Rochpompass1234*', 2),
(2, 'dardignan', 'sylvain', 'dardignan.sylvain@gmail.com', 'sylvain1934*', 3),
(3, 'Margand', 'Xavier', 'Margand.xavier@gmail.com', 'MargandExpressFood2019*', 1),
(4, 'Francis', 'Austin', 'franc.aust@gmail.com', 'frankey3000*', 3),
(5, 'Gringas', 'Roger', 'gringouz@hotmail.com', 'allerpariss2000', 3),
(6, 'Eustache', 'Baril', 'EustacheBaril@dayrep.com', 'iuP6aquah', 2),
(7, 'Hétu', 'Thierry', 'ThierryHetu@jourrapide.com', 'ThierryHetu15478944*..', 3),
(8, 'L\'Angelier', 'Victorine', 'VictorineLAngelier@rhyta.com', 'ooKoh9hae6o', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_adresse1` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_statut_commande1` FOREIGN KEY (`statut_commande_id`) REFERENCES `statut_commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `fk_commande_produit_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_produit_produit1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_statut_livreur1` FOREIGN KEY (`statut_livreur_id`) REFERENCES `statut_livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD CONSTRAINT `fk_sac_livreur_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sac_livreur_produit1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_type_utilisateur` FOREIGN KEY (`type_utilisateur_id`) REFERENCES `type_utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
