-- ============================================================
-- Retail Operations SQL Query Analysis
-- Author: Ava Szczygiel
-- Tools: MySQL 8.0
-- Description: Explores a retail database of customers, orders,
--              products, and vendors using filtering, sorting,
--              and aggregation techniques to answer operational
--              business questions.
-- ============================================================

USE aa630_m2_activity;

-- ============================================================
-- PART 1: RETRIEVING DATA
-- ============================================================

-- 1.1: Retrieve all columns from the customers table
-- Business Question: What customer data is available, and how many customers are there?

SELECT *
FROM customers;


-- 1.2: Retrieve every customer ID from the customers table
-- Business Question: How many unique customers exist in the database?

SELECT customer_id
FROM customers;


-- 1.3: Retrieve a unique list of products ordered from the OrderItems table
-- Business Question: Which distinct products have actually been ordered?

SELECT DISTINCT product_id
FROM Order_Items;


-- ============================================================
-- PART 2: SORTING QUERIES
-- ============================================================

-- 2.1: Customer ID and order number sorted by customer ID (ASC),
--      then by order date in reverse chronological order (newest first)
-- Business Question: What is the customer ID from the two most recent orders?
-- Technique: Multi-column ORDER BY with mixed ASC/DESC

SELECT cust_id, order_num
FROM orders
ORDER BY cust_id ASC, order_num DESC;


-- 2.2: Quantity and price from OrderItems sorted highest quantity
--      and highest price first
-- Business Question: What is the most expensive and highest quantity item?
-- Technique: Multi-column sort to surface top-value items

SELECT quantity, item_price
FROM OrderItems
ORDER BY quantity DESC, item_price DESC;


-- ============================================================
-- PART 3: FILTERING QUERIES
-- ============================================================

-- 3.1: Unique list of order numbers containing 100 or more of any item
-- Business Question: How many orders qualify as bulk purchases (qty >= 100)?
-- Technique: DISTINCT + WHERE filter on aggregate threshold

SELECT DISTINCT order_num
FROM OrderItems
WHERE quantity >= 100;


-- 3.2: Vendor names filtered to California-based vendors only
-- Business Question: Which vendors operate out of California?
-- Technique: Multi-condition WHERE filter (country AND state)

SELECT vend_name
FROM vendors
WHERE vend_country = 'USA'
  AND vend_state = 'CA';


-- ============================================================
-- PART 4: AGGREGATING DATA
-- ============================================================

-- 4.1: Total number of items sold across all orders
-- Business Question: What is the overall sales volume by unit count?
-- Technique: SUM() aggregate across entire table

SELECT SUM(quantity) AS total_items_sold
FROM OrderItems;


-- 4.2: Total number of product BR01 items sold
-- Business Question: How many units of product BR01 have been sold specifically?
-- Technique: SUM() with WHERE filter on specific product

SELECT SUM(quantity) AS br01_total_sold
FROM OrderItems
WHERE prod_id = 'BR01';


-- 4.3: Order count and average order size for orders under 200 units
-- Business Question: How many smaller orders exist, and what is their average size?
-- Goal: Understand the volume and typical size of non-bulk orders to support
--       inventory and fulfillment planning decisions.
-- Technique: COUNT(), AVG(), and WHERE filter to isolate a segment

SELECT
    COUNT(DISTINCT order_num) AS num_orders,
    AVG(quantity)             AS avg_quantity_per_line
FROM OrderItems
WHERE quantity <= 200;
