DROP DATABASE IF EXISTS flatmate_expense_db;
CREATE DATABASE flatmate_expense_db;
USE flatmate_expense_db;

-- 1. Flat Table
CREATE TABLE Flat (
    flat_id INT PRIMARY KEY AUTO_INCREMENT,
    flat_name VARCHAR(50) NOT NULL,
    flat_address VARCHAR(150) NOT NULL,
    total_members INT NOT NULL,
    monthly_rent DECIMAL(10,2) NOT NULL
);
-- insert Flat records
INSERT INTO Flat (flat_id, flat_name, flat_address, total_members, monthly_rent) VALUES
(1, 'Sunrise Apartments', '123 Green Road, Dhaka-1215', 7, 35000.00),
(2, 'Lake View Tower', '45 Lake Drive, Dhaka-1205', 5, 42000.00),
(3, 'Garden Residence', '78 Park Avenue, Dhaka-1216', 6, 38000.00),
(4, 'Palm View', '56 Palm Avenue, Dhaka-1217', 4, 30000.00),
(5, 'Sky Garden', '90 Sky Road, Dhaka-1208', 7, 45000.00),
(6, 'Green Valley', '34 Valley Street, Dhaka-1219', 5, 36000.00),
(7, 'Rose Villa', '12 Rose Lane, Dhaka-1210', 6, 40000.00),
(8, 'Maple Residency', '78 Maple Drive, Dhaka-1211', 4, 32000.00),
(9, 'Orchid Tower', '56 Orchid Avenue, Dhaka-1212', 7, 48000.00),
(10, 'Lily Garden', '90 Lily Road, Dhaka-1213', 5, 34000.00),
(11, 'Jasmine Court', '34 Jasmine Street, Dhaka-1214', 6, 39000.00),
(12, 'Tulip Residency', '12 Tulip Lane, Dhaka-1215', 4, 31000.00),
(13, 'Daisy Villa', '78 Daisy Drive, Dhaka-1216', 7, 44000.00),
(14, 'Iris Tower', '56 Iris Avenue, Dhaka-1217', 5, 37000.00),
(15, 'Lavender Garden', '90 Lavender Road, Dhaka-1218', 6, 41000.00),
(16, 'Marigold Court', '34 Marigold Street, Dhaka-1219', 4, 33000.00),
(17, 'Violet Residency', '12 Violet Lane, Dhaka-1220', 7, 46000.00),
(18, 'Sunflower Villa', '78 Sunflower Drive, Dhaka-1221', 5, 38000.00),
(19, 'Dahlia Tower', '56 Dahlia Avenue, Dhaka-1222', 6, 42000.00),
(20, 'Aster Garden', '90 Aster Road, Dhaka-1223', 4, 35000.00);

