-- CREATE TABLE customers(
-- 	id SERIAL PRIMARY KEY,
-- 	name TEXT NOT NULL,
-- 	phone TEXT UNIQUE,
-- 	city TEXT NOT NULL,
-- 	created_at TIMESTAMP NOT NULL DEFAULT NOW()
-- );
-- CREATE TABLE categories(
-- 	id SERIAL PRIMARY KEY,
-- 	title TEXT NOT NULL UNIQUE
-- );
-- CREATE TABLE products(
-- 	id SERIAL PRIMARY KEY,
-- 	title TEXT NOT NULL,
-- 	category_id INT REFERENCES categories(id) ON DELETE SET NULL,
-- 	price NUMERIC(10,2) NOT NULL CHECK (price > 0),
-- 	is_active BOOLEAN NOT NULL DEFAULT TRUE
-- );

-- CREATE TABLE orders(
-- 	id SERIAL PRIMARY KEY,
-- 	customer_id INT REFERENCES customers(id) ON DELETE SET NULL,
-- 	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
-- 	status TEXT NOT NULL CHECK (status IN ('new','paid','shipped','cancelled'))
-- );

-- CREATE TABLE order_items(
-- 	order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
-- 	product_id INT REFERENCES products(id) ON DELETE SET NULL, 
-- 	qty INT NOT NULL CHECK (qty > 0),
-- 	price NUMERIC(10,2) NOT NULL CHECK (price > 0),
-- 	PRIMARY KEY (order_id, product_id)
-- );
-- CREATE TABLE payments(
-- 	id SERIAL PRIMARY KEY,
-- 	order_id INT REFERENCES orders(id) ON DELETE SET NULL,
-- 	paid_at TIMESTAMP,
-- 	amount NUMERIC(10,2) NOT NULL CHECK(amount > 0),
-- 	method TEXT NOT NULL CHECK(method IN ('card','cash','transfer'))
-- );
-- CREATE TABLE shipments(
-- 	id SERIAL PRIMARY KEY,
-- 	order_id INT REFERENCES orders(id) ON DELETE SET NULL,
-- 	shipped_at TIMESTAMP,
-- 	carrier TEXT NOT NULL CHECK(carrier IN ('glovo','yandex','pickup','courier')),
-- 	tracking TEXT
-- )


-- INSERT INTO customers (id, name, phone, city, created_at) VALUES
-- (1,'Aruzhan','+77010000001','Almaty',   '2026-01-10 10:00'),
-- (2,'Dias',   '+77010000002','Almaty',   '2026-01-11 12:00'),
-- (3,'Madi',   '+77010000003','Astana',   '2026-01-12 09:30'),
-- (4,'Amina',  '+77010000004','Shymkent', '2026-01-13 18:20'),
-- (5,'Ilyas',  '+77010000005','Astana',   '2026-01-20 14:10'),
-- (6,'Saniya', '+77010000006','Almaty',   '2026-01-25 20:45');


-- INSERT INTO categories (id, title) VALUES
-- (1,'Food'),
-- (2,'Electronics'),
-- (3,'Books'),
-- (4,'Clothes'),
-- (5,'Toys'); 


-- INSERT INTO products (id, title, category_id, price, is_active) VALUES
-- (1,'Burger',       1, 2500,  TRUE),
-- (2,'Cola',         1,  600,  TRUE),
-- (3,'Pizza',        1, 4500,  TRUE),
-- (4,'Headphones',   2,19990,  TRUE),
-- (5,'USB-C Cable',  2, 2990,  TRUE),
-- (6,'Laptop',       2,399990, TRUE),
-- (7,'SQL Basics',   3, 5500,  TRUE),
-- (8,'React Guide',  3, 8000,  TRUE),
-- (9,'Hoodie',       4,15990,  TRUE),
-- (10,'Sneakers',    4,45990, TRUE);


-- INSERT INTO orders (id, customer_id, created_at, status) VALUES
-- (101, 1, '2026-02-01 11:00', 'paid'),
-- (102, 1, '2026-02-02 13:10', 'new'),
-- (103, 2, '2026-02-02 16:40', 'shipped'),
-- (104, 3, '2026-02-03 09:15', 'cancelled'),
-- (105, 4, '2026-02-04 19:00', 'paid'),
-- (106, 4, '2026-02-05 10:05', 'shipped'),
-- (107, 6, '2026-02-06 12:00', 'new'),
-- (108, NULL,'2026-02-07 12:30', 'paid'); 


