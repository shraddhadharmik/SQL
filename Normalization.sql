create database normalization;
use normalization;

#1NF
create table course_content (
course varchar(50),
content varchar(100)
);

insert into course_content values ('Programming', 'Java,C++'),
('Web', 'HTML,PHP,ASP');

select * from course_content;

select 1 as n union all select 2 union all select 3;

select * from course_content t cross join (select 1 as n union all select 2 union all select 3)n;

create table course_content_1nf(
course varchar(50), 
content varchar(100)) as
select distinct course, 
substring_index(substring_index(t.content, ',', n.n), ',', -1)content
from course_content t cross join
(select 1 as n union all select 2 union all select 3) n
order by course;

select * from course_content_1nf;

#2nf
create table purchase(cust_id int, store_id int,
pur_loc varchar(100));
insert into purchase values
(1,1,'Los Angeles'),
(1,3,'San Francisco'),
(2,1,'Los Angeles'),
(3,2, 'New York'),
(4,3, 'San Francisco');

create table purchase_2nf_1(cust_id int, store_id int) as
select cust_id, store_id from purchase;
select * from purchase_2nf_1;

create table purchase_2nf_2(store_id int, pur_loc varchar(100)) as
select store_id, pur_loc from purchase;
select * from purchase_2nf_2;

create table books (
book_id int,
genre int,
genre_type varchar(100),
price decimal(5,2)
);

insert into books values
(1,1, 'Gardening', 25.99),
(2,2, 'Sports', 14.99),
(3,1,'Gardening', 10.00),
(4,3, 'Travel', 12.99),
(5,2, 'Sports', 17.99);

select * from books;

create table books_3nf_1 (book_id int, genre_id int, price decimal(5,2)) as
select book_id, genre, price from books;

create table books_3nf_2 (genre int, genre_type varchar(100)) as
select distinct genre, genre_type from books;

select * from books_3nf_2;

#########UNION###########
Create table store_information(
Name varchar(15),
txn_date varchar(30),
sales int);

insert into store_information values
('los angeles','jan 20 1990',1500),('san diego','jan 07 1992',200),
('los angeles','jan 28 1990',1500),('boston','jan 18  1999',500);

create table internet_sales(
txn_date varchar(30),
sales int);

insert into internet_sales values('jan 07 1992',200),
('jan 20  1992',200),('jan 28 1990',200),('jan 18 1999',500);

Select txn_date from store_information
UNION
Select txn_date from internet_sales;

Select txn_date from store_information
union all
Select txn_date from internet_sales;

select * from books,purchase;
#UNION ALL-> without removing duplicates

########Limit and Offset###########

Select * from actor
limit 50;

select * from city
limit 100 
offset 20;

