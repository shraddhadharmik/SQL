use df1903cm;

#Selecting one column
select name from students;

#selecting 2 columns from table
select name,location from students;

#Selecting all columns from table
select * from students;
select students.* from students;

# SELECT statement to do Arithmetic operations, or to view
select 1+1;
select 540/20;			#column name will be 540/20
select 30-20 as sub;  #will give column name as sub
select current_time();
select current_date();
select current_timestamp();

#retrieveing all olumns from the database

select * from information_schema.columns where table_schema = 'df1903cm'; #will display all columns from database df1903cm

#Alias column names
select First_Name as name, address as addr from customer;


use sakila;

#select rows based on condition
select actor_id, first_name, last_name from actor where first_name='Zero' and last_name='Cage';
select actor_id, first_name, last_name from actor where first_name='Hellen' and last_name='Kilmer';
select actor_id, first_name, last_name from actor where first_name='Hellen' or last_name='Kilmer';
select actor_id, first_name, last_name from actor where first_name='Zero' or last_name='Cage';

#To exclude some values
select actor_id, first_name from actor where not actor_id=11 and actor_id=22;

select actor_id, first_name, last_name from actor where (first_name='Hellen' or last_name='Kilmer') and actor_id>36;

# Comparision Functions and Operators - BETWEEN..AND

select film_id, category_id from film_category where category_id between 13 and 16;

#>, <, >=
select city,country_id from city where country_id>44;
select city,country_id from city where country_id>=44;
select city,country_id from city where country_id=44;
select city,country_id from city where country_id<100;
select city,country_id from city where country_id<=100;

# using in and 'not in'
#country id with 25,30,41,46,66,70

select city,country_id from city where country_id in (25,30,41,46,66,70);
select city,country_id from city where country_id not in (25,30,41,46,66,70);

# not between
select film_id,category_id from film_category where category_id not between 13 and 16;

#'is not null' example
select address from address where address2 is not null;

#'is null'
select address from address where address2 is null;

# For NO, following could be used - NOT, <>, !=
select * from actor where actor_id<>29;
select * from actor where actor_id!=29;

#Wildcard characters - % _  {used for patter matching}
select * from actor where first_name like '%is';
select * from actor where first_name like 'an%';
select * from actor where first_name like '%le%';
select * from actor where first_name like 'b%r_';
select * from actor where first_name like '_ar%';

#Coalesce - to check first occurence of values if multiple null

#Return the first non-null value in a list
select coalesce(null, null, null, 'Aegis', null, 'aegis.edu.in');

#Null safe operator
select 20 <=> 10;		#returns 0
select 10 <=> 10;		#returns 1
select 10 <=> null;		#returns 0

#For greatest and least, it will check the first character
select greatest(17,200,34,708,225);
select greatest('Aegis','Edu.com','batchDp1806');

select least(17,200,34,708,225);
select least('Aegis','Edu.com','batch Dp1806');

#now() will give exact time of today
select now() + interval 2 day;
select now() - interval 2 hour;

select date_sub(curdate(), interval 1 month);
select date_add(curdate(), interval 1 month);

# 'isnull' will return 0 or 1, depending on whether the expression is null or not
select isnull(2830);	# = 0
select isnull("");	# = 0
select isnull(null);	# = 1

#Arithmetic Functions

select ceil(29.45);	# = 30
select floor(93.65);	# = 93
select sqrt(25);	# = 5
select power(4,3);	# = 64
select mod(38,6);		#remainder = 2
select ln(33);	#log
select abs(12.43); #=12.43
select abs(-34.45); # = 35.45
select round(100.546); # = 101
select round(100.346);	# = 100
 
 
 # String Functions
 
