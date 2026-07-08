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

-- 3. Bill_Categories Table
CREATE TABLE Bill_Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(150)
);

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