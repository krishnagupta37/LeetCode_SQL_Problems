CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
select ifnull ((select salary
    from (select salary, 
     dense_rank() over(order by salary desc) as rn
from employee) t
where rn = n limit 1), null) AS NthHighestSalary
 );
END