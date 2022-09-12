--------------------------- Stored Procedures --------------------------------------------
/*
The STORED PROCEDURE is a prepared SQL query that you can save so that the query can be reused over and over again.
--> So, if we have a SQL query that we write over and over again, we can keep it as a stored procedure and execute it. 
--> We can also pass parameters to a stored procedure so that the stored procedure can act based on the parameter value that is given.

Syntax:
DELIMITER //
CREATE PROCEDURE procedure_name()
BEGIN
sql_statement; // any complex query
END //
DELIMITER ;
*/
use rev;
show tables;

select * from magic_knights;
select * from clover_warriors;

# Stored Procedures using IN parameter 
/*
--> IN is the default mode. When you define an IN parameter in a stored procedure, the calling program has to pass an argument to 
the stored procedure.
--> In addition, the value of an IN parameter is protected. It means that even you change the value of the IN parameter inside the
stored procedure, its original value is unchanged after the stored procedure ends.
--> In other words, the stored procedure only works on the copy of the IN parameter.
*/
call getBy_squad('Golden_Dawn');
call getBy_squad('Black-Bulls');

# Stored Procedures using OUT parameter
/*
--> The value of an OUT parameter can be changed inside the stored procedure and its new value is passed back to the calling program.
Note: Notice that the stored procedure cannot access the initial value of the OUT parameter when it starts.
*/
call numof_knights('Golden_Dawn', @members);
select @members;

# Stored Procedures using INOUT parameters
/*
An INOUT parameter is a combination of IN and OUT parameters. It means that the calling program may pass the argument, 
and the stored procedure can modify the INOUT parameter and pass the new value back to the calling program.
*/
set @counter = 1999;
call setCounter(@counter, 11);
select @counter as age;

call demo2();
