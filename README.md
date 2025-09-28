# ELEVATE_LABS_DATA-ANALYST_INTERN_TASK-4
# Ecommerce MySQL Project

This project demonstrates a simple **E-commerce Database** built with **MySQL**.
It contains schema definitions, sample data, and example queries for analysis.

---

## 📂 Project Structure

```
.
├── ecommerce.sql   # SQL script (schema + sample data + queries)
├── output.txt      # Sample output of queries
└── README.md       # Project documentation
```

---

## ⚙️ Setup Instructions

### 1. Prerequisites

* MySQL 8.0+ (Server & Client)
* Command Prompt / Terminal access
* Optional: MySQL Workbench for GUI

### 2. Import Database

Run the provided SQL file:

```bash
mysql -u root -p < ecommerce.sql
```

This will:

* Create the `ecommerce` database
* Build all required tables (`customers`, `products`, `orders`, `order_items`)
* Insert sample data
* Execute example queries

### 3. Verify Database

Log in to MySQL:

```bash
mysql -u root -p
```

Then check:

```sql
USE ecommerce;
SHOW TABLES;
SELECT * FROM customers;
```

---

## 📊 Example Queries

Some queries included in `ecommerce.sql`:

* Show all customers:

  ```sql
  SELECT * FROM customers;
  ```

* Orders with customer names:

  ```sql
  SELECT o.id AS order_id, c.name, o.total, o.order_date
  FROM orders o
  JOIN customers c ON o.customer_id = c.id;
  ```

* Total revenue:

  ```sql
  SELECT SUM(total) AS total_revenue FROM orders;
  ```

* Top products by revenue:

  ```sql
  SELECT p.name, SUM(oi.quantity * oi.unit_price) AS revenue
  FROM order_items oi
  JOIN products p ON p.id = oi.product_id
  GROUP BY p.id, p.name
  ORDER BY revenue DESC;
  ```

---

## 📑 Sample Output

A sample run is provided in **`output.txt`**, e.g.:

```
mysql> SELECT SUM(total) AS total_revenue FROM orders;
+---------------+
| total_revenue |
+---------------+
|      103500.00|
+---------------+
```

---

## 🚀 How to Use

1. Clone or download this repository
2. Import `ecommerce.sql` into your MySQL server
3. Run queries from the script or write your own
4. Compare with `output.txt` for expected results

---

## 📝 Notes

* This is a sample project for learning **SQL basics, joins, aggregates, and schema design**.
* You can extend it by adding more tables (e.g., `payments`, `categories`, `suppliers`).
* Indexing and optimization examples can also be added for performance.

---
