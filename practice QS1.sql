
CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE employee (
 id INT PRIMARY KEY,
 name VARCHAR(100),
 salary INT
);

INSERT INTO employee
(id, name, salary)
VALUES
(1, "Nahid", 50000),
(2, "Ifti", 30000),
(3, "Mashuk", 20000);

SELECT * FROM employee;