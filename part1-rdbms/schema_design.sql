
-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



INSERT INTO customers VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi');

INSERT INTO products VALUES
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200),
('P006', 'Standing Desk', 'Furniture', 22000),
('P007', 'Pen Set', 'Stationery', 250);
('P999', 'Test Product', 'Test', 100);

INSERT INTO sales_reps VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

INSERT INTO orders VALUES
('ORD1027', 'C002', 'SR02', '2023-11-02'),
('ORD1114', 'C001', 'SR01', '2023-08-06'),
('ORD1153', 'C006', 'SR01', '2023-02-14'),
('ORD1002', 'C002', 'SR02', '2023-01-17'),
('ORD1118', 'C006', 'SR02', '2023-11-10'),
('ORD1132', 'C003', 'SR02', '2023-03-07'),
('ORD1037', 'C002', 'SR03', '2023-03-06'),
('ORD1075', 'C005', 'SR03', '2023-04-18'),
('ORD1083', 'C006', 'SR01', '2023-07-03'),
('ORD1091', 'C001', 'SR01', '2023-07-24');

INSERT INTO order_items VALUES
('ORD1027', 'P004', 4),
('ORD1114', 'P007', 2),
('ORD1153', 'P007', 3),
('ORD1002', 'P005', 1),
('ORD1118', 'P007', 5),
('ORD1132', 'P007', 5),
('ORD1037', 'P007', 2),
('ORD1075', 'P003', 3),
('ORD1083', 'P007', 2),
('ORD1091', 'P006', 3);
