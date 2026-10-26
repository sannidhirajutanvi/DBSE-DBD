CREATE DATABASE students;
USE students;

-- CREATE TABLE
DROP TABLE IF EXISTS bank_transactions;
CREATE TABLE bank_transactions (
    txn_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    branch_name VARCHAR(50),
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE
);

-- INSERT DATA
INSERT INTO bank_transactions VALUES
(101,'Tanvi','Hyderabad','Deposit',5000,'2026-05-03'),
(102,'Sita','Hyderabad','Withdrawal',2000,'2024-01-06'),
(103,'Kiran','Vijayawada','Deposit',12000,'2024-01-08'),
(104,'Anil','Vizag','Deposit',8000,'2024-01-10'),
(105,'Priya','Hyderabad','Withdrawal',3500,'2024-01-11'),
(106,'Ramesh','Vizag','Deposit',15000,'2024-01-12'),
(107,'Keerthi','Vijayawada','Withdrawal',1000,'2024-01-13'),
(108,'Rahul','Hyderabad','Deposit',9000,'2024-01-14'),
(109,'Sneha','Vizag','Withdrawal',4000,'2024-01-15'),
(110,'Madhu','Vijayawada','Deposit',11000,'2024-01-16');

-- 1. SUM()
SELECT SUM(amount) AS Total_Amount
FROM bank_transactions;

-- 2. AVG()
SELECT AVG(amount) AS Average_Amount
FROM bank_transactions;

-- 3. MAX()
SELECT MAX(amount) AS Highest_Amount
FROM bank_transactions;

-- 4. MIN()
SELECT MIN(amount) AS Lowest_Amount
FROM bank_transactions;

-- 5. COUNT()
SELECT COUNT(*) AS Total_Transactions
FROM bank_transactions;

-- 6. WHERE + SUM()
SELECT SUM(amount) AS Total_Deposit
FROM bank_transactions
WHERE transaction_type = 'Deposit';

-- 7. GROUP BY + SUM()
SELECT branch_name, SUM(amount) AS Total_Amount
FROM bank_transactions
GROUP BY branch_name;

-- 8. GROUP BY + MAX()
SELECT branch_name, MAX(amount) AS Highest_Amount
FROM bank_transactions
GROUP BY branch_name;

-- 9. GROUP BY + MIN()
SELECT branch_name, MIN(amount) AS Lowest_Amount
FROM bank_transactions
GROUP BY branch_name;

-- 10. GROUP BY + COUNT()
SELECT branch_name, COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY branch_name;

-- 11. GROUP BY + HAVING
SELECT branch_name, SUM(amount) AS Total_Amount
FROM bank_transactions
GROUP BY branch_name
HAVING SUM(amount) > 20000;

-- 12. WHERE + ORDER BY
SELECT *
FROM bank_transactions
WHERE amount > 8000
ORDER BY amount DESC;

-- 13. GROUP BY + AVG() + HAVING + ORDER BY
SELECT branch_name, AVG(amount) AS Avg_Amount
FROM bank_transactions
GROUP BY branch_name
HAVING AVG(amount) > 7000
ORDER BY Avg_Amount DESC;