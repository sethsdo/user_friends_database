-- MySQL Workbench Synchronization
-- Generated: 2017-09-13 17:24
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Seth Olmstead

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`friendships` (
  `id` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  `friend_id` INT(11) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_frendships_users_idx` (`users_id` ASC),
  INDEX `fk_frendships_users1_idx` (`friend_id` ASC),
  CONSTRAINT `fk_frendships_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frendships_users1`
    FOREIGN KEY (`friend_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



#Queries
-- SELECT * FROM users

-- LEFT JOIN friendships ON users.id = friendships.users_id 
-- LEFT JOIN users as user2 ON user2.id=friendships.friend_id;

-- SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name
-- FROM users
-- LEFT JOIN friendships ON users.id = friendships.users_id 
-- LEFT JOIN users as user2 ON user2.id=friendships.friend_id