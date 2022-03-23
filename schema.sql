/* Database schema to keep the structure of entire database. */

/* MILESTONE 1: create animals table */

 CREATE TABLE animals (
	id INT PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts VARCHAR ( 255 ) NOT NULL,
  neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL NOT NULL,
  species VARCHAR (50) NOT NULL
);

/* MILESTONE 3: query multiple tables */

CREATE TABLE owners(
id  INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100) NOT NULL,
age SMALLINT NOT NULL
);

CREATE TABLE species(
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,,
name varchar(50) NOT NULL
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD id SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);