-- 2. Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    flat_id INT NOT NULL,
    member_name VARCHAR(50) NOT NULL,
    member_contact VARCHAR(20) NOT NULL,
    member_email VARCHAR(80) UNIQUE NOT NULL,
    join_date DATE NOT NULL,
    status ENUM('active','inactive') DEFAULT 'active',
    FOREIGN KEY (flat_id) REFERENCES Flat(flat_id)
);
-- Members
INSERT INTO Members (member_id, flat_id, member_name, member_contact, member_email, join_date, status) VALUES
(1, 1, 'Nahid Ibn Zaman', '01772043515', 'nahid.ibn0@gmail.com', '2025-07-09', 'active'),
(2, 2, 'Rifat Hasan', '01795899313', 'rifat.hasan1@gmail.com', '2025-12-18', 'active'),
(3, 3, 'Tanvir Islam', '01753524491', 'tanvir.islam2@gmail.com', '2025-01-08', 'active'),
(4, 4, 'Shakib Ahmed', '01752339391', 'shakib.ahmed3@gmail.com', '2025-07-09', 'inactive'),
(5, 5, 'Arif Chowdhury', '01786125617', 'arif.chowdhury4@gmail.com', '2025-12-11', 'active'),
(6, 6, 'Mahin Rahman', '01777005685', 'mahin.rahman5@gmail.com', '2025-07-21', 'active'),
(7, 7, 'Saif Karim', '01745551614', 'saif.karim6@gmail.com', '2025-03-08', 'active'),
(8, 8, 'Rakib Hossain', '01782340307', 'rakib.hossain7@gmail.com', '2025-05-24', 'active'),
(9, 9, 'Fahim Alam', '01788320463', 'fahim.alam8@gmail.com', '2025-07-12', 'active'),
(10, 10, 'Emon Siddique', '01728566572', 'emon.siddique9@gmail.com', '2025-09-16', 'inactive'),
(11, 11, 'Sabbir Mahmud', '01716323852', 'sabbir.mahmud10@gmail.com', '2025-02-05', 'active'),
(12, 12, 'Naeem Kabir', '01766661351', 'naeem.kabir11@gmail.com', '2025-10-03', 'active'),
(13, 13, 'Rayhan Sarkar', '01789978790', 'rayhan.sarkar12@gmail.com', '2025-08-17', 'active'),
(14, 14, 'Aviroop Talukder', '01784252722', 'aviroop.talukder13@gmail.com', '2025-01-22', 'active'),
(15, 15, 'Zisan Bhuiyan', '01782070937', 'zisan.bhuiyan14@gmail.com', '2025-05-25', 'active'),
(16, 16, 'Tahsin Molla', '01724972279', 'tahsin.molla15@gmail.com', '2025-05-14', 'active'),
(17, 17, 'Mehedi Sheikh', '01710435578', 'mehedi.sheikh16@gmail.com', '2025-12-24', 'active'),
(18, 18, 'Rezwan Miah', '01777187530', 'rezwan.miah17@gmail.com', '2025-03-17', 'active'),
(19, 19, 'Jubayer Uddin', '01793926371', 'jubayer.uddin18@gmail.com', '2025-05-27', 'active'),
(20, 20, 'Sadman Khan', '01791734598', 'sadman.khan19@gmail.com', '2025-04-05', 'active');

-- 3. Bill_Categories Table
CREATE TABLE Bill_Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(150)
);
-- BILL_CATEGORIES TABLE
INSERT INTO Bill_Categories (category_id, category_name, description) VALUES
(1, 'Rent', 'Monthly house rent payment'),
(2, 'WiFi', 'Internet connection bill'),
(3, 'Electricity', 'Electricity consumption bill'),
(4, 'Gas', 'Gas connection bill'),
(5, 'Bua', 'Domestic help salary'),
(6, 'Bazar/Meals', 'Grocery and meal expenses'),
(7, 'Miscellaneous', 'Other shared expenses'),
(8, 'Water', 'Water supply bill'),
(9, 'Security', 'Security guard service'),
(10, 'Maintenance', 'Building maintenance fee'),
(11, 'Cable TV', 'Cable television subscription'),
(12, 'Cleaning', 'Cleaning service charges'),
(13, 'Parking', 'Parking space rent'),
(14, 'Gym', 'Gym membership fee'),
(15, 'Laundry', 'Laundry service charges'),
(16, 'Gardening', 'Garden maintenance'),
(17, 'Pest Control', 'Pest control service'),
(18, 'Generator', 'Generator fuel and maintenance'),
(19, 'Lift/Elevator', 'Elevator maintenance fee'),
(20, 'Insurance', 'Flat insurance premium')
ON DUPLICATE KEY UPDATE 
    category_name = VALUES(category_name),
    description = VALUES(description);
    
-- 4. Bills Table
CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    flat_id INT NOT NULL,
    category_id INT NOT NULL,
    bill_month DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('unpaid','partial','paid') DEFAULT 'unpaid',
    FOREIGN KEY (flat_id) REFERENCES Flat(flat_id),
    FOREIGN KEY (category_id) REFERENCES Bill_Categories(category_id)
);

-- BILLS TABLE

