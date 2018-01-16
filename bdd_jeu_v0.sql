-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 16 Janvier 2018 à 13:34
-- Version du serveur :  5.7.20-0ubuntu0.17.10.1
-- Version de PHP :  7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdd_jeu_v0`
--
CREATE DATABASE IF NOT EXISTS `bdd_jeu_v0` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bdd_jeu_v0`;

-- --------------------------------------------------------

--
-- Structure de la table `artefact`
--

CREATE TABLE `artefact` (
  `id` int(11) NOT NULL,
  `idObjet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `artefact`
--

INSERT INTO `artefact` (`id`, `idObjet`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `aventurier`
--

CREATE TABLE `aventurier` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `jaugeVie` int(11) NOT NULL,
  `jaugeMagie` int(11) NOT NULL,
  `idJoueur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `aventurier`
--

INSERT INTO `aventurier` (`id`, `nom`, `jaugeVie`, `jaugeMagie`, `idJoueur`) VALUES
(1, 'Javelot', 90, 85, 1),
(2, 'Grim', 100, 70, 1),
(3, 'Archer', 50, 120, 1),
(4, 'Hell', 120, 120, 1),
(5, 'Mage1', 100, 85, 2),
(6, 'Mage2', 85, 90, 2),
(7, 'Mage3', 50, 120, 2),
(8, 'Mage4', 120, 120, 2);

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `id` int(11) NOT NULL,
  `idObjet` int(11) NOT NULL,
  `idSac` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dependre`
--

CREATE TABLE `dependre` (
  `id` int(11) NOT NULL,
  `idSort` int(11) NOT NULL,
  `idTypeTerrain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `dependre`
--

INSERT INTO `dependre` (`id`, `idSort`, `idTypeTerrain`) VALUES
(5, 5, 1),
(8, 6, 1),
(1, 1, 2),
(6, 5, 2),
(9, 6, 2),
(2, 1, 3),
(10, 6, 3),
(7, 5, 4),
(3, 1, 5),
(4, 2, 5),
(11, 6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `evoluer`
--

CREATE TABLE `evoluer` (
  `id` int(11) NOT NULL,
  `idAventurier` int(11) NOT NULL,
  `idTerrain` int(11) NOT NULL,
  `tempsJeu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `evoluer`
--

INSERT INTO `evoluer` (`id`, `idAventurier`, `idTerrain`, `tempsJeu`) VALUES
(9, 1, 1, '00:00:00'),
(10, 2, 1, '00:00:00'),
(11, 3, 1, '00:00:00'),
(12, 4, 1, '00:00:00'),
(13, 5, 5, '00:00:00'),
(14, 6, 5, '00:00:00'),
(15, 7, 5, '00:00:00'),
(16, 8, 5, '00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joueur`
--

INSERT INTO `joueur` (`id`, `nom`, `prenom`) VALUES
(1, 'Drappier', 'Théo'),
(2, 'Robot', 'Joueur1');

-- --------------------------------------------------------

--
-- Structure de la table `lancer`
--

CREATE TABLE `lancer` (
  `id` int(11) NOT NULL,
  `idAventurierLanceur` int(11) NOT NULL,
  `idAventurierCible` int(11) NOT NULL,
  `idSort` int(11) NOT NULL,
  `tempsJeu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `nourriture`
--

CREATE TABLE `nourriture` (
  `id` int(11) NOT NULL,
  `idObjet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `nourriture`
--

INSERT INTO `nourriture` (`id`, `idObjet`) VALUES
(1, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `objet`
--

CREATE TABLE `objet` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `masse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `objet`
--

INSERT INTO `objet` (`id`, `nom`, `masse`) VALUES
(1, 'Baguette de feu', 0),
(2, 'Baguette de glace', 0),
(3, 'Gigot', 0),
(4, 'Steak', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sac`
--

CREATE TABLE `sac` (
  `id` int(11) NOT NULL,
  `idTypeSac` int(11) NOT NULL DEFAULT '2',
  `idAventurier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sac`
--

INSERT INTO `sac` (`id`, `idTypeSac`, `idAventurier`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `sort`
--

CREATE TABLE `sort` (
  `id` int(11) NOT NULL,
  `idArtefact` int(11) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `degats` int(11) NOT NULL,
  `consoMagie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sort`
--

INSERT INTO `sort` (`id`, `idArtefact`, `nom`, `degats`, `consoMagie`) VALUES
(1, NULL, 'Tempête', 11, 10),
(2, NULL, 'Vague', 11, 10),
(5, 1, 'Flamme', 12, 4),
(6, 2, 'Gel', 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

CREATE TABLE `terrain` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `idTypeTerrain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `terrain`
--

INSERT INTO `terrain` (`id`, `nom`, `idTypeTerrain`) VALUES
(1, 'Terrain1', 1),
(2, 'Terrain2', 1),
(3, 'Terrarin3', 2),
(4, 'Terrain4', 2),
(5, 'Terrain5', 2),
(6, 'Terrain6', 3),
(7, 'Terrain7', 3),
(8, 'Terrain8', 4),
(9, 'Terrain9', 5),
(10, 'Terrain10', 5);

-- --------------------------------------------------------

--
-- Structure de la table `type_sac`
--

CREATE TABLE `type_sac` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `capacite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type_sac`
--

INSERT INTO `type_sac` (`id`, `nom`, `capacite`) VALUES
(1, 'Sacoche', 5),
(2, 'Petit sac', 10),
(3, 'Sac moyen', 15),
(4, 'Grand sac', 20),
(5, 'Sac géant', 30);

-- --------------------------------------------------------

--
-- Structure de la table `type_terrain`
--

CREATE TABLE `type_terrain` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `type_terrain`
--

INSERT INTO `type_terrain` (`id`, `nom`) VALUES
(1, 'Montagne'),
(2, 'Plaine'),
(3, 'Plage'),
(4, 'Volcan'),
(5, 'Mer');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `artefact`
--
ALTER TABLE `artefact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idObjet_2` (`idObjet`),
  ADD KEY `idObjet` (`idObjet`);

--
-- Index pour la table `aventurier`
--
ALTER TABLE `aventurier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idJoueur` (`idJoueur`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idObjet` (`idObjet`),
  ADD KEY `idSac` (`idSac`);

--
-- Index pour la table `dependre`
--
ALTER TABLE `dependre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idTypeTerrain_2` (`idTypeTerrain`,`idSort`),
  ADD KEY `idTypeTerrain` (`idTypeTerrain`),
  ADD KEY `idSort` (`idSort`);

--
-- Index pour la table `evoluer`
--
ALTER TABLE `evoluer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idAventurier_2` (`idAventurier`,`idTerrain`,`tempsJeu`),
  ADD KEY `idAventurier` (`idAventurier`),
  ADD KEY `tempsJeu` (`tempsJeu`),
  ADD KEY `idTerrain` (`idTerrain`) USING BTREE;

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lancer`
--
ALTER TABLE `lancer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idAventurierLanceur_2` (`idAventurierLanceur`,`idAventurierCible`,`idSort`,`tempsJeu`),
  ADD KEY `idAventurierLanceur` (`idAventurierLanceur`),
  ADD KEY `idAventurierCible` (`idAventurierCible`),
  ADD KEY `idSort` (`idSort`);

--
-- Index pour la table `nourriture`
--
ALTER TABLE `nourriture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idObjet_2` (`idObjet`),
  ADD KEY `idObjet` (`idObjet`);

--
-- Index pour la table `objet`
--
ALTER TABLE `objet`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sac`
--
ALTER TABLE `sac`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idAventurier` (`idAventurier`),
  ADD KEY `idTypeSac` (`idTypeSac`);

--
-- Index pour la table `sort`
--
ALTER TABLE `sort`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idArtefact` (`idArtefact`);

--
-- Index pour la table `terrain`
--
ALTER TABLE `terrain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTypeTerrain` (`idTypeTerrain`);

--
-- Index pour la table `type_sac`
--
ALTER TABLE `type_sac`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_terrain`
--
ALTER TABLE `type_terrain`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `artefact`
--
ALTER TABLE `artefact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `aventurier`
--
ALTER TABLE `aventurier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `contenir`
--
ALTER TABLE `contenir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `dependre`
--
ALTER TABLE `dependre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `evoluer`
--
ALTER TABLE `evoluer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `lancer`
--
ALTER TABLE `lancer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `nourriture`
--
ALTER TABLE `nourriture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `objet`
--
ALTER TABLE `objet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `sac`
--
ALTER TABLE `sac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `sort`
--
ALTER TABLE `sort`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `terrain`
--
ALTER TABLE `terrain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `type_sac`
--
ALTER TABLE `type_sac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `type_terrain`
--
ALTER TABLE `type_terrain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `artefact`
--
ALTER TABLE `artefact`
  ADD CONSTRAINT `artefact_ibfk_2` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`id`);

--
-- Contraintes pour la table `aventurier`
--
ALTER TABLE `aventurier`
  ADD CONSTRAINT `aventurier_ibfk_1` FOREIGN KEY (`idJoueur`) REFERENCES `joueur` (`id`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`idSac`) REFERENCES `sac` (`id`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`id`);

--
-- Contraintes pour la table `dependre`
--
ALTER TABLE `dependre`
  ADD CONSTRAINT `dependre_ibfk_1` FOREIGN KEY (`idTypeTerrain`) REFERENCES `type_terrain` (`id`),
  ADD CONSTRAINT `dependre_ibfk_2` FOREIGN KEY (`idSort`) REFERENCES `sort` (`id`);

--
-- Contraintes pour la table `evoluer`
--
ALTER TABLE `evoluer`
  ADD CONSTRAINT `evoluer_ibfk_1` FOREIGN KEY (`idAventurier`) REFERENCES `aventurier` (`id`),
  ADD CONSTRAINT `evoluer_ibfk_2` FOREIGN KEY (`idTerrain`) REFERENCES `terrain` (`id`);

--
-- Contraintes pour la table `lancer`
--
ALTER TABLE `lancer`
  ADD CONSTRAINT `lancer_ibfk_1` FOREIGN KEY (`idAventurierLanceur`) REFERENCES `aventurier` (`id`),
  ADD CONSTRAINT `lancer_ibfk_2` FOREIGN KEY (`idAventurierCible`) REFERENCES `aventurier` (`id`),
  ADD CONSTRAINT `lancer_ibfk_3` FOREIGN KEY (`idSort`) REFERENCES `sort` (`id`);

--
-- Contraintes pour la table `nourriture`
--
ALTER TABLE `nourriture`
  ADD CONSTRAINT `nourriture_ibfk_1` FOREIGN KEY (`idObjet`) REFERENCES `objet` (`id`);

--
-- Contraintes pour la table `sac`
--
ALTER TABLE `sac`
  ADD CONSTRAINT `sac_ibfk_1` FOREIGN KEY (`idAventurier`) REFERENCES `aventurier` (`id`),
  ADD CONSTRAINT `sac_ibfk_2` FOREIGN KEY (`idTypeSac`) REFERENCES `type_sac` (`id`);

--
-- Contraintes pour la table `sort`
--
ALTER TABLE `sort`
  ADD CONSTRAINT `sort_ibfk_1` FOREIGN KEY (`idArtefact`) REFERENCES `artefact` (`id`);

--
-- Contraintes pour la table `terrain`
--
ALTER TABLE `terrain`
  ADD CONSTRAINT `terrain_ibfk_1` FOREIGN KEY (`idTypeTerrain`) REFERENCES `type_terrain` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
