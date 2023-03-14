show databases;
use Rfam;


# i. How many types of tigers can be found in the taxonomy table of the dataset?
SELECT COUNT(*) 
FROM taxonomy 
WHERE species LIKE "%Panthera tigris%";

-- What is the "ncbi_id" of the Sumatran Tiger? (hint: use the biological name of the tiger)
SELECT ncbi_id 
FROM taxonomy 
WHERE species LIKE "%Sumatran tiger%";


# b. Find all the columns that can be used to connect the tables in the given database.
-- As per my understanding, the columns which can be used to connect the tables would be the ones having 
-- .."primary key" and "foreign key".
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA="Rfam" AND (COLUMN_KEY="PRI" OR COLUMN_KEY="MUL");


# c. Which type of rice has the longest DNA sequence? (hint: use the rfamseq and the taxonomy tables)
-- Biological name of "Rice" = "Oryza sativa"
SELECT taxo.species, MAX(seq.length)
FROM rfamseq AS seq
INNER JOIN 
(
	SELECT ncbi_id, species FROM taxonomy WHERE species LIKE "%Oryza sativa%"
) AS taxo
ON seq.ncbi_id = taxo.ncbi_id 
GROUP BY taxo.species 
ORDER BY MAX(seq.length) DESC LIMIT 1;
-- Oryza sativa Indica Group	47244934

# OR

SELECT t.species, r.length 
FROM rfamseq AS r
INNER JOIN 
(
	SELECT ncbi_id, species FROM taxonomy WHERE species LIKE "%Oryza sativa%"
) AS t
ON r.ncbi_id = t.ncbi_id 
ORDER BY r.length DESC LIMIT 1;
-- Oryza sativa Indica Group	47244934

# WHEREAS the following query doesnt make any fucking sense

SELECT taxo.species 
FROM rfamseq AS seq
INNER JOIN 
(
	SELECT ncbi_id, species FROM taxonomy WHERE species LIKE "%Oryza sativa%"
) AS taxo
ON seq.ncbi_id = taxo.ncbi_id
ORDER BY MAX(seq.length);
-- Of course it's gonna give wrong results!


# d. We want to paginate a list of the family names and their longest DNA sequence lengths (in descending order of length) 
-- where only families that have DNA sequence lengths greater than 1,000,000 are included. Give a query that will return 
-- the 9th page when there are 15 results per page. 
-- (Hint: We need the family accession ID, family name and the maximum length in the results.)
SELECT 
	fam.rfam_acc family_accession_id, 
	fam.description family_name, 
	MAX(seq.length) longest_dna_seq_length
FROM family AS fam
INNER JOIN rfamseq AS seq
ON fam.auto_wiki = seq.ncbi_id
WHERE seq.length >= 1000000
GROUP BY family_name
ORDER BY MAX(seq.length) DESC
LIMIT 120, 135;  # Most probably there are not as many records so as to reach the 9th page! 
-- Offsetting (skipping) the first 120 rows.

