/* Populate database with sample data. */

INSERT INTO animals VALUES(1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals VALUES(2, 'Gabumon', '2018-11-18', 2, true, 8);
INSERT INTO animals VALUES(3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals VALUES(4, 'Devimon', '2017-05-12', 5, true, 11);
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
