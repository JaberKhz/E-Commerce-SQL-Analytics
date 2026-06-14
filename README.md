# Global E-Commerce Data Analytics Project (SQL)

## 📌 Project Overview
This project demonstrates an end-to-end SQL-based data analytics solution for a global E-Commerce platform. Using **PostgreSQL (pgAdmin 4)**, I designed a relational database schema, populated it with sample transactional data, and performed deep-dive data cleaning, financial reporting, and advanced user-behavior analysis.

---

## 📊 Database Schema
The project utilizes 4 interconnected tables:
* **`users`**: Contains customer profiles and geographical data.
* **`products`**: Inventory data, product categories, and pricing.
* **`orders`**: Transactional records, order dates, and delivery status.
* **`reviews`**: Customer feedback and ratings.

---

## 🛠️ Key Skills & SQL Concepts Applied
* **Data Cleaning & Manipulation:** `TRIM`, `UPPER`, `LOWER`, `SUBSTRING` for standardizing text and creating country codes.
* **Filtering & Sorting:** `WHERE`, `LIKE` (Wildcards), `LIMIT`, and `ORDER BY`.
* **Aggregations & Grouping:** `SUM`, `AVG`, `MAX`, `MIN`, `COUNT(DISTINCT)`, `GROUP BY`, and `HAVING` for financial summaries.
* **Advanced Conditional Logic:** `CASE STATEMENT` for dynamic order status categorization.
* **Date & Time Functions:** `TO_CHAR` and `NOW()` for time-series analysis and reporting timestamps.
* **Advanced Relational Operations:** Multi-table `INNER JOIN`, `LEFT JOIN` (for missing data detection), and `UNION`.
* **Subqueries:** Complex conditional nesting for benchmark analysis.

---

## 🔍 Analytical Questions Answered (Business Insights)
1. **Data Standardizing:** Standardized messy user inputs and generated 3-letter country codes.
2. **Financial Summary:** Generated key financial KPIs (Total unique items, Average price, Price extremes).
3. **Inventory Value:** Calculated total asset value per category, filtering out low-value categories (> $1000).
4. **Operations Reporting:** Built a comprehensive master report joining customers, products, and order quantities.
5. **Churn & Marketing Analysis:** Identified inactive users who registered but haven't placed any orders yet (Target for marketing discounts).
6. **Pricing Benchmark:** Isolated premium products priced above the store-wide average using subqueries.

---

## 💻 How to Run the Project
1. Open **pgAdmin 4** or any PostgreSQL interface.
2. Create a new database.
3. Execute the queries inside `project_queries.sql` to build the schema and review the insights.
