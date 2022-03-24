/* Database schema to keep the structure of entire database. */

/* MILESTONE 1 */

CREATE TABLE animals (
	id SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(20),
	date_of_birth DATE,
	escape_attempts SMALLINT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

/* MILESTONE 2 */

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

/* MILESTONE 3 */

CREATE TABLE owners(
	id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(50),
	age SMALLINT
);

CREATE TABLE species(
	id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name varchar(50)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id SMALLINT,
ADD CONSTRAINT fk_animals_species FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id SMALLINT,
ADD CONSTRAINT fk_animals_owners FOREIGN KEY(owner_id) REFERENCES owners(id);


/* MILESTONE 4 */

CREATE TABLE vets(
	id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50),
	age SMALLINT,
	date_of_graduation DATE
);

CREATE TABLE specializations(
	species_id SMALLINT REFERENCES species(id) ON DELETE CASCADE,
	vet_id SMALLINT REFERENCES vet(id) ON DELETE CASCADE,
	PRIMARY KEY(species_id, vet_id)
);

CREATE TABLE visits(
  id SMALLINT GENERATED ALWAYS AS IDENTITY,
  vet_id SMALLINT REFERENCES vets(id) ON UPDATE CASCADE,
  animals_id SMALLINT REFERENCES animals(id) ON UPDATE CASCADE,
  visit_date DATE,
  PRIMARY KEY(id, vet_id, animals_id)
);
