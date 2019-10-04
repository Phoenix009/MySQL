CREATE DATABASE book_shop;
USE book_shop;

source book_data.sql
DESC books;

SELECT * FROM books;


/* NOT EQUAL*/
SELECT title, released_year FROM books 
WHERE released_year != 2017;

SELECT title, author_lname FROM books 
WHERE author_lname != "Harris";

/* NOT LIKE */
SELECT title, author_lname FROM books 
WHERE title LIKE "W%";

SELECT title FROM books 
WHERE title NOT LIKE "W%";

/* Greater than " > " */
SELECT * FROM books
WHERE released_year > 2000 
ORDER BY released_year;

/* Greater than equal to */
SELECT * FROM books
WHERE released_year >= 2000
ORDER BY released_year;

SELECT title, stock_quantity FROM books
WHERE stock_quantity >= 100; 

/* Less Than " < " */
SELECT title, released_year FROM books 
WHERE released_year < 2000
ORDER BY released_year;

SELECT title, released_year 
FROM books WHERE released_year <= 2000
ORDER BY released_year;

/* LOGICAL AND */

SELECT title, released_year, author_lname FROM books 
WHERE released_year > 2010 AND 
author_lname = "Eggers";

SELECT * FROM books
WHERE author_lname = "Eggers" AND
released_year > 2010 AND
title LIKE "%novel%";

/* Logical OR */
SELECT title , CONCAT(author_lname, " ", author_fname) FROM books
WHERE author_lname = "Eggers" OR 
author_lname = "Gaiman";
