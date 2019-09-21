CREATE DATABASE book_shop;
USE book_shop;

source book_data.sql
DESC books;

SELECT * FROM books;


/* 
DISTINCT 
Gives the unique elements in the specified column
SELECT DISTINCT columnName FROM tableName;
*/
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname, " ", author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;


/*
ORDER BY
Helps in Sorting the results
default in Ascending
*/
SELECT author_lname FROM books ORDER BY author_lname;
SELECT title FROM books ORDER By title;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT title FROM books ORDER By title DESC;
SELECT title FROM books ORDER BY released_year DESC;
SELECT author_fname, author_lname FROM books ORDER BY author_fname, author_lname;

/*
LIMIT
To specify how many rows of result do we want
*/
SELECT title FROM books LIMIT 10;
SELECT title FROM books ORDER BY released_year DESC LIMIT 5;
SELECT title FROM books ORDER BY released_year DESC LIMIT 10, 5;


/*
LIKE
WHERE author_fname LIKE "%Da%";
find all the author_fname which contains "da" in it. (case insensitive)

    Wildcards
    % - Whatever after or before
        Ex:- LIKE "%da%"  - Whaterver before and after "da"
             LIKE "da%"  - starting with "da" and anything After
    _ -  with one char/digits
        Ex:- LIKE "____" - With four char/digits EXACTLY;
*/
SELECT title , author_fname FROM books WHERE author_fname LIKE "%da%";
SELECT title , author_fname FROM books WHERE author_fname LIKE "da%";
SELECT title FROM books WHERE stock_quantity LIKE "____";
--WE can use escape symbols :)




/*
Refing Selections Excercise
1). Title's containing "stories";
2). Find the longest book (max pages);
3). Print the summary;
4). Find the lnames of the authors who have a space in them;
5). Find three books with the lowest stock;
6). Print the title, author_lname, sorted first by the author_lname and then by the title;
7). Just a Random task "yell"
*/

SELECT title FROM books WHERE title LIKE "%stories%";

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT (title, " - ", released_year) AS 'summary' 
FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE "% %";

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title , author_lname FROM books ORDER BY author_lname, title ;

SELECT UPPER(CONCAT(
    "my favourite author is ",
    author_fname,
    " ",
    author_lname,
    " !"
)) AS "yell" FROM books ORDER BY author_lname;

