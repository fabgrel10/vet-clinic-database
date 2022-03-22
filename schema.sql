/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (
	id INT PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts VARCHAR ( 255 ) NOT NULL,
  neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL NOT NULL,
  species VARCHAR (50) NOT NULL
);
