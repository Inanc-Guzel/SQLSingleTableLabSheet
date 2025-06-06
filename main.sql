
CREATE TABLE pet (
  name VARCHAR(20),
  owner VARCHAR(20),
  species VARCHAR(20),
  sex CHAR(1),
  checkups SMALLINT CHECK (checkups >= 0),  -- Negatif değerleri engelle
  birth DATE,
  death DATE
);

INSERT INTO pet (name, owner, species, sex, checkups, birth, death)
VALUES 
  ('Fluffy', 'Harold', 'cat', 'f', 5, '2001-02-04', NULL),
  ('Claws', 'Gwen', 'cat', 'm', 2, '2000-03-17', NULL),
  ('Buffy', 'Harold', 'dog', 'f', 7, '1999-05-13', NULL),
  ('Fang', 'Benny', 'dog', 'm', 4, '2000-08-27', NULL),
  ('Bowser', 'Diane', 'dog', 'm', 8, '1998-08-31', '2001-07-29'),
  ('Chirpy', 'Gwen', 'bird', 'f', 0, '2002-09-11', NULL),
  ('Whistler', 'Gwen', 'bird', '', 1, '2001-12-09', NULL),
  ('Slim', 'Benny', 'snake', 'm', 5, '2001-04-29', NULL);

--Q1-1 
SELECT owner, name 
FROM pet 
WHERE sex = 'f';
--Q1-2
SELECT name, birth 
FROM pet 
WHERE species = 'dog';

--Q1-3 
SELECT DISTINCT owner 
FROM pet 
WHERE species = 'bird';
--Q1-4
SELECT DISTINCT species 
FROM pet 
WHERE sex = 'f';
--Q1-5 
SELECT name, birth 
FROM pet 
WHERE species IN ('cat', 'bird');
--Q1-6 
SELECT name, species 
FROM pet 
WHERE species IN ('cat', 'bird') AND sex = 'f';


--Q2-1
SELECT owner, name
FROM pet
WHERE name LIKE '%er' OR name LIKE '%all';
--Q2-2
SELECT name
FROM pet
WHERE owner LIKE '%e%';
--Q2-3
SELECT name
FROM pet
WHERE name NOT LIKE '%fy';
--Q2-4
SELECT name
FROM pet
WHERE LENGTH(owner) = 4;
--Q2-5
SELECT DISTINCT owner
FROM pet
WHERE (owner LIKE 'a%' OR owner LIKE 'b%' OR owner LIKE 'c%' OR owner LIKE 'd%' OR owner LIKE 'e%')
AND (owner LIKE '%a' OR owner LIKE '%b' OR owner LIKE '%c' OR owner LIKE '%d' OR owner LIKE '%e');
--Q2-6

--Q3-1
SELECT owner, AVG(checkups) AS average_checkups
FROM pet
GROUP BY owner;
--Q3-2
SELECT species, COUNT(*) AS pet_count
FROM pet
GROUP BY species
ORDER BY pet_count ASC;
--Q3-3
SELECT owner, species, COUNT(*) AS pet_count
FROM pet
GROUP BY owner, species;
--Q3-4
SELECT owner, COUNT(DISTINCT species) AS distinct_species_count
FROM pet
GROUP BY owner;
--Q3-5
SELECT sex, COUNT(*) AS gender_count
FROM pet
WHERE sex IS NOT NULL AND sex != ''
GROUP BY sex;
--Q3-6
SELECT owner, COUNT(*) AS bird_count
FROM pet
WHERE species = 'bird'
GROUP BY owner;
--Q3-7
SELECT owner, SUM(checkups) AS total_checkups
FROM pet
GROUP BY owner;
