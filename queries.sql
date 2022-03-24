/* Queries that provide answers to the questions from all projects. */

/* MILESTONE 1*/
SELECT *
FROM animals
WHERE name like '%mon';

SELECT *
FROM animals
WHERE date_of_birth >= '2016-01-01'
  AND date_of_birth <= '2019-31-12';

SELECT *
FROM animals
WHERE neutered = true
  AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name = 'Agumon'
  or name = 'Pikachu';

SELECT name,
  escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = true;

SELECT *
FROM animals
WHERE name != 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg >= 10.4
  AND weight_kg <= 17.3;

/* MILESTONE 2 */

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT *
FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT *
FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT animals_2022_deleted;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO animals_2022_deleted;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name)
from animals;

SELECT COUNT(escape_attempts)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT neutered,
  SUM(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT species,
  MAX(weight_kg),
  MIN(weight_kg)
FROM animals
GROUP BY species;

SELECT AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

/* MILESTONE 3 */

SELECT name,
  full_name
FROM owners
  INNER JOIN animals ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT species.name,
  animals.name
FROM species
  INNER JOIN animals ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT name,
  full_name
FROM owners
  LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT COUNT(animals.name)
FROM species
  INNER JOIN animals ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

SELECT COUNT(animals.name)
FROM species
  INNER JOIN animals ON species.id = animals.species_id
WHERE species.name = 'Digimon';

SELECT name
FROM animals
  INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell'
  AND animals.species_id = 2;

SELECT animals.name,
  full_name
FROM owners
  INNER JOIN animals ON owners.id = animals.owner_id
WHERE full_name = 'Dean Winchester'
  AND animals.escape_attempts = 0;

SELECT owners.full_name AS "Owner",
  COUNT(animals.id) AS "Total Animals"
FROM animals
  INNER JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(animals.id) DESC
LIMIT 1;

/* MILESTONE 4 */

SELECT animals.name AS "Animal",
  visits.visit_date AS "Visit Date"
FROM animals
  JOIN visits ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT animals) AS "Diff. Animals"
FROM animals
  JOIN visits ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name AS "Vet Name",
  STRING_AGG(species.name, ' , ') AS "Species Name"
FROM vets
  LEFT JOIN specializations ON vets.id = specializations.vet_id
  LEFT JOIN species ON species.id = specializations.species_id
GROUP BY vets.name;

SELECT animals.name AS "Animal Name"
FROM animals
  JOIN visits ON animals.id = visits.animal_id
  JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
  AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name AS "Animal Name",
  COUNT(animals) AS "Animals Count"
FROM animals
  INNER JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(animals) DESC
LIMIT 1;

SELECT animals.name AS "Animal Name",
  visits.visit_date AS "Visit Date"
FROM animals
  INNER JOIN visits ON animals.id = visits.animal_id
  INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date
LIMIT 1;

SELECT animals.name AS "Animal Name",
  visits.visit_date AS "Visit Date",
  vets.name AS "Vet Name"
FROM animals
  INNER JOIN visits ON animals.id = visits.animal_id
  INNER JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(visits) AS "Visits"
FROM vets
  LEFT JOIN visits ON visits.vet_id = vets.id
  LEFT JOIN specializations ON specializations.vet_id = vets.id
  LEFT JOIN species ON species.id = specializations.species_id
WHERE species IS NULL;

SELECT species.name AS "Species Name",
  COUNT(species.name) AS "Visits"
FROM vets
  INNER JOIN visits ON visits.vet_id = vets.id
  INNER JOIN animals ON animals.id = visits.animal_id
  INNER JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.name) DESC
LIMIT 1;
