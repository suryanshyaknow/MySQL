show databases;
-- drop database airflow_db;
create database the_100;
use the_100;

############################ Create a table ##################################
drop table if exists magic_knights;
create table if not exists magic_knights(
id int auto_increment,
knight_name varchar(50),
mana_attribute varchar(50),
ranking varchar(50),
primary key(id)
-- There can only be one auto column and it must be defined as `primary key`.
);

select * from magic_knights;

################# Insert entries into the created table ######################
insert into magic_knights (knight_name, mana_attribute, ranking)
values 
('Julius Novachrono', 'time manipulation', 'Wizard King'),
('Yami Sukehiro', 'dark magic', 'Captain'),
('Fuegoleon Vermillion', 'flame magic', 'Captain'),
('Mereleona Vermillion', 'flame magic', 'Royal Knights Captain');

select * from magic_knights;

################# Insert NULL entries into the table #########################
insert into magic_knights (knight_name, mana_attribute, ranking)
values
('Asta', 'anti-magic', NULL),
('Sekke', NULL, NULL);

select * from magic_knights;

################### `IS NULL` and `IS NOT NULL` ##############################
select * from magic_knights where ranking is null;
select * from magic_knights where mana_attribute is not null;

########################### UPDATE Statement #################################
update magic_knights set mana_attribute="somewhat kinda barrier" where mana_attribute is null;
# Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
# To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

SET SQL_SAFE_UPDATES = 0;
# Execute the line no. 42 here! 
select * from magic_knights;

############################ DELETE Statement ################################
delete from magic_knights where ranking is null;
select * from magic_knights;

############################ ALTER Statement #################################
alter table magic_knights add status varchar(30);  # Add a column named "status" into "magic_knights"
alter table magic_knights add birth_year date;  # Add a "birth_year" column of `date` dtype into "magic_knights"
alter table magic_knights modify column birth_year year;  # Change the dtype of "birth_year" column from `date` to `year`

-- alter table magic_knights drop column birth_year;  # To delete a column using ALTER statement
alter table magic_knights rename column knight_name to knights;  # To rename a column using ALTER statement

alter table magic_knights rename magic_freshmen;  # To reanme a table itself using ALTER statement
select * from magic_freshmen;
alter table magic_freshmen rename magic_knights;

select * from magic_knights;
DESC magic_knights;  # To get a brief description of a table

###################### Insert records into the newly created columns #############################
# Into "status" column
update magic_knights set status = 'Royal' where id=1;
update magic_knights set status = 'Foriegner' where id=2;
update magic_knights set status = 'Royal' where id=3;
update magic_knights set status = 'Royal' where id=4;
update magic_knights set status = 'Peasant' where id=5;

# Into "birth_year" column
update magic_knights set birth_year = '1976' where id=1;
update magic_knights set birth_year = '1990' where id=2;
update magic_knights set birth_year = '1991' where id=3;
update magic_knights set birth_year = '1986' where id=4;
update magic_knights set birth_year = '2004' where id=5;

select * from magic_knights;













