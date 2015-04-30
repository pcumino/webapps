-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14-Abr-2015 às 16:16
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vehiclemanagerdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `car`
--

CREATE TABLE IF NOT EXISTS `car` (
`idcar` int(10) unsigned zerofill NOT NULL,
  `fabric` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `year` int(10) unsigned zerofill NOT NULL,
  `km` bigint(9) unsigned zerofill NOT NULL,
  `plate` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
`iddriver` int(10) unsigned zerofill NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(16) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `cnh` bigint(11) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `driver_has_car`
--

CREATE TABLE IF NOT EXISTS `driver_has_car` (
  `driver_iddriver` int(10) unsigned zerofill NOT NULL,
  `driver_cnh` bigint(11) unsigned zerofill NOT NULL,
  `car_idcar` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `petrolstation`
--

CREATE TABLE IF NOT EXISTS `petrolstation` (
`idpetrolstation` int(10) unsigned zerofill NOT NULL,
  `refuel_id` int(11) NOT NULL,
  `car_idcar` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `refuel`
--

CREATE TABLE IF NOT EXISTS `refuel` (
`idrefuel` int(10) unsigned zerofill NOT NULL,
  `amount` double unsigned zerofill NOT NULL,
  `date` datetime NOT NULL,
  `petrolstation_idpetrolstation` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `repairshop`
--

CREATE TABLE IF NOT EXISTS `repairshop` (
`idrepairshop` int(10) unsigned NOT NULL,
  `service_id` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `car_idcar` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `services`
--

CREATE TABLE IF NOT EXISTS `services` (
`idservices` int(10) unsigned zerofill NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(120) DEFAULT NULL,
  `repairshop_idrepairshop` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`idusers` int(10) unsigned zerofill NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(10) NOT NULL,
  `cpf` bigint(11) unsigned zerofill NOT NULL,
  `cnh` bigint(11) unsigned zerofill NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`idusers`, `email`, `name`, `cpf`, `cnh`) VALUES
(0000000001, 'pedrol04@hotmail.com', 'Pedro', 00000000001, 10000000001);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
 ADD PRIMARY KEY (`idcar`), ADD UNIQUE KEY `idcar_UNIQUE` (`idcar`), ADD UNIQUE KEY `plate_UNIQUE` (`plate`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
 ADD PRIMARY KEY (`iddriver`,`cnh`), ADD UNIQUE KEY `iddriver_UNIQUE` (`iddriver`), ADD UNIQUE KEY `cnh_UNIQUE` (`cnh`), ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `driver_has_car`
--
ALTER TABLE `driver_has_car`
 ADD PRIMARY KEY (`driver_iddriver`,`driver_cnh`,`car_idcar`), ADD KEY `fk_driver_has_car_car1_idx` (`car_idcar`), ADD KEY `fk_driver_has_car_driver1_idx` (`driver_iddriver`,`driver_cnh`);

--
-- Indexes for table `petrolstation`
--
ALTER TABLE `petrolstation`
 ADD PRIMARY KEY (`idpetrolstation`), ADD UNIQUE KEY `idpetrolstation_UNIQUE` (`idpetrolstation`), ADD KEY `fk_petrolstation_car1_idx` (`car_idcar`);

--
-- Indexes for table `refuel`
--
ALTER TABLE `refuel`
 ADD PRIMARY KEY (`idrefuel`), ADD UNIQUE KEY `idreful_UNIQUE` (`idrefuel`), ADD KEY `fk_reful_petrolstation1_idx` (`petrolstation_idpetrolstation`);

--
-- Indexes for table `repairshop`
--
ALTER TABLE `repairshop`
 ADD PRIMARY KEY (`idrepairshop`), ADD KEY `fk_repairshop_car_idx` (`car_idcar`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
 ADD PRIMARY KEY (`idservices`), ADD UNIQUE KEY `idservices_UNIQUE` (`idservices`), ADD KEY `fk_services_repairshop1_idx` (`repairshop_idrepairshop`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`idusers`), ADD UNIQUE KEY `idusers_UNIQUE` (`idusers`), ADD UNIQUE KEY `email_UNIQUE` (`email`), ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`), ADD UNIQUE KEY `cnh_UNIQUE` (`cnh`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
MODIFY `idcar` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
MODIFY `iddriver` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `petrolstation`
--
ALTER TABLE `petrolstation`
MODIFY `idpetrolstation` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `refuel`
--
ALTER TABLE `refuel`
MODIFY `idrefuel` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repairshop`
--
ALTER TABLE `repairshop`
MODIFY `idrepairshop` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
MODIFY `idservices` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `idusers` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `driver_has_car`
--
ALTER TABLE `driver_has_car`
ADD CONSTRAINT `fk_driver_has_car_car1` FOREIGN KEY (`car_idcar`) REFERENCES `car` (`idcar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_driver_has_car_driver1` FOREIGN KEY (`driver_iddriver`, `driver_cnh`) REFERENCES `driver` (`iddriver`, `cnh`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `petrolstation`
--
ALTER TABLE `petrolstation`
ADD CONSTRAINT `fk_petrolstation_car1` FOREIGN KEY (`car_idcar`) REFERENCES `car` (`idcar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `refuel`
--
ALTER TABLE `refuel`
ADD CONSTRAINT `fk_reful_petrolstation1` FOREIGN KEY (`petrolstation_idpetrolstation`) REFERENCES `petrolstation` (`idpetrolstation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `repairshop`
--
ALTER TABLE `repairshop`
ADD CONSTRAINT `fk_repairshop_car` FOREIGN KEY (`car_idcar`) REFERENCES `car` (`idcar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `services`
--
ALTER TABLE `services`
ADD CONSTRAINT `fk_services_repairshop1` FOREIGN KEY (`repairshop_idrepairshop`) REFERENCES `repairshop` (`idrepairshop`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
