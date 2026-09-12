-- INFOMAN1 Week 5 Lab: SQL 2 (SELECT with Conditions)
-- Student: Red Cyrus Oloresisimo | ID: 2510818 | Section: BSIT-II

USE infoman1_vetclinic;

-- Task 1: Basic SELECT Statements
SELECT * FROM pet;

SELECT pet_name, species FROM pet;

-- Task 2: Filtering with Equality
SELECT pet_name, species
FROM pet
WHERE species = 'Dog';

-- Task 3: Filtering with Relational Operators
SELECT pet_name, species, age
FROM pet
WHERE age >= 4;

SELECT appointment_id, appointment_date, reason_for_visit
FROM appointment
WHERE appointment_date < '2026-09-01';

-- Task 4: Combine and Debug
-- Working query (returns 3 rows from September 2026)
SELECT appointment_id, appointment_date, reason_for_visit
FROM appointment
WHERE appointment_date >= '2026-09-01';

-- Broken query (missing quotes: returns all 5 rows with Warning 1292: Incorrect datetime value: '2016')
SELECT appointment_id, appointment_date, reason_for_visit
FROM appointment
WHERE appointment_date >= 2026-09-01;

SHOW WARNINGS;
