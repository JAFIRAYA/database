SELECT DISTINCT language_name FROM films;

SELECT films.film_title, films.description, languages.language_name
FROM films
LEFT JOIN languages ON films.language_id = languages.language_id;

SELECT films.film_title, films.description, languages.language_name
FROM languages
LEFT JOIN films ON languages.language_id = films.language_id;


CREATE TABLE new_film (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

INSERT INTO new_film (name) VALUES
    ('Film A'),
    ('Film B'),
    ('Film C');
	
	CREATE TABLE customer_review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT,
    language_id INT,
    title VARCHAR(255),
    score INT,
    review_text TEXT,
    last_update TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES new_film(id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES language(language_id)
);


INSERT INTO customer_review (film_id, language_id, title, score, review_text, last_update)
VALUES
    (1, 1, 'Review 1', 8, 'This is a great film!', NOW()),
    (2, 2, 'Review 2', 6, 'Not bad, but could be better.', NOW());
	
	
	---->Lorsque vous supprimez un film de la table "new_film", la contrainte DELETE CASCADE sur la relation de clé étrangère avec la table "customer_review" supprimera automatiquement les critiques associées dans la table "customer_review".





