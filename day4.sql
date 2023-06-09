SELECT * FROM items ORDER BY price ASC;
SELECT * FROM items WHERE price >= 80 ORDER BY price DESC;
SELECT first_name, last_name FROM customers ORDER BY first_name ASC LIMIT 3;
SELECT last_name FROM customers ORDER BY last_name DESC;


----------------->exercice2
SELECT * FROM customer;
SELECT first_name || ' ' || last_name AS full_name FROM customer;
SELECT DISTINCT create_date FROM customer;
SELECT * FROM customer ORDER BY first_name DESC;
SELECT film_id, title, description, release_year, rental_rate 
FROM film 
ORDER BY rental_rate ASC;
SELECT a.address, a.phone 
FROM address AS a 
JOIN city AS c ON a.city_id = c.city_id 
JOIN country AS co ON c.country_id = co.country_id 
WHERE co.country = 'United States' AND c.district = 'Texas';
SELECT * FROM film WHERE film_id IN (15, 150);
SELECT film_id, title, description, length, rental_rate 
FROM film 
WHERE title = 'YourFavoriteMovie';
SELECT film_id, title, description, length, rental_rate 
FROM film 
WHERE title LIKE 'XY%';
SELECT film_id, title, rental_rate 
FROM film 
ORDER BY rental_rate 
LIMIT 10;
SELECT film_id, title, rental_rate 
FROM film 
WHERE film_id NOT IN (
    SELECT film_id 
    FROM film 
    ORDER BY rental_rate 
    LIMIT 10
) 
ORDER BY rental_rate 
LIMIT 10;
SELECT c.first_name, c.last_name, p.amount, p.payment_date 
FROM customer AS c 
JOIN payment AS p ON c.customer_id = p.customer_id 
ORDER BY c.customer_id;
SELECT f.film_id, f.title 
FROM film AS f 
LEFT JOIN inventory AS i ON f.film_id = i.film_id 
WHERE i.film_id IS NULL;
SELECT ci.city, co.country 
FROM city AS ci 
JOIN country AS co ON ci.country_id = co.country_id;
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date 
FROM customer AS c 
JOIN payment AS p ON c.customer_id = p.customer_id 
ORDER BY p.staff_id;


----------------->daily
SELECT COUNT(*) 
FROM FirstTab AS ft 
WHERE ft.id NOT IN (SELECT id FROM SecondTab WHERE id IS NULL)
Sortie : 2
->La requête compte le nombre de lignes dans la table FirstTab où la colonne id n'existe pas dans la table SecondTab lorsque l'id est NULL.
SELECT COUNT(*) 
FROM FirstTab AS ft 
WHERE ft.id NOT IN (SELECT id FROM SecondTab WHERE id = 5)
Sortie : 2
->La requête compte le nombre de lignes dans la table FirstTab où la colonne id ne correspond pas à la valeur 5 dans la table SecondTab.
SELECT COUNT(*) 
FROM FirstTab AS ft 
WHERE ft.id NOT IN (SELECT id FROM SecondTab)
Sortie : 0
->La requête compte le nombre de lignes dans la table FirstTab où la colonne id n'existe pas dans la table SecondTab.
SELECT COUNT(*) 
FROM FirstTab AS ft 
WHERE ft.id NOT IN (SELECT id FROM SecondTab WHERE id IS NOT NULL)
Sortie : 0
->La requête compte le nombre de lignes dans la table FirstTab où la colonne id n'existe pas dans la table SecondTab lorsque l'id n'est pas NULL. Puisque tous les identifiants de la table FirstTab sont NULL, le résultat sera 0.


























