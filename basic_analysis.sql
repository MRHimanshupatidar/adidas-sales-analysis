-- Total Revenue
SELECT SUM(total_sales) AS total_revenue
FROM fact_sales;

-- Total Operating Profit
SELECT SUM(operating_profit) AS total_profit
FROM fact_sales;

-- Total Units Sold
SELECT SUM(units_sold) AS total_units_sold
FROM fact_sales;

-- Sales by Region
SELECT 
    l.region,
    SUM(fs.total_sales) AS revenue
FROM fact_sales fs
JOIN locations l 
    ON fs.location_id = l.location_id
GROUP BY l.region
ORDER BY revenue DESC;

-- Sales by Sales Method
SELECT 
    sm.method_name,
    SUM(fs.total_sales) AS revenue
FROM fact_sales fs
JOIN sales_method sm 
    ON fs.method_id = sm.method_id
GROUP BY sm.method_name
ORDER BY revenue DESC;

-- Top 5 Products by Revenue
SELECT 
    p.product_name,
    SUM(fs.total_sales) AS revenue
FROM fact_sales fs
JOIN products p 
    ON fs.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 States by Revenue
SELECT 
    l.state,
    SUM(fs.total_sales) AS revenue
FROM fact_sales fs
JOIN locations l 
    ON fs.location_id = l.location_id
GROUP BY l.state
ORDER BY revenue DESC
LIMIT 5;
