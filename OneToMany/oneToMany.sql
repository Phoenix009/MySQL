CREATE TABLE customers
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fname VARCHAR(30),
    lname VARCHAR(30),
    email VARCHAR(50) NOT NULL
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT NOT NULL,
    order DATE NOT NULL,
    amount DECIMAL(8, 2) NOT NULL,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
)


INSERT INTO customers(fname, lname, email)
VALUES
("Boy", "George", "george@gmail.com"),
("George", "Michael", "gm@gmail.com"),
("David", "Bowie", "david@gmail.com"),
("Blue", "Steele", "vlue@gmail.com"),
("Beete", "Davis", "bette@gmail.com");


INERT INTO orders
VALUES
("2016/02/10", 99.99, 1),
("2017/11/11", 35.50, 1),
("2014/12/12", 800.67, 2),
("2015/01/03", 12.50, 2),
("1999/04/11", 450.25, 5);


/*
CROSS JOIN
Cross Product between two table rows
*/
SELECT id 
FROM customers 
WHERE CONCAT(fname, " ", lname) = "Boy George";


--To find all the orders by "Boy george"
SELECT * 
FROM orders 
WHERE customer_id = 
    (SELECT id 
    FROM customers 
    WHERE CONCAT(fname, " ", lname) = "Boy George")
--A bit cumbersome

SELECT * FROM customers, orders
--Will result in CROSS JOIN
--Meaningless and Useless without a predicate/condition



--Implicit condition
SELECT * 
FROM customers, orders 
WHERE customers.id = orders.customer_id;

SELECT CONCAT(fname, " ", lname) AS "Name", order_date, amount
FROM customers, orders
WHERE customers.id = orders.customer_id;


--Explicit INNER JOIN
--Joins the data from both tables
-- Only those rows are taken that satisfy the predicate
--The predicate is mostly an id matching condition
SELECT * FROM customers 
JOIN orders
ON customer.id = orders.customer_id;


SELECT CONCAT(fname, " ", lname) AS "Name", order_date, amount
JOIN orders
ON customer.id = orders.customer_id;

SELECT CONCAT(fname, " ", lname) AS "Spender", SUM(amount) AS "total_spent"
FROM customers
JOIN orders  
ON orders.customer_id = customer.id
GROUP BY customer_id
ORDER BY total_spent DESC;


--LEFT JOIN
--All data from left table and the intersection
--Gives NULL values to the values not having corresponding value on the other table
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;



SELECT fname, lname, SUM(amount) AS "Total_spent"
FROM customers
LEFT JOIN orders   
    ON customers.id = orders.customer_id
GROUP BY customer_id
ORDER BY total_spent DESC;



SELECT fname,
        lname,
        IFNULL(SUM(amount), 0) AS "Total_spent"
FROM customers
LEFT JOIN orders   
    ON customers.id = orders.customer_id
GROUP BY customer_id
ORDER BY total_spent DESC;


--RIGHT JOIN
--Same as left JOIN

/*
JOIN Excercise

STUDENTS(id, first_name)
PAPERS(title, grade, student_id)
*/

CREATE TABLE students(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(30)
);

CREATE TABLE papers(
    student_id INT,
    title VARCHAR(30) NOT NULL,
    grade INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);


INSERT INTO students(first_name)
VALUES("Caleb"),
    ("Samantha"),
    ("Raj"),
    ("Carlos"),
    ("Lisa");


INSERT INTO papers(student_id, title, grade)
VALUES(1, "My First Book report", 60),
    (1, "My Second Book report", 75),
    (2, "Russian Lit Through The Ages", 94),
    (2, "De Montiagne and The Art of The Essay", 98),
    (4, "Borges and Magical Realism", 89);



SELECT first_name, title, grade
FROM student
JOIN papers
    ON student.id = papers.student_id
ORDER BY grade DESC;


SELECT first_name, title , grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;


SELECT first_name, 
    IFNULL(title, "MISSING") , 
    IFNULL(grade, 0)
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;


SELECT first_name, IFNULL(AVG(grade), 0) AS "average"
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;


SELECT first_name, 
    IFNULL(AVG(grade), 0) AS "average",
    CASE
        WHEN AVG(grade) >= 75 THEN "PASSING"
        ELSE "FAILING"
FROM students
LEFT JOIN papers    
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average;

