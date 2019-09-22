CREATE DATABASE book_shop;
USE book_shop;

source book_data.sql
DESC books;

SELECT * FROM books;


/*
COUNT
count anthying that you specify
*/
SELECT COUNT(*) FROM BOOKS;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE "%the%";



/*
GROUP BY
summarizes or aggregates the identical data into single rows
*/
SELECT author_lname, COUNT(*) FROM books;
GROUP BY author_lname;

SELECT title, author_fname, author_lname, COUNT(*) FROM books 
GROUP BY author_lname, author_fname;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT CONCAT("In ",
    released_year,
    COUNT(*),
    " book(s) were released") AS year FROM books GROUP BY released_year;




/*
MIN AND MAX
Find the minimum and maximum value
*/
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;
SELECT MAX(released_year) FROM books;
--SELECT MAX(pages), title FROM books;
--here max runs independently 

SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT author_fname, author_lname, MIN(released_year) 
FROM books GROUP BY author_fname, author_lname;

SELECT CONCAT(author_lname, " ", author_fname) AS "authors", MAX(pages) AS "longest book"
FROM books GROUP BY author_lname, author_fname;

/*
SUM
finds the sum :|
*/
SELECT SUM(pages) FROM books;

SELECT author_fname, author_lname, SUM(pages) 
FROM books GROUP BY author_lname, author_fname;

/*
AVG
finds the average :| 
*/
SELECT AVG(released_year) FROM books;
SELECT AVG(pages) FROM books;

SELECT released_year, AVG(stock_quantity) 
FROM books GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_fname, author_lname;

/*
AGGREGATE FUNCTIONS challenge
1). Print the number of books in the database;
2). Print out how many books were released in each year;
3). Print the total books in the stock;
4). Print the average release_year for each author;
5). Print the full name of the author who wrote the longest book
*/
SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT author_fname, author_lname, AVG(released_year)
FROM books GROUP BY athor_fname , author_lname;

SELECT CONCAT(author_fname, " ", author_lname) 
FROM books ORDER BY pages DESC LIMIT 1;

SELECT released_year AS "year", 
    COUNT(*) AS "#books", 
    AVG(pages) AS "avg pages"
FROM books GROUP BY year;
