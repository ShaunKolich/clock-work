-- MySQL Script generated by MySQL Workbench
-- Sun Nov 17 16:01:39 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TimesheetPortal
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TimesheetPortal` ;

-- -----------------------------------------------------
-- Schema TimesheetPortal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TimesheetPortal` DEFAULT CHARACTER SET utf8mb4 ;
USE `TimesheetPortal` ;

-- -----------------------------------------------------
-- Table `TimesheetPortal`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TimesheetPortal`.`roles` ;

CREATE TABLE IF NOT EXISTS `TimesheetPortal`.`roles` (
  `roleId` INT(11) NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(45) NOT NULL DEFAULT 'Associate',
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `TimesheetPortal`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TimesheetPortal`.`status` ;

CREATE TABLE IF NOT EXISTS `TimesheetPortal`.`status` (
  `statusId` INT(11) NOT NULL AUTO_INCREMENT,
  `statusName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`statusId`),
  UNIQUE INDEX `statusId_UNIQUE` (`statusId` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `TimesheetPortal`.`timeSheet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TimesheetPortal`.`timeSheet` ;

CREATE TABLE IF NOT EXISTS `TimesheetPortal`.`timeSheet` (
  `timeSheetId` INT(11) NOT NULL AUTO_INCREMENT,
  `userId` INT(11) NOT NULL,
  `statusId` INT(11) NOT NULL DEFAULT '1',
  `mon_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `tue_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `wed_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `thu_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `fri_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `enddate` DATETIME NOT NULL,
  PRIMARY KEY (`timeSheetId`),
  UNIQUE INDEX `idtimeSheet_UNIQUE` (`timeSheetId` ASC),
  INDEX `userId_idx` (`userId` ASC),
  INDEX `statusId_idx` (`statusId` ASC),
  CONSTRAINT `statusId`
    FOREIGN KEY (`statusId`)
    REFERENCES `TimesheetPortal`.`status` (`statusId`),
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `TimesheetPortal`.`users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `TimesheetPortal`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TimesheetPortal`.`users` ;

CREATE TABLE IF NOT EXISTS `TimesheetPortal`.`users` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
-- MySQL Script generated by MySQL Workbench
-- Sun Nov 17 16:01:39 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Clockwork
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Clockwork` ;

-- -----------------------------------------------------
-- Schema Clockwork
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Clockwork` DEFAULT CHARACTER SET utf8mb4 ;
USE `Clockwork` ;

-- -----------------------------------------------------
-- Table `Clockwork`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clockwork`.`roles` ;

CREATE TABLE IF NOT EXISTS `Clockwork`.`roles` (
  `roleId` INT(11) NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(45) NOT NULL DEFAULT 'Associate',
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Clockwork`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clockwork`.`status` ;

CREATE TABLE IF NOT EXISTS `Clockwork`.`status` (
  `statusId` INT(11) NOT NULL AUTO_INCREMENT,
  `statusName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`statusId`),
  UNIQUE INDEX `statusId_UNIQUE` (`statusId` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Clockwork`.`timeSheet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clockwork`.`timeSheet` ;

CREATE TABLE IF NOT EXISTS `Clockwork`.`timeSheet` (
  `timeSheetId` INT(11) NOT NULL AUTO_INCREMENT,
  `userId` INT(11) NOT NULL,
  `statusId` INT(11) NOT NULL DEFAULT '1',
  `mon_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `tue_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `wed_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `thu_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `fri_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `sat_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `sun_hours` FLOAT UNSIGNED NULL DEFAULT '0',
  `week_end_date` DATETIME NOT NULL,
  PRIMARY KEY (`timeSheetId`),
  UNIQUE INDEX `idtimeSheet_UNIQUE` (`timeSheetId` ASC),
  INDEX `userId_idx` (`userId` ASC),
  INDEX `statusId_idx` (`statusId` ASC),
  CONSTRAINT `statusId`
    FOREIGN KEY (`statusId`)
    REFERENCES `Clockwork`.`status` (`statusId`),
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `Clockwork`.`users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Clockwork`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clockwork`.`users` ;

CREATE TABLE IF NOT EXISTS `Clockwork`.`users` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `jobTitle` VARCHAR(45) NULL DEFAULT NULL,
  `roleId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `idusers_UNIQUE` (`userId` ASC),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC),
  INDEX `roleId_idx` (`roleId` ASC),
  CONSTRAINT `roleId`
    FOREIGN KEY (`roleId`)
    REFERENCES `Clockwork`.`roles` (`roleId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4;

insert into users (userId, firstName, lastName, userName, password, jobTitle, roleId)
values (1, 'Shaun','Kolich', 'skolich', 'test', 'employee', 1),
	(2, 'Dan', 'Smith' , 'dsmith', 'test', 'employee', 2),
    (3, 'Sarah','Johnson', 'sjohnson', 'test', 'employee', 3),
    (4, 'john', 'doe', 'jdoe', 'test', 'employee', 1);
    
insert into timeSheet (timesheetId, userId, statusId, week_end_date)
values (3, 1, 1, "2019-11-17");
insert into timeSheet (timesheetId, userId, statusId, week_end_date)
values (2, 1, 2, "2019-11-10");
insert into timeSheet (timesheetId, userId, statusId, week_end_date)
values (1, 1, 2, "2019-11-03");
insert into timeSheet (timesheetId, userId, statusId, week_end_date)
values (4, 2, 2, "2019-11-03");

commit;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;