################################### CONSTRAINTS Continued.. #############################################
use the_100;
show tables;

select * from magic_knights;
insert into magic_knights values (5, 'Asta', 'Anti-magic', null, 'peasant', 2000);
DESC magic_knights;

######################################## FOREIGN KEY ####################################################
-- A foreign key constraint is used to prevent actions that would destroy the links between tables.
-- A foreign key is a field (or collection of fields) in one table, that refers to the primary key in another table.
-- The table with the foreign key is called the child table, and the table with the primary key is called the reference or parent table.

# Create the table "magic_squads"
drop table magic_squads;
create table magic_squads(
id int,
squad varchar(25),
rank_within_squad int,
constraint fk_magic_squads foreign key(id) references magic_knights(id)
);
desc magic_squads;

# Insert some records into "magic_squads"
insert into magic_squads values
(5, 'Black Bulls', 2),
(7, 'Golden Dawn', 2),
(3, 'Crimson Lion Kings', 1),
(4, 'Royal Knights', 1),
(2, 'Black Bulls', 1),
(1, 'Gray Deers', 1);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
-- (`the_100`.`magic_squads`, CONSTRAINT `fk_magic_squads` FOREIGN KEY (`id`) REFERENCES `magic_knights` (`id`))
-- => We can't even update the child table, is that it?!

select * from magic_squads;
DESC magic_squads;

# So now, let's drop the foreign key and reset it again after the records get updated into the child table..
alter table magic_squads drop index fk_magic_squads;  # failed!
-- Error Code: 1553. Cannot drop index 'fk_magic_squads': needed in a foreign key constraint
alter table magic_squads drop foreign key fk_magic_squads;

# Now that we dropped the foreign key, let's update the records into the "magic_squads"..
-- Execute the line no. 31 here!
select * from magic_squads;

# Let's reset the foreign key constraint
alter table magic_squads
add foreign key(id) references magic_knights(id);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
-- (`the_100`.`#sql-13b8_c`, CONSTRAINT `magic_squads_ibfk_1` FOREIGN KEY (`id`) REFERENCES `magic_knights` (`id`))
-- => So basically we have to drop Yuno's record from the child table since it's not in the parent table.
 
# Dropping Yuno's record and re-adding the foreign key..
SET SQL_SAFE_UPDATES = 0;
delete from magic_squads where squad='Golden Dawn';
select * from magic_squads;
-- Execute the line no. 50 to re-add the foreign key constraint! 
DESC magic_squads;

######################################### LEFT JOIN #####################################################
# Let's perform some join operations while we're at it..
-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2).
-- The result is 0 records from the right side, if there is no match.
select * from magic_knights as mk
LEFT JOIN magic_squads as ms on mk.id = ms.id;

select * from magic_squads as ms 
LEFT JOIN magic_knights as mk on ms.id = mk.id;

########################## Insert some records into "Magic_Knights" #####################################
insert into magic_knights (knights, mana_attribute, ranking, status) values
('Yuno', 'wind', 'level 4 Senior Magic Knight', 'Peasant');

insert into magic_knights (id, knights, mana_attribute, ranking, status) values
('9', 'Klaus', 'steel', 'level 3 Senior Magic Knight', 'Royal');

insert into magic_knights (knights, mana_attribute, ranking, status) values
('Mimosa', 'plant', 'level 5 Senior Magic Knight', 'Royal');

select * from magic_knights;
DESC magic_knights;

##################################### CHECK CONSTRAINT ##################################################
-- To impose some conditions on a certain column.
alter table magic_knights add constraint chk_magic_knights check(id<0);
-- Error Code: 3818. Check constraint 'chk_magic_knights' cannot refer to an auto-increment column.

##################################### DEFAULT CONSTRAINT ################################################
alter table magic_knights modify column ranking varchar(30) default 'None';
DESC magic_knights;
insert into magic_knights (knights, mana_attribute, status, birth_year)
values ('Suryansh', 'Sun', 'One-for-All', 1999);
select * from magic_knights;  # Observe 11th record..

# Dropping Default constraint..
alter table magic_knights alter ranking drop default;
DESC magic_knights;