INSERT INTO Bills (bill_id, flat_id, category_id, bill_month, total_amount, due_date, status) VALUES
(1, 1, 1, '2026-01-01', 22000.00, '2026-01-10', 'paid'),
(2, 1, 2, '2026-01-01', 1500.00, '2026-01-15', 'paid'),
(3, 1, 3, '2026-01-01', 3500.00, '2026-01-20', 'paid'),
(4, 2, 1, '2026-01-01', 16000.00, '2026-01-10', 'paid'),
(5, 2, 4, '2026-01-01', 1200.00, '2026-01-15', 'paid'),
(6, 3, 1, '2026-01-01', 28000.00, '2026-01-10', 'paid'),
(7, 3, 5, '2026-01-01', 4000.00, '2026-01-10', 'paid'),
(8, 4, 1, '2026-02-01', 20000.00, '2026-02-10', 'paid'),
(9, 4, 3, '2026-02-01', 2800.00, '2026-02-20', 'paid'),
(10, 5, 1, '2026-02-01', 20000.00, '2026-02-10', 'paid'),
(11, 5, 6, '2026-02-01', 6500.00, '2026-02-25', 'paid'),
(12, 6, 1, '2026-02-01', 20000.00, '2026-02-10', 'partial'),
(13, 6, 2, '2026-02-01', 1500.00, '2026-02-15', 'paid'),
(14, 7, 1, '2026-03-01', 15000.00, '2026-03-10', 'paid'),
(15, 7, 3, '2026-03-01', 3200.00, '2026-03-20', 'unpaid'),
(16, 8, 1, '2026-03-01', 25000.00, '2026-03-10', 'paid'),
(17, 8, 4, '2026-03-01', 1400.00, '2026-03-15', 'unpaid'),
(18, 9, 1, '2026-03-01', 25000.00, '2026-03-10', 'paid'),
(19, 10, 1, '2026-03-01', 16000.00, '2026-03-10', 'unpaid'),
(20, 10, 7, '2026-03-01', 2000.00, '2026-03-25', 'unpaid');

-- 5. Bill_Payments Table
CREATE TABLE Bill_Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT NOT NULL,
    paid_by INT NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id),
    FOREIGN KEY (paid_by) REFERENCES Members(member_id)
);

-- BILL_PAYMENTS TABLE

INSERT INTO Bill_Payments
(payment_id, bill_id, paid_by, amount_paid, payment_date, payment_method) VALUES

(1, 1, 1, 22000.00, '2026-01-08', 'bKash'),
(2, 2, 2, 1500.00, '2026-01-14', 'Cash'),
(3, 3, 3, 3500.00, '2026-01-18', 'Nagad'),
(4, 4, 4, 16000.00, '2026-01-08', 'bKash'),
(5, 5, 5, 1200.00, '2026-01-12', 'Cash'),
(6, 6, 6, 28000.00, '2026-01-09', 'bKash'),
(7, 7, 7, 4000.00, '2026-01-08', 'Cash'),
(8, 8, 8, 20000.00, '2026-02-08', 'Nagad'),
(9, 9, 9, 2800.00, '2026-02-18', 'bKash'),
(10, 10, 10, 20000.00, '2026-02-08', 'Cash'),
(11, 11, 11, 6500.00, '2026-02-22', 'bKash'),
(12, 12, 12, 15000.00, '2026-02-08', 'Cash'),
(13, 13, 13, 1500.00, '2026-02-14', 'Nagad'),
(14, 14, 14, 15000.00, '2026-03-08', 'bKash'),
(15, 16, 16, 25000.00, '2026-03-08', 'Cash'),
(16, 18, 18, 25000.00, '2026-03-08', 'bKash'),
(17, 19, 19, 8000.00, '2026-03-08', 'Cash'),
(18, 1, 2, 5000.00, '2026-01-09', 'bKash'),
(19, 4, 3, 8000.00, '2026-01-09', 'Nagad'),
(20, 8, 5, 10000.00, '2026-02-09', 'Cash');

-- 6. Shared_Expenses Table

CREATE TABLE Shared_Expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    flat_id INT NOT NULL,
    expense_title VARCHAR(80) NOT NULL,
    expense_type VARCHAR(30) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    paid_by INT NOT NULL,
    FOREIGN KEY (flat_id) REFERENCES Flat(flat_id),
    FOREIGN KEY (paid_by) REFERENCES Members(member_id)
);

