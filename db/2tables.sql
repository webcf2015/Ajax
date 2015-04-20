SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pajax1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pajax1` ;
CREATE SCHEMA IF NOT EXISTS `pajax1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `pajax1` ;

-- -----------------------------------------------------
-- Table `pajax1`.`lesutilisateurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pajax1`.`lesutilisateurs` ;

CREATE TABLE IF NOT EXISTS `pajax1`.`lesutilisateurs` (
  `idutilisateur` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lelogin` VARCHAR(45) NULL,
  `lenom` VARCHAR(255) NULL,
  `lemail` VARCHAR(120) NULL,
  `lemdp` CHAR(32) NULL,
  `laperm` SMALLINT NULL,
  PRIMARY KEY (`idutilisateur`),
  UNIQUE INDEX `login_UNIQUE` (`lelogin` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pajax1`.`lesmessages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pajax1`.`lesmessages` ;

CREATE TABLE IF NOT EXISTS `pajax1`.`lesmessages` (
  `idlesmessages` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lemessage` TEXT NULL,
  `letemps` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `lesutilisateurs_idutilisateur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idlesmessages`),
  INDEX `fk_lesmessages_lesutilisateurs_idx` (`lesutilisateurs_idutilisateur` ASC),
  CONSTRAINT `fk_lesmessages_lesutilisateurs`
    FOREIGN KEY (`lesutilisateurs_idutilisateur`)
    REFERENCES `pajax1`.`lesutilisateurs` (`idutilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
