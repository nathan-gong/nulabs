# Create Schema
CREATE DATABASE IF NOT EXISTS nulabs;
USE nulabs;

-- Entity Tables

CREATE TABLE college (
    college_name VARCHAR(16) PRIMARY KEY
);

CREATE TABLE administrator (
    username VARCHAR(255) PRIMARY KEY,
    college_name VARCHAR(16) NOT NULL,
    FOREIGN KEY (college_name)
        REFERENCES college (college_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE building (
    building_name VARCHAR(255) PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    college_name VARCHAR(16) NOT NULL,
    FOREIGN KEY (college_name)
        REFERENCES college (college_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE lab (
    lab_name VARCHAR(255) PRIMARY KEY,
    lab_description VARCHAR(3000) NOT NULL,
    website VARCHAR(1000) NOT NULL,
    recruiting_status TINYINT NOT NULL,
    department VARCHAR(255) NOT NULL,
    building_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (building_name)
        REFERENCES building (building_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE lab_member (
    username VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    degree_level VARCHAR(64) NOT NULL,
    lab_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (lab_name)
        REFERENCES lab (lab_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE project (
    title VARCHAR(256) PRIMARY KEY,
    project_description VARCHAR(3000),
    lab_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (lab_name)
        REFERENCES lab (lab_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE publication (
    doi VARCHAR(256) PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    publish_date INT NOT NULL,
    journal VARCHAR(1000) NOT NULL
);

CREATE TABLE pi (
    username VARCHAR(255) PRIMARY KEY,
    lab_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (username)
        REFERENCES lab_member (username)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (lab_name)
        REFERENCES lab (lab_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Relationship Tables

CREATE TABLE results_in (
    title VARCHAR(256) NOT NULL,
    doi VARCHAR(128) NOT NULL,
    FOREIGN KEY (title)
        REFERENCES project (title)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (doi)
        REFERENCES publication (doi)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE conducts (
    username VARCHAR(255) NOT NULL,
    title VARCHAR(256) NOT NULL,
    lab_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (username)
        REFERENCES lab_member (username)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (title)
        REFERENCES project (title)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (lab_name)
        REFERENCES lab (lab_name)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