-- Inserting into shared_Expenses
INSERT INTO Shared_Expenses (flat_id, expense_title, expense_type, total_amount, expense_date, paid_by) VALUES
(1, 'Monthly Grocery - January', 'Bazar', 8500.00, '2026-01-05', 1),
(1, 'Birthday Celebration', 'Meal', 3500.00, '2026-01-20', 2),
(2, 'Monthly Grocery - January', 'Bazar', 7200.00, '2026-01-06', 4),
(2, 'AC Service', 'Repair', 2500.00, '2026-01-25', 5),
(3, 'Monthly Grocery - January', 'Bazar', 9000.00, '2026-01-05', 6),
(3, 'Plumbing Repair', 'Repair', 1800.00, '2026-01-22', 7),
(4, 'Monthly Grocery - February', 'Bazar', 6800.00, '2026-02-05', 8),
(4, 'Movie Night', 'Meal', 2500.00, '2026-02-15', 9),
(5, 'Monthly Grocery - February', 'Bazar', 7500.00, '2026-02-06', 10),
(5, 'House Cleaning Supplies', 'Other', 1200.00, '2026-02-20', 11),
(6, 'Monthly Grocery - February', 'Bazar', 8200.00, '2026-02-05', 12),
(6, 'Electrician Service', 'Repair', 2000.00, '2026-02-18', 13),
(7, 'Monthly Grocery - March', 'Bazar', 6500.00, '2026-03-05', 14),
(7, 'Weekend BBQ', 'Meal', 4000.00, '2026-03-15', 15),
(8, 'Monthly Grocery - March', 'Bazar', 8800.00, '2026-03-06', 16),
(8, 'Water Filter Replacement', 'Other', 3000.00, '2026-03-20', 17),
(9, 'Monthly Grocery - March', 'Bazar', 7800.00, '2026-03-05', 18),
(9, 'Fan Repair', 'Repair', 1500.00, '2026-03-18', 19),
(10, 'Monthly Grocery - March', 'Bazar', 7000.00, '2026-03-06', 20),
(10, 'Pizza Night', 'Meal', 3000.00, '2026-03-22', 21);

-- 7. Member_Dues Table
CREATE TABLE Member_Dues (
    due_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    bill_id INT NULL,
    expense_id INT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    due_date DATE NOT NULL,
    paid_date DATE NULL,
    status ENUM('pending','cleared') DEFAULT 'pending',
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (bill_id) REFERENCES Bills(bill_id),
    FOREIGN KEY (expense_id) REFERENCES Shared_Expenses(expense_id)
);

-- Inserting into Member-Dues table
INSERT INTO Member_Dues (due_id, member_id, bill_id, expense_id, amount_due, due_date, paid_date, status) VALUES

(1, 1, 1, NULL, 5500.00, '2026-01-10', '2026-01-08', 'cleared'),
(2, 2, 1, NULL, 5500.00, '2026-01-10', '2026-01-08', 'cleared'),
(3, 3, 1, NULL, 5500.00, '2026-01-10', '2026-01-08', 'cleared'),
(4, 4, 1, NULL, 5500.00, '2026-01-10', '2026-01-08', 'cleared'),
(5, 1, 2, NULL, 375.00, '2026-01-15', '2026-01-14', 'cleared'),
(6, 2, 2, NULL, 375.00, '2026-01-15', '2026-01-14', 'cleared'),
(7, 3, 2, NULL, 375.00, '2026-01-15', '2026-01-14', 'cleared'),
(8, 4, 2, NULL, 375.00, '2026-01-15', '2026-01-14', 'cleared'),
(9, 5, 4, NULL, 3200.00, '2026-01-10', '2026-01-08', 'cleared'),
(10, 6, 4, NULL, 3200.00, '2026-01-10', '2026-01-08', 'cleared'),
(11, 5, 4, NULL, 3200.00, '2026-01-10', '2026-01-08', 'cleared'),
(12, 6, 6, NULL, 7000.00, '2026-01-10', '2026-01-09', 'cleared'),
(13, 7, 6, NULL, 7000.00, '2026-01-10', '2026-01-09', 'cleared'),
(14, 8, 8, NULL, 5000.00, '2026-02-10', '2026-02-08', 'cleared'),
(15, 9, 8, NULL, 5000.00, '2026-02-10', '2026-02-08', 'cleared'),
(16, 8, 8, NULL, 5000.00, '2026-02-10', '2026-02-08', 'cleared'),
(17, 9, 9, NULL, 2800.00, '2026-02-20', '2026-02-18', 'cleared'),
(18, 10, 10, NULL, 5000.00, '2026-02-10', '2026-02-08', 'cleared'),
(19, 11, 12, NULL, 4000.00, '2026-02-10', NULL, 'pending'),
(20, 12, 12, NULL, 4000.00, '2026-02-10', NULL, 'pending');

