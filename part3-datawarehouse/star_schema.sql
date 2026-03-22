-- Dimension: Date
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table
CREATE TABLE fact_sales (
    sale_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_id DATE,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    revenue DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- dim_date
INSERT INTO dim_date VALUES
('2023-01-01', 2023, 1, 1),
('2023-02-01', 2023, 2, 1),
('2023-03-01', 2023, 3, 1);

-- dim_store
INSERT INTO dim_store VALUES
('S1', 'Mumbai Store', 'Mumbai'),
('S2', 'Delhi Store', 'Delhi'),
('S3', 'Bangalore Store', 'Bangalore');

-- dim_product
INSERT INTO dim_product VALUES
('P1', 'Laptop', 'Electronics'),
('P2', 'Shirt', 'Clothing'),
('P3', 'Milk', 'Groceries');

-- fact_sales
INSERT INTO fact_sales (date_id, store_id, product_id, quantity, revenue) VALUES
('2023-01-01', 'S1', 'P1', 2, 100000),
('2023-01-01', 'S2', 'P2', 5, 5000),
('2023-02-01', 'S3', 'P3', 10, 600),
('2023-02-01', 'S1', 'P2', 3, 3000),
('2023-03-01', 'S2', 'P1', 1, 50000),
('2023-03-01', 'S3', 'P2', 7, 7000),
('2023-01-01', 'S3', 'P1', 1, 50000),
('2023-02-01', 'S2', 'P3', 8, 480),
('2023-03-01', 'S1', 'P3', 6, 360),
('2023-01-01', 'S2', 'P1', 2, 100000);
