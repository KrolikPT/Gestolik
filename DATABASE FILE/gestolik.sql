-- --------------------------------------------------------
-- Anfitrião:                    localhost
-- Versão do servidor:           5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for gestolik
CREATE DATABASE IF NOT EXISTS `gestolik` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gestolik`;

-- Dumping structure for table gestolik.balanco
CREATE TABLE IF NOT EXISTS `balanco` (
  `id_balanco` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `data` varchar(50) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `tipo` varchar(50) NOT NULL DEFAULT 'Débito',
  `valor` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_balanco`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.despesas
CREATE TABLE IF NOT EXISTS `despesas` (
  `id_despesa` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_despesa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.fecho_de_contas
CREATE TABLE IF NOT EXISTS `fecho_de_contas` (
  `id_fecho` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `data_abertura` varchar(50) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `data_fecho` varchar(50) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `valor_despesa` double DEFAULT '0',
  `valor_receita` double DEFAULT '0',
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_fecho`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.gestor
CREATE TABLE IF NOT EXISTS `gestor` (
  `id_gestor` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `data_abertura` varchar(50) DEFAULT NULL,
  `conta_aberta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_gestor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.receitas
CREATE TABLE IF NOT EXISTS `receitas` (
  `id_receita` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_receita`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.saldo
CREATE TABLE IF NOT EXISTS `saldo` (
  `id_saldo` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `saldo` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_saldo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.totalizadores
CREATE TABLE IF NOT EXISTS `totalizadores` (
  `id_totalizador` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilizador` int(11) NOT NULL,
  `id_despesa` int(11) DEFAULT NULL,
  `id_receita` int(11) DEFAULT NULL,
  `data_abertura` varchar(50) DEFAULT NULL,
  `data` varchar(200) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `valor` double NOT NULL DEFAULT '0',
  `tipo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_totalizador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table gestolik.utilizadores
CREATE TABLE IF NOT EXISTS `utilizadores` (
  `id_utilizador` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(200) NOT NULL,
  PRIMARY KEY (`id_utilizador`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
