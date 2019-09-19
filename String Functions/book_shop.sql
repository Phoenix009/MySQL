CREATE DATABASE book_shop;
USE book_shop;

source book_data.sql
DESC books;

SELECT * FROM books;



/* 
CONCAT 

CONCAT(column, anotherColumnName);
CONCAT(column, "text", anotherColumn, "text")
*/

SELECT CONCAT("Hello", "World");

SELECT CONCAT("Hello", "...", "World");

SELECT 
    CONCAT(author_fname, " ", author_lname) AS author_name
FROM books;

SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, " ", author_lname) AS full
FROM books;

/* CONCAT_WS (concat with sepperator) */
SELECT 
    CONCAT(title, "-", author_fname, "-", author_lname)
FROM books;

SELECT
    CONCAT_WS("-", title, author_fname, author_lname)
FROM books;



/*
SUBSTRING 
SUBSTRING(String, fromIndex,lastIndex);
SUBSTRING(String, firstIndex);
SUBSTRING(String, negativeIndex);
*/

SELECT SUBSTRING("Hello World", 1, 4);

SELECT SUBSTRING("Hello World", 6);

SELECT SUBSTRING(title, 1, 10) AS "short_title" FROM books;

SELECT CONCAT(
    SUBSTRING(title, 1, 10), 
    "...") 
    AS "short_title"
FROM books;




/*
REPLACE 
Replace a substring with another substring

REPLACE(src, sub_to_replace, sub_with)
replaces every occurence with the replace str
*/

SELECT REPLACE("Hello World","Hell", "!@#$");
SELECT REPLACE("cheese coffee bred biscuits", " ", " and ");

SELECT 
    SUBSTRING(
        REPLACE(title, "e", "3"),
        1,
        10
    )
FROM books;


/*
REVERSE
REVERSE(String)
*/
SELECT REVERSE("dlroW olleH");

SELECT REVERSE(author_fname) FROM books;

SELECT 
    CONCAT(author_name, 
        REVERSE(author_name)
        )
    AS "palindrome name"
FROM books;




/* 
CHARLENGTH 
CHAR_LENGTH(String)
*/
SELECT CHAR_LENGTH("HELLO WORLD");

SELECT
    author_lname AS "last",
    CHARLENGTH(author_lname) AS "length"
FROM books;

SELECT 
    CONCAT(
        author_lname,
        " is ",
        CHAR_LENGTH(author_lname),
        " characters long"
    )
FROM books;


/* 
UPPER AND LOWER
UPPER(STRING)
LOWER(STRING) 
Uppercases all characters
Lowercases all characters
*/
SELECT UPPER(title) FROM books;

SELECT
    CONCAT(
        UPPER("my favourite book is "),
        UPPER(title)
    )
FROM books;



/* String Functions Excercise */
SELECT
    UPPER(REVERSE("Why does my cat look at me with such hatred ?"));


SELECT 
    REPLACE(title, " ", "->") AS "title"
FROM books;


SELECT 
    author_lname AS "forwards",
    REVERSE(author_lname) AS "backwards"
FROM books;


SELECT 
    UPPER(CONCAT(author_fname, " ", author_lname)) AS "full name in caps"
FROM books;

SELECT
    CONCAT(
        title,
        " was released in ",
        released_year
    ) AS blurb
FROM books;


SELECT 
    title,
    CHAR_LENGTH(title) AS "character count"
FROM books;


SELECT 
    CONCAT(SUBSTRING(title, 1, 10), "...") AS "short_title",
    CONCAT(author_lname, ",", author_fname) AS "author",
    CONCAT(stock_quantity, " in stock") AS "quantity"
FROM books;
