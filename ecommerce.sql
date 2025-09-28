-- ecommerce.sql
-- Schema + sample data + analysis queries

-- 1. Create database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- 2. Create tables
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150),
  email VARCHAR(150) UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  price DECIMAL(10,2),
  stock INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(12,2),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 3. Insert sample data
INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice@gmail.com'),
('Bob Smith', 'bob@yahoo.com'),
('Charlie Brown', 'charlie@hotmail.com');

INSERT INTO products (name, price, stock) VALUES
('Laptop', 55000, 10),
('Phone', 25000, 15),
('Headphones', 2000, 30),
('Keyboard', 1500, 20);

INSERT INTO orders (customer_id, total) VALUES
(1, 55000),
(2, 27000),
(3, 21500);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 55000),  -- Alice bought Laptop
(2, 2, 1, 25000), -- Bob bought Phone
(2, 3, 1, 2000),  -- Bob bought Headphones
(3, 2, 1, 25000), -- Charlie bought Phone
(3, 4, 1, 1500);  -- Charlie bought Keyboard

-- 4. Example queries

-- Show all customers
SELECT * FROM customers;

-- Show all products
SELECT * FROM products;

-- Orders with customer names
SELECT o.id AS order_id, c.name AS customer, o.total, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id;

-- Total revenue
SELECT SUM(total) AS total_revenue FROM orders;

-- Top products by revenue
SELECT p.name, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON p.id = oi.product_id
GROUP BY p.id, p.name
ORDER BY revenue DESC;