select ASCII('hello'); #Return numeric value of left-most character
select BIN(5);             #Return a string containing binary representation of a number
select CHAR(97);      #Return the character for each integer passed(ASCII value)
select CHAR_LENGTH('hello');#/CHARACTER_LENGTH()	Return number of characters in argument
select CONCAT('hi',' there');	#Return concatenated string
select CONCAT_WS('+','hi','there');	#Return concatenate with separator
SELECT elt(4,'hello','there','hello','you'); #Return string at index number
select FIELD('hello', 'there','you','hello');	# Return the index (position) of the first argument in the subsequent arguments
select find_in_set('hello','there,you,hello'); #Return the index position of the first argument within the second argument
select FORMAT(45,4);	#Return a number formatted to specified number of decimal places
SELECT INSERT('Quadratic', 3, 4, 'What');	#Insert a substring at the specified position up to the specified number of characters
SELECT INSTR('foobarbar', 'bar');	#Return the index of the first occurrence of substring
SELECT LEFT('foobarbar', 5);	#Return the leftmost number of characters as specified
SELECT LOCATE('bar', 'foobarbar'); #LOCATE()/POSITION()	#Return the position of the first occurrence of substring
SELECT LOWER('QUADRATICALLY');	#Return the argument in lowercase
SELECT LPAD('hi',5,'?');	#Return the string argument, left-padded with the specified string
SELECT LTRIM('  barbar');	#Remove leading spaces
SELECT ORD('app');	#Return character code for leftmost character of the argument
SELECT REPEAT('MySQL', 3);	#Repeat a string the specified number of times
SELECT REPLACE('www.mysql.com', 'w', 'Ww');	#Replace occurrences of a specified string
SELECT REVERSE('abc');	#Reverse the characters in a string
SELECT RIGHT('foobarbar', 4);	#Return the specified rightmost number of characters
SELECT RPAD('hi',5,'?');	#Append string the specified number of times
SELECT RPAD('hi',1,'?');
SELECT RTRIM('barbar   ');	#Remove trailing spaces
SELECT SPACE(6);	#Return a string of the specified number of spaces
SELECT STRCMP('ltext', 'text');	#Compare two strings STRCMP() returns 0 if the strings are the same, -1 if the first argument is smaller than the second according to the current sort order, and 1otherwis
SELECT SUBSTRING('Sakila' FROM -4 FOR 2);	#Return the substring as specified
select ASCII('hello'); #Return numeric value of left-most character
select BIN(5);             #Return a string containing binary representation of a number
select CHAR(97);      #Return the character for each integer passed(ASCII value)
select CHAR_LENGTH('hello');#/CHARACTER_LENGTH()	Return number of characters in argument
select CONCAT('hi',' there');	#Return concatenated string
select CONCAT_WS('+','hi','there');	#Return concatenate with separator
SELECT elt(1,'hello','there','hello','you'); #Return string at index number
select FIELD('hello', 'there','you','hello');	# Return the index (position) of the first argument in the subsequent arguments
select find_in_set('hello','there,you,hello'); #Return the index position of the first argument within the second argument
select FORMAT(45,4);	#Return a number formatted to specified number of decimal places
SELECT INSERT('Quadratic', 3, 4, 'What');	#Insert a substring at the specified position up to the specified number of characters
SELECT INSTR('foobarbar', 'bar');	#Return the index of the first occurrence of substring
SELECT LEFT('foobarbar', 5);	#Return the leftmost number of characters as specified
SELECT LOCATE('bar', 'foobarbar'); #LOCATE()/POSITION()	#Return the position of the first occurrence of substring
SELECT LOWER('QUADRATICALLY');	#Return the argument in lowercase


SELECT LPAD('hi',5,'?');	#Return the string argument, left-padded with the specified string


SELECT LTRIM('  barbar');	#Remove leading spaces




SELECT ORD('app');	#Return character code for leftmost character of the argument

SELECT REPEAT('MySQL', 3);	#Repeat a string the specified number of times
SELECT REPLACE('www.mysql.com', 'w', 'Ww');	#Replace occurrences of a specified string
SELECT REVERSE('abc');	#Reverse the characters in a string
SELECT RIGHT('foobarbar', 4);	#Return the specified rightmost number of characters


SELECT RPAD('hi',5,'?');	#Append string the specified number of times


SELECT RPAD('hi',1,'?');


SELECT RTRIM('barbar   ');	#Remove trailing spaces


SELECT SPACE(6);	#Return a string of the specified number of spaces


SELECT STRCMP('text', '1text');	#Compare two strings STRCMP() returns 0 if the strings are the same, -1 if the first argument is smaller than the second according to the current sort order, and 1otherwis
SELECT SUBSTRING('Sakila' FROM -4 FOR 2);	#Return the substring as specified
SELECT SUBSTRING('foobarbar' FROM 4);
SELECT SUBSTRING('Quadratically',5);
SELECT SUBSTRING('Quadratically',5,6);
SELECT SUBSTRING('Sakila', -3);
SELECT SUBSTRING('Sakila', -5, 3);
SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2);#Return a substring from a string before the specified number of occurrences of the delimiter
SELECT SUBSTRING_INDEX('www.mysql.com', '.', -2); #If count is negative, everything to the right of the final delimiter (counting from the right) is returned. SUBSTRING_INDEX() performs a case-sensitive match when searching for delim.
SELECT TRIM('  bar   ');
SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');
SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');
SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz'); #Remove leading and trailing spaces
SELECT UPPER('Hej');#UPPER()/UCASE()	#Convert to uppercase
select 2+3;
select isnull(null);