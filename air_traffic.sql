-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT NOT NULL REFERENCES countries(id)
);


CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline_id INT NOT NULL REFERENCES airlines(id),
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  from_city_id INT NOT NULL REFERENCES cities(id),
  to_city_id INT NOT NULL REFERENCES cities(id),
  seat TEXT NOT NULL
);

INSERT INTO airlines (name) VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries (name) VALUES
  ('United States'),
  ('Japan'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('Brazil'),
  ('Chile'),
  ('United Kingdom');

INSERT INTO cities (name, country_id) VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Los Angeles', 1),
  ('Mexico City', 3),
  ('Paris', 4),
  ('Casablanca', 5),
  ('Dubai', 6),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('Sao Paolo', 7),
  ('Santiago', 8);

INSERT INTO flights (airline_id, departure_time, arrival_time, from_city_id, to_city_id, seat) VALUES
  (1, '2018-04-08T09:00:00Z', '2018-04-08T12:00:00Z', 1, 2, '33B'),
  (2, '2018-12-19T12:45:00Z', '2018-12-19T16:15:00Z', 8, 5, '8A'),
  (3, '2018-01-02T07:00:00Z', '2018-01-02T08:03:00Z', 3, 8, '12F'),
  (3, '2018-04-15T16:50:00Z', '2018-04-15T21:00:00Z', 2, 1,'20A'),
  (4, '2018-08-01T18:30:00Z', '2018-08-01T21:50:00Z', 6, 7, '23D'),
  (5, '2018-10-31T01:15:00Z', '2018-10-31T12:55:00Z', 4, 1, '18C'),
  (1, '2019-02-06T06:00:00Z', '2019-02-06T07:47:00Z', 5, 2, '9E'),
  (2, '2018-12-22T14:42:00Z', '2018-12-22T15:56:00Z', 3, 4, '1A'),
  (2, '2019-02-06T16:28:00Z', '2019-02-06T19:18:00Z', 2, 5, '32B'),
  (6, '2019-01-20T19:30:00Z', '2019-01-20T22:45:00Z', 6, 7, '10D');

