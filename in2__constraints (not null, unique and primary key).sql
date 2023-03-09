############################ SQL Constraints ##################################
/* 
SQL Constraints are used to specify any rules for the records in a table.

--> Can be used to limit the type of data that can go into a table.
--> Ensures the ACCURACY and RELIABILITY of the records in the table, and if there's any violation between the constraints and the records action,
the action will be aborted.
--> Can be column-level as well as table-level.

1. Not Null
2. Unique (--> to uniquely identify a record)
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/

use the_100;
-- drop table pirates;

######################### Create table "pirates" ##############################
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
show tables;
DESC pirates;
-- NOTE: "Name" and "LastName" are shown to have primary keys even though we didn't set them explicitly.
-- This demonstrates the fact that PRIMARY KEY = UNIQUE KEY + NOT NULL

# Inserting records into "pirates"
insert into pirates values
('Luffy', 'D.', 'Monkey', 'GomuGomu nomi', 'Mugiwara no Ichimei', 1, '5th Emperor'),
('Zoro', null, 'Roronoa', null, 'Mugiwara Ichimei', 2, 'Worst-Generation'),
('Law', 'D. Water', 'Trafalgar', 'OpeOpe nomi', 'Hearts no Ichimei', 1, 'Worst-Generation'),
('Kid', null, 'Yustas', 'Magnetism no mi', 'Kiddo no Ichimei', 1, 'Worst-Generation'),
('Sanji', null, 'Vinsmoke', null, 'Mugiwara no Ichimei', 3, 'Kuro no Ashi'),
('Luffy', 'D.', 'Saru', 'Gomu-Gomu no mi', 'Mugiwara Ichimei', 1, '5th Emperor');

select * from pirates;

insert into pirates values ('Luffy', null, 'Monkey', 'Rubber-Rubber devilfruit', 'StrawHats', 1, '5th Yonkou');
-- Error Code: 1062. Duplicate entry 'Luffy-Monkey' for key 'pirates.Name'
-- NOTE: Any new entry having Name='Luffy' and LastName='Monkey' altogether is gonna violate the unique(Name, LastName) constraint,
-- and thus it won't be allowed into the "pirates".

#################### ALTER Statement to ADD constraints ################################
alter table pirates add unique(DevilFruit);  # Adding UNIQUE constraint onto "DevilFruit"

# Now , let's try appedning duplicate entriy into "DevilFruit"
insert into pirates values ('Teach', 'D.', 'Marshall', 'GomuGomu nomi', 'Kurohige no Ichimei', '1', 'Yonko');
-- Error Code: 1062. Duplicate entry 'GomuGomu nomi' for key 'pirates.DevilFruit'

insert into pirates values ('Teach', 'D.', 'Marshall', 'YamiYami nomi', 'Kurohige no Ichimei', '1', 'Yonko');
select * from pirates;

# Let's tryna set UNIQUE contraint to "Crew" column that's already having null vals
alter table pirates add unique(Crew); 
-- Error Code: 1062. Duplicate entry 'Mugiwara Ichimei' for key 'pirates.Crew'

#################### Giving names to constraints ################################
alter table pirates
add constraint uc_pirates unique(Name, LastName);
-- Duplicate index 'uc_pirates' defined on the table 'the_100.pirates'. This is deprecated and will be disallowed in a future release.

alter table pirates
add constraint uc_pirates1 unique(Name, LastName, DevilFruit);

# Tryna remove duplicate index "uc_pirates", and see if it's able to remove the duplicate index only or even the original one
DESC pirates;
alter table pirates drop index uc_pirates;
DESC pirates;  # No change in original index whatsoever!

############################ PRIMARY KEY ##################################
--  drop table kaizoku;
 create table if not exists Kaizoku(
 Name varchar(30),
 MiddleName varchar(30),
 LastName varchar(30),
 DevilFruit varchar(30),
 Crew varchar(30),
 RankWithinCrew int,
 Recognition varchar(30) not null,
 constraint pk_kaizoku primary key(Name, MiddleName, DevilFruit)
 -- NOTE: Making sure that a kaizoku is having absolute unique name and can't be allowed to have same devil fruit as any other's.
 );

# Drop PRIMARY KEY 
DESC kaizoku;
alter table kaizoku drop constraint pk_kaizoku; 
-- Not gonna work, probably because a table can only have one single primary key,
-- and as such it doesn't make any sense to name the single primary key.
alter table kaizoku drop primary key;
DESC kaizoku;
-- NOTE: Woah! one AMAZING finding here, after dropping the primary key, colums that were part of the pk priorly are still not allowed to have null entries.

# Set back the PRIMARY KEY constraint
alter table kaizoku add constraint primary key(Name, MiddleName, DevilFruit);

# Inserting records into "Kaizoku"
insert into Kaizoku values
('Luffy', 'D.', 'Monkey', 'GomuGomu nomi', 'Mugiwara no Ichimei', 1, '5th Emperor'),
('Zoro', null, 'Roronoa', null, 'Mugiwara Ichimei', 2, 'Worst-Generation'),
('Law', 'D. Water', 'Trafalgar', 'OpeOpe nomi', 'Hearts no Ichimei', 1, 'Worst-Generation'),
('Kid', null, 'Yustas', 'Magnetism no mi', 'Kiddo no Ichimei', 1, 'Worst-Generation'),
('Sanji', null, 'Vinsmoke', null, 'Mugiwara no Ichimei', 3, 'Kuro no Ashi'),
('Luffy', 'D.', 'Saru', 'Gomu-Gomu no mi', 'Mugiwara Ichimei', 1, '5th Emperor');

select * from kaizoku;

# Findings: After declaring the PRIMARY KEY(Name, LastName, DevilFruit),

-- 1. Column 'LastName' cannot be null.
 alter table Kaizoku modify MiddleName varchar(30) null;
 DESC kaizoku;
 
-- 2. Column 'DevilFruit' cannot be null.
alter table Kaizoku modify DevilFruit varchar(30) null;
-- None of the entries of a PRIMARY KEY field cannot and must not be NULL in any manner.