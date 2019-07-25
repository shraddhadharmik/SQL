create table StudentDetails(
SID int,
name varchar(20),
address varchar(20));

insert into StudentDetails values(1, 'Harsh', 'Kolkata'),
(2,'Suyash', 'Powai'),
(3, 'Shraddha', 'Thane'),
(4, 'Sameer', 'Thane'),
(5, 'Ram', 'Rajasthan');

create table StudentMarks(
id int,
name varchar(20),
marks int,
age int);

insert into StudentMarks values(1, 'Harsh', 22, 22),
(2,'Suyash', 0, 0),
(3, 'Shraddha', 100, 26),
(4, 'Sameer', 100,26),
(5, 'Ram', 40, 40);

create view DetailsView as select name, address from StudentDetails where sid < 3;
select * from StudentDetails;

update DetailsView set name='Harsha' where name = 'Harsh';

create view StudentName as select sid, name from StudentDetails order by name;

create view marksview as select a.name, a.address, b.marks from Studentdetails a, StudentMarks b 
where a.name = b.name;

select * from marksview;

create view vjoin as select s.name, address, marks from studentdetails s join studentmarks on id=sid;
select * from vjoin;

select * from studentmarks;
update studentmarks set name = 'Ram' where marks = 40;
update vjoin set name = 'Ramya' where marks = 40 ;

#localcheck option to try;