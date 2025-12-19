-- Retailers
CREATE TABLE IF NOT EXISTS retailers (
    retailer_id INT PRIMARY KEY,
    retailer_name VARCHAR(100)
);

-- Locations
CREATE TABLE IF NOT EXISTS locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50)
);

-- Products
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price_per_unit DECIMAL(10,2)
);

-- Sales Method
CREATE TABLE IF NOT EXISTS sales_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50)
);

-- Fact Sales
CREATE TABLE IF NOT EXISTS fact_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    retailer_id INT,
    location_id INT,
    product_id INT,
    method_id INT,
    invoice_date DATE,
    units_sold INT,
    total_sales DECIMAL(15,2),
    operating_profit DECIMAL(15,2),
    operating_margin DECIMAL(5,2),
    FOREIGN KEY (retailer_id) REFERENCES retailers(retailer_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (method_id) REFERENCES sales_method(method_id)
);
