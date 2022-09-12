# ------------------------ CONSTRAINTS continued.. -------------------------------------------
show tables;
select * from magic_knights;
desc magic_knights;

 create table if not exists magic_knights2(
id int,
knight_name varchar(50),
mana_attribute varchar(50),
ranking varchar(50),
primary key(id)
# There can only be one auto column and it must be defined as a key
);

insert into magic_knights2 values(
'1',
'Zora',
'Ash',
'junior');

insert into magic_knights2 values(
null,
'Henry',
'Recombination',
'junior');
# Column Id can't be null!

desc magic_knights2;

# -------------------------- FORIEGN KEY ---------------------------------------------
/* 
--> The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
--> A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
--> The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table. 
*/
select * from magic_knights;
create table magic_squads(
id int,
squad varchar(25),
rank_within_squad int,
constraint fk_magic_squads foreign key(id) references magic_knights(id)
);
desc magic_squads;

insert into magic_squads values
(5, 'Black Bulls', 2),
(7, 'Golden Dawn', 2),
(3, 'Crimson Lion Kings', 1),
(4, 'Royal Knights', 1),
(2, 'Black Bulls', 1),
(1, 'Gray Deers', 1); # what?! Can't pdate or add child row

/* Let's drop foreign key and then update it after adding values
--> alter table magic_squads drop INDEX fk_magic_squads; # failed! */
alter table magic_squads drop foreign key fk_magic_squads;

select *  from magic_squads; 
# after dropping the key and adding the records, now we'll again add the foreign key
alter table magic_squads
add foreign key(id) references magic_knights(id); # Error Code: 1452, basically gotta drop Yuno's row cuz he wasn't in the magiv_knights

SET SQL_SAFE_UPDATES = 0;
delete from magic_squads where squad = 'Golden Dawn';
alter table magic_squads
add foreign key(id) references magic_knights(id); 

select * from magic_knights;
select * from magic_squads;

# LET'S PERFORM A JOIN OPERATION WHILE WE'RE AT IT
select * from magic_knights
inner join magic_squads
on magic_knights.id = magic_squads.id; # The INNER JOIN keyword selects records that have matching values in both tables.

# LEFT JOIN
/*
The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2).
The result is 0 records from the right side, if there is no match.
*/
select * from magic_knights
LEFT join magic_squads
on magic_knights.id = magic_squads.id;

# ------------------------------------------------------------------------------------------------
insert into magic_knights (knight_name, mana_attribute, ranking, status) values
('Yuno', 'wind', 'level 4 Senior Magic Knight', 'Peasant');

insert into magic_knights (id, knight_name, mana_attribute, ranking, status) values
('9', 'Klaus', 'steel', 'level 3 Senior Magic Knight', 'Royal');

insert into magic_knights (knight_name, mana_attribute, ranking, status) values
('Mimosa', 'plant', 'level 5 Senior Magic Knight', 'Royal');

# ------------------------------------------------------------------------------------------------

### ----------------------------- CHECK CONSTRAINTS ----------------------------------------------
# __> TO IMPOSE SOME CONDITIONS ON A CERATIN COLUMN
select * from magic_knights;

alter table magic_knights add constraint chk_magic_knights check(id<10);
#__> check constraint can't refer to an auto-increement column.

### --------------------------- DEFAULT CONSTRAINT -----------------------------------------------
alter table magic_knights modify column ranking varchar(30) default 'None';
desc magic_knights;
select * from magic_knights;

#__> dropping deafult constraint
alter table magic_knights alter ranking drop default;
desc magic_knights;

