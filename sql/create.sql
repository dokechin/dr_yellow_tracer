SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

grant all privileges on dyt.* to dyt@localhost identified by 'hoge';

CREATE SCHEMA IF NOT EXISTS `dyt`;
USE `dyt` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tweet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dyt`.`Look` (
      id bigint not null auto_increment,
      station_id bigint,
      looked_at  datetime,
      primary key (id),
      index(looked_at)
      );
 
 -- -----------------------------------------------------
-- Table `jognavi`.`User`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dyt`.`Station` 
(
      id bigint,
      name varchar (128),
      km decimal(5,1),
      primary key (id)
);

insert into dyt.Station (id,name,km) values 
 (1, '“Œ‹ž‰w', 0),
 (2, '•iì‰w', 6.8),
 (3, 'V‰¡•l‰w', 25.5),
 (4, '¬“cŒ´‰w', 76.7),
 (5, '”MŠC‰w', 95.4),
 (6, 'ŽO“‡‰w', 111.3),
 (7, 'V•xŽm‰w', 135.0),
 (8, 'Ã‰ª‰w', 167.4),
 (9, 'Š|ì‰w', 211.3),
 (10, '•l¼‰w', 238.9),
 (11, 'ŽO‰ÍˆÀé‰w', 274.2),
 (12, '–¼ŒÃ‰®‰w', 342),
 (13, 'Šò•Œ‰H“‡‰w', 367.1),
 (14, '•ÄŒ´‰w', 408.2),
 (15, '‹ž“s‰w', 476.3),
 (16, 'V‘åã‰w', 515.4),
 (17, 'V_ŒË‰w', 548.0),
 (18, '¼–¾Î‰w', 570.2),
 (19, '•P˜H‰w', 601.3),
 (20, '‘Š¶‰w', 621.3),
 (21, '‰ªŽR‰w', 676.3),
 (22, 'V‘q•~‰w', 702.1),
 (23, '•ŸŽR‰w', 733.1),
 (24, 'V”ö“¹‰w', 750.5),
 (25, 'ŽOŒ´‰w', 761.0),
 (26, '“ŒL“‡‰w', 791.9),
 (27, 'L“‡‰w', 821.2),
 (28, 'VŠâ‘‰w', 865.4),
 (29, '“¿ŽR‰w', 903.5),
 (30, 'VŽRŒû‰w', 944.6),
 (31, 'Œú‹·‰w', 968.7),
 (32, 'V‰ºŠÖ‰w', 992.5),
 (33, '¬‘q‰w', 1013.2),
 (34, '”Ž‘½‰w', 1069.1);
