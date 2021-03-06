DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;
DROP TABLE cinemas;

CREATE TABLE cinemas (
  id SERIAL4 PRIMARY KEY,
  cinema_chain VARCHAR(255),
  location VARCHAR(255),
  capacity INTEGER
);

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds NUMERIC (10,2)
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price NUMERIC (10,2)
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);