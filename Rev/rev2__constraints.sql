# SQL Constraints
/*
SQL Constraints are used to specify any rules for the records in a table.
--> Can be used to limit the type of data that can go into a table.
--> Ensures the ACCURACY and Reliablity of the records in the table, 
and if there's any violation between the constraints and the records action,
the action will be aborted.
--> can be column-level or table-level.

1. Not Null
2. Unique (--> to uniquely identify a record)
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/
 use rev;

drop table pirates;
 create table pirates(
 Name varchar(30) not null,
 MiddleName varchar(30),
 LastName varchar(30) not null,
 DevilFruit varchar(30),
 Crew varchar(30),
 RankWithinCrew int not null,
 Recognition varchar(30) not null,
 unique(Name, LastName)
 );
 
 DESC pirates;
 /* Note: Name and LastName columns are shown to have primary keys,
 but we didn't set it explicitly, this demonstrates the fact that
 PRIMARY KEY = UNIQUE KEY + NOT NULL
 */
 
 # inseritnf vals into pirates
insert into pirates values
('Luffy', 'D.', 'Monkey', 'GomuGomu nomi', 'Mugiwara no Ichimei', 1, '5th Emperor'),
('Zoro', null, 'Roronoa', null, 'Mugiwara Ichimei', 2, 'Worst-Generation'),
('Law', 'D. Water', 'Trafalgar', 'OpeOpe nomi', 'Hearts no Ichimei', 1, 'Worst-Generation'),
('Kid', null, 'Yustas', 'Magnetism no mi', 'Kiddo no Ichimei', 1, 'Worst-Generation'),
('Sanji', null, 'Vinsmoke', null, 'Mugiwara no Ichimei', 3, 'Kuro no Ashi'),
('Luffy', 'D.', 'Saru', 'Gomu-Gomu no mi', 'Mugiwara Ichimei', 1, '5th Emperor');

/* Note: Any new entry having Name='Luffy' and LastName='Monkey' altogether will violate the constraint,
and it won't be allowed any entry into the pirates,
*/
select * from pirates;

# Alter statement to ADD constraints
alter table pirates ADD unique(DevilFruit);

insert into pirates values
# ('Teach', 'D.', 'Marshall', 'GomuGomu nomi', 'Kurohige no Ichimei', '1', 'Yonko')
# --> won't work cuz now DevilFruit column has UNIQUE key
('Teach', 'D.', 'Marshall', 'YamiYami nomi', 'Kurohige no Ichimei', '1', 'Yonko');

select * from pirates;

# Let's set the UNIQUE constraint to the Crew column that is already having duplicate values:
alter table pirates ADD unique(Crew); 
# Error: Duplicate entry 'Mugiwara no ichimei' for key 'pirates.Crew'

DESC pirates;

# Giving names to the constraints
alter table pirates
add constraint uc_pirates unique(Name, LastName); # duplicate index (deprecated)

alter table pirates
add constraint uc_pirates1 unique(Name, LastName, DevilFruit);

alter table pirates
add constraint uc_pirates3 unique(RankWithinCrew, recognition); # already vioalating, thats why not allowed
select * from pirates;

# Trying to remove that duplicate constraint and see whether it's able to remove duplicate only or the both..
DESC pirates;
alter table pirates drop INDEX uc_pirates; 
# alter table pirates drop primary key uc_pirates; ---> won't work!
DESC pirates;
insert into pirates values
('Teach', 'ASSHOLE', 'Marshall', 'YamiYami nomi', 'Blackbeard Pirates', '1', 'Emperor');
# --> Thus the Error Code: 1062 demonstrates that by dropping the index we were only able to remove the duplicate constraint.

------------------------------------- PRIMARY KEY ---------------------------------------------------------------------------
 
 drop table kaizoku;
 create table if not exists Kaizoku(
 Name varchar(30),
 MiddleName varchar(30),
 LastName varchar(30),
 DevilFruit varchar(30),
 Crew varchar(30),
 RankWithinCrew int,
 Recognition varchar(30) not null,
 constraint pk_kaizoku primary key(Name, MiddleName, DevilFruit)
 
 # making sure that a kaizoku is having absolute unique name and can't be allowed to have same devil fruit as some other's
 );
 
 DESC Kaizoku;
 alter table Kaizoku
 # drop index pk_kaizoku; --> Not gonna work, probably because a table can only have single primary key
 drop primary key;
 DESC Kaizoku;
 # Woah! one AMAZING finding here: After dropping the pk, vals that were pk priorly are still not allowed to have null vals.
 
 alter table Kaizoku
 add constraint pk_kaizoku primary key(Name, LastName, DevilFruit);
 
 # inserting vals into table Kaizoku..
 insert into Kaizoku values
('Luffy', 'D.', 'Monkey', 'GomuGomu nomi', 'Mugiwara no Ichimei', 1, '5th Emperor'),
('Zoro', null, 'Roronoa', null, 'Mugiwara Ichimei', 2, 'Worst-Generation'),
('Law', 'D. Water', 'Trafalgar', 'OpeOpe nomi', 'Hearts no Ichimei', 1, 'Worst-Generation'),
('Kid', null, 'Yustas', 'Magnetism no mi', 'Kiddo no Ichimei', 1, 'Worst-Generation'),
('Sanji', null, 'Vinsmoke', null, 'Mugiwara no Ichimei', 3, 'Kuro no Ashi'),
('Luffy', 'D.', 'Saru', 'Gomu-Gomu no mi', 'Mugiwara Ichimei', 1, '5th Emperor');

# findings (after declaring PRIMARY KEY):
# --> 1. Column 'LastName' cannot be null.
 alter table Kaizoku modify MiddleName varchar(30) null;
 DESC kaizoku;
 
# --> 2. Column 'DevilFruit' cannot be null.
alter table Kaizoku modify DevilFruit varchar(30) null;
# --> All parts of a PRIMARY KEY cannot and must not be NULL in any way.







 
 









