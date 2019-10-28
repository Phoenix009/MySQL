
/* We want to reward the users 
who have been around the longest
Find the 5 oldest users */
SELECT * FROM users
ORDER BY created_at ASC
LIMIT 5;


/* What day of the week
do most users register on
We need to figure out when 
to schedule an ad campaign*/
SELECT 
    DAYNAME(created_at) AS "day", 
    COUNT(*) AS "registrations" 
FROM users
GROUP BY day
ORDER BY registrations DESC
LIMIT 1;



/*
    We want to target out inactive
    users with an email campaign
    Find the users who have never posted a photo
*/
SELECT username FROM
users LEFT JOIN photos
ON  users.id = photos.user_id
WHERE photos.id IS NULL;



/*
    We are running a new contest
    to see who can get the most likes 
    on a single photo
    Who Won??
*/

SELECT username, photos.id, COUNT(*) AS "likes"
FROM photos JOIN likes ON photos.id = likes.photo_id
JOIN users ON users.id = photos.user_id
GROUP BY photo_id
ORDER BY likes DESC LIMIT 1;

-- OP:
-- +---------------+-----+-------+
-- | username      | id  | likes |
-- +---------------+-----+-------+
-- | Zack_Kemmer93 | 145 |    48 |
-- +---------------+-----+-------+



/*
    How many times does the average user post
*/

SELECT 
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)
AS "avg posts";

-- OP:
-- +-----------+
-- | avg posts |
-- +-----------+
-- |    2.5700 |
-- +-----------+

/*
    A brand wants to know which
    hashtags to use in a post
    What are the top five most used hashtags
*/

SELECT tag_name, COUNT(*) as "counts"
FROM photo_tags JOIN tags 
ON photo_tags.tag_id = tags.id
GROUP BY tag_id
ORDER BY counts DESC
LIMIT 5;




/*
    We have a small problem with
    the bots on our site
    Find the users who have liked every single photo on the site
*/

SELECT username, COUNT(*) AS "num_likes" 
FROM users JOIN likes
ON users.id = likes.user_id
GROUP BY user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);