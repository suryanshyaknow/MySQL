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
DELETE FROM magic_knights where ranking is null;
select * from magic_knights;

############################ ALTER Statement #################################
ALTER table magic_knights ADD status varchar(30);  # Add a column named "status" into "magic_knights"
ALTER table magic_knights ADD birth_year date;  # Add a "birth_year" column of `date` dtype into "magic_knights"
ALTER table magic_knights MODIFY column birth_year year;  # Change the dtype of "birth_year" column from `date` to `year`

-- alter table magic_knights drop column birth_year;  # To delete a column using ALTER statement
ALTER table magic_knights RENAME column knight_name to knights;  # To rename a column using ALTER statement

ALTER table magic_knights RENAME magic_freshmen;  # To reanme a table itself using ALTER statement
select * from magic_freshmen;
ALTER table magic_freshmen RENAME magic_knights;

select * from magic_knights;
DESC magic_knights;  # To get a brief description of a table

###################### Insert records into the newly created columns #############################
# Into "status" column
UPDATE magic_knights SET status = 'Royal' where id=1;
UPDATE magic_knights SET status = 'Foriegner' where id=2;
UPDATE magic_knights SET status = 'Royal' where id=3;
UPDATE magic_knights SET status = 'Royal' where id=4;
UPDATE magic_knights SET status = 'Peasant' where id=5;

# Into "birth_year" column
UPDATE magic_knights SET birth_year = '1976' where id=1;
UPDATE magic_knights SET birth_year = '1990' where id=2;
UPDATE magic_knights SET birth_year = '1991' where id=3;
UPDATE magic_knights SET birth_year = '1986' where id=4;
UPDATE magic_knights SET birth_year = '2004' where id=5;

select * from magic_knights;

######################## Create "Temporary" Table ############################
# But WHY?
-- They are faster than creating the real tables.
-- They allow us to simplify complex queries using subsets and joins.
-- They'll be deleted when current session is terminated.

show tables;
select * from magic_knights; 
create TEMPORARY table Captains as
(
select * from magic_knights where ranking="Captain"
);
select * from Captains;














