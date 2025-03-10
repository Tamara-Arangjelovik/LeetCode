# Write your MySQL query statement below
SELECT Department.name AS Department, cte.name AS Employee, cte.salary AS Salary 
FROM (
    SELECT id, departmentId, name, salary,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rn
    FROM Employee
) AS cte
JOIN Department ON cte.departmentId = Department.id
WHERE cte.rn < 4;