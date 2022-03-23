/* Queries that provide answers to the questions from all projects. */

/* MILESTONE 1: create animals table*/

SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-31-12';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* MILESTONE 2: query and update animals table */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animals_2022_deleted;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO animals_2022_deleted;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) from animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

/* MILESTONE 3: query multiple tables */

SELECT name, full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';
SELECT species.name, animals.name FROM species INNER JOIN animals ON species.id = animals.species_id WHERE species.name = 'Pokemon';
SELECT name, full_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT COUNT(animals.name) FROM species INNER JOIN animals ON species.id = animals.species_id WHERE species.name = 'Pokemon';
SELECT COUNT(animals.name) FROM species INNER JOIN animals ON species.id = animals.species_id WHERE species.name = 'Digimon';
SELECT name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Jennifer Orwell' AND animals.species_id = 2;
SELECT animals.name, full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name AS "Owner",
COUNT(animals.id) AS "Total Animals"
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(animals.id) DESC LIMIT 1;
