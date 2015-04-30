-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema vehicleManagerDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vehicleManagerDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vehicleManagerDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema vehiclecontrol
-- -----------------------------------------------------
USE `vehicleManagerDB` ;

-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`car` (
  `idcar` INT ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `fabric` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` INT UNSIGNED ZEROFILL NOT NULL,
  `km` BIGINT(9) UNSIGNED ZEROFILL NOT NULL,
  `plate` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`idcar`),
  UNIQUE INDEX `idcar_UNIQUE` (`idcar` ASC),
  UNIQUE INDEX `plate_UNIQUE` (`plate` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`repairshop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`repairshop` (
  `idrepairshop` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_id` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `car_idcar` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`idrepairshop`),
  INDEX `fk_repairshop_car_idx` (`car_idcar` ASC),
  CONSTRAINT `fk_repairshop_car`
    FOREIGN KEY (`car_idcar`)
    REFERENCES `vehicleManagerDB`.`car` (`idcar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`services` (
  `idservices` INT ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(120) NULL,
  `repairshop_idrepairshop` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idservices`),
  UNIQUE INDEX `idservices_UNIQUE` (`idservices` ASC),
  INDEX `fk_services_repairshop1_idx` (`repairshop_idrepairshop` ASC),
  CONSTRAINT `fk_services_repairshop1`
    FOREIGN KEY (`repairshop_idrepairshop`)
    REFERENCES `vehicleManagerDB`.`repairshop` (`idrepairshop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`petrolstation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`petrolstation` (
  `idpetrolstation` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `refuel_id` INT NOT NULL,
  `car_idcar` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`idpetrolstation`),
  UNIQUE INDEX `idpetrolstation_UNIQUE` (`idpetrolstation` ASC),
  INDEX `fk_petrolstation_car1_idx` (`car_idcar` ASC),
  CONSTRAINT `fk_petrolstation_car1`
    FOREIGN KEY (`car_idcar`)
    REFERENCES `vehicleManagerDB`.`car` (`idcar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`refuel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`refuel` (
  `idrefuel` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `amount` DOUBLE UNSIGNED ZEROFILL NOT NULL,
  `date` DATETIME NOT NULL,
  `petrolstation_idpetrolstation` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`idrefuel`),
  UNIQUE INDEX `idreful_UNIQUE` (`idrefuel` ASC),
  INDEX `fk_reful_petrolstation1_idx` (`petrolstation_idpetrolstation` ASC),
  CONSTRAINT `fk_reful_petrolstation1`
    FOREIGN KEY (`petrolstation_idpetrolstation`)
    REFERENCES `vehicleManagerDB`.`petrolstation` (`idpetrolstation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`driver` (
  `iddriver` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `firstname` VARCHAR(10) NOT NULL,
  `lastname` VARCHAR(10) NOT NULL,
  `cnh` BIGINT(11) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`iddriver`, `cnh`),
  UNIQUE INDEX `iddriver_UNIQUE` (`iddriver` ASC),
  UNIQUE INDEX `cnh_UNIQUE` (`cnh` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`driver_has_car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`driver_has_car` (
  `driver_iddriver` INT UNSIGNED ZEROFILL NOT NULL,
  `driver_cnh` BIGINT(11) UNSIGNED ZEROFILL NOT NULL,
  `car_idcar` INT ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`driver_iddriver`, `driver_cnh`, `car_idcar`),
  INDEX `fk_driver_has_car_car1_idx` (`car_idcar` ASC),
  INDEX `fk_driver_has_car_driver1_idx` (`driver_iddriver` ASC, `driver_cnh` ASC),
  CONSTRAINT `fk_driver_has_car_driver1`
    FOREIGN KEY (`driver_iddriver` , `driver_cnh`)
    REFERENCES `vehicleManagerDB`.`driver` (`iddriver` , `cnh`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_driver_has_car_car1`
    FOREIGN KEY (`car_idcar`)
    REFERENCES `vehicleManagerDB`.`car` (`idcar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicleManagerDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehicleManagerDB`.`users` (
  `idusers` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `cpf` BIGINT(11) UNSIGNED ZEROFILL NOT NULL,
  `cnh` BIGINT(11) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  UNIQUE INDEX `cnh_UNIQUE` (`cnh` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
