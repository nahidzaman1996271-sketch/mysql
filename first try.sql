DROP DATABASE IF EXISTS college;
CREATE DATABASE college;
USE college;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil",   85, "A", "Mumbai"),
(102, "nahid",  72, "B", "Dhaka"),
(103, "mashuk", 60, "C", "Chittagong"),
(104, "ravi",   90, "A", "Delhi"),
(105, "sofia",  55, "D", "Pune"),
(106, "karim",  78, "B", "Sylhet");

SELECT DISTINCT city FROM student;
SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 90
ORDER BY city ASC