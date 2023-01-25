#################################### MySQL Indexes #############################################
# `CREATE INDEX` statement is used to create indexes in tables.
-- The indexes are used to retrieve data from the db more quickly than others.
-- Time difference can be too large when we million of records.
-- The user can't see the indexes, they're just used to speed up queries/searches.

-- In Layman's terms, indexing a column in a table is similar to getting to a desired page with the help of index table 
-- ..that's available on one of first few pages of the books. If we don't use that index table, it prolly will take forever
-- ..to reach to a desired page.

# How does Indexing works?
-- When we're adding an index to the table, we're telling the database that a certain column is more important to us.
-- The time efficiency that we get from using the indexes will be visible to the naked eye, when we have large datasets like, 
-- ..say illions of records. 
-- MySQL will literally copy the data that we indexed and locate it elsewhere.

# NOTE: (Kinda disadvantage) Updating a table with index will take more time than updating it otherwise.
-- It's because the indexes will also need an update.
-- Thus it's better to create indexes only on those columns that'll be frequently searched against.

use the_100;
show tables;
select * from pirates;
desc pirates;

# Creating the Indexes
CREATE INDEX idx_devil_fruit on pirates(DevilFruit);
CREATE INDEX idx_abs_name on pirates(Name, LastName);
desc pirates;

# Is there any way to specifically call upon indexes?
-- Nope! Just execute the queries as usual and the result will be demonstrated by the time taken to execute that query,
-- ..provided we're dealing with large datasets.

select name, lastname from pirates;
select name, lastname from pirates where name='luffy';

# `SHOW INDEX` Statement
show index from pirates;

# BTree Indexing: 
-- A B-tree index creates a multi-level tree structure that breaks a database down into fixed-size blocks or pages. 
-- Each level of this tree can be used to link those pages via an address location, allowing one page (known as a node, or internal page)
-- ..to refer to another with leaf pages at the lowest level.

-- As the name implies, the B-tree index is a tree data structure with a root and nodes. 
-- The tree is balanced because the root node is the index value that splits the range of values found in the index column.

# NOTES: 
-- Certain constraints created in MySQL such as primary keys or unique keys are stored in a B-tree index format. 
-- Similar to Oracle, B-tree indexes are the default for new indexes. 
-- The query optimizer in MySQL can use B-tree indexes when handling equality and range queries on data.
