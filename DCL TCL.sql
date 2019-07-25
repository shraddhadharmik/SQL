## DCL - Data Control Language ##

create user super@localhost identified by '12345';

show grants for super@localhost;

#grant permission
grant all on *.* to 'super'@'localhost' with grant option;

show grants for super@localhost;
   
create user robin@localhost identified by 'muniversity';

grant all on sakila.* to 'robin'@localhost;
 
create user Shraddha@localhost identified by 'faith';

grant all on sakila.actor to Shraddha@localhost;

create user abc identified by 'muni';

grant select, update, delete on sakila.* to abc;

show grants for abc;

revoke update, delete on sakila.* from abc;

revoke all privileges, grant option from abc;

create database crm;
use crm;

create table customer(
custid int primary key auto_increment,
first_name varchar(225) not null,
last_name varchar(225) not null,
phone varchar(15) not null,
email varchar(225));

insert into customer(first_name, last_name, phone, email)
values('John', 'Doe', '(408)-987-7654', 'john.doe@mysqltutorial.org');

create role crm_dev, crm_read, crm_write;

select * from customer;

grant all on crm.* to crm_dev;

grant select on crm.* to crm_read;

grant insert, update, delete on crm.* to crm_write;

create user user1@localhost identified by 'user1';
create user user2@localhost identified by 'user2';
create user user3@localhost identified by 'user3';
create user user4@localhost identified by 'user4';

grant crm_dev to user1@localhost;
grant crm_read to user2@localhost, user3@localhost;
grant crm_write to user4@localhost;

show grants for user1@localhost;
show grants for user2@localhost;

drop role crm_read, crm_write;
drop table customer;