-- INSERT INTO order_items (order_id, product_id, qty, price) VALUES
-- (101, 1, 2, 2500),
-- (101, 2, 2,  600),

-- (102, 3, 1, 4500),

-- (103, 4, 1, 19990),
-- (103, 5, 2,  2990),

-- (104, 7, 1, 5500),

-- (105, 9, 1, 15990),
-- (105, 2, 3,   600),

-- (106, 6, 1, 399990),
-- (106, 5, 1,   2990),

-- (108, 8, 1, 8000);


-- INSERT INTO payments (id, order_id, paid_at, amount, method) VALUES
-- (201, 101, '2026-02-01 11:05', 6200,  'card'),    
-- (202, 105, '2026-02-04 19:10', 17790, 'cash'),     
-- (203, 106, '2026-02-05 10:10', 402980,'transfer'), 
-- (204, 108, '2026-02-07 12:35', 8000,  'card'),
-- (205, NULL,'2026-02-08 10:00', 9999,  'cash');   


-- INSERT INTO shipments (id, order_id, shipped_at, carrier, tracking) VALUES
-- (301, 103, '2026-02-03 10:00', 'glovo',    'GLOVO-103-AAA'),
-- (302, 106, '2026-02-05 18:00', 'courier','CR-106-BBB'),
-- (303, NULL,'2026-02-06 09:00', 'pickup', NULL); 


-- SELECT c.name, o.id, o.status
-- FROM customers c
-- JOIN orders o ON o.customer_id = c.id
-- ORDER BY c.id,o.id

-- SELECT c.name, o.id AS order_id, o.status
-- FROM customers c
-- LEFT JOIN orders o ON o.customer_id = c.id
-- ORDER BY c.id, o.id

-- SELECT c.id, c.name
-- FROM customers c
-- LEFT JOIN orders o ON o.customer_id = c.id
-- WHERE o.id IS NULL

-- SELECT c.id AS customer_id, o.id AS order_id, c.name, o.status
-- FROM customers c 
-- FULL OUTER JOIN orders o ON o.customer_id = c.id
-- WHERE c.id IS NULL OR o.id is NULL
-- ORDER BY customer_id NULLS LAST, order_id NULLS LAST

-- SELECT
-- o.id AS order_id,
-- c.name AS customer,
-- o.status,
-- p.amount AS paid_amount,
-- s.carrier,
-- s.tracking
-- FROM orders o
-- LEFT JOIN customers c ON c.id = o.customer_id
-- LEFT JOIN payments p ON p.order_id = o.id
-- LEFT JOIN shipments s ON s.order_id = o.id
-- ORDER BY o.id

-- Заказы без оплаты
-- SELECT o.id, o.status
-- FROM orders o
-- LEFT JOIN payments p ON p.order_id = o.id
-- WHERE p.id IS NULL
-- ORDER BY o.id

-- SELECT o.id, o,status
-- FROM orders o
-- LEFT JOIN shipments s ON s.order_id = o.id
-- WHERE s.id IS NULL
-- ORDER BY o.id

-- SELECT c.id, c.name
-- FROM customers c
-- LEFT JOIN orders o ON o.customer_id = c.id
-- WHERE o.id IS NULL
-- ORDER BY c.id

-- SELECT cat.title, COUNT(p.id) AS product_count
-- FROM categories cat
-- LEFT JOIN products p ON p.category_id = cat.id
-- GROUP BY cat.title
-- ORDER BY product_count, cat.title

-- SELECT c.*
-- FROM customers c
-- WHERE c.id IN(
-- 	SELECT o.customer_id
-- 	FROM orders o 
-- 	WHERE o.customer_id IS NOT NULL
-- ) 

-- SELECT c.*
-- FROM customers c
-- WHERE EXISTS(
-- 	SELECT 1
-- 	FROM orders o
-- 	WHERE o.customer_id = c.id
-- )

