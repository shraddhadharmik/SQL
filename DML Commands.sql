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

