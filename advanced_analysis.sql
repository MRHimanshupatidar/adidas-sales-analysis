-- Monthly Sales Trend
SELECT
    DATE_FORMAT(invoice_date, '%Y-%m') AS month,
    SUM(total_sales) AS revenue
FROM fact_sales
GROUP BY month
ORDER BY month;

-- Average Order Value (AOV)
SELECT
    ROUND(SUM(total_sales) / COUNT(*), 2) AS avg_order_value
FROM fact_sales;

-- Product-wise Average Operating Margin
SELECT
    p.product_name,
    ROUND(AVG(fs.operating_margin), 2) AS avg_margin
FROM fact_sales fs
JOIN products p 
    ON fs.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_margin DESC;

-- Sales Contribution % by Sales Method
SELECT
    sm.method_name,
    ROUND(
        SUM(fs.total_sales) * 100 /
        (SELECT SUM(total_sales) FROM fact_sales),
        2
    ) AS contribution_percent
FROM fact_sales fs
JOIN sales_method sm 
    ON fs.method_id = sm.method_id
GROUP BY sm.method_name
ORDER BY contribution_percent DESC;

-- Top 2 Products in Each Region (Window Function)
SELECT region, product_name, revenue
FROM (
    SELECT
        l.region,
        p.product_name,
        SUM(fs.total_sales) AS revenue,
        RANK() OVER (
            PARTITION BY l.region
            ORDER BY SUM(fs.total_sales) DESC
        ) AS rnk
    FROM fact_sales fs
    JOIN locations l 
        ON fs.location_id = l.location_id
    JOIN products p 
        ON fs.product_id = p.product_id
    GROUP BY l.region, p.product_name
) ranked_products
WHERE rnk <= 2;

-- Month-over-Month Sales Growth
SELECT
    month,
    total_sales,
    previous_month_sales,
    total_sales - previous_month_sales AS growth
FROM (
    SELECT
        DATE_FORMAT(invoice_date, '%Y-%m') AS month,
        SUM(total_sales) AS total_sales,
        LAG(SUM(total_sales)) OVER (
            ORDER BY DATE_FORMAT(invoice_date, '%Y-%m')
        ) AS previous_month_sales
    FROM fact_sales
    GROUP BY month
) t;
