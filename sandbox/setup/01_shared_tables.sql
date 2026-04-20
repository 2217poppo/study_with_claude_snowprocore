-- ============================================
-- 共有テーブル定義
-- 複数の演習で再利用するテーブル群
-- 新しい共有テーブルが必要になったらここに追加する
-- ============================================

USE DATABASE ${DB_NAME};
USE SCHEMA PUBLIC;

-- サンプル売上データ
-- 用途: 集約関数、Time Travel、クラスタリング、ビュー、ストリーム等
CREATE TABLE IF NOT EXISTS sample_sales (
  sale_id INT AUTOINCREMENT,
  sale_date DATE,
  product_name VARCHAR(100),
  category VARCHAR(50),
  quantity INT,
  unit_price DECIMAL(10,2),
  total_amount DECIMAL(10,2),
  region VARCHAR(50),
  customer_id INT
);

-- サンプルデータ投入（テーブルが空の場合のみ）
INSERT INTO sample_sales (sale_date, product_name, category, quantity, unit_price, total_amount, region, customer_id)
SELECT column1, column2, column3, column4, column5, column6, column7, column8
FROM VALUES
  ('2024-01-15'::DATE, 'Laptop', 'Electronics', 2, 999.99, 1999.98, 'East', 101),
  ('2024-01-16'::DATE, 'Mouse', 'Electronics', 5, 29.99, 149.95, 'West', 102),
  ('2024-01-17'::DATE, 'Desk', 'Furniture', 1, 450.00, 450.00, 'East', 103),
  ('2024-02-01'::DATE, 'Monitor', 'Electronics', 3, 349.99, 1049.97, 'North', 101),
  ('2024-02-05'::DATE, 'Chair', 'Furniture', 2, 275.00, 550.00, 'South', 104),
  ('2024-02-10'::DATE, 'Keyboard', 'Electronics', 10, 79.99, 799.90, 'West', 105),
  ('2024-03-01'::DATE, 'Laptop', 'Electronics', 1, 1299.99, 1299.99, 'East', 106),
  ('2024-03-15'::DATE, 'Webcam', 'Electronics', 4, 89.99, 359.96, 'North', 102),
  ('2024-03-20'::DATE, 'Bookshelf', 'Furniture', 1, 199.99, 199.99, 'South', 107),
  ('2024-04-01'::DATE, 'Headphones', 'Electronics', 6, 149.99, 899.94, 'East', 108)
WHERE NOT EXISTS (SELECT 1 FROM sample_sales LIMIT 1);

-- サンプル顧客データ
-- 用途: JOIN演習、セキュリティ（マスキング）、データ共有等
CREATE TABLE IF NOT EXISTS sample_customers (
  customer_id INT,
  customer_name VARCHAR(100),
  email VARCHAR(200),
  signup_date DATE,
  tier VARCHAR(20),
  region VARCHAR(50)
);

INSERT INTO sample_customers
SELECT column1, column2, column3, column4, column5, column6
FROM VALUES
  (101, 'Alice Johnson', 'alice@example.com', '2023-06-15'::DATE, 'Gold', 'East'),
  (102, 'Bob Smith', 'bob@example.com', '2023-07-20'::DATE, 'Silver', 'West'),
  (103, 'Carol White', 'carol@example.com', '2023-08-10'::DATE, 'Bronze', 'East'),
  (104, 'David Brown', 'david@example.com', '2023-09-01'::DATE, 'Gold', 'South'),
  (105, 'Eve Davis', 'eve@example.com', '2023-10-15'::DATE, 'Silver', 'West'),
  (106, 'Frank Miller', 'frank@example.com', '2023-11-20'::DATE, 'Bronze', 'East'),
  (107, 'Grace Wilson', 'grace@example.com', '2024-01-05'::DATE, 'Gold', 'South'),
  (108, 'Henry Lee', 'henry@example.com', '2024-02-14'::DATE, 'Silver', 'East')
WHERE NOT EXISTS (SELECT 1 FROM sample_customers LIMIT 1);
