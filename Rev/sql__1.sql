use mydb1;
show tables;

select * from fitbit_data;

desc fitbit_data;

SET SQL_SAFE_UPDATES = 0;
SET SESSION sql_mode = '';
UPDATE fitbit_data
SET ActivityDate = str_to_date( ActivityDate, '%d-%m-%Y');
DESC mydb1.fitbit_data;

# Third most active person:
select Id, ActivityDate from mydb1.fitbit_data;

select * from fitbit_data;	
desc fitbit_data;

select * from junkster.fitbit_data;
desc junkster.fitbit_data;

alter table fitbit_data 
add column year1 date after ActivityDate; 





