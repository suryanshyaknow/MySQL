################################## DATE VARIABLES ##########################################
# MySQL has several built-in date and time functions that can be used to manipulate and format date and time values. 
-- Here are some of the commonly used date and time functions in MySQL:

-- 1. NOW(): returns the current date and time
-- 2. DATE(): extracts the date part of a date or datetime expression
-- 3. TIME(): extracts the time part of a date or datetime expression
-- 4. YEAR(): extracts the year from a date or datetime expression
-- 5.  MONTH(): extracts the month from a date or datetime expression
-- 6. DAY(): extracts the day of the month from a date or datetime expression
-- 7. HOUR(): extracts the hour from a datetime expression
-- 8. MINUTE(): extracts the minute from a datetime expression
-- 9. SECOND(): extracts the second from a datetime expression
-- 10. DATE_FORMAT(): formats a date or datetime expression into a specified string format
-- 11. TIMESTAMP(): converts a date and time value to a Unix timestamp
-- 12. UNIX_TIMESTAMP(): returns a Unix timestamp for a given date and time value
-- 13. STR_TO_DATE(): converts a string to a date or datetime value using a specified format string
-- 14. ADDDATE(): adds a specified interval to a date or datetime value
-- 15. DATE_ADD(): adds a specified interval to a date or datetime value
-- 16. DATE_SUB(): subtracts a specified interval from a date or datetime value
-- 17. DATEDIFF(): calculates the difference between two dates or datetime values in days

select NOW();  		  # Current date and time
select DATE(NOW());   # Current date
select TIME(NOW());   # Current time
select YEAR(NOW());   # Current year
select MONTH(NOW());  # Current month
select DAY(NOW());    # Current day
select HOUR(NOW());   # Current hour

################################### DATE_FORMAT() ##########################################
select DATE_FORMAT(NOW(), '%d/%m/%y') as today;
select NOW(), TIMESTAMP(NOW()) AS Unix_timestamp;  # No differences whatsoever!
