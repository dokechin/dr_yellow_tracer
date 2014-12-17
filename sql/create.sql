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
 (1, '�����w', 0),
 (2, '�i��w', 6.8),
 (3, '�V���l�w', 25.5),
 (4, '���c���w', 76.7),
 (5, '�M�C�w', 95.4),
 (6, '�O���w', 111.3),
 (7, '�V�x�m�w', 135.0),
 (8, '�É��w', 167.4),
 (9, '�|��w', 211.3),
 (10, '�l���w', 238.9),
 (11, '�O�͈���w', 274.2),
 (12, '���É��w', 342),
 (13, '�򕌉H���w', 367.1),
 (14, '�Č��w', 408.2),
 (15, '���s�w', 476.3),
 (16, '�V���w', 515.4),
 (17, '�V�_�ˉw', 548.0),
 (18, '�����Ήw', 570.2),
 (19, '�P�H�w', 601.3),
 (20, '�����w', 621.3),
 (21, '���R�w', 676.3),
 (22, '�V�q�~�w', 702.1),
 (23, '���R�w', 733.1),
 (24, '�V�����w', 750.5),
 (25, '�O���w', 761.0),
 (26, '���L���w', 791.9),
 (27, '�L���w', 821.2),
 (28, '�V�⍑�w', 865.4),
 (29, '���R�w', 903.5),
 (30, '�V�R���w', 944.6),
 (31, '�����w', 968.7),
 (32, '�V���։w', 992.5),
 (33, '���q�w', 1013.2),
 (34, '�����w', 1069.1);
