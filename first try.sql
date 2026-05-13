DROP DATABASE IF EXISTS college;
CREATE DATABASE college;
USE college;


CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student (id, name)
VALUES
(101, "nahid"),
(102, "ifti"),
(103, "johirul");

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course (id, course)
VALUES
(102, "english"),
(103, "math"),
(105, "science"),
(107, "computer science");

SELECT *
FROM student
INNER JOIN course
ON student.id = course.id;