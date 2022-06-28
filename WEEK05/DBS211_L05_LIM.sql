-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 14th June 2022
-- Purpose: Lab 05 DBS211
-- ***********************
SET AUTOCOMMIT ON; 
-- Q1 SOLUTION --
CREATE TABLE L5_DIRECTORS( 
director_id INT PRIMARY key, 
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(30) NOT NULL);

CREATE TABLE l5_movies( 
m_id INT PRIMARY key, 
title VARCHAR(35) NOT NULL, 
release_year INT NOT NULL, 
director INT NOT NULL, 
score DECIMAL(3, 2), 
CONSTRAINT score CHECK(score < 5 AND score > 0), 
CONSTRAINT director_fk 
FOREIGN KEY (director) 
REFERENCES l5_directors (director_id) 
);

CREATE TABLE l5_actors( 
a_id INT PRIMARY KEY, 
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(30) NOT NULL 
);

CREATE TABLE l5_castings( 
movie_id INT, 
actor_id INT, 
PRIMARY KEY (movie_id, actor_id) 
);

-- Q2 SOLUTION –
ALTER TABLE l5_castings 
ADD( 
CONSTRAINT movies_id_fk 
FOREIGN KEY (movie_id) 
REFERENCES l5_movies (m_id), 
CONSTRAINT actors_id_fk 
FOREIGN KEY (actor_id) 
REFERENCES l5_actors(a_id) 
);

-- Q3 SOLUTION –
ALTER TABLE l5_directors 
ADD username VARCHAR(60);

-- Q4 SOLUTION –
ALTER TABLE l5_directors 
ADD UNIQUE (username);

-- Q5 SOLUTION –
INSERT ALL 
INTO l5_directors(director_id, first_name, last_name) VALUES(1010, 'Rob', 'Minkoff')
INTO l5_directors(director_id, first_name, last_name) VALUES(1020, 'Bill', 'Condon')
INTO l5_directors(director_id, first_name, last_name) VALUES(1050, 'Josh', 'Cooley')
INTO l5_directors(director_id, first_name, last_name) VALUES(2010, 'Brad', 'Bird')
INTO l5_directors(director_id, first_name, last_name) VALUES(3020, 'Lake', 'Bell')
SELECT * 
FROM DUAL;

-- Q6 SOLUTION –
UPDATE l5_directors 
SET username = LOWER(CONCAT(SUBSTR(first_name, 1, 1), last_name));

-- Q7 SOLUTION –
DROP TABLE L5_CASTINGS;
DROP TABLE L5_ACTORS;
DROP TABLE L5_MOVIES;
DROP TABLE L5_DIRECTORS;

--It is important to remove tables according to the order.
--If  each table is connected to each other, we cannot delete the referenced table right away. 
--We need to drop foreign key constraint first and then we can drop it. 


