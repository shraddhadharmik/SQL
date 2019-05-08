# Comment
/*
Multiple line comment
*/

#Create database
create database df1903cm;
create database db;

#To use database
use db;

#Drop database
drop database db;

#Create database using Schema database
create schema db;
use db;
drop schema db;

#To see all the databases created
show databases;

#1. Create simple table and if not exists
use df1903cm;
create table if not exists Student(
student_ID int,
name varchar(15),
age int,
location varchar(20),
dob date
);

#2. Create Temporary table
#Creates a temporary table and it gets erased off once the tool is closed

create temporary table employee(
employee_ID int unique key,
name varchar(15),
age int,
location varchar(20),
dob date);

#to Describe the table and to see the schema
desc student;

#3. create table using constraint null | not null

create table shoes(
id char(10) primary key,
brand char(20) not null,
type char(250) not null,
color char(250) not null,
price decimal(6,2) not null,
desce varchar(750) null
);

#4. Autoincrement , primary key
create table tutorials_tbl(
tutorial_id int not null auto_increment,
tutorial_title varchar(100) not null,
tutorial_author varchar(40) not null,
submission_date date,
primary key(tutorial_id)
);

desc tutorials_tbl;

#5. using default values
create table Customer(
First_Name char(50),
Last_Name char(50),
Address char(50),
City char(50),
Country char(25) default 'United States',
Birth_Date datetime
);

#6. using enum
#Primary key - just one key, but can also combine multiple column to form a primary key
#multiple unique keys could be present

create table contenttype(
contenttypeid int unsigned not null auto_increment,
class varbinary(50) not null,
packageid int unsigned not null,
canplace enum('0','1') not null default '0',
cansearch enum('0','1') not null default '0',
primary key content(contenttypeid, packageid),
unique key packageclass(packageid, class)
);
#Varbinary similar to VARCHAR type, but stores binary type strings rather than non-binary character strings

#7. using int and decimal
create table test(
stiny tinyint signed,
utiny tinyint unsigned,
salary decimal(6,2)
);

#8. Boolean data types
create table if not exists users(
id int auto_increment primary key,
name varchar(100) not null,
biography text,
weight decimal(5,2),
married boolean,
regdate datetime
);

#10. Rename table
rename table users to user;
desc user;


##### ALTER TABLE ######

#11.

alter table student add marks int after name;
desc student;

#add in first position
alter table student add panno int first;
desc student;

alter table student drop age;
desc student;

show columns from student;

#modify column attributes
alter table student modify name varchar(30) not null;

#adding not null constraint
alter table student change panno pan_no int not null;

#change datatype
alter table student modify name char(30) not null;

#Rename the table
alter table student rename students;

alter table customer modify country char(25) default 'United States';


#--------------TRUNCATE TABLE-------------------
truncate table user;

#--------------DROP TABLE----------------
drop table contenttype;

#-------------INDEXING-----------------------
create table dept(
deptId int,
dname varchar(10)
);

create index index1 on dept(deptId);
#show index
show index from dept;
#drop index
drop index index1 on dept;

create index index1 on dept(deptId,dname);
show index from dept;
drop index index1 on dept;

#creating index based on first n characters

create index index_name on student(StudentName(5)); #for first 5 characters
create index index_name1 on student(StudentName);	#search for entire name
alter table student add index(StudentName(3)); 	#
show index from student;

drop index StudentName_5 on student;

#------------------CASCADE and DELETE--------------------------

create table customer(
id int not null auto_increment,
firstname varchar(50) not null,
lastname varchar(50) not null,
primary key(id)
);

create table contact(
contact_id int,
customer_id int,
info varchar(50) not null,
foreign key(customer_id)
references customer(id)
on delete cascade
on update cascade
);








