# Write your MySQL query statement below
SELECT id , COUNT(id) as num
FROM 
(SELECT requester_id AS id
FROM RequestAccepted

UNION ALL 

SELECT accepter_id
FROM RequestAccepted) c
GROUP BY id
ORDER BY num DESC
LIMIT 1;