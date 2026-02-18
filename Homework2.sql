-- CREATE TABLE categories(
-- 	id SERIAL PRIMARY KEY,
-- 	title VARCHAR(50) NOT NULL UNIQUE
-- );
-- CREATE TABLE products(
-- 	id SERIAL PRIMARY KEY,
-- 	title VARCHAR(80) NOT NULL,
-- 	price INT NOT NULL CHECK(price > 0),
-- 	category_id INT REFERENCES categories(id)
-- );
-- CREATE TABLE orders(
-- 	id SERIAL PRIMARY KEY,
-- 	customer VARCHAR(60) NOT NULL,
-- 	total INT NOT NULL CHECK (total >= 0),
-- 	created_at TIMESTAMP DEFAULT NOW()
-- );

-- INSERT INTO categories(title)
-- VALUES
-- ('Electonics'),
-- ('Accessories'),
-- ('Office'),
-- ('Gaming'),
-- ('Home');


-- INSERT INTO products (title,price,category_id)
-- VALUES 
-- ('Keyboard', 12000, 1),
-- ('Mouse', 7000, 1),
-- ('Headphones', 35000, 1),
-- ('USB Cable', 3000, 2),
-- ('Mouse Pad', 3000, 2),
-- ('NoteBook', 1000, 3),
-- ('Pen', 600, 3),
-- ('Gaming Chair', 100000, 4),
-- ('PlayStation 5', 75000, 5),
-- ('Gaming Mouse', 8500, 5),
-- ('Premium Laptop', 120000, 1),
-- ('Office Laptop', 65000, 1),
-- ('Wireless Headphones', 15000, 2);
-- -- ('Gamepad', 18000, 4),
-- ('Monitor', 100000, 4);

-- INSERT INTO orders(customer, total)
-- VALUES
-- ('Alex', 19000),
-- ('Dana', 35000),
-- ('Diana', 90000),
-- ('Ira', 2500),
-- ('John', 68000),
-- ('Anna', 1500);
-- ('Ivan Petrov', 2500),
-- ('Ivan Petrov', 82000),
-- ('Anna Smirnova', 15000),
-- ('Anna Smirnova', 22000),
-- ('Dmitry Kozlov', 90000),
-- ('Elena Volkova', 5000);



-- SELECT COUNT(category_id) FROM products

-- SELECT COUNT(*)
-- FROM products
-- WHERE price > 10000


-- SELECT SUM(price) FROM products
-- SUM -> это деньги, очки, баллы, количиство

-- SELECT SUM(total)
-- FROM orders
-- WHERE customer = 'Alex'
-- SUM -> != строки SUM(title)



-- SELECT AVG(price) FROM products
-- AVG -> всегда дробные
-- AVG = SUM/COUNT

-- SELECT ROUND(AVG(price)) FROM products

-- SELECT AVG(total)
-- FROM orders
-- WHERE customer = 'Alex'
-- Средний чек клиента


-- SELECT MIN(price), MAX(price) FROM products
-- min/min != строкам

-- COUNT -> посчитать количество(работает со всеми, показывает количество строк)
-- SUM -> сумма таблицы/строки которую вы указали
-- AVG -> Среднее значение (строки/столбца/таблицы) AVG = SUM / COUNT
-- ROUND -> Округление
-- MIN/MAX -> нахождение минимального и максимальног значение


-- GROUP BY
-- HAVING


-- SELECT COUNT(*) FROM products

-- GROUP BY -> склеивает строки в группы, а агрегатные функция считает внутри самой группы


-- SELECT category_id, COUNT(*) AS total
-- FROM products
-- GROUP BY category_id

-- SELECT category_id, COUNT(*) AS total
-- FROM products
-- GROUP BY category_id
-- ORDER BY total DESC


-- SELECT category_id,
-- 	   COUNT(*) AS total,
-- 	   MIN(price) AS min_price,
-- 	   MAX(price) AS max_price,
-- 	   ROUND(AVG(price), 2) AS avg_price
-- FROM products
-- GROUP BY category_id

-- HAVING -> критический момент
-- -- WHERE фильтрует строки, до GROUP BY, не знает про COUNT
-- HAVING -> фильтровать группы, знает про COUNT, после GROUP BY

-- SELECT category_id, COUNT(*) AS total
-- FROM products
-- GROUP BY category_id
-- HAVING COUNT(*) >= 3

-- WHERE + GROUP BY + HAVING

-- SELECT category_id, COUNT(*) AS total
-- FROM products
-- WHERE price > 10000
-- GROUP BY category_id
-- HAVING COUNT(*) >=2


-- 1
-- SELECT 
--     category_id,
--     COUNT(*) AS total_products
-- FROM products
-- GROUP BY category_id
-- ORDER BY total_products DESC;
-- 2
-- SELECT 
--     category_id,
--     COUNT(*) AS total_products
-- FROM products
-- GROUP BY category_id
-- HAVING COUNT(*) >= 3;
-- 3
-- SELECT 
-- 	category_id,
-- 	MIN(price) AS min_price,
-- 	MAX(price) AS max_price,
-- 	ROUND(AVG(price), 2) AS avg_price
-- FROM products
-- GROUP BY category_id;
-- 4
-- SELECT category_id,
-- 	COUNT(*) AS expensive_count
-- 	FROM products
-- 	WHERE price > 10000
-- 	GROUP BY category_id
-- 	HAVING COUNT(*) >=2;
-- 5
-- SELECT customer,
-- 	COUNT(*) AS orders_count
-- 	FROM orders
-- 	GROUP BY customer
-- 	ORDER BY orders_count DESC;
-- 6
-- SELECT customer,
-- 	COUNT (*) AS orders_count
-- 	FROM orders
-- 	GROUP BY customer
-- 	HAVING COUNT(*) >=2;
-- 7
-- SELECT customer,
-- 	SUM(total) AS spent_total,
-- 	ROUND(AVG(total), 2) AS avg_check
-- 	FROM orders
-- 	GROUP BY customer
-- 	ORDER BY spent_total DESC;