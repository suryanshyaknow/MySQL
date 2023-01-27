############################### Some SQL Problem Statements continued.. #####################################
use company__the_100;
show tables;
select * from Employees;
select * from Bonus;
select * from EmpDesignation;

# 1. Write an SQL query to retrieve all details where first name from table "employee" starts with "S".
-- Here's where the WILDCARDS in conjunction  with the `LIKE` keyword comes into the picture.
/*
There are two wildcards often used in conjunction with the LIKE operator:

-- i. The percent sign (%) represents zero, one, or multiple characters.
-- ii. The underscore sign (_) represents one, single character.
*/
select * from Employees where FirstName LIKE "S%"; 
select * from Employees where FirstName LIKE "S_";  # Records where after first letter "S", there's only one more single character.

# 2. Write an SQL query to print all details of the employees whose salry lies between 5000 to 10000.
select * from Employees where salary between 5000 and 10000;  # way1
select * from Employees where salary >= 5000 and salary <= 10000;  # way2
select * from Employees where 5000 <= salary <= 10000;  # way3

-- Return only Names and Salary for the above problem.
select CONCAT(FirstName, ' ',  LastName) as Employee, Salary from Employees where Salary between 5000 and 10000;
-- OR
select CONCAT(FirstName, ' ',  LastName) as Employees, Salary 
from Employees where EmpID in
(select EmpID from Employees where Salary between 5000 and 10000);

# 3. Write an SQL query to retrieve details of all the employees who have joined in November 1999.
select * from Employees;
-- select * from Employees where JoiningDate is '1999-11-26';  # Error in SQL syntax!
-- select * from Employees where JoiningDate='1999-11-26';
select * from Employees where Year(JoiningDate)=1999 and month(JoiningDate)=11;

# 4. Write an SQL query to retrieve the number of employees in every department.
select Department, count(*) from Employees GROUP BY Department; 

# 5. Write an SQL query to retrieve details of all employees who are commanders. 
select * from (select * from Employees natural join EmpDesignation);
-- Error Code: 1248. Every derived table must have its own alias

select * from (select * from Employees natural join EmpDesignation) as Employees_Desig where Designation="Heda (Commander)";
-- OR
select emp.empID, FirstName, LastName, Designation, DesignationDate, Salary, JoiningDate, Department from Employees as emp
inner join EmpDesignation as desig
on emp.EmpID = desig.EmpID
where Designation="Heda (Commander)";

# 6. Write an SQL query to clone a new table from another table.
create table grounders 
as (select * from Employees natural join Bonus natural join EmpDesignation);
select * from grounders;
-- OR
create table cloned_grounders like grounders;
select * from cloned_grounders;  # Not gonna work! There are no records in `cloned_grounders`.

# 7. Write an SQL query to show top `n` salaries of employees.
-- Say n=3
select * from Employees order by Salary DESC limit 3;

# 8. Write an SQL query to return the nth highest salary.
-- Say n here is 4.
select * from Employees order by Salary DESC limit 3, 1;  # limit n-1, 1;
-- In this syntax, the `LIMIT n-1, 1` clause returns 1 row that starts at the row n.
-- Similarly, the `LIMIT n-1, 1` clause would return 2 rows that start at the row n.

# 9. Write an SQL query to return the nth highest salary without using `LIMIT` keyword.
-- Say, n=4.
select * from (select * from Employees order by Salary DESC limit 4) as X order by salary ASC limit 1;  # 4th highset salary!

  