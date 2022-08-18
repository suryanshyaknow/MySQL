show databases;

create database rev;
use rev;

drop table magic_knights;

# create a table
create table if not exists magic_knights(
id int auto_increment,
Knight_name varchar(50),
mana_attribute varchar(50),
ranking varchar(50),
primary key(Id)
# There can only be one auto column and it must be defined as a key
);

select * from magic_knights;

# Inserting vals into magic_knights
insert into magic_knights (Knight_name, mana_attribute, ranking)
values 
('Julius Novachrono', 'time manipulation', 'Wizard King'),
('Yami Sukehiro', 'dark magic', 'Captain'),
('Fuegoleon Vermillion', 'flame magic', 'Captain'),
('Mereleona Vermillion', 'flame magic', 'Royal Knights Captain');

select * from magic_knights;

insert into magic_knights (Knight_name, mana_attribute, ranking)
values 
('Asta', 'anti-magic', NULL),
('Sekke', NULL, NUll);

# ( is Null) & (is not NUll)
# NULL --> vals that are missing
select * from magic_knights where ranking is null;
select * from magic_knights where mana_attribute is null;
select * from magic_knights where mana_attribute is not null;

# UPDATE statement to replace null vals
update magic_knights set mana_attribute='somewhat barrier kinda'
where mana_attribute is null;

SET SQL_SAFE_UPDATES = 0;
select * from magic_knights;

# DELETE statement
delete from magic_knights where knight_name='Sekke';
select * from magic_knights;

# ALTER statement
alter table magic_knights add status varchar(30);

alter table magic_knights add birth_year date;
alter table magic_knights modify column birth_year year; 

# Insert values into the new column created
update magic_knights set status = 'Royal' where id=1;
update magic_knights set status = 'Foriegner' where id=2;
update magic_knights set status = 'Royal' where id=3;
update magic_knights set status = 'Royal' where id=4;
update magic_knights set status = 'Peasant' where id=5;

update magic_knights set birth_year = '1976' where id=1;
update magic_knights set birth_year = '1990' where id=2;
update magic_knights set birth_year = '1991' where id=3;
update magic_knights set birth_year = '1986' where id=4;
update magic_knights set birth_year = '2004' where id=5;

select * from magic_knights;

desc magic_knights;

# using alter to drop column
alter table magic_knights drop column birth_year;

# using alter to rename a column
alter table magic_knights rename column Knight_name to knight_name;





