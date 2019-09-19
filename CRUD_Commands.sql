/* 
C Create
R Read
U Update
D Delete
*/

/* The following Table will be used in this section */
CREATE TABLE cats
(
    cat_id NOT NULL AUTO_INCREMENT,
    cat_name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

INSERT INTO cats(cat_name, breed, age)
VALUES("Ringo", "Tabby", 4),
      ("Cindy", "Maine Coon", 10),
      ("Dumbledore", "Maine Coon", 11),
      ("Egg", "Persian", 4),
      ("Misty", "Tabby", 13),
      ("George Michael", "Ragdoll", 9),
      ("Jackson", "Sphynx", 7);


/* READ */

SELECT * FROM cats;
/* Returns all the data from the table */


SELECT cat_name FROM cats;
SELECT age FROM cats;
SELECT age, cat_name FROM cats;
/* Returns the specified attribute form the table */


/* Adding Conditions to select the specific data */
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE cat_name = "Egg";
/* REMEMBER SQL IS CASE INSENSITIVE */

/* ALIASES */
SELECT cat_id as id, cat_name FROM cats;
/* Will modify the column name of the returned table */






/* UPDATE */
UPDATE cats SET breed = "Tabby" WHERE cat_name = "Misty";
UPDATE cats SET age = 14 WHERE cat_name = "Dumbledore";
/* Good Thumb Rule:
    Check the data eing returned for the WHERE 
    before actually changing the data
*/


/* UPDATE CHALLENGE 
1). Change Jacksons name to Jack
2). Change Ringo's breed to "Bristish Shorthair"
3). Update both Maine Coons's age to be 12
*/

UPDATE cats SET cat_name  = "Jack" WHERE cat_name = "Jackson";
UPDATE cats SET breed = "British Shorthair" WHERE cat_name = "Ringo";
UPDATE cats SET age = 12 WHERE breed = "Maine Coon";


/* Delete */
/* Always Select first and check the o/p before deleting */

DELETE FROM cats WHERE cat_name = "Egg";
/*Deletes the specified entry from the table*/

DELETE FROM cats;
/* Deletes every entry in the Table
   Note : The Table is note deleted 
*/

/* Delete Challenge 
    1). Delete the cats with age 4.
    2). Delete cats with age same as their id.
    3). Delete All cats
*/
DELETE FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = cat_id;
DELETE FROM cats; 