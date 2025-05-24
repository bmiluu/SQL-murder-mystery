CREATE DATABASE detective_game DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

USE detective_game;

CREATE TABLE Person (
    person_id INT PRIMARY KEY,
    name VARCHAR(100),
    height_cm INT,
    entity_type VARCHAR(50),
    clothing VARCHAR(50),
    is_traitor BOOLEAN DEFAULT FALSE
);

CREATE TABLE Relationship (
    person_id INT,
    friend_id INT,
    relationship_type VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (friend_id) REFERENCES Person(person_id),
    PRIMARY KEY (person_id, friend_id)
);

CREATE TABLE Detective (
    detective_id INT PRIMARY KEY,
    name VARCHAR(100),
    experience_years INT,
    birth_year INT
);

CREATE TABLE Interview (
    interview_id INT PRIMARY KEY,
    detective_id INT,
    person_id INT,
    date DATE,
    FOREIGN KEY (detective_id) REFERENCES Detective(detective_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Statement (
    statement_id INT PRIMARY KEY,
    interview_id INT,
    content TEXT,
    FOREIGN KEY (interview_id) REFERENCES Interview(interview_id)
);