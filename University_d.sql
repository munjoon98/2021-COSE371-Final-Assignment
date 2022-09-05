drop table takes;
drop table teaches;
drop table course;
drop table student;
drop table instructor;
drop table department;

create table department(dept_name varchar(20), building varchar(15),
budget numeric(12,2), primary key(dept_name));

create table instructor(ID char(5), name varchar(20) not null,
dept_name varchar(20), salary numeric(8,2), primary key (ID),
foreign key (dept_name) references department);

create table student(ID varchar(5), name varchar(20) not null,
dept_name varchar(20), tot_cred numeric(3,0), primary key (ID),
foreign key (dept_name) references department);

create table course(course_id varchar(8), sec_id varchar(8), title varchar(40),
dept_name varchar(20), credits numeric(2,0),
primary key (course_id, sec_id), foreign key (dept_name) references department);

create table teaches(ID varchar(5), course_id varchar(8), sec_id varchar(8),
primary key(ID, course_id, sec_id), foreign key (ID) references instructor,
foreign key(course_id, sec_id) references course);

create table takes(ID varchar(5), course_id varchar(8), sec_id varchar(8),
primary key(ID, course_id, sec_id), foreign key (ID) references student,
foreign key(course_id, sec_id) references course);

insert into department values('Mathematics', 'Gauss', 21000);
insert into department values('Computer Science', 'Page', 25000);
insert into department values('Business', 'Buffett', 30000);
insert into department values('Social Science', 'Comte', 23000);
insert into department values('Education', 'Keller', 28000);

insert into instructor values ('45565', 'Katz', 'Computer Science', '75000');
insert into instructor values ('58583', 'Califieri', 'Mathematics', '62000');
insert into instructor values ('76543', 'Singh', 'Business', '80000');
insert into instructor values ('76766', 'Crick', 'Social Science', '72000');
insert into instructor values ('83821', 'Brandt', 'Education', '92000');

insert into student values ('23121', 'Chavez', 'Computer Science', '110');
insert into student values ('44553', 'Peltier', 'Mathematics', '56');
insert into student values ('45678', 'Levy', 'Business', '46');
insert into student values ('54321', 'Williams', 'Social Science', '54');
insert into student values ('55739', 'Sanchez', 'Education', '38');

insert into course values ('CS-101', '1', 'Intro to Computer Science', 'Computer Science', '4');
insert into course values ('CS-190', '1', 'Game Design', 'Computer Science', '4');
insert into course values ('CS-315', '2', 'Discrete Mathematics', 'Computer Science', '3');
insert into course values ('BU-101', '1', 'Banking', 'Business', '4');
insert into course values ('BU-170', '1', 'Management', 'Business', '3');
insert into course values ('BU-345', '1', 'Accounting', 'Business', '3');
insert into course values ('MA-101', '2', 'Linear Algebra', 'Mathematics', '3');
insert into course values ('SS-140', '1', 'Game Design', 'Social Science', '3');
insert into course values ('ED-233', '2', 'Intro to Teaching', 'Education', '3');

insert into teaches values ('45565', 'CS-101', '1');
insert into teaches values ('45565', 'CS-190', '1');
insert into teaches values ('45565', 'CS-315', '2');
insert into teaches values ('58583', 'MA-101', '2');
insert into teaches values ('76543', 'BU-101', '1');
insert into teaches values ('76543', 'BU-170', '1');
insert into teaches values ('76543', 'BU-345', '1');
insert into teaches values ('76766', 'SS-140', '1');
insert into teaches values ('83821', 'ED-233', '2');

insert into takes values ('23121', 'CS-101', '1');
insert into takes values ('23121', 'CS-190', '1');
insert into takes values ('44553', 'MA-101', '2');
insert into takes values ('45678', 'BU-101', '1');
insert into takes values ('45678', 'BU-170', '1');
insert into takes values ('54321', 'SS-140', '1');
insert into takes values ('55739', 'ED-233', '2');