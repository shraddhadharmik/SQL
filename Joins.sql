
create table geography(
id int primary key auto_increment,
region_name varchar(30),
store_name varchar(30) unique key
);

create table store_information(
store_name varchar(30),
sales int,
transaction_date date,
foreign key(store_name) references geography(store_name)
);


insert into geography values
(1,'East', 'Boston'),
(2,'East', 'New York'),
(3,'West', 'Los Angeles'),
(4,'West', 'San Diego');

insert into store_information values
('Los Angeles', 1500, '1999/01/05'),
('San Diego', 250, '1999/01/07'),
('Los Angeles', 300, '1999/01/08'),
('Boston', 700, '1999/01/08');

select a1.region_name region, sum(a2.sales) sales from geography a1, store_information a2 
where a1.store_name = a2.store_name
group by a1.region_name;

#INNER JOIN / CROSS JOIN/ JOIN
select * from geography cross join store_information;
select * from geography inner join store_information;
select * from geography join store_information;
select * from geography A inner join store_information using (store_name);

select * from geography A inner join store_information B
on A.store_name = B.store_name;
select * from geography;
select * from store_information;

#LEFT JOIN

select * from geography left join store_information using(store_name);
select * from geography A left join store_information B on A.store_name = B.store_name;

#RIGHT JOIN

select * from geography right join store_information using(store_name);
select * from geography A right join store_information B on A.store_name = B.store_name;

#NATURAL JOINS
select * from geography join store_information;

#whatever is common. tat is given as output
select * from geography natural join store_information;
select * from geography natural left join store_information;
select * from geography natural right join store_information;

create table ss1 as select * from store_information;

select * from ss1;
select * from store_information 
right join geography using(store_name)
right join ss1 on ss1.store_name = geography.store_name
where ss1.sales<1500;

select region_name,store_name from geography natural join store_information where sales>1000;

#which store did not have any sales
select store_name from geography left join store_information
using(store_name) where id is null;

#self join
alter table store_information add column payment_date date;
insert into store_information values
('Los Angeles', 1500, '1999/01/05', '1999/01/06'),
('San Diego', 250, '1999/01/07', '1999/01/07'),
('Los Angeles', 300, '1999/01/08', '1999/01/10'),
('Boston', 700, '1999/01/08', '1999/01/08')
on duplicate key update payment_date = values(payment_date);

select * from store_information;
truncate store_information;

select * from store_information a natural join store_information b 
where a.transaction_date = b.payment_date;


select * from store_information a natural join store_information b 
where b.payment_date - a.transaction_date = 1;


select store_name, sales, transaction_date, payment_date,
payment_date - transaction_date as difference from store_information
where payment_date - transaction_date = (select max(b.payment_date - a.transaction_date)
as difference from store_information a natural join store_information b);

select region_name, max(sales) from store_information natural left join geography group by region_name;

select region_name, sum(sales) from store_information natural left join  geography group by region_name;

select store_name, ifnull(sum(sales),0) from store_information a right join geography b using(store_name)
group by store_name;

select region_name, sum(sales) from store_information natural left join geography group by region_name;