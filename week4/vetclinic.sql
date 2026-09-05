-- INFOMAN1 Week 4 Lab: Veterinary Clinic (DDL & Table Creation)
-- Student: Red Cyrus Oloresisimo | ID: 2510818 | Section: BSIT-II
-- Run with:  mysql -u root -p < vetclinic.sql   (or paste each task into the mysql CLI)

-- ============================================================
-- Task 1: Create the database
-- ============================================================
CREATE DATABASE infoman1_vetclinic;
SHOW DATABASES;
USE infoman1_vetclinic;

-- ============================================================
-- Task 2: Core tables (owner, pet, veterinarian)
-- ============================================================
CREATE TABLE owner (
    owner_id     INT AUTO_INCREMENT,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    phone_number VARCHAR(15)  NOT NULL,
    PRIMARY KEY (owner_id)
);

CREATE TABLE veterinarian (
    vet_id         INT AUTO_INCREMENT,
    first_name     VARCHAR(50)  NOT NULL,
    last_name      VARCHAR(50)  NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    PRIMARY KEY (vet_id)
);

CREATE TABLE pet (
    pet_id   INT AUTO_INCREMENT,
    pet_name VARCHAR(50)  NOT NULL,
    species  VARCHAR(30)  NOT NULL,
    age      TINYINT UNSIGNED NOT NULL,
    owner_id INT NOT NULL,
    PRIMARY KEY (pet_id),
    CONSTRAINT fk_pet_owner
        FOREIGN KEY (owner_id) REFERENCES owner (owner_id)
);

-- ============================================================
-- Task 3: Relationship tables (appointment, vaccination_record)
-- ============================================================
CREATE TABLE appointment (
    appointment_id   INT AUTO_INCREMENT,
    appointment_date DATETIME     NOT NULL,
    reason_for_visit VARCHAR(255) NOT NULL,
    pet_id           INT NOT NULL,
    vet_id           INT NOT NULL,
    PRIMARY KEY (appointment_id),
    CONSTRAINT fk_appointment_pet
        FOREIGN KEY (pet_id) REFERENCES pet (pet_id),
    CONSTRAINT fk_appointment_vet
        FOREIGN KEY (vet_id) REFERENCES veterinarian (vet_id)
);

CREATE TABLE vaccination_record (
    pet_id           INT NOT NULL,
    vaccine_name     VARCHAR(100) NOT NULL,
    vaccination_date DATE NOT NULL,
    PRIMARY KEY (pet_id, vaccine_name, vaccination_date),
    CONSTRAINT fk_vaccination_pet
        FOREIGN KEY (pet_id) REFERENCES pet (pet_id)
        ON DELETE CASCADE
);

-- ============================================================
-- Task 4: Verify the schema
-- ============================================================
SHOW TABLES;
DESCRIBE owner;
DESCRIBE pet;
DESCRIBE veterinarian;
DESCRIBE appointment;
DESCRIBE vaccination_record;

-- ============================================================
-- Task 5: Deliberate mistake, diagnosis, and correction
-- ============================================================
-- 5a. The mistake: store the phone number as an integer.
ALTER TABLE owner MODIFY phone_number INT NOT NULL;

-- 5b. Diagnose: DESCRIBE shows Type = int for phone_number.
DESCRIBE owner;

-- 5c. Fix: restore a character type that keeps leading zeros and "+" signs.
ALTER TABLE owner MODIFY phone_number VARCHAR(15) NOT NULL;

-- 5d. Confirm the fix.
DESCRIBE owner;