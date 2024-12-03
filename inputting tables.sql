use cs_ajr70185;

CREATE TABLE IF NOT EXISTS `cs_ajr70185`.`Actor_Collaboration` (
  `idActor1` INT NOT NULL,
  `idActor2` INT NOT NULL,
  `movieCount` INT NULL,
  PRIMARY KEY (`idActor1`, `idActor2`),
  INDEX `fk_Actor_has_Actor_Actor2_idx` (`idActor2` ASC) VISIBLE,
  INDEX `fk_Actor_has_Actor_Actor1_idx` (`idActor1` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_has_Actor_Actor1`
    FOREIGN KEY (`idActor1`)
    REFERENCES `cs_ajr70185`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actor_has_Actor_Actor2`
    FOREIGN KEY (`idActor2`)
    REFERENCES `cs_ajr70185`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE Actor_Collaboration CHANGE movieName movieCount INT NOT NULL;
select * from Actor;

INSERT INTO Actor_Collaboration (idActor1, idActor2, movieCount)
VALUES
    (1, 2, 3), -- Leonardo DiCaprio and Robert De Niro
    (1, 3, 2), -- Leonardo DiCaprio and Brad Pitt
    (1, 4, 0), -- Leonardo DiCaprio and Scarlett Johansson
    (1, 5, 1), -- Leonardo DiCaprio and Tom Hanks
    (1, 6, 0), -- Leonardo DiCaprio and Natalie Portman
    (1, 7, 1), -- Leonardo DiCaprio and Johnny Depp
    (1, 8, 0), -- Leonardo DiCaprio and Morgan Freeman
    (1, 9, 0), -- Leonardo DiCaprio and Denzel Washington
    (1, 10, 0), -- Leonardo DiCaprio and Meryl Streep
    (2, 3, 0), -- Robert De Niro and Brad Pitt
    (2, 4, 0), -- Robert De Niro and Scarlett Johansson
    (2, 5, 0), -- Robert De Niro and Tom Hanks
    (2, 6, 0), -- Robert De Niro and Natalie Portman
    (2, 7, 0), -- Robert De Niro and Johnny Depp
    (2, 8, 0), -- Robert De Niro and Morgan Freeman
    (2, 9, 0), -- Robert De Niro and Denzel Washington
    (2, 10, 0), -- Robert De Niro and Meryl Streep
    (3, 4, 0), -- Brad Pitt and Scarlett Johansson
    (3, 5, 0), -- Brad Pitt and Tom Hanks
    (3, 6, 0), -- Brad Pitt and Natalie Portman
    (3, 7, 0), -- Brad Pitt and Johnny Depp
    (3, 8, 0), -- Brad Pitt and Morgan Freeman
    (3, 9, 0), -- Brad Pitt and Denzel Washington
    (3, 10, 0), -- Brad Pitt and Meryl Streep
    (4, 5, 0), -- Scarlett Johansson and Tom Hanks
    (4, 6, 0), -- Scarlett Johansson and Natalie Portman
    (4, 7, 0), -- Scarlett Johansson and Johnny Depp
    (4, 8, 0), -- Scarlett Johansson and Morgan Freeman
    (4, 9, 0), -- Scarlett Johansson and Denzel Washington
    (4, 10, 0), -- Scarlett Johansson and Meryl Streep
    (5, 6, 0), -- Tom Hanks and Natalie Portman
    (5, 7, 0), -- Tom Hanks and Johnny Depp
    (5, 8, 0), -- Tom Hanks and Morgan Freeman
    (5, 9, 0), -- Tom Hanks and Denzel Washington
    (5, 10, 0), -- Tom Hanks and Meryl Streep
    (6, 7, 0), -- Natalie Portman and Johnny Depp
    (6, 8, 0), -- Natalie Portman and Morgan Freeman
    (6, 9, 0), -- Natalie Portman and Denzel Washington
    (6, 10, 0), -- Natalie Portman and Meryl Streep
    (7, 8, 0), -- Johnny Depp and Morgan Freeman
    (7, 9, 0), -- Johnny Depp and Denzel Washington
    (7, 10, 0), -- Johnny Depp and Meryl Streep
    (8, 9, 0), -- Morgan Freeman and Denzel Washington
    (8, 10, 0), -- Morgan Freeman and Meryl Streep
    (9, 10, 0); -- Denzel Washington and Meryl Streep
