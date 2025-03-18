DROP TABLE IF EXISTS store, employee, store_employee;

CREATE TABLE IF NOT EXISTS store (
  id SERIAL,
  name VARCHAR(255) NOT NULL
);



CREATE TABLE IF NOT EXISTS employee(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  position VARCHAR NOT NULL,
  salary DECIMAL(10,2) NOT NULL
);
\COPY employee FROM './data/employee.csv' WITH CSV HEADER;
SELECT setval('employee_id_seq', (SELECT(MAX(id)) FROM employee));

CREATE TABLE IF NOT EXISTS action_figure (
  id SERIAL PRIMARY KEY,
  action_figure_title VARCHAR(255),
  quantity INTEGER,
  price DECIMAL(100, 2)
);

\COPY action_figure FROM './data/action_figure.csv' WITH CSV HEADER;
SELECT setval('action_figure_id_seq', (SELECT(MAX(id)) FROM action_figure));

CREATE TABLE IF NOT EXISTS poster (
  id SERIAL PRIMARY KEY,
  poster_title VARCHAR(255),
  quantity INTEGER,
  price DECIMAL(100, 2)
);

\COPY poster FROM './data/poster.csv' WITH CSV HEADER;
SELECT setval('poster_id_seq', (SELECT(MAX(id)) FROM poster));

CREATE TABLE IF NOT EXISTS game (
  id SERIAL PRIMARY KEY,
  game_title VARCHAR(255),
  quantity INTEGER,
  price DECIMAL(100, 2)
);

\COPY game FROM './data/game.csv' WITH CSV HEADER;
SELECT setval('game_id_seq', (SELECT(MAX(id)) FROM game));




CREATE TABLE IF NOT EXISTS store_employee (
  id SERIAL PRIMARY KEY,
  store_id INTEGER REFERENCES store(id),
  employee_id INTEGER REFERENCES employee(id)
);

INSERT INTO store(name) VALUES('walmart');




SELECT * FROM store;
SELECT * FROM employee;
SELECT * FROM action_figure;
SELECT * FROM poster;
SELECT * FROM game;