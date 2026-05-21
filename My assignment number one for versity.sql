CREATE DATABASE school;
USE school;
CREATE TABLE student (
    sno VARCHAR(6),
    sname VARCHAR(15),
    dept VARCHAR(8),
    CONSTRAINT student_pk PRIMARY KEY (sno)
);

CREATE table students
(sid VARCHAR(2),
name VARCHAR(15),
dept VARCHAR(8)
);

CREATE table emp(
eid INT,
ename VARCHAR(20),
edate VARCHAR(20),
salary INT
);

INSERT INTO student
values ('S1','Mithun','CSE');

INSERT into emp values (101,'Anik','20 Jan 2020',34000);
INSERT into emp values (102,'Shakib','19 Dec 2021',13400);
INSERT into emp values (103,'Setara','2 Feb 2021',23400);
INSERT into emp values (104,'Afif','1 Mar 2022',33400);
INSERT into emp values (105,'Sarju','4 Apr 2023',43400);

SELECT * FROM student;
SELECT * FROM students;
SELECT * FROM emp;
