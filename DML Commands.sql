#---------------DML OPERATIONS------------------
desc student;


create table student1(
pan_no int,
student_ID int,
sname varchar(20),
marks int,
location varchar(45),
dob date,
age int
);
insert into student1 values
(1,1,'Shraddha',100,'Powai','1993/06/07',25),
(2,2,'Sameer',99,'Powai','1993/06/09',25),
(3,3,'Sagar',0,'Powai','1993/06/07',25),
(4,4,'Suyash',1,'Powai','1993/04/07',25),
(5,5,'Manavi',90,'Powai','1995/07/07',22),
(6,6,'Vidhi',80,'Powai','1995/06/07',24),
(7,7,'Shruti',80,'Powai','1997/06/07',23),
(8,8,'Shreya',90,'Powai','1995/06/07',22),
(9,9,'Anjana',80,'Powai','1997/06/07',21),
(10,10,'Preeti',75,'Powai','1995/06/07',22)
;

select * from student1;

use df1903cm;
desc students;

insert into students values
(1,1,'Shraddha',100,'Powai','1993/06/07'),
(2,2,'Sameer',99,'Powai','1993/06/09'),
(3,3,'Sagar',0,'Powai','1993/06/07'),
(4,4,'Suyash',1,'Powai','1993/04/07'),
(5,5,'Manavi',90,'Powai','1995/07/07'),
(6,6,'Vidhi',80,'Powai','1995/06/07'),
(7,7,'Shruti',80,'Powai','1997/06/07'),
(8,8,'Shreya',90,'Powai','1995/06/07'),
(9,9,'Anjana',80,'Powai','1997/06/07'),
(10,10,'Preeti',75,'Powai','1995/06/07')
;

desc shoes;
insert into shoes values
(1,'Bata','slippers','black',300,'chappal'),
(2,'Tata','chappal','white',200,'chor bazaar se churaya hua'),
(3,'Sata','joota','blue',250,'found outside temple'),
(4,'Lata','moze','blredack',20,'might be smelly')
;

desc tutorials_tbl;

select * from customer;

#if we do not have certain values, omit the column
 insert into customer(First_Name,Last_Name, City) values
 ('Sagar', 'Maar khata hai', 'nakamuka bazaar');
 
 insert into tutorials_tbl values
(3,'bio','sagar chacha', '0001/00/00'),
(4,'jio','sagar fufaji', '0001/00/00')
;

select * from tutorials_tbl;

desc customer;

insert into customer values
('Sagar', 'juari', 'casino', 'chor bazaar', 'Pakistan', '0000/00/00');

CREATE TABLE contenttype (
        contenttypeid INT UNSIGNED NOT NULL AUTO_INCREMENT,
        class VARBINARY(50) NOT NULL,
        packageid INT UNSIGNED NOT NULL,
        canplace ENUM('0','1') NOT NULL DEFAULT '0',
        cansearch ENUM('0','1') NOT NULL DEFAULT '0',
        PRIMARY KEY content(contenttypeid,packageid),
        UNIQUE KEY packageclass (packageid, class)
);

insert into contenttype values
(10,'string',113,'0','1');

insert into contenttype values
(10,'string',113,'23','1');		#cannot insert values apart from the ones mentioned in the enum

insert into contenttype(class,packageid,cansearch) values
('int',34,'0');

insert into contenttype(class,packageid,cansearch) values
('int',35,'0');

select * from contenttype;
desc test;

insert into test(utiny) values(2500);
insert into test(utiny) values(-100);  #cannot insert negative value for unsigned int
insert into test(salary) values(8888.88);
insert into test(salary) values(879888.88);  #value out of range
select* from test;


#------------------------------------------SELECT---------------------------------------
use df1903cm;

desc user;

insert into user values(100,'Archana', 'Well Educated', 56.97, False, '1998/08/10');

insert into user values(101,'Sagar', 'Not well', 10.97, True, '1970/08/17');
insert into user values(102,'Suyash', 'Golu', 100.97, True, '1960/08/17');

select * from user;

create table persons(
id int not null auto_increment,
lastname varchar(255) not null,
firstname varchar(255),
address varchar(255),
primary key(id))
auto_increment = 100;

insert into persons(firstname,lastname) values
('sdfs','sdfsd'),
('eger','rthswe');


#-----------------UPDATE---------------------------

select * from user;

set sql_safe_updates = 0;
update students set marks = 101 where name='Sameer';


#------------------------DELETE----------------
delete from persons;

#delete for a person
delete from user where id=102;

#delete for multiple
delete from user where id=100 or 101;
select * from user;

use mydb;

desc customer;
desc contact;

insert into customer values
('25','sajkda','sdfewwe');

insert into contact values
('25','24','sdfewwe');

select * from customer;
select * from contact;
update contact set info='dsfsdwe' where customer_id=24;

delete from customer where id=28;

update customer set id=28 where id=24;

use df1903cm;

create table students1(
id int auto_increment primary key, name varchar(20), class varchar(20), 
social int, science int, math int);

INSERT INTO students1 (id, name, class, social, science, math)
 VALUES (2, 'Max Ruin', 'Three', 86, 57, 86);
 
 INSERT INTO students1 (id, name, class, social, science, math)VALUES
(2, 'Max Ruin', 'Three', 86, 57, 86),
(3, 'Arnold', 'Three', 56, 41, 76),
(4, 'Krish Star', 'Four', 62, 52, 72),
(5, 'John Mike', 'Four', 62, 82, 92),
(6, 'Alex John', 'Four', 58, 93, 83),
(7, 'My John Rob', 'Fifth', 79, 64, 74),
(8, 'Asruid', 'Five', 89, 84, 94),
(9, 'Tes Qry', 'Six', 77, 61, 71),
(10, 'Big John', 'Four', 56, 44, 56) 

ON DUPLICATE KEY UPDATE social=values(social),
science=values(science),math=values(math);
 
 select * from students1;
 
 INSERT INTO students1 (id, name, class, social, science, math) VALUES
(2, 'Max Ruin', 'Three', 86, 88, 88),
(3, 'Arnold', 'Three', 56, 41, 76),
(4, 'Krish Star', 'Four', 62, 52, 72),
(5, 'John Mike', 'Four', 62, 82, 92),
(6, 'Alex John', 'Four', 58, 93, 83),
(7, 'My John Rob', 'Fifth', 79, 64, 74),
(8, 'Asruid', 'Five', 89, 84, 94),
(9, 'Tes Qry', 'Six', 77, 61, 71),
(10, 'Big John', 'Four', 56, 44, 56),
(11,'New Name','Five',75,78,52) 

ON DUPLICATE KEY UPDATE social=values(social),science=values(science),math=values(math);
 
INSERT INTO students1 (id, name, class, social, science, math)
VALUES (2, 'Max Ruin', 'Three', 86, 57, 86) 
on duplicate key update social=88,science=90,math=95;
 
 UPDATE students1 SET math=50, social=60, science=55 WHERE  id=4;
 
 UPDATE students1 SET math=0;
 
 select * from students1;
 
UPDATE students1 SET math=math+5, social=social+5, science=science+5 
WHERE  id=3;

create table marks(
id int,
name varchar(10),
marks1 int,
marks2 int);

load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\marks.txt" into table marks fields terminated by ',';

select * from marks;

create table test_table(
a int,
b int
);

insert into test_table values(1,2),(2,3),(3,4);

select a,b,a+b into outfile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\result.txt" 
fields terminated by ',' optionally enclosed by '"' 
lines terminated by '\n' from test_table;




