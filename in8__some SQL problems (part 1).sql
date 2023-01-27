############################## Some SQL Problem Statements ############################################
# ************************** Create database "Company__the_100" ***************************************
create database Company__the_100;
use Company__the_100;

################################ Create table "Employees" #############################################
create table Employees(
EmpID int,
FirstName varchar(30),
LastName varchar(30),
Salary int,
JoiningDate datetime,
Department varchar(30),
primary key(EmpID)
);

# Insert some records into "Employees"
insert into Employees (EmpID, FirstName, LastName, Salary, JoiningDate, Department) values
(1, 'Suryansh', 'Grover', 12000, '1999-11-26', 'Development'),
(2, 'Bellamy', 'Blake', 10000, '1999-11-26', 'Arkadia'),
(3, 'Roan', NULL, 15000, '1999-11-26', 'Azgeda'),
(4, 'Lexa', 'kom Trikuru', 25000, '1999-11-1', 'Polis'),
(5, 'Clarke', 'Griffin', 5000, '1999-11-26', 'Skaikru');

select * from Employees;
desc Employees;

######################## Create table "Bonus" with `EmpId` as a foreign key ###########################
-- create table Bonus(
-- EmpId int,
-- BonusDate datetime,
-- BonusAmount int,
-- foreign key(EmpID) references Employees.EmpID
-- );
-- Error Code: 1239. Incorrect foreign key definition for 'foreign key without name': Key reference and table reference don't match

create table if not exists Bonus(
EmpId int,
BonusDate datetime,
BonusAmount int,
foreign key(EmpID) references Employees(EmpID)
on delete cascade  
# Basically, it ensures that if a particular record gets deleted in the parent table, same's gon' happen in the child table.
);

# To delete all records from a table
SET SQL_SAFE_UPDATES = 0;
DELETE from Bonus;

# Insert some records into "Bonus"
insert into Bonus (EmpID, BonusDate, BonusAmount) values
(4, '2000-01-05', 25000),
(1, '2000-01-06', 23000),
(3, '2005-01-18', 7000),
(5, '2004-01-05', 4000),
(2, '2002-01-31', 30000);
-- (7, '2004-01-14', 25000);  # SQL won't allow a new record to be uploaded into a child date!

select * from Bonus;
desc Bonus;

################### Create table "EmpDesignation" with EmpID as a foreign key #########################
drop table EmpDesignation;
create table if not exists EmpDesignation(
EmpID int,
Designation varchar(30),
DesignationDate date,
foreign key fk_desig(EmpID) references Employees(EmpID)
on delete cascade
);

# Insert some records into "EmpDesignation"
insert into EmpDesignation values 
(5, 'Wanheda', '2000-2-14'),
(4, 'Heda (Commander)', '1999-2-14'),
(2, 'War-hero', '2001-1-20'),
(1, NULL, '2000-2-15'),
(3, 'King of Azgeda', '2000-3-14');

select * from EmpDesignation;
desc EmpDesignation;

##################### Let's perform a JOIN operation on "Employees" and "Bonus" #######################
select * from Employees natural join Bonus;

####################### Let's create a VIEW of the above joined table #################################
create view employees_plus_bonus as select * from Employees natural join Bonus;
select * from employees_plus_bonus;

####################### Let's tryna perform JOIN operation on 3 tables ################################
select * from Employees natural join Bonus natural join EmpDesignation;
