################################## MySQL JOINS #######################################
# A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
-- Inner Join
-- Left Join
-- Right Join
-- Full Join
-- Natural Join
-- Cross Join => The CROSS JOIN is used to generate a paired combination of each row of the first table 
-- ..with each row of the second table. This join type is also known as Cartesian join.

# Example: Suppose that we are sitting in a coffee shop and we decide to order breakfast. 
-- ..Shortly, we will look at the menu and we will start thinking of which meal and drink combination could
-- ..be more tastier. Our brain will receive this signal and begin to generate all meal and drink combinations.

use the_100;
show tables;

select * from magic_knights;
select * from magic_squads;

################################### INNER JOIN #######################################
# The INNER JOIN selects the common rows between two tables.
select magic_squads.id, knights, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
inner join magic_squads
on magic_knights.id = magic_squads.id
order by id;

select * from magic_knights
inner join magic_squads
on magic_knights.id = magic_squads.id
order by magic_knights.id;

#################################### LEFT JOIN #######################################
# The LEFT JOIN selects all records from the left table and only matching records form the right.
select * from magic_knights
left join magic_squads
on magic_knights.id = magic_squads.id
order by magic_knights.id;
-- => All records from the "magic_knights" and matching ones from the "magic_squads",
-- ..and columns of the right table that are not present in left table have NULL entries.

select * from magic_knights; 
select * from magic_squads; 
insert into magic_squads values (11, 'Black Bulls', NULL);

select * from magic_squads
left join magic_knights
on magic_knights.id = magic_squads.id
order by magic_squads.id;

#################################### RIGHT JOIN ######################################
# The RIGHT JOIN selects all records from the right table and only matching ones from the left.
select * from magic_squads
right join magic_knights
on magic_squads.id = magic_knights.id
order by magic_knights.id;

################################# FULL OUTER JOIN ####################################
# The FULL OUTER JOIN/FULL JOIN returns the UNION of tables -- table1 and table2.

# NOTE: However, MySQL doesn't follow the `FULL OUTER JOIN` or `FULL JOIN` to perform the full outer join.
select * from magic_knights
full join magic_squads
on magic_knights.id = magic_squads.id;
-- Error Code: 1054. Unknown column 'magic_knights.id' in 'on clause'

# But it doesn't mean at all, we can't even perform the full outer join. Let's get on with it!
select magic_knights.id, knights, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
left join magic_squads
on magic_knights.id = magic_squads.id
UNION
select magic_knights.id, knights, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
right join magic_squads
on magic_knights.id = magic_squads.id
order by id;

# NOTE: The above query returns each record only once. Should we wanna have the resulting table contain duplicate records too,
-- ..use `UNION ALL` instead of `UNION`.

select magic_knights.id, knights, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
left join magic_squads
on magic_knights.id = magic_squads.id
UNION ALL
select magic_knights.id, knights, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
right join magic_squads
on magic_knights.id = magic_squads.id
order by id;

############################## CROSS/CARTESIAN JOIN ##################################
select * from magic_knights cross join magic_squads;
select * from magic_squads cross join magic_knights order by magic_squads.id;

################################## NATURAL JOIN ######################################
# A NATURAL JOIN is a type of join operation that creates an implicit join by combining tables 
-- ..based on columns with the same name and data type.
-- It kinda performs the INNER JOIN naturally!

select * from magic_knights natural join magic_squads;
-- We din't even need to write `on magic_knights.id = magic_squads.id`. It searched for the common columns
-- ..between the both table on its own.

select * from magic_squads natural join magic_knights;
-- Exact same drill!





