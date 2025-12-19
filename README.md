# Adidas Sales Analysis (SQL + Python)

## 📌 Project Overview
This project is an end-to-end sales analysis of Adidas US sales data using
MySQL, SQL, and Python. The goal is to analyze sales performance, profitability,
regional trends, product performance, and sales methods to extract meaningful
business insights.

---

## 🧰 Tools & Technologies
- MySQL
- SQL (Joins, Aggregations, Window Functions)
- Python
- Pandas
- Matplotlib
- Jupyter Notebook

---

## 🗂 Database Schema
The project uses a star-schema style design:

- **fact_sales** – transactional sales data  
- **products** – product details  
- **locations** – region, state, and city data  
- **retailers** – retailer information  
- **sales_method** – sales channels  

---

## 🔍 Key Analysis Performed
- Total revenue, profit, and units sold
- Region-wise and state-wise sales analysis
- Top-performing products by revenue
- Sales contribution by sales method
- Monthly sales trends
- Product performance across regions
- Operating margin analysis

---

## 📊 Key Insights
- Certain regions contribute significantly higher revenue than others
- A small number of products drive a large portion of total sales
- Sales methods show different performance patterns
- Some products have high margins but relatively lower sales
- Sales data shows clear monthly trends

---

## ▶ How to Run the Project
1. Load the dataset into MySQL
2. Execute SQL queries from the `sql/` folder
3. Run the Python analysis notebook/script from the `python/` folder

---

## 📎 Project Structure
