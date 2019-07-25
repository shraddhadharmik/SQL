use crm;

create table stud_table(
stu_id int,
stu_name varchar(15),
Sub1 int,
Sub2 int,
Sub3 int,
Sub4 int,
Sub5 int,
total int,
per float,
stat varchar(15));

delimiter $$
create trigger stu_insert
before insert on stud_table for each row
begin
	set new.total =  new.sub1 + new.sub2 + new.sub3 + new.sub4 + new.sub5;
	set new.per = new.total/5;
	if new.per < 33 then
		set new.stat = "fail";
	elseif new.per>=33 and new.per<45 then
		set new.stat="3rd Div";
	elseif new.per >=45 and new.per<60 t	hen
		set new.stat="2nd Div";
	else
		set new.stat="1st Div";
	end if;
end$$
delimiter ;

insert into stud_table(stu_id, stu_name, sub1, sub2, sub3, sub4, sub5) values
(1, 'Shraddha', 100, 100, 100, 100, 100),
(2, 'Sameer', 100, 100, 100, 100, 100),
(3, 'Sagar', 45, 56, 67, 78, 89),
(4, 'Mohit', 0, 0, 0, 0, 0);

select * from stud_table;

create table stud_table1(
stud_id int,
stud_name varchar(15),
stud_class int
);

create table stud_log(user_id varchar(15), description varchar(100));

#after insert trigger
delimiter $$
create trigger stu_insert2
after insert on stud_table1 for each row
begin
	insert into stud_log(user_id, description) 
    values (user(), concat('Inserted Student record : ', new.stud_id, ' ', new.stud_name, ' ', new.stud_class ));
end$$
delimiter ;


select * from stud_table1;
insert into stud_table1 values
(1, 'Sameer', 12),
(2, 'Shraddha', 12);

select * from stud_log;

create table Employee(
id int,
first_name varchar(30),
lsat_name varchar(15),
start_date date,
end_date date,
city varchar(10),
description varchar(15)
);

insert into employee values
(1, 'Mkl', 'pol', '1994-05-05', '1996-05-05', 'Nainital', 'Programmer'),
(2, 'JKL', 'dff', '1994-05-05', '1996-05-05', 'Jodhpur', 'Programmer'),
(3, 'fcl', 'ere', '1994-05-05', '1996-05-05', 'Jabalpur', 'Programmer');

create table employee_update(
user_id varchar(15),
description varchar(15)
);

alter table employee_update modify description varchar(100);

select * from employee;
delimiter $$
create trigger employee_trigger
after update on employee for each row
begin
	insert into employee_update(user_id, description) values
    (user(), concat('Id with', new.id, 'is modified from ', old.start_date, 'to ', new.start_date));
end$$
delimiter ;

drop trigger employee_trigger;

select * from employee_update;

set sql_safe_updates = 0;
update Employee set start_date="2006-12-12";

create table del_emp_log(
id int,
first_name varchar(50),
last_name varchar(50),
start_date date,
end_date date,
city varchar(50),
description varchar(50),
lastdeleted time
);

delimiter $$
create trigger Emp_trigger
after delete on employee for each row
begin
insert into del_emp_log values(
old.id, old.first_name, old.lsat_name, old.start_date, old.end_date, old.city, old.description, curtime());
end $$
delimiter ;

select * from employee;

select * from del_emp_log;

delete from employee where id=3;

#show triggers
show triggers like '%employee%';

select * from information_schema.triggers
where trigger_Schema = 'crm' and trigger_name = 'stu_insert';

select * from information_schema.triggers where trigger_schema = 'crm';

select * from information_schema.triggers where trigger_schema='crm' and event_object_table='employee';

show triggers from crm;

drop trigger if exists Emp_trigger;

lock tables employee read;

unlock tables;

#CReate procedure
create procedure proc1()
	select 'Hello World!' as Output;
    
call Proc1();

create procedure ListStudents()
	select * from stud_table;
    
call ListStudents();

drop procedure if exists liststudents;

create procedure liststudents()
select stu_id, stu_name from stud_table;

call Liststudents();

create procedure sayHello(in name varchar(20))
select concat('Hello ', name, '!') as Greeting;

call sayHello('Shraddha');

create procedure saySomething(in phrase varchar(20), in name varchar(20))
select concat(phrase, ' ', name, '!') as Output;

call saySomething('Go', 'Blue Jays');

create procedure findstudent(in id int)
select stu_id, concat(stu_name, ' ', total) as 'Details'
from Stud_table where Stu_id = id;

call findstudent(2);

delimiter //
create procedure mySign(in x int)
begin
if x>0 then
select x as number, '+' as Sign;
elseif x<0 then
select x as number, '-' as Sign;
else
select x as number, 'Zero' as Sign;
end if;
end//
delimiter ;

call mySign(3);
call mySign(-3);
call mySign(0);

delimiter //
create procedure calculator(in x int, in y int, out sum int, out product int, inout m int)
begin
	set sum = x+y;
    set product = x*y;
    set m=m+2;
end//
delimiter ;

set @i = 4;
call calculator(4,5,@s, @p, @i);

select @s,@p,@i;

delimiter //
create procedure digitName(in x int)
begin
declare result varchar(20);
case x
when 0 then set result='Zero';
when 1 then set result='One';
when 2 then set result='Two';
when 3 then set result='Three';
end//
delimiter ;





