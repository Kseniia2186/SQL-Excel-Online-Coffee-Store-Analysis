CREATE DATABASE OnlineStore;
USE OnlineStore;
CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR (50),
last_name VARCHAR (50),
email VARCHAR (100)
);
CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name VARCHAR (100),
price DECIMAL (10, 2)
);
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers (customer_id),
FOREIGN KEY (product_id) REFERENCES Products (product_id)
);
INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES
(1, 'Bob', 'Smith', 'bob@gmail.com'),
(2, 'Eva', 'Lee', 'eva@gmail.com'),
(3, 'Dan', 'Ron', 'Ron@gmail.com'),
(4, 'Joe', 'Taylor', 'joe@gmail.com'),
(5, 'Jim', 'Popov', 'jim@gmail.com'),
(6, 'Kim', 'Daw', 'kim@gmail.com'),
(7, 'Sam', 'Jakson', 'sam@gmail.com'),
(8, 'Max', 'Hight', 'max@gmail.com'),
(9, 'Samanta', 'Ivan', 'samanta@gmail.com'),
(10, 'Trisha', 'Main', 'trisha@gmail.com');

INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Espresso Roast', 14.99),
(2, 'French Roast', 13.49),
(3, 'Italian Roast', 15.99),
(4, 'Breakfast Blend', 12.99),
(5, 'Colombian Coffee', 13.99),
(6, 'Ethiopian Yirgacheffe', 16.49),
(7, 'Guatemalan Antigua', 15.49),
(8, 'House Blend', 12.49),
(9, 'Decaf Medium Roast', 13.49),
(10, 'Vanilla Flavored Coffee', 14.49);

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 2, 3, '2025-06-01'),
(2, 1, 7, 1, '2025-06-02'),
(3, 2, 1, 4, '2025-06-02'),
(4, 4, 5, 1, '2025-06-03'),
(5, 4, 9, 3, '2025-06-03'),
(6, 5, 10, 5, '2025-06-03'),
(7, 7, 1, 3, '2025-06-04'),
(8, 8, 8, 2, '2025-06-05'),
(9, 9, 3, 4,  '2025-06-05'),
(10, 10, 1, 2, '2025-06-06');

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

-- 1. Total Spending per Customer

SELECT c.first_name, c.last_name, sum(p.price*o.quantity) AS total_spent 
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.customer_id;

-- 2. Find Orders with a Total Amount Greater than $50

SELECT c.first_name, c.last_name, p.product_name, p.price*o.quantity AS total_spent 
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
WHERE p.price*o.quantity > 50
ORDER BY total_spent;

-- 3. Update Customer Information

UPDATE Customers
SET email = 'neweva@gmail.com'
WHERE customer_id = 2;

SELECT * FROM Customers;



