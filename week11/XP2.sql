
CREATE TABLE Customer (
  id INT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);


CREATE TABLE Customer_Profile (
  id INT PRIMARY KEY,
  isLoggedIn BOOLEAN DEFAULT false,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customer(id)
);


INSERT INTO Customer (id, first_name, last_name)
VALUES (1, 'John', 'Doe'), (2, 'Jerome', 'Lalu'), (3, 'Lea', 'Rive');


INSERT INTO Customer_Profile (id, isLoggedIn, customer_id)
VALUES (1, true, (SELECT id FROM Customer WHERE first_name = 'John')),
       (2, false, (SELECT id FROM Customer WHERE first_name = 'Jerome'));

SELECT c.first_name
FROM Customer c
JOIN Customer_Profile cp ON c.id = cp.customer_id
WHERE cp.isLoggedIn = true;

SELECT c.first_name, cp.isLoggedIn
FROM Customer c
LEFT JOIN Customer_Profile cp ON c.id = cp.customer_id;


SELECT COUNT(c.id) AS not_logged_in_count
FROM Customer c
LEFT JOIN Customer_Profile cp ON c.id = cp.customer_id
WHERE cp.isLoggedIn = false OR cp.isLoggedIn IS NULL;



--------->ParT2



CREATE TABLE Book (
  book_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL
);


INSERT INTO Book (title, author)
VALUES ('Alice In Wonderland', 'Lewis Carroll'),
       ('Harry Potter', 'J.K Rowling'),
       ('To kill a mockingbird', 'Harper Lee');


CREATE TABLE Student (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  age INT CHECK (age <= 15)
);

INSERT INTO Student (name, age)
VALUES ('John', 12),
       ('Lera', 11),
       ('Patrick', 10),
       ('Bob', 14);

CREATE TABLE Library (
  book_fk_id INT REFERENCES Book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
  student_fk_id INT REFERENCES Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
  borrowed_date DATE,
  PRIMARY KEY (book_fk_id, student_fk_id)
);

INSERT INTO Library (book_fk_id, student_fk_id, borrowed_date)
VALUES ((SELECT book_id FROM Book WHERE title = 'Alice In Wonderland'), (SELECT student_id FROM Student WHERE name = 'John'), '2022-02-15'),
       ((SELECT book_id FROM Book WHERE title = 'To kill a mockingbird'), (SELECT student_id FROM Student WHERE name = 'Bob'), '2021-03-03'),
       ((SELECT book_id FROM Book WHERE title = 'Alice In Wonderland'), (SELECT student_id FROM Student WHERE name = 'Lera'), '2021-05-23'),
       ((SELECT book_id FROM Book WHERE title = 'Harry Potter'), (SELECT student_id FROM Student WHERE name = 'Bob'), '2021-08-12');

Retrieve all columns from the junction table
SELECT *
FROM Library;

SELECT s.name, b.title
FROM Student s
JOIN Library l ON s.student_id = l.student_fk_id
JOIN Book b ON b.book_id = l.book_fk_id;


SELECT AVG(s.age) AS average_age
FROM Student s
JOIN Library l ON s.student_id = l.student_fk_id
JOIN Book b ON b.book_id = l.book_fk_id
WHERE b.title = 'Alice In Wonderland';

DELETE FROM Student WHERE name = 'John';

SELECT *
FROM Library;
----->Lorsqu'un étudiant est supprimé de la table des étudiants, les enregistrements correspondants dans la table de jonction (Bibliothèque) qui font référence à cet étudiant sont également automatiquement supprimés en raison de la ON DELETE CASCADEcontrainte.



