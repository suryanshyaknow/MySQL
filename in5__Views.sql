######################################### VIEWS ####################################################
# `CREATE VIEW`
-- A View is a virtual table based on the result-set of a sql query.
-- A View contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
-- We can add SQL statements and functions to a view and present the data as if the data were coming from one single table.

# Example: Say, I am DBA in a company and my junior asks me to provide him some of the records or columns from an internal table. Knowing
-- ..that I'm not obliged to share all records with him, what I could do is to create a View of those records or columns or whatever he asked
-- ..and send him over the view's name.

# NOTE: Views won't work in groupby, aggregate functions clauses, queries which involves updating something and sub-queries.

use the_100;
show tables;

################################### Create table "Warriors" ########################################
-- drop table Warriors;
create table Warriors(
warrior_id int auto_increment,
name varchar(30),
lastname varchar(30)default "lnu",
age int,
primary key(warrior_id)
);

# Insert some records into "Warriors"
insert into Warriors (name, lastname, age) values
('Yami', 'Sukehiro', '28'),
('Mereoleona', 'Vermillion', '34'),
('Asta', NULL, '17'),
('William', 'Vangeance', '27'),
('Yuno', 'Gregorris', '17'),
('Julius', 'Novachrono', '49');

insert into Warriors (name, age) values ("Suryansh", 22);

select * from Warriors;

##################################### Create table "Squads" ########################################
create table squads(
warrior_id int,
squad varchar(30) not null,
rank_ varchar(25) not null,
foreign key(warrior_id) references warriors(warrior_id));

drop table squads;

create table squads(
warrior_id int,
squad varchar(30) not null,
rank_ varchar(25) not null,
constraint fk_squads foreign key(warrior_id) references warriors(warrior_id));

# Insert some records into "Squads"
insert into squads values
(1, 'Black-Bulls', 'Squad Captain'),
(2, 'Royal-Knights', 'Squad Captain'),
(4, 'Golden_Dawn', 'Squad Captain'),
(5, 'Golden_Dawn', 'Squad Vice-Captain'),
(6, 'Grey-Deers', 'Mahote (Wizard-King)'),
(3, 'Black-Bulls', 'Intermediate Level 1');

select * from squads;
desc squads;

select * from warriors;
desc warriors;

############################# Create a VIEW performing an INNER JOIN ###############################
CREATE VIEW clover_warriors as 
select warriors.warrior_id, name, lastname, age, squad, rank_ from warriors
inner join squads on warriors.warrior_id = squads.warrior_id; 

select * from clover_warriors;

alter table clover_warriors
add column warrior_id int;
-- Error Code: 1347. 'the_100.clover_warriors' is not BASE TABLE

