-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema VintDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema VintDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VintDB` DEFAULT CHARACTER SET utf8 ;
USE `VintDB` ;

-- -----------------------------------------------------
-- Table `VintDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VintDB`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FIrst` VARCHAR(45) NOT NULL,
  `Last` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `DateOfOrder` DATETIME NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VintDB`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VintDB`.`Stock` (
  `StockID` INT NOT NULL,
  `Item` VARCHAR(45) NOT NULL,
  `ItemType` VARCHAR(45) NOT NULL,
  `Quantity` INT NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`StockID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VintDB`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VintDB`.`Sales` (
  `SalesId` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `StockID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`SalesId`, `CustomerID`, `StockID`),
  INDEX `fk_Sales_Customer_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Sales_Stock1_idx` (`StockID` ASC) VISIBLE,
  CONSTRAINT `fk_Sales_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `VintDB`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Stock1`
    FOREIGN KEY (`StockID`)
    REFERENCES `VintDB`.`Stock` (`StockID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
