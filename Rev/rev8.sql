create database questions;
use questions;

# Q1
create table employee (
EId int, 
FirstName varchar(30), 
LastName varchar(30), 
salary int, 
JoiningDate datetime, 
Department varchar(30),
primary key(EId)
);
alter table employee
modify column Eid int auto_increment; # won't execute!
desc employee;

create table bonus (
EId int,
BonusDate date,
BonusAmount int,
foreign key(EId) references employee(EId)
on delete cascade
);
desc bonus;

create table designation(
EId int,
Designation varchar(25),
DesigDate date,
foreign key(EId) references employee(EId)
on delete cascade # --> if any EId get's deleted in the parent table, same's gonna happen in the child table!
);
desc designation;