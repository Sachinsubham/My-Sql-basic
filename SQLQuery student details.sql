create database student_detalis1
use student_detalis1
create table student_detalis1(
s_id int primary key,
s_name varchar(20),
s_marks int);

insert into student_detalis1 values (
1,'sam',78 );
insert into student_detalis1 values (
2,'john',63);
insert into student_detalis1 values (
3,'matte',82);
insert into student_detalis1 values (
4,'anshu', 74);
select * from student_detalis1
 
 create table student_detalis2 (
s_id int primary key,
s_name varchar(20),
s_marks int);

insert into student_detalis2 values (
3,'matte',82);
insert into student_detalis2 values (
4,'anshu', 74);
insert into student_detalis2 values (
5,'karle', 85);
select * from  student_detalis2 

/* "union" used to combine the the result set of two or more select statements*/
select * from  student_detalis1
union
select * from  student_detalis2;

/* "union all" gives all the rows from both the tables including the duplicates*/
select * from  student_detalis1
union all
select * from  student_detalis2;

/* "except" combines two select statements and returns unique records from the first table which are not the part of the second table*/
select * from  student_detalis1
except
select * from  student_detalis2;

/* "intersect" combines the common results of selected tables*/
select * from  student_detalis1
intersect
select * from  student_detalis2;







