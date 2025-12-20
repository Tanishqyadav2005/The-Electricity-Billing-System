-- Electricity Billing System Database Setup Script
-- Database: Bill_system

-- Create Database (if not exists)
CREATE DATABASE IF NOT EXISTS Bill_system;
USE Bill_system;

-- Drop tables if they exist (for fresh setup)
DROP TABLE IF EXISTS bill;
DROP TABLE IF EXISTS meter_info;
DROP TABLE IF EXISTS tax;
DROP TABLE IF EXISTS new_customer;
DROP TABLE IF EXISTS Signup;

-- Create Signup table (for user authentication)
CREATE TABLE Signup (
    meter_no VARCHAR(50),
    username VARCHAR(50),
    name VARCHAR(100),
    password VARCHAR(50),
    usertype VARCHAR(20)
);

-- Create new_customer table
CREATE TABLE new_customer (
    name VARCHAR(100),
    meter_no VARCHAR(50),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR(100),
    phone_no VARCHAR(20)
);

-- Create meter_info table
CREATE TABLE meter_info (
    meter_number VARCHAR(50),
    meter_location VARCHAR(50),
    meter_type VARCHAR(50),
    phase_code VARCHAR(10),
    bill_type VARCHAR(50),
    Days VARCHAR(10)
);

-- Create bill table
CREATE TABLE bill (
    meter_no VARCHAR(50),
    month VARCHAR(20),
    unit VARCHAR(20),
    total_bill VARCHAR(50),
    status VARCHAR(20)
);

-- Create tax table (for billing calculations)
CREATE TABLE tax (
    cost_per_unit VARCHAR(20),
    meter_rent VARCHAR(20),
    service_charge VARCHAR(20),
    service_tax VARCHAR(20),
    swacch_bharat VARCHAR(20),
    fixed_tax VARCHAR(20)
);

-- Insert Demo Login Credentials
-- Admin Login
INSERT INTO Signup VALUES ('ADMIN001', 'admin', 'Administrator', 'admin123', 'Admin');

-- Customer Login (Demo User 1)
INSERT INTO Signup VALUES ('123456', 'demo', 'John Doe', 'demo123', 'Customer');

-- Insert Demo Customer Data
INSERT INTO new_customer VALUES 
('John Doe', '123456', '123 Main Street', 'New York', 'NY', 'john.doe@email.com', '1234567890'),
('Jane Smith', '234567', '456 Oak Avenue', 'Los Angeles', 'CA', 'jane.smith@email.com', '2345678901'),
('Bob Johnson', '345678', '789 Pine Road', 'Chicago', 'IL', 'bob.johnson@email.com', '3456789012');

-- Insert Demo Meter Info
INSERT INTO meter_info VALUES 
('123456', 'Outside', 'Electric Meter', '011', 'Normal', '30'),
('234567', 'Inside', 'Smart Meter', '022', 'Normal', '30'),
('345678', 'Outside', 'Solar Meter', '033', 'Normal', '30');

-- Insert Tax Configuration
INSERT INTO tax VALUES ('10', '50', '100', '5', '10', '20');

-- Insert Demo Bills
INSERT INTO bill VALUES 
('123456', 'January', '150', '2500', 'Paid'),
('123456', 'February', '180', '3000', 'Not Paid'),
('234567', 'January', '200', '3500', 'Paid'),
('345678', 'January', '120', '2000', 'Not Paid');

-- Display Demo Login Credentials
SELECT '=== DEMO LOGIN CREDENTIALS ===' AS Info;
SELECT 'Admin Login:' AS Type, 'Username: admin' AS Username, 'Password: admin123' AS Password, 'Type: Admin' AS UserType
UNION ALL
SELECT 'Customer Login:' AS Type, 'Username: demo' AS Username, 'Password: demo123' AS Password, 'Type: Customer' AS UserType;
CREATE DATABASE ebs;
USE ebs;

CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    units INT
);

CREATE TABLE bill (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    units INT,
    amount DOUBLE,
    bill_date DATE
);
