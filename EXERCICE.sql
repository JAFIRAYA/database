CREATE TABLE producers (
  id INT PRIMARY KEY,
  movie_id INT,
  producer_name VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);
INSERT INTO producers (id, movie_id, producer_name)
VALUES
  (1, 1, 'Producer 1'),
  (2, 1, 'Producer 2'),
  (3, 2, 'Producer 3'),
  (4, 3, 'Producer 4');
  SELECT movies.title, producers.producer_name
FROM movies
INNER JOIN producers ON movies.id = producers.movie_id;
