use df1903cm;

select * from test_table;

create table test_table1(
a int,
b int,
c int);

load data infile "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\result.txt" 
into table test_table1 fields terminated by ',';

select a,b,a+b into dumpfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/resul.txt' 
from test_table limit 1;

use sakila;

#### Distict #####

select last_name from actor;
select distinct last_name from actor;

##### ORDER BY #######
select first_name from actor 
where first_name like '%s'
order by first_name;

select first_name from actor 
where first_name like '%s'
order by first_name asc;

select * from actor 
where actor_id between 1 and 100
order by last_name desc;


select actor_id, first_name, last_name from actor
where actor_id between 1 and 100 order by 1 desc;

## Having is used after group by and used with agregate functions like add,max

create table foodcart(
date date,
food varchar(10),
sold int);

insert into foodcart values
('2002/06/08','pizza', 349),
('2002/06/08', 'hotdog', 500),
('2002/06/08', 'pizza', 70);

select * from foodcart;
select strcmp('name','shradhda');

select food, sum(sold) as totalSold 
from foodcart
group by food
having sum(sold) > 300;

select max(2,4);

create table employee(
empid int,
name varchar(10),
dept_name varchar(10),
salary int
);

insert into employee values
(1,'Shraddha', 'IT', 1000000000),
(2,'Sameer', 'IT', 1000000000),
(3,'Arun', 'ETC', 980000),
(4,'Abhishek', 'MECH', 450000),
(5,'Ritesh', 'MECH', 1300000),
(6,'Naveen', 'IT', 67000),
(7,'Sagar', 'CS', 50000),
(8,'Suyash', 'MECH', null);

select sum(salary) from employee group by dept_name;

select dept_name, sum(salary) from employee group by dept_name;
select dept_name, sum(salary) from employee where dept_name = 'IT';

select avg(salary) from employee;

#count(*)  #count function does not ignore null values
select count(*) from employee;
select count(salary) from employee;

#min #max
select min(salary), dept_name from employee 
group by dept_name;

select max(salary), dept_name from employee 
group by dept_name;

select count(distinct dept_name) from employee;

#standard functions
select count(salary) as n,
sum(salary) as sum,
avg(salary) as mean,
std(salary) as std,
stddev_samp(salary) as std_dev,
var_samp(salary) as varince,
min(salary) as minimum,
max(salary) as maximum from employee;



