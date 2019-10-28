USE join_us;

--Find the earliest date of registration

SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") as "earlist_date"
FROM users;

/* OP:
+-------------------+
| earlist_date      |
+-------------------+
| October 28th 2018 |
+-------------------+
1 row in set (0.03 sec) */




-- Find the email of the earliest regtration

SELECT email, created_at
FROM users
WHERE created_at = (SELECT min(created_at) FROM users);

/* OP:
+-------------------------------+---------------------+
| email                         | created_at          |
+-------------------------------+---------------------+
| Nikolas_Kertzmann31@yahoo.com | 2018-10-28 16:19:13 |
+-------------------------------+---------------------+
1 row in set (0.04 sec) */





-- Find the no. of users joined in each month
SELECT MONTHNAME(created_at) AS "month", COUNT(*) AS "registrations"
FROM users
GROUP BY MONTHNAME(created_at)
ORDER BY registrations DESC;

/* OP:
+-----------+---------------+
| month     | registrations |
+-----------+---------------+
| November  |            49 |
| May       |            46 |
| October   |            46 |
| December  |            46 |
| September |            44 |
| July      |            44 |
| June      |            43 |
| January   |            41 |
| April     |            40 |
| February  |            36 |
| March     |            33 |
| August    |            32 |
+-----------+---------------+
12 rows in set (0.00 sec) */




-- Find the count of yahoo users
SELECT COUNT(*) AS "yahoo_users"
FROM users
WHERE email LIKE "%@yahoo.com";

/* OP:
+-------------+
| yahoo_users |
+-------------+
|         161 |
+-------------+
1 row in set (0.00 sec) */




--Calculate total number of users for each email host
SELECT 
CASE 
    WHEN email LIKE "%@gmail.com" THEN "gmail"
    WHEN email LIKE "%@hotmail.com" THEN "hotmail"
    WHEN email LIKE "%@yahoo.com" THEN "yahoo"
    ELSE "other"
END AS "provider",
COUNT(*) AS "total_users"
FROM users
GROUP BY provider
ORDER BY total_users DESC;

/* OP:
+----------+-------------+
| provider | total_users |
+----------+-------------+
| hotmail  |         169 |
| gmail    |         169 |
| yahoo    |         161 |
| other    |           1 |
+----------+-------------+
4 rows in set (0.00 sec) */





