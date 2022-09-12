------------------------------ MySQL Joins --------------------------------
/*
i. Inner Join
ii. Left Join
iii. Right Join
iv. Full Join
v. Natural Join
vi. Cross Join --> All possibilties of left table in regard to the right table.
*/
use rev;
show tables;

select * from magic_knights;
select * from magic_squads;

# Inner join
select magic_squads.id, knight_name, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
inner join magic_squads
on magic_knights.id = magic_squads.id
order by id;

# Left join --> all records from the left table and matching from the right
select magic_knights.id, knight_name, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
left join magic_squads
on magic_knights.id = magic_squads.id
order by id;

# Right join --> all records from the right table and matching from the right
select magic_knights.id, knight_name, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
right join magic_squads
on magic_knights.id = magic_squads.id
order by id;

# Full Outer Join
select magic_knights.id, knight_name, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
left join magic_squads
on magic_knights.id = magic_squads.id
UNION
select magic_knights.id, knight_name, squad, mana_attribute, ranking, rank_within_squad, status from magic_knights
right join magic_squads
on magic_knights.id = magic_squads.id
order by id;

# Cross Join
select * from magic_knights cross join magic_squads;
select * from magic_squads cross join magic_knights;

# Natural Join --> kinda inner join without repeating the common id
select * from magic_knights natural join magic_squads
order by id;

select * from magic_squads natural join magic_knights
order by id;