-- 8. Advances Table
CREATE TABLE Advances (
    advance_id INT PRIMARY KEY AUTO_INCREMENT,
    lender_id INT NOT NULL,
    borrower_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    reason VARCHAR(100),
    advance_date DATE NOT NULL,
    repaid_date DATE NULL,
    status ENUM('pending','repaid') DEFAULT 'pending',
    FOREIGN KEY (lender_id) REFERENCES Members(member_id),
    FOREIGN KEY (borrower_id) REFERENCES Members(member_id)
);

-- Inserting into Advances table
INSERT INTO Advances (advance_id, lender_id, borrower_id, amount, reason, advance_date, repaid_date, status) VALUES

(1, 1, 2, 1500.00, 'Borrowed for groceries', '2026-01-15', '2026-01-20', 'repaid'),
(2, 2, 3, 1000.00, 'WiFi bill advance', '2026-01-20', '2026-01-25', 'repaid'),
(3, 3, 4, 2000.00, 'Emergency cash', '2026-01-25', '2026-01-30', 'repaid'),
(4, 4, 5, 500.00, 'Bus fare', '2026-02-01', '2026-02-05', 'repaid'),
(5, 1, 6, 3000.00, 'Monthly rent advance', '2026-02-05', '2026-02-10', 'repaid'),
(6, 5, 7, 1500.00, 'Grocery shopping', '2026-02-10', '2026-02-15', 'repaid'),
(7, 2, 1, 1000.00, 'Electricity bill advance', '2026-02-15', '2026-02-20', 'repaid'),
(8, 6, 2, 2000.00, 'Medical expense', '2026-02-20', '2026-02-25', 'repaid'),
(9, 3, 5, 1500.00, 'Gas bill advance', '2026-02-25', NULL, 'pending'),
(10, 7, 1, 2500.00, 'Rent contribution', '2026-03-01', NULL, 'pending'),
(11, 1, 3, 1000.00, 'Bazar fund', '2026-03-05', NULL, 'pending'),
(12, 4, 6, 2000.00, 'Bua salary advance', '2026-03-08', NULL, 'pending'),
(13, 2, 4, 1500.00, 'WiFi bill share', '2026-03-10', NULL, 'pending'),
(14, 5, 1, 1000.00, 'Electricity bill', '2026-03-12', NULL, 'pending'),
(15, 6, 3, 2000.00, 'Rent advance', '2026-03-15', NULL, 'pending'),
(16, 7, 2, 1500.00, 'Grocery expense', '2026-03-18', NULL, 'pending'),
(17, 1, 5, 1000.00, 'Gas bill share', '2026-03-20', NULL, 'pending'),
(18, 3, 6, 2000.00, 'Bazar fund', '2026-03-22', NULL, 'pending'),
(19, 4, 7, 1500.00, 'Bua salary', '2026-03-25', NULL, 'pending'),
(20, 5, 2, 1000.00, 'Miscellaneous expense', '2026-03-28', NULL, 'pending');

