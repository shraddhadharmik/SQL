use crm;
set sql_safe_updates = 0;
show variables like '% autocommit';
set autocommit = 1;

create table class(
id int,
name varchar(30)
);

insert into class values(1, 'Shraddha'), (2, 'Sagar');

start transaction;

savepoint a;
insert into class values(6, 'Chris');
savepoint b;
insert into class values(7, 'Bravo');


select * from class;
rollback to a;
commit;

start transaction;
savepoint a;
delete from class;
rollback to a;
savepoint b;
truncate table class;
rollback to b;
commit;
