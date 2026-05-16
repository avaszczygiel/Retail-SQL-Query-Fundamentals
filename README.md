# Retail Operations SQL Analysis

## Project Overview
This project applies core SQL querying techniques to a retail operations database containing customers, orders, order items, products, and vendors. Queries range from basic data retrieval to multi-condition filtering, multi-column sorting, and aggregation — demonstrating foundational SQL skills used in real-world business analytics.

---

## Business Questions Answered

| Part | # | Question |
|------|---|----------|
| 1 – Retrieval | 1.1 | What customer data is available, and how many customers exist? |
| 1 – Retrieval | 1.2 | How many unique customer IDs are in the database? |
| 1 – Retrieval | 1.3 | Which distinct products have been ordered? |
| 2 – Sorting | 2.1 | What are the two most recent orders, sorted by customer and date? |
| 2 – Sorting | 2.2 | What is the highest quantity and most expensive item ordered? |
| 3 – Filtering | 3.1 | Which orders contain 100 or more units of any single item? |
| 3 – Filtering | 3.2 | Which vendors are located in California? |
| 4 – Aggregation | 4.1 | What is the total number of items sold across all orders? |
| 4 – Aggregation | 4.2 | How many units of product BR01 have been sold? |
| 4 – Aggregation | 4.3 | How many non-bulk orders exist and what is their average order size? |

---

## Database Schema

The database contains five related tables:

```
customers         orders            orderitems         products          vendors
-----------       ----------        -----------        ----------        ----------
cust_id       ←→  cust_id           order_num      ←→  prod_id       ←→  vend_id
cust_name         order_num     ←→  order_item         vend_id           vend_name
cust_address      order_date        prod_id            prod_name         vend_address
cust_city                           quantity           prod_price        vend_city
cust_state                          item_price         prod_desc         vend_state
cust_zip                                                                 vend_country
cust_country
cust_contact
cust_email
```

---

## SQL Techniques Demonstrated

- `SELECT *` and column-specific retrieval
- `SELECT DISTINCT` to eliminate duplicates
- `ORDER BY` with multiple columns and mixed `ASC`/`DESC` directions
- `WHERE` with single and multi-condition filters (`AND`)
- `SUM()`, `COUNT()`, `AVG()` aggregate functions
- Combining `WHERE` with aggregates to filter specific segments

---

## Files

```
retail-sql-query-fundamentals/
├── README.md
├── queries/
│   └── analysis_queries.sql    ← All queries with business context comments
└── data/
    └── database_schema.sql     ← Full schema and seed data
```

---

## How to Run

1. Install [MySQL](https://dev.mysql.com/downloads/) or use MySQL Workbench
2. Run `data/database_schema.sql` to create and populate the database
3. Open `queries/analysis_queries.sql` and run each section individually

---

## Tools Used
- **MySQL 8.0**
- **MySQL Workbench**

---

## About
Academic project completed as part of MBA coursework in Business Analytics at Bryant University.
