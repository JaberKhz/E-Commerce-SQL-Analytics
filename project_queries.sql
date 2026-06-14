-- 1. إنشاء جدول المستخدمين
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50),
    join_date TIMESTAMP
);

-- 2. إنشاء جدول المنتجات
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    stock INT
);

-- 3. إنشاء جدول الطلبات
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    order_date TIMESTAMP,
    quantity INT,
    status VARCHAR(20)
);

-- 4. إنشاء جدول التقييمات
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    rating INT,
    review_text TEXT
);

-- ===================================================
-- تغذية الجداول بالبيانات (Data Insertion)
-- ===================================================

INSERT INTO users (full_name, country, join_date) VALUES
(' Ahmed Ali ', 'Egypt', '2025-01-15 08:30:00'),
('Sara Mansour', 'Egypt', '2025-02-20 14:15:00'),
('john smith', 'USA', '2025-03-01 11:00:00'),
('Mona Al-Saeed', 'Saudi Arabia', '2025-04-12 18:45:00'),
(' Khalid Fahad ', 'Saudi Arabia', '2025-05-19 09:00:00'),
('Emily Watson', 'UK', '2025-06-01 16:20:00');

INSERT INTO products (product_name, category, price, stock) VALUES
('iPhone 15 Pro', 'Electronics', 1200.00, 15),
('Samsung Galaxy S24', 'Electronics', 1000.00, 8),
('Running Shoes Nike', 'Sports', 150.00, 50),
('SQL Guide Book', 'Books', 45.00, 120),
('Coffee Maker', 'Home Appliances', 89.99, 0),
('Leather Wallet', 'Accessories', 35.00, 25);

INSERT INTO orders (user_id, product_id, order_date, quantity, status) VALUES
(1, 1, '2026-01-10 10:00:00', 1, 'Shipped'),
(1, 4, '2026-01-15 15:30:00', 2, 'Shipped'),
(2, 3, '2026-02-18 11:20:00', 1, 'Pending'),
(3, 2, '2026-03-05 14:00:00', 1, 'Cancelled'),
(4, 5, '2026-04-20 09:15:00', 1, 'Shipped'),
(5, 1, '2026-05-22 17:45:00', 1, 'Shipped'),
(2, 6, '2026-06-10 13:00:00', 3, 'Shipped');

INSERT INTO reviews (user_id, product_id, rating, review_text) VALUES
(1, 1, 5, 'EXCELLENT PHONE! Highly recommended.'),
(2, 3, 4, 'Very comfortable shoes for running'),
(4, 5, 2, 'Bad packaging, but product is okay...'),
(3, 2, 1, 'Order cancelled by seller');

Select 
	* 
From 
	users 
Limit 
	15;

Select 
	Upper(Trim( full_name )) As Cleaned_Name
From 
	users ;

Select 
	product_name,
	price 
From 
	products
Where
	category = 'Electronics'
Order By 
	price DESC;

Select 
	* 
From 
	products;

Select 
	product_name,
	price,
	 stock
From 
	products
Where 
	 stock = 0 
Limit 
	2;

Select 
	product_id,
	product_name,
	price
From 
	products 
Where 
	product_name Like '%Nike%' Or product_name lIKE'%Shoes%' ;

Select 
	full_name,
	Lower(SUBSTR(country,1,3)) 
From 
	users;

Select 
	Count(Distinct(product_id)) As Total_Unique_Value,
	AVG(price) As AVG_Price,
	Max(price) As Max_Price,
	Min(price) As Min_Price
From 
	products;

Select 
	category,
	Sum(price * stock) As Total_Stock_Price
From 
	products
Group By 
	category
Having 
	Sum(price * stock) > 1000;

Select 
	order_id,
	order_date ,
	To_CHAR(order_date,'yyyy-MM') As Only_Month_Year,
	Now() As Today_Date
From 
	orders;

Select 	
	* 
From 
	orders;

Select 
	order_id,
	status,
Case
	When status = 'Shipped' Then 'Fast Dilivery'
	When status = 'Pending' Then 'Review Requires'
	Else
		'Follow Up Needed'
	End 	
		Dilivery_Speed
From 
	orders;

Select 
	O.order_id,
	U.full_name,
	P.product_name,
	O.quantity
From 
	orders O 
		Inner Join 
			products P On
						O.product_id = P.product_id
		Inner Join 
			users U
				On 
					O.user_id = U.user_id;

Select 
	O.order_id,
	U.user_id,
	U.full_name 
From 
	users U 
		Left Join 
			orders O On
				O.user_id = U.user_id
Where
	O.order_id Is Null;

Select 
	 product_name,
	 price
From 
	products
Where
	price > 
		(Select
			AVG(Price) AS AVG_Price
		 From 
		 products	);

Select 
	full_name 
From 
	users
Union 
	Select 
		product_name 
	From 
		 products

