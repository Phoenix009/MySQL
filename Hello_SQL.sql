/* Show Existing Databases */
SHOW DATABASES;

/* Creating a Database */
CREATE DATABASE name_db;
CREATE DATABASE hello_db;

/* Deleting a Database */
DROP DATABASE name_db;

/* Selecting a Database to Work with */
USE name_of_db;
SELECT database()  /*Returns the name of the databse. If no db is being used the o/p is NULL*/

/*

Basic DataTypes:
    NumericTypes        StringTypes
    ->  INT                 CHAR
        SMALLINT        ->  VARCHAR
        TINYINT             BINARY
        MEDIUMINT           VARBINARY
        BIGINT              BLOB(TINY, MEDIUM, LONG)
        DOUBLE              TEXT(TINY, MEDIUM, LOG)
        BIT                 ENUM
        DECIMAL             
        NUMERIC             
        FLOAT              

    DateTypes:
        DATE
        DATETIME
        TIMESTAMP
        TIME
        YEAR    
*/


/* Creating Tables */
CREATE TABLE friends
(
    fr_name VARCHAR(30),
    age INT
);


/* Print the existing tables in the working database */
SHOW TABLES;
SHOW COLUMNS FROM friends;
DESC friends;


/* Deleting the tables in the database */
DROP TABLE table_name;

/* CREATING A DATABASE CHALLENGE */
CREATE TABLE pastries
(
    pastry_name VARCHAR(50),
    qty INT
);

DESC pastries;

DROP TABLE pastries;
