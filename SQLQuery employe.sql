 create table employe(
e_id int,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20),
primary key (e_id)

);
insert into employe values(
1,'sam',45000,45,'male','operations'
);
insert into employe values(
2,'momb',48000,42,'female','turning'
);
insert into employe values(
3,'sahif',42000,38,'male','support'
);
insert into employe values(
4,'gayle',36500,29,'male', 'operations'
);
insert into employe values(
5,'sofiya',39000,34,'female','support'
);
select * from employe;
select e_name from employe;
select * from employe where e_salary > 35000 and e_gender = 'male';
select * from employe where e_dept = 'operations' or e_dept = 'support';
select * from employe where not e_gender = 'female';   /* used of "not" operator*/
select * from employe where e_name like 's%';   /* '%'are used for zero, single or multiple character*/
select * from employe where e_salary like '4%';
select * from employe where e_age like '4_';   /* '_' are used for single character*/
select * from employe where e_age between 30 and 40; /* "betwwen" operator used when range is extract from particular column of table*/
select min(e_salary)from employe;  /* "min" operator used to extract minimum value of that column from table*/
select max(e_age) from employe;   /* "max" operator used to extract maximum value of that column from table*/
select count(*) from employe where e_gender = 'female'; /* "count" operator used to find number of rows in given condition*/
select sum (e_salary) from employe;  /* "sum" operator used to total sum of numeric column*/
select avg (e_age) from employe;   /* "avg" operator used the average value of numeric column*/
select '        charlie';
select ltrim ('        charlie');   /* "ltrim" used to remove blanks on the left side of the character*/
select ' MY NAME IS SACHIN SHUBHAM';
select lower (' MY NAME IS SACHIN SHUBHAM');   /* "lower" used to converts all characters into lowercase letters*/
select 'hello india';
select upper ('hello india');          /* "upper" used to converts all characters into uppercase letters*/
select 'sachin shubham';
select reverse ('sachin shubham');    /* "reverse" used to reverse all the characters in the string*/
select 'my name is sachin shubham';
select substring ('my name is sachin shubham',4,3);   /* "substring" used to extract certain part of original string from a given position*/
                                                    /* formula of substring = ( original string, string index, length of required sub string)*/
select * from employe order by e_salary;     /* "order by" use to sort the data in ascending order*/
select * from employe order by e_salary desc; /* arrange data in descending order*/
select top 1 * from employe;     /* "top" used to find the data from top side*/
select top 3 * from employe;
select top 3 e_salary from employe;  
select top 3 * from employe order by e_salary;
select top 3 * from employe order by e_salary desc;
select avg (e_salary),e_gender from employe group by e_gender;  /* to find avg salary of male and female respectively*/
                                                              /* "group by" used to find aggregate of group wise*/
select avg (e_age), e_dept from employe group by e_dept order by avg (e_age) desc;  /* to find the avg age dept wise and arrange the avg age by dec order*/
select avg (e_salary),e_dept from employe group by e_dept having avg (e_salary) > 45000; /* "having" used in cobination with group by to impose conditions on group*/
update employe set e_age = 40 where e_name = 'sam';    /* "update" used to modify the existing records in the table*/
select * from employe
update employe set e_dept = 'tech' where e_gender = 'female';  /* change e_dept to tech for all female*/
update employe set e_salary = 50000;   /* all employe has convert to eqaul saalry=50000*/
update employe set e_gender = 'female' where e_name = 'sahif';
delete employe where e_name = 'sahif';    /* "delete used to delete existing record of particular row in the table*/
rollback;
truncate table employe;                    /* "truncate" used to delete all the data inside the table*/
begin tran;     /* "begin tran" used always before 'update' , 'delete' and 'insert' command when we modify the data in the table by using these commands are not sure*/
update employe set e_salary = 46000 where e_id = 1;
rollback;      /* "rollback" used to undo all the entry after begin tran by using 'update' , 'delete' and 'insert' command */
update employe set e_salary = 48000 where e_id = 2; 
begin tran;
update employe set e_salary = 35000 where e_id = 4;
rollback;
select * from employe;
begin tran;
delete employe where e_id = 4;
rollback;
begin tran;
insert into employe values(
3,'sahif', 42000,38,'male', 'support'
);
rollback;
update employe set e_salary = 36000 where e_id = 4;
create table department(
d_id int,
d_name varchar(20),
d_location varchar(20),
primary key (d_id)
);
insert into department values(
1,'operations','california'
);
insert into department values(
2,'tech','new york'
);
insert into department values(
5,'tech','capetown'
);
select * from department
select employe.e_name, employe.e_dept, department.d_name, department.d_location
from employe
inner join department 
on employe.e_dept = department.d_name;
select employe.e_name, employe.e_dept, department.d_name, department.d_location
from employe
left join department 
on employe.e_dept = department.d_name;

begin tran;
update department set d_location = 'new york' where d_id = 4;
select * from department
/* to add 10 in e_age of employe where d_location is new york*/
begin tran;
update employe set e_age = e_age +10
from employe 
join department on employe.e_dept = department.d_name
where d_location = 'new york';
rollback;
select * from employe
/* to delete the row where d_location is new york*/
begin tran;
delete employe from employe 
join department on employe.e_dept = department.d_name
where d_location = 'new york';
rollback;








