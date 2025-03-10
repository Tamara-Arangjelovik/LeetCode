# Write your MySQL query statement below
with CTE1 as -- id of the  of the users who have rated the greatest number of movies
(
select user_id 
from MovieRating
group by user_id
having count(movie_id) = (select max(movie_count) from (select count(movie_id) as movie_count from MovieRating R group by user_id) A )
)

, CTE2 as -- id and rating of movies in February 2020
(
select movie_id, AVG(rating) as avg_rating
from MovieRating 
where DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
group by movie_id
)


SELECT MIN(B.name) AS results
FROM CTE1 A 
LEFT JOIN Users B ON A.user_id = B.user_id
UNION ALL
SELECT MIN(M.title)
FROM Movies M
JOIN
(
SELECT movie_id
FROM CTE2
WHERE avg_rating = (SELECT MAX(avg_rating) FROM CTE2)
) C
ON M.movie_id = C.movie_id
