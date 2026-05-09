CREATE DATABASE college;

USE college;

CREATE TABLE student (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 age INT NOT NULL
);


INSERT INTO student VALUES(1, "NAHID", 26);
INSERT INTO student VALUES(2, "Mashuk", 24);
INSERT INTO student VALUES(3, "Mash", 29);

SELECT * FROM  student;