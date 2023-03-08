-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  parent_body TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  star_id INTEGER REFERENCES stars(id) ON DELETE CASCADE
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets(id) ON DELETE CASCADE
);

INSERT INTO stars (name, galaxy) VALUES ('The Sun', 'Milky Way');

INSERT INTO planets (name, orbital_period_in_years, parent_body, galaxy, star_id) 
VALUES ('Earth', 1.00, 'The Sun', 'Milky Way', 1),
       ('Mars', 1.88, 'The Sun', 'Milky Way', 1),
       ('Venus', 0.62, 'The Sun', 'Milky Way', 1),
       ('Neptune', 164.8, 'The Sun', 'Milky Way', 1),
       ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', NULL),
       ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', NULL);

INSERT INTO moons (name, planet_id)
VALUES ('The Moon', 1),
       ('Phobos', 2),
       ('Deimos', 2),
       ('Naiad', 4),
       ('Thalassa', 4),
       ('Despina', 4),
       ('Galatea', 4),
       ('Larissa', 4),
       ('S/2004 N 1', 4),
       ('Proteus', 4),
       ('Triton', 4),
       ('Nereid', 4),
       ('Halimede', 4),
       ('Sao', 4),
       ('Laomedeia', 4),
       ('Psamathe', 4),
       ('Neso', 4)





