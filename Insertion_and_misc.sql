CREATE DATABASE myLife;
USE myLife;
CREATE TABLE friends
(
    name VARCHAR(20),
    age INT
);

/* Inserting a new value in the table */
INSERT INTO friends(fr_name,age)
VALUES("Jetson", 17);


/* Multiple insert */
INSERT INTO friends(fr_name, age)
VALUES ("James", 18),
       ("Sirius", 19),
       ("Lupin", 18),
       ("BOOO", 17);


/* INSERTION CHALLENGE */
CREATE TABLE people
(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

INSERT INTO people(first_name, last_name, age)
VALUES  ("Tina", "Belcher", 13),
        ("Bob", "Belcher", 42),
        ("Linda", "Belcher", 45),
        ("Philip", "Frond", 38),
        ("Calvin", "Fischoeder", 70);


/* Checking the contents of a table */
SELECT * FROM table_name;
SELECT * FROM friends;

/* Warnings */
SHOW WARNNGS;

/* Creating a table with not null constraint */
CREATE TABLE cats
(
    cat_name VARCHAR(20) NOT NULL,
    cat_age INT NOT NULL
);
/*
If we dont add the NOT NULL atribute then 
we will get an warning while the data will
still be entered in the database with a default
value for the unspecified attribute.

We can set the default attribues for the
NOT NULL attributes
*/


/* Setting Default values */

CREATE TABLE cats
(
    cat_name VARCHAR(20) DEFAULT "un-named",
    age INT DEFAULT 90
);

CREATE TABLE cats
(
    cat_name VARCHAR(20) NOT NULL DEFAULT "un-named",
    age INT DEFAULT NOT NULL  90
);


/* Keys */

/* PRIMARY KEY -> A Unique Identifier */
CREATE TABLE cats_unique
(
    cat_id INT NOT NULL,
    cat_name VARCHAR(20) DEFAULT "no-name",
    cat_age INT,
    PRIMARY KEY(cat_id)
);
/* If we enter an existing value for the 
primary key then we will get an error */

/* A better way of representing ID's */
CREATE TABLE unique_cats
(
    cat_id INT NOT NULL AUTO_INCREMENT,
    cat_name VARCHAR(20) DEFAULT "no-name",
    cat_age INT,
    PRIMARY KEY(cat_id)
);
/*
The auto-increment will automatically 
increment the value of the id's for every entry
*/

CREATE TABLE employees
(
    emp_id INT NOT NULL AUTO_INCREMENT;
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    mid_name VARCHAR(20),
    age INT NOT NULL,
    current_status VARCHAR(20) NOT NULL DEFAULT "employed",
    PRIMARY KEY(emp_id)
);