SELECT member_id, member_name, member_contact, status FROM Members;
SELECT * FROM Members WHERE status = 'active';
INSERT INTO Bill_Categories (category_id, category_name, description)
VALUES (21, 'Laundry', 'Shared laundry service charge');
UPDATE Bills SET status = 'paid' WHERE bill_id = 5;
DELETE FROM Advances WHERE advance_id = 20;
SELECT bill_id, flat_id, total_amount, status FROM Bills WHERE total_amount > 15000;
SELECT member_id, member_name, join_date FROM Members ORDER BY join_date DESC;
SELECT member_id, member_name FROM Members ORDER BY member_id;
INSERT INTO Members (member_id, flat_id, member_name, member_contact, member_email, join_date, status) VALUES
(21, 1, 'Anik Reza', '01731682744', 'anik.reza20@gmail.com', '2025-09-25', 'active'),
(22, 2, 'Farhan Nabi', '01710076758', 'farhan.nabi21@gmail.com', '2025-10-11', 'active'),
(23, 3, 'Riyad Sattar', '01725014631', 'riyad.sattar22@gmail.com', '2025-06-27', 'active'),
(24, 4, 'Shanto Rashid', '01742138745', 'shanto.rashid23@gmail.com', '2025-01-08', 'active'),
(25, 5, 'Imran Faruk', '01720570592', 'imran.faruk24@gmail.com', '2025-02-24', 'active');
SELECT bill_id, total_amount, status FROM Bills
WHERE (status = 'unpaid' AND total_amount > 10000) OR status = 'partial';
SELECT member_name, status FROM Members WHERE NOT status = 'inactive';
SELECT member_name, member_email FROM Members WHERE member_name LIKE 'S%';
SELECT category_id, category_name FROM Bill_Categories
WHERE category_name IN ('WiFi', 'Electricity', 'Gas');
SELECT expense_id, expense_title, total_amount FROM Shared_Expenses
WHERE total_amount BETWEEN 1000 AND 4000;
SELECT COUNT(*) AS total_members FROM Members;
SELECT SUM(amount_paid) AS total_collected FROM Bill_Payments;
SELECT AVG(total_amount) AS avg_bill_amount FROM Bills;
SELECT MIN(total_amount) AS smallest_bill, MAX(total_amount) AS largest_bill FROM Bills;
SELECT status, COUNT(*) AS bill_count FROM Bills GROUP BY status;
SELECT flat_id, SUM(total_amount) AS total_billed
FROM Bills GROUP BY flat_id HAVING SUM(total_amount) > 20000;
SELECT m.member_name, f.flat_name
FROM Members m INNER JOIN Flat f ON m.flat_id = f.flat_id;
SELECT b.bill_id, b.total_amount, bp.amount_paid
FROM Bills b LEFT JOIN Bill_Payments bp ON b.bill_id = bp.bill_id;
SELECT bp.payment_id, m.member_name, bp.amount_paid
FROM Bill_Payments bp RIGHT JOIN Members m ON bp.paid_by = m.member_id;
SELECT m.member_name, bp.payment_id, bp.amount_paid
FROM Members m LEFT JOIN Bill_Payments bp ON m.member_id = bp.paid_by
UNION
SELECT m.member_name, bp.payment_id, bp.amount_paid
FROM Members m RIGHT JOIN Bill_Payments bp ON m.member_id = bp.paid_by;
SELECT a.member_name AS member1, b.member_name AS member2, a.flat_id
FROM Members a JOIN Members b ON a.flat_id = b.flat_id AND a.member_id < b.member_id
ORDER BY a.flat_id;
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'flatmate_expense_db' AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;
SELECT COLUMN_NAME, IS_NULLABLE, COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'flatmate_expense_db' AND TABLE_NAME = 'Members';
SELECT member_name,
       CASE WHEN status = 'active' THEN 'Currently Living' ELSE 'Moved Out' END AS living_status
FROM Members;
DELIMITER //
CREATE PROCEDURE GetMemberDues(IN p_member_id INT)
BEGIN
    SELECT d.due_id, d.amount_due, d.status
    FROM Member_Dues d
    WHERE d.member_id = p_member_id;
END //
DELIMITER ;
 
CALL GetMemberDues(14);
SELECT due_id, member_id, amount_due, IFNULL(paid_date, 'Not Paid Yet') AS payment_status
FROM Member_Dues WHERE paid_date IS NULL;
ALTER TABLE Members ADD COLUMN emergency_contact VARCHAR(20) NULL;
CREATE INDEX idx_bill_status ON Bills(status);
CREATE VIEW ActiveMembersView AS
SELECT member_id, member_name, member_email, flat_id
FROM Members WHERE status = 'active';
 
SELECT * FROM ActiveMembersView;