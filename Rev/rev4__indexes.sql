/*--------------------------------- MySQL Indexes ---------------------------------------------
CREATE INDEX statement is used to create indexes in tables.
--> The indexes are used to retrieve data from the database more quickly than others.
	Time difference can be too large when we have million of records.
--> The users can't see the indexes, they are just used to speed up queries/searches.

Note: Kinda Disadvantage: Updating the table with index will take more time than updating otherwise.
--> It's because the indexes will also need an update.
Thus it's better to create indexes on those columns that will be frequently searched against.

Layman's example: A book having index table and with the help of that indexe table, we getting to the page we want.
If we don't use indexes then probably we'll take forever to reach to the desired page. 

Clearer Picture: When you're adding an index you are just telling the database that that a certain column is important for you.
__> The time efficiency that we get from using indexes will be visible to the naked eye,
when we have large datasets say, millions of records.
___> MySQL will literally take the data of the index made and loacte it to some other separate location.
*/
use rev;
show tables;
select * from pirates; 
desc pirates;

# Creating Index 
create index index_devilfruit on pirates(DevilFruit);
create index index_absolute_name on pirates(Name, LastName);
desc pirates;

# Using the Index
# Ain't no particular way, just use the queries as usual and the result will be demonstrated in time taken.
select Name, LastName from pirates where name="Luffy";

# Showing the Indexes
SHOW INDEX FROM pirates;
 