-- SELECT c.id, c.name,
-- 	(SELECT COUNT(*)
-- 	FROM orders o
-- 	WHERE o.customer_id = c.id) AS orders_count
-- FROM customers c
-- ORDER BY c.id

-- Товары дороже среднего своей категории
-- SELECT p.*
-- FROM products p
-- WHERE p.price > (
-- 	SELECT AVG(p2.price)
-- 	FROM products p2
-- 	WHERE p2.category_id = p.category_id
-- )
-- ORDER BY p.category_id, p.price DESC



-- SELECT id,status,
-- CASE 
-- 	WHEN status = 'new' THEN 'Ожидает оплаты'
-- 	WHEN status = 'paid' THEN 'Оплачен'
-- 	WHEN status = 'shipped' THEN 'Отправлен'
-- 	WHEN status = 'cancelled' THEN 'Отменен'
-- 	ELSE 'Неизвестно'
-- END AS status_text
-- FROM orders
-- ORDER BY id

-- SELECT o.id,
-- CASE 
-- 	WHEN p.id IS NULL THEN 'Не оплачен'
-- 	ELSE 'Оплачен'
-- END AS payment_status,
-- CASE 
-- 	WHEN s.id IS NULL THEN 'Не доставлен'
-- 	ELSE 'Доставлен'
-- END AS shipment_status
-- FROM orders o
-- LEFT JOIN payments p ON p.order_id = o.id
-- LEFT JOIN shipments s ON s.order_id = o.id
-- ORDER BY o.id

-- SELECT 
-- o.id,
-- COALESCE(SUM(oi.qty * oi.price), 0)
-- AS total,
-- 	CASE
-- 		WHEN COALESCE(SUM(oi.qty * oi.price),0) = 0 THEN 'Пустой заказ' 
-- 		WHEN SUM(oi.qty * oi.price) < 10000 THEN 'Маленький'
-- 		WHEN SUM(oi.qty * oi.price) < 50000 THEN 'Средний'
-- 		ELSE 'Большой'
-- 	END AS order_size
-- FROM orders o
-- LEFT JOIN order_items oi ON oi.order_id = o.id
-- GROUP BY o.id
-- ORDER BY o.id

-- SELECT c.id, c.name,
-- COUNT(o.id) AS orders_count,
-- CASE
-- 	WHEN COUNT(o.id) = 0 THEN 'Новый'
-- 	WHEN COUNT(o.id) BETWEEN 1 AND 2 THEN 'Обычный'
-- 	ELSE 'Постоянный'
-- END AS customer_level
-- FROM customers c 
-- LEFT JOIN orders o ON o.customer_id = c.id
-- GROUP BY c.id, c.name
-- ORDER BY c.id

-- 1
-- SELECT c.id, c.name,
-- CASE
-- 	WHEN COALESCE((
-- 		SELECT COUNT(*)
-- 		FROM orders o
-- 		WHERE o.customer_id = c.id
-- 	), 0) = 0 THEN 'new'
-- 	WHEN (
-- 		SELECT COUNT(*)
-- 		FROM orders o
-- 		WHERE o.customer_id = c.id
-- 	) BETWEEN 1 AND 2 THEN 'returning'
-- 	ELSE 'loyal'
-- 	END AS client_type
-- 	FROM customers c
	-- 2
-- SELECT o.id,
-- 	o.created_at,
-- 	o.status,
-- 	CASE 
-- 		WHEN o.status = 'cancelled' THEN 'high'
-- 		WHEN o.status = 'new'
-- 			AND o.created_at < NOW() - INTERVAL '3 days'
-- 			THEN 'medium'
-- 			ELSE 'low'
-- 		END AS risk_label
-- 		FROM orders o
-- 3
-- SELECT p.id,
-- 	p.title,
-- 	p.price,
-- 	p.category_id
-- 	FROM products p
-- 	WHERE p.price = (
-- 		SELECT MAX(p2.price)
-- 		FROM products p2
-- 		WHERE p2.category_id = p.category_id)
-- 4
-- SELECT p.id,
-- 	p.title,
-- 	CASE 
-- 		WHEN EXISTS(
-- 			SELECT 1
-- 			FROM order_items oi
-- 			WHERE oi.product_id = p.id
-- 		) THEN 'sold'
-- 		ELSE 'not_sold'
-- 		END AS sold_flag
-- 	FROM products p
-- 5
-- SELECT
--     o.id,
--     COALESCE((
--         SELECT SUM(pay.amount)
--         FROM payments pay
--         WHERE pay.order_id = o.id
--     ), 0) AS paid_amount,

--     COALESCE((
--         SELECT SUM(oi.qty * (
--             SELECT p.price
--             FROM products p
--             WHERE p.id = oi.product_id
--         ))
--         FROM order_items oi
--         WHERE oi.order_id = o.id
--     ), 0) AS items_total

-- FROM orders o
-- WHERE
--     COALESCE((
--         SELECT SUM(pay.amount)
--         FROM payments pay
--         WHERE pay.order_id = o.id
--     ), 0)
--     >
--     COALESCE((
--         SELECT SUM(oi.qty * (
--             SELECT p.price
--             FROM products p
--             WHERE p.id = oi.product_id
--         ))
--         FROM order_items oi
--         WHERE oi.order_id = o.id
--     ), 0)
-- 6
-- SELECT o.id,
-- o.status
-- FROM orders o
-- WHERE EXISTS (
-- 	SELECT 1
-- 	FROM order_items oi
-- 	WHERE oi.order_id = o.id
-- 	AND (
-- 		SELECT p.price
-- 		FROM products p
-- 		WHERE p.id = oi.product_id
-- 	) > 20000
-- )
-- 7
-- SELECT
--     o.id,
--     CASE
--         WHEN COALESCE((
--             SELECT SUM(oi.qty * (
--                 SELECT p.price
--                 FROM products p
--                 WHERE p.id = oi.product_id
--             ))
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ), 0) = 0 THEN 'zero'

--         WHEN (
--             SELECT SUM(oi.qty * (
--                 SELECT p.price
--                 FROM products p
--                 WHERE p.id = oi.product_id
--             ))
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ) < 10000 THEN 'small'

--         WHEN (
--             SELECT SUM(oi.qty * (
--                 SELECT p.price
--                 FROM products p
--                 WHERE p.id = oi.product_id
--             ))
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ) <= 50000 THEN 'medium'

--         ELSE 'big'
--     END AS check_class
-- FROM orders o;
-- 8
-- SELECT
--     c.id,
--     c.name
-- FROM customers c
-- WHERE EXISTS (
--     SELECT 1
--     FROM orders o
--     WHERE o.customer_id = c.id
--       AND EXISTS (
--           SELECT 1
--           FROM payments p
--           WHERE p.order_id = o.id
--       )
-- )
-- AND NOT EXISTS (
--     SELECT 1
--     FROM orders o2
--     WHERE o2.customer_id = c.id
--       AND EXISTS (
--           SELECT 1
--           FROM shipments s
--           WHERE s.order_id = o2.id
--       )
-- )
-- 9
-- SELECT
--     o.id,
--     CASE
--         WHEN EXISTS (
--             SELECT 1
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ) THEN 'filled'
--         ELSE 'empty'
--     END AS items_state
-- FROM orders o
-- 10
-- SELECT
--     o.id,
--     CASE
--         WHEN NOT EXISTS (
--             SELECT 1
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ) THEN 'D'

--         WHEN EXISTS (
--             SELECT 1
--             FROM payments p
--             WHERE p.order_id = o.id
--         )
--         AND COALESCE((
--             SELECT SUM(oi.qty * (
--                 SELECT p2.price
--                 FROM products p2
--                 WHERE p2.id = oi.product_id
--             ))
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ), 0) >= 50000 THEN 'A'

--         WHEN EXISTS (
--             SELECT 1
--             FROM payments p
--             WHERE p.order_id = o.id
--         ) THEN 'B'

--         WHEN COALESCE((
--             SELECT SUM(oi.qty * (
--                 SELECT p2.price
--                 FROM products p2
--                 WHERE p2.id = oi.product_id
--             ))
--             FROM order_items oi
--             WHERE oi.order_id = o.id
--         ), 0) > 0 THEN 'C'

--         ELSE 'D'
--     END AS business_grade
-- FROM orders o
