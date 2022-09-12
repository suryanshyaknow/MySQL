# ---------------------------- VIEWS --------------------------------------
/* 
__> View is a virtual table based on the result set of an SQL query.
__> In a view we can have any number of rows and columns. 

Example: Suppose I am DBA in a company and my junior asks me to provide him some of the records or columns from an internal table saying 
that those are important for him, what can I do is I can create a view of those records or columns or whatever and can send him over the
view's name. Because I'm not obliged to share whole records with him.

__> Views won't work in groupby, aggregate functions clauses, queries which involves updating something and sub-queries.
*/

use rev;
create table maho_warriors(
warrior_id int auto_increment,
name varchar(30),
lastname varchar(30),
age int,
primary key(warrior_id)
);

insert into maho_warriors (name, lastname, age) values
('Yami', 'Sukehiro', '28'),
('Mereoleona', 'Vermillion', '34'),
('Asta', NULL, '17'),
('William', 'Vangeance', '27'),
('Yuno', 'Gregorris', '17'),
('Julius', 'Novachrono', '49');

select * from maho_warriors;

create table maho_department(
warrior_id int,
mana_department varchar(30) not null,
rank_ varchar(25) not null,
foreign key(warrior_id) references maho_warriors(warrior_id));

alter table maho_department rename column mana_department to magic_squad;
select * from maho_department;
desc maho_department;

insert into maho_department values
(1, 'Black-Bulls', 'Squad Captain'),
(2, 'Royal-Knights', 'Squad Captain'),
(4, 'Golden_Dawn', 'Squad Captain'),
(5, 'Golden_Dawn', 'Squad Vice-Captain'),
(6, 'Grey-Deers', 'Mahote (Wizard-King)'),
(3, 'Black-Bulls', 'Intermediate Level 1');

select * from maho_warriors;
select * from maho_department;

# Creating a view by performing an inner-join
create view clover_warriors as 
select  name, lastname, age, magic_squad, rank_ from maho_warriors
inner join maho_department on maho_warriors.warrior_id = maho_department.warrior_id; 

select * from clover_warriors;
