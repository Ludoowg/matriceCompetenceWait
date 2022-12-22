-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.36 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour matricecompetence
CREATE DATABASE IF NOT EXISTS `matricecompetence` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `matricecompetence`;

-- Listage de la structure de table matricecompetence. matcomp_employe
CREATE TABLE IF NOT EXISTS `matcomp_employe` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUID` int(11) DEFAULT NULL,
  `Nom` varchar(50) NOT NULL DEFAULT '',
  `Prenom` varchar(50) NOT NULL DEFAULT '',
  `Domaine` varchar(50) NOT NULL DEFAULT '',
  `Statut` varchar(50) NOT NULL DEFAULT '',
  `Intitule_de_poste` varchar(140) DEFAULT '',
  `Fiche_metier` varchar(140) DEFAULT NULL,
  `Manager` varchar(50) DEFAULT '',
  `Acces_EDH` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table matricecompetence.matcomp_employe : ~1 rows (environ)
INSERT INTO `matcomp_employe` (`ID`, `CUID`, `Nom`, `Prenom`, `Domaine`, `Statut`, `Intitule_de_poste`, `Fiche_metier`, `Manager`, `Acces_EDH`) VALUES
	(1, 875, 'Abir', 'Houssna', '', '', '', NULL, '', NULL);

-- Listage de la structure de table matricecompetence. matcomp_entite
CREATE TABLE IF NOT EXISTS `matcomp_entite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='\r\n';

-- Listage des données de la table matricecompetence.matcomp_entite : ~0 rows (environ)
INSERT INTO `matcomp_entite` (`ID`, `nom`) VALUES
	(1, 11);

-- Listage de la structure de table matricecompetence. matcomp_entite_employe
CREATE TABLE IF NOT EXISTS `matcomp_entite_employe` (
  `ID_entite` int(11) DEFAULT NULL,
  `ID_employe` int(11) DEFAULT NULL,
  KEY `FK_entite_employe_entite` (`ID_entite`),
  KEY `FK_entite_employe_employe` (`ID_employe`),
  CONSTRAINT `FK_entite_employe_employe` FOREIGN KEY (`ID_employe`) REFERENCES `matcomp_employe` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_entite_employe_entite` FOREIGN KEY (`ID_entite`) REFERENCES `matcomp_entite` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table matricecompetence.matcomp_entite_employe : ~0 rows (environ)
INSERT INTO `matcomp_entite_employe` (`ID_entite`, `ID_employe`) VALUES
	(1, 1);

-- Listage de la structure de table matricecompetence. matcomp_langages
CREATE TABLE IF NOT EXISTS `matcomp_langages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table matricecompetence.matcomp_langages : ~0 rows (environ)
INSERT INTO `matcomp_langages` (`ID`, `nom`) VALUES
	(1, 'Javascript');

-- Listage de la structure de table matricecompetence. matcomp_langage_employe
CREATE TABLE IF NOT EXISTS `matcomp_langage_employe` (
  `ID_langage` int(11) DEFAULT NULL,
  `ID_employe` int(11) DEFAULT NULL,
  KEY `FK_langage_employe_langages` (`ID_langage`),
  KEY `FK_langage_employe_employe` (`ID_employe`),
  CONSTRAINT `FK_langage_employe_employe` FOREIGN KEY (`ID_employe`) REFERENCES `matcomp_employe` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_langage_employe_langages` FOREIGN KEY (`ID_langage`) REFERENCES `matcomp_langages` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table matricecompetence.matcomp_langage_employe : ~0 rows (environ)

-- Listage de la structure de table matricecompetence. matcomp_outils_si
CREATE TABLE IF NOT EXISTS `matcomp_outils_si` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table matricecompetence.matcomp_outils_si : ~0 rows (environ)
INSERT INTO `matcomp_outils_si` (`ID`, `Nom`) VALUES
	(1, 'PowerBI');

-- Listage de la structure de table matricecompetence. matcomp_outils_si_employe
CREATE TABLE IF NOT EXISTS `matcomp_outils_si_employe` (
  `ID_outils_si` int(11) DEFAULT NULL,
  `ID_employe` int(11) DEFAULT NULL,
  KEY `FK_outils_si_employe_employe` (`ID_employe`),
  KEY `FK_outils_si_employe_outils_si` (`ID_outils_si`),
  CONSTRAINT `FK_outils_si_employe_employe` FOREIGN KEY (`ID_employe`) REFERENCES `matcomp_employe` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_outils_si_employe_outils_si` FOREIGN KEY (`ID_outils_si`) REFERENCES `matcomp_outils_si` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table matricecompetence.matcomp_outils_si_employe : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
