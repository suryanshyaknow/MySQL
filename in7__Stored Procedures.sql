################################## STORED PROCEDURES ##########################################
# The STORED PROCEDURE is a prepared SQL query that we can save so that it can be reused over and over again.
-- So, if we have a SQL query that we write over and over again, we can keep it as a stored procedure and execute it upon calling. 
-- We can also pass parameters to a stored procedure so that the stored procedure can act based on the parameter value that is given.

use the_100;
select * from warriors;

# Creating a Stored Procedure
DROP procedure IF EXISTS `get_warriors`;
DELIMITER $$
USE `the_100`$$
CREATE PROCEDURE get_warriors()
BEGIN
	select name from warriors;
END$$
DELIMITER ;

call get_warriors();  # how to call a stored procedure

########################### STORED PROCEDURES using IN param ##################################
# When we define an IN param in a stored procedure, the calling program has to pass an argument to the stored procedure.
-- ..IN is the default mode.

-- Additionally, the val of an IN param is protected. It means that even if you change the value of the IN param inside 
-- ..a stored procedure , its original val remains unchanged after the stored procedure ends. 
-- In other words, the stored procedure works only on the copy of the IN param.

# Creating a Stored Procedure using IN param
DROP procedure IF EXISTS `get_by_squad`;
DELIMITER $$
USE `the_100`$$
CREATE PROCEDURE get_by_squad(IN squad varchar(30))
BEGIN
select * from clover_warriors where clover_warriors.squad=squad;  # Don't confuse it by just mentionaing `where squad=squad`
END$$
DELIMITER ;

call get_by_squad('Black-Bulls');
call get_by_squad('Golden_Dawn');

select * from clover_warriors where clover_warriors.squad='Black-Bulls';
desc clover_warriors;

########################### STORED PROCEDURES using OUT param #################################
# The value of an OUT parameter can be changed inside the stored procedure and its new value is passed back to the calling program.
-- Notice that the stored procedure cannot access the initial value of the OUT parameter when it starts.

# Creating a Stored Procedure using OUT param
DROP procedure IF EXISTS `get_num_of_knights`;
DELIMITER $$
USE `the_100`$$
CREATE PROCEDURE get_num_of_knights(IN squad varchar(30), OUT knights int)
BEGIN
select count(*) into knights from clover_warriors where clover_warriors.squad=squad;
END$$
DELIMITER ;

call get_num_of_knights('Black-Bulls', @knights);  # @knights is a Session Variable.
select @knights as NumberOfKnights;

call get_num_of_knights('Golden_Dawn', @knights);
select @knights as NumberOfKnights;

########################## STORED PROCEDURES using INOUT param ################################
# An INOUT parameter is a combination of IN and OUT parameters. 
-- It means that the calling program may pass the argument, and the stored procedure can modify the INOUT parameter 
-- ..and pass the new value back to the calling program.

# NOTE: We did the same thing above by using IN and OUT param altogether.

# Creating a Stored Procedure using INOUT param
DROP procedure IF EXISTS `get_tot_mana_atts`;
DELIMITER $$
USE `the_100`$$
CREATE PROCEDURE get_tot_mana_atts(INOUT manas int, IN status varchar(30))
BEGIN
select count(*) into manas from magic_knights where magic_knights.status=status;
END$$
DELIMITER ;

select * from magic_knights;

call get_tot_mana_atts(@manas, 'Royal');
select @manas as manas_in_royality;

call get_tot_mana_atts(@manas, 'peasant');
select @manas as manas_in_peasants;

call get_tot_mana_atts(@manas, 'Foriegner');
select @manas as manas_in_foreigners;



