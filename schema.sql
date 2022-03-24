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
