CREATE TABLE items (
  id INT ,
  name VARCHAR(100),
  price INT
);
CREATE TABLE customers (
  id INT ,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);
INSERT INTO items (id, name, price)
VALUES
  (1, 'Small Desk', 100),
  (2, 'Large Desk', 300),
  (3, 'Fan', 80);
  INSERT INTO customers (id, first_name, last_name)
VALUES
  (1, 'Greg', 'Jones'),
  (2, 'Sandra', 'Jones'),
  (3, 'Scott', 'Scott'),
  (4, 'Trevor', 'Green'),
  (5, 'Melanie', 'Johnson');
  SELECT * FROM items;
  SELECT * FROM items WHERE price > 80;
  SELECT * FROM items WHERE price <= 300;
  SELECT * FROM customers WHERE last_name = 'Smith';
  SELECT * FROM customers WHERE last_name = 'Jones';
  SELECT * FROM customers WHERE first_name <> 'Scott';
  
  
  
  ->dailyChallenge
  
  CREATE TABLE actors (
  id INT ,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT
);
INSERT INTO actors (id, first_name, last_name, age)
VALUES (1, 'Tom', 'Hanks', 65),
       (2, 'Meryl', 'Streep', 72),
	   (3, 'Leonardo', 'DiCaprio', 46)
SELECT COUNT(*) FROM actors;
INSERT INTO actors (id, name, age) VALUES (4, '', NULL);
->receive an error message indicating the constraint violation.
