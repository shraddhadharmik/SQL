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

 



