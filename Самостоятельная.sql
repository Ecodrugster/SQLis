-- CREATE TABLE viewers (
--   id           INT PRIMARY KEY,
--   full_name    TEXT NOT NULL,
--   birth_year   INT NOT NULL,
--   city         TEXT NOT NULL);

-- CREATE TABLE movies (
--   id            INT PRIMARY KEY,
--   title         TEXT NOT NULL,
--   genre         TEXT NOT NULL,
--   duration_min  INT NOT NULL,
--   age_rating    INT NOT NULL   -- 0, 6, 12, 16, 18
--   );
  
-- CREATE TABLE halls (
--   id        INT PRIMARY KEY,
--   name      TEXT NOT NULL,
--   capacity  INT NOT NULL
-- );

-- CREATE TABLE sessions (
--   id          INT PRIMARY KEY,
--   movie_id    INT NOT NULL REFERENCES movies(id),
--   hall_id     INT NOT NULL REFERENCES halls(id),
--   start_ts    TIMESTAMP NOT NULL,
--   base_price  INT NOT NULL
-- );

-- CREATE TABLE tickets (
--   id            INT PRIMARY KEY,
--   session_id    INT NOT NULL REFERENCES sessions(id),
--   viewer_id     INT NOT NULL REFERENCES viewers(id),
--   seat_row      INT NOT NULL,
--   seat_no       INT NOT NULL,
--   price_paid    INT NOT NULL,
--   purchased_at  TIMESTAMP NOT NULL,
--   status        TEXT NOT NULL CHECK (status IN ('paid','reserved','refunded'))
-- );

-- CREATE TABLE reviews (
--   id          INT PRIMARY KEY,
--   viewer_id   INT NOT NULL REFERENCES viewers(id),
--   movie_id    INT NOT NULL REFERENCES movies(id),
--   rating      INT NOT NULL CHECK (rating BETWEEN 1 AND 10),
--   review_date DATE NOT NULL
-- );

-- INSERT INTO viewers (id, full_name, birth_year, city) VALUES
-- (1,'Aruzhan K.',2006,'Almaty'),
-- (2,'Dana S.',2004,'Almaty'),
-- (3,'Mansur T.',2003,'Astana'),
-- (4,'Ali N.',2005,'Shymkent'),
-- (5,'Saniya R.',2007,'Almaty'),
-- (6,'Valeriy P.',2002,'Karaganda'),
-- (7,'Diana M.',2006,'Astana'),
-- (8,'Ratmir A.',2004,'Almaty'),
-- (9,'Amir Z.',2008,'Shymkent'),
-- (10,'Beibit O.',2001,'Almaty');

-- INSERT INTO movies (id, title, genre, duration_min, age_rating) VALUES
-- (1,'Neon Steppe','Sci-Fi',128,16),
-- (2,'Coffee in Rain','Drama',102,12),
-- (3,'Laughing Code','Comedy',95,6),
-- (4,'Silent Glacier','Thriller',110,16),
-- (5,'Kids of Tomorrow','Animation',88,0),
-- (6,'Red Line','Action',123,18),
-- (7,'Old City Tales','Drama',140,12);

-- INSERT INTO halls (id, name, capacity) VALUES
-- (1,'Hall A',80),
-- (2,'Hall B',60),
-- (3,'VIP',30);

-- Sessions (February 2026)
-- INSERT INTO sessions (id, movie_id, hall_id, start_ts, base_price) VALUES
-- (1, 1, 1, '2026-02-17 18:00', 2500),
-- (2, 2, 2, '2026-02-17 19:30', 2000),
-- (3, 3, 1, '2026-02-18 16:00', 1800),
-- (4, 4, 2, '2026-02-18 21:00', 2300),
-- (5, 5, 1, '2026-02-19 12:00', 1500),
-- (6, 6, 3, '2026-02-19 20:00', 3500),
-- (7, 7, 2, '2026-02-20 18:30', 2100),
-- (8, 1, 3, '2026-02-20 22:00', 3200);

-- Tickets (mix of paid/reserved/refunded)
-- INSERT INTO tickets (id, session_id, viewer_id, seat_row, seat_no, price_paid, purchased_at, status) VALUES
-- (1, 1, 2, 3, 10, 2500, '2026-02-16 12:10', 'paid'),
-- (2, 1, 1, 3, 11, 2500, '2026-02-16 12:12', 'paid'),
-- (3, 1, 8, 4,  1, 2200, '2026-02-16 14:40', 'paid'),
-- (4, 1, 5, 4,  2, 2200, '2026-02-16 14:41', 'refunded'),

-- (5, 2, 3, 2,  5, 2000, '2026-02-17 10:01', 'paid'),
-- (6, 2, 7, 2,  6, 2000, '2026-02-17 10:02', 'paid'),
-- (7, 2, 6, 1,  1, 1800, '2026-02-17 11:15', 'reserved'),

-- (8, 3, 4, 5,  8, 1800, '2026-02-17 09:20', 'paid'),
-- (9, 3, 9, 5,  9, 1500, '2026-02-17 09:25', 'paid'),

-- (10, 4, 10, 6, 12, 2300, '2026-02-18 12:00', 'paid'),
-- (11, 4, 6,  6, 13, 2300, '2026-02-18 12:01', 'paid'),
-- (12, 4, 2,  6, 14, 2000, '2026-02-18 12:02', 'refunded'),

-- (13, 5, 1,  1,  2, 1500, '2026-02-18 17:00', 'paid'),
-- (14, 5, 5,  1,  3, 1500, '2026-02-18 17:01', 'paid'),
-- (15, 5, 9,  1,  4, 1500, '2026-02-18 17:02', 'reserved'),

-- (16, 6, 6,  2,  2, 3500, '2026-02-19 10:10', 'paid'),
-- (17, 6, 8,  2,  3, 3500, '2026-02-19 10:11', 'paid'),

-- (18, 7, 3,  3,  7, 2100, '2026-02-19 09:00', 'paid'),
-- (19, 7, 7,  3,  8, 2100, '2026-02-19 09:01', 'paid'),

-- (20, 8, 10, 1,  1, 3200, '2026-02-20 13:30', 'paid');

-- INSERT INTO reviews (id, viewer_id, movie_id, rating, review_date) VALUES
-- (1, 2, 1, 9, '2026-02-17'),
-- (2, 1, 1, 8, '2026-02-17'),
-- (3, 8, 1, 7, '2026-02-17'),
-- (4, 3, 2, 6, '2026-02-18'),
-- (5, 7, 2, 8, '2026-02-18'),
-- (6, 4, 3, 9, '2026-02-18'),
-- (7, 9, 3, 7, '2026-02-18'),
-- (8, 10,4, 8, '2026-02-19'),
-- (9, 6, 4, 9, '2026-02-19'),
-- (10,6, 6, 6, '2026-02-20');


-- Task 1
-- SELECT s.id AS session_id,
--     s.start_ts,
--     h.name AS hall_name,
--     m.title AS movie_title,
--     m.genre,
--     s.base_price
-- FROM sessions s
-- INNER JOIN halls h ON s.hall_id  = h.id
-- INNER JOIN movies m ON s.movie_id = m.id
-- ORDER BY s.start_ts;


-- Task 2

-- SELECT m.id AS movie_id,
-- 	m.title,
-- 	COUNT(s.id) AS sessions_count
-- 	FROM movies m
-- 	LEFT JOIN sessions s ON s.movie_id = m.id
-- 	GROUP BY m.id, m.title
-- 	ORDER BY m.id;

-- Task 3
-- SELECT h.id AS hall_id,
-- 	h.name AS hall_name,
-- 	COUNT(s.id) AS sessions_count
-- 	FROM halls h
-- 	LEFT JOIN sessions s ON s.hall_id = h.id
-- 	GROUP BY h.id, h.name
-- 	ORDER BY h.id;

-- TASK 4
-- SELECT v.id AS viewer_id,
-- 	v.full_name,
-- 	SUM(CASE
-- 			WHEN t.status = 'paid' THEN 1
-- 			ELSE 0
-- 			END) AS paid_tickets_count
-- 			FROM viewers v 
-- 			LEFT JOIN tickets t ON t.viewer_id = v.id
-- 			GROUP BY v.id, v.full_name
-- 			ORDER BY v.id

-- Task 5
-- SELECT s.id AS sessions_id,
-- 	COUNT (t.id) FILTER (WHERE t.status = 'paid') AS paid_count,
-- 	COUNT (t.id) FILTER (WHERE t.status = 'reserved') AS reserved_count,
-- 	COUNT (t.id) FILTER (WHERE t.status = 'refunded') AS refunded_count
-- FROM sessions s
-- LEFT JOIN tickets t ON t.session_id = s.id
-- GROUP BY s.id
-- ORDER BY s.id;

	-- Task 6
-- SELECT s.id AS sessions_id,
-- 	s.start_ts,
-- 	m.title AS movie_title
-- FROM sessions s
-- INNER JOIN movies m ON m.id = s.movie_id
-- LEFT JOIN tickets t ON t.session_id = s.id
-- AND t.status = 'paid'
-- WHERE t.id IS NULL
-- ORDER BY s.start_ts;

-- Task 7

-- SELECT s.id AS sessions_id,
-- s.start_ts,
-- SUM(t.price_paid) AS revenue
-- FROM sessions s
-- JOIN tickets t ON t.session_id = s.id
-- WHERE t.status = 'paid'
-- GROUP BY s.id,start_ts
-- ORDER BY s.start_ts;

-- task 8

-- SELECT 
-- CASE 
-- 	WHEN s.id IS NULL THEN 'ticket_without_session'
-- 	WHEN t.id IS NULL THEN 'session_without_tickets'
-- 	END AS kind,
-- COALESCE(t.id, s.id) AS id,
-- CASE 
-- WHEN s.id IS NULL THEN 
-- 'ticket_id='||t.id ||',session_id=' || t.session_id
-- WHEN t.id IS NULL THEN
-- 'start_ts' || s.start_ts 
-- END AS info
-- FROM tickets t
-- FULL OUTER JOIN sessions s ON t.session_id = s.id
-- WHERE s.id IS NULL

-- task 9
-- SELECT m.id AS movie_id,
-- m.title,
-- AVG(r.rating) AS avg_rating
-- FROM movies m
-- LEFT JOIN reviews r ON r.movie_id = m.id
-- GROUP BY m.id, m.title
-- ORDER BY m.id

-- task 10
-- SELECT v.id AS viewer_id,
-- 	v.full_name,
-- 	t_last.purchased_at AS last_purchase_at,
-- 	t_last.session_id AS last_session_id
-- 	FROM viewers v 
-- 	LEFT JOIN LATERAL (
-- SELECT t.session_id,t.purchased_at
-- FROM tickets t
-- WHERE t.viewer_id = v.id AND t.status = 'paid'
-- ORDER BY t.purchased_at DESC 
-- LIMIT 1)
-- t_last ON true
-- WHERE v.city = 'Almaty'
-- ORDER BY v.id;


-- TASK 11
-- SELECT m.title,
-- 	SUM(t.price_paid) AS revenue
-- 	FROM movies m 
-- 	JOIN sessions s ON s.movie_id = m.id
-- 	JOIN tickets t On t.session_id = s.id 
-- 	WHERE t.status = 'paid'
-- 	GROUP BY m.id, m.title
-- 	ORDER BY revenue DESC LIMIT 3

-- TASK 12
-- SELECT m.title,
-- COUNT (t.id) AS paid_count
-- FROM movies m
-- JOIN sessions s ON s.movie_id = m.id
-- JOIN tickets t ON t.session_id = s.id
-- WHERE t.status = 'paid'
-- GROUP BY m.id, m.title
-- ORDER BY paid_count DESC LIMIT 3

-- TASK 13
-- SELECT m.title,
-- AVG (r.rating) AS avg_rating,
-- COUNT(r.id) AS reviews_count
-- FROM movies m
-- JOIN reviews r ON r.movie_id = m.id
-- GROUP BY m.id, m.title
-- HAVING COUNT (r.id) >= 2 AND AVG (r.rating) >= 8
-- ORDER BY avg_rating DESC

-- TASK 14
-- SELECT h.name AS hall_name,
-- COUNT (t.id) AS paid_count
-- FROM halls h
-- JOIN sessions s ON s.hall_id = h.id
-- JOIN tickets t ON t.session_id = s.id 
-- WHERE t.status = 'paid'
-- GROUP BY h.id, h.name
-- HAVING COUNT(t.id) >= 4
-- ORDER BY paid_count DESC

-- TASK 15

-- SELECT v.city,
-- COUNT(t.id) AS paid_tickets_count,
-- SUM(t.price_paid) AS revenue
-- FROM viewers v
-- JOIN tickets t ON t.viewer_id = v.id
-- WHERE t.status = 'paid'
-- GROUP BY v.city 
-- ORDER BY paid_tickets_count DESC 

-- TASK 16

-- SELECT s.id AS session_id,
-- SUM(t.price_paid) AS revenue,
-- avg_rev.avg_revenue_all_sessions
-- FROM sessions s 
-- JOIN tickets t ON t.session_id = s.id
-- JOIN (
-- SELECT AVG (s2_revenue) AS avg_revenue_all_sessions
-- FROM (
-- 	SELECT SUM(t2.price_paid) AS s2_revenue
-- 	FROM sessions s2
-- 	JOIN tickets t2 ON t2.session_id = s2.id
-- 	WHERE t2.status = 'paid'
-- 	GROUP BY s2.id
-- ) AS sub
-- ) AS avg_rev ON true 
-- WHERE t.status = 'paid'
-- GROUP BY s.id,avg_rev.avg_revenue_all_sessions
-- HAVING SUM(t.price_paid) > avg_rev.avg_revenue_all_sessions
-- ORDER BY revenue DESC 

-- TASK 17

-- SELECT m.genre,
-- COUNT(m.id) AS movie_count,
-- AVG(m.duration_min) AS avg_duration,
-- MAX(m.age_rating) AS max_age_rating
-- FROM movies m
-- GROUP BY m.genre
-- ORDER BY m.genre

-- TASK 18
-- SELECT
--    m.title,
--    m.duration_min,
--    avg_all.avg_duration_all
-- FROM movies m
-- JOIN (
--    SELECT AVG(duration_min) AS avg_duration_all
--    FROM movies
-- ) AS avg_all ON true
-- WHERE m.duration_min > avg_all.avg_duration_all
-- ORDER BY m.duration_min DESC;

-- TASK 19
-- SELECT t.id AS ticket_id,
-- 	t.price_paid,
-- 	CASE 
-- 		WHEN t.price_paid < 1800 THEN 'cheap'
-- 		WHEN t.price_paid BETWEEN 1800 AND 2499 THEN 'standart'
-- 		ELSE 'premium'
-- 	END AS price_bucket
-- 	FROM tickets t 
-- 	ORDER BY t.id

-- Task 20
-- SELECT s.id AS session_id,
--     h.capacity AS hall_capacity,
--     COUNT(t.id) AS paid_count,
--     CASE
--     WHEN COUNT(t.id) = 0 THEN 'empty'
--     WHEN COUNT(t.id) BETWEEN 1 AND FLOOR(h.capacity * 0.5) THEN 'low'
--     WHEN COUNT(t.id) BETWEEN FLOOR(h.capacity * 0.5) + 1 AND FLOOR(h.capacity * 0.8) THEN 'mid'
--     ELSE 'high'
--     END AS fill_status
-- FROM sessions s
-- JOIN halls h ON s.hall_id = h.id
-- LEFT JOIN tickets t ON t.session_id = s.id AND t.status = 'paid'
-- GROUP BY s.id, h.capacity
-- ORDER BY s.id;

-- TASK 21
-- SELECT v.id AS viewer_id,
--     v.full_name,
--     COUNT(t.id) AS paid_count,
--     CASE
--     WHEN COUNT(t.id) = 0 THEN 'new'
--     WHEN COUNT(t.id) BETWEEN 1 AND 2 THEN 'regular'
--     WHEN COUNT(t.id) BETWEEN 3 AND 5 THEN 'loyal'
--     ELSE 'vip'
-- END AS level
-- FROM viewers v
-- LEFT JOIN tickets t ON t.viewer_id = v.id AND t.status = 'paid'
-- GROUP BY v.id, v.full_name
-- ORDER BY v.id;

-- TASK 22
-- SELECT 
--     m.title,
--     AVG(r.rating) AS avg_rating,
--     CASE
--         WHEN AVG(r.rating) IS NULL THEN 'no_data'
--         WHEN AVG(r.rating) < 7 THEN 'risk'
--         WHEN AVG(r.rating) BETWEEN 7 AND 8.4 THEN 'ok'
--         ELSE 'hit'
--     END AS label
-- FROM movies m
-- LEFT JOIN reviews r ON m.id=r.movie_id
-- GROUP BY m.title;

-- TASK 23
-- SELECT 
--     t.id AS ticket_id,
--     v.full_name,
--     m.title,
--     (2026 - v.birth_year) AS viewer_age,
--     m.age_rating,
--     CASE
--     	WHEN (2026 - v.birth_year) < m.age_rating THEN 'underage'
--     	ELSE 'ok'
--     END AS check_result
-- FROM tickets t
-- JOIN viewers v ON t.viewer_id=v.id
-- JOIN sessions s ON t.session_id=s.id
-- JOIN movies m ON s.movie_id=m.id;

-- TASK 24
-- SELECT 
--     m.title,
--     AVG(t.price_paid) AS avg_paid_price,
--     CASE
--         WHEN AVG(t.price_paid) < 2000 THEN 'budget'
--         WHEN AVG(t.price_paid) BETWEEN 2000 AND 2999 THEN 'middle'
--         ELSE 'expensive'
--     END AS class
-- FROM movies m
-- JOIN sessions s ON m.id=s.movie_id
-- JOIN tickets t ON s.id=t.session_id
-- WHERE t.status='paid'
-- GROUP BY m.title;

-- TASK 25
-- SELECT v.id, v.full_name
-- FROM viewers v
-- WHERE EXISTS (
--     SELECT 1
--     FROM tickets t
--     JOIN sessions s ON t.session_id=s.id
--     JOIN movies m ON s.movie_id=m.id
--     WHERE t.viewer_id=v.id
--       AND t.status='paid'
--       AND m.genre='Sci-Fi'
-- );

-- TASK 26
-- SELECT m.id, m.title
-- FROM movies m
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM reviews r
--     WHERE r.movie_id=m.id
-- );

-- TAsk 27
-- SELECT m.title
-- FROM movies m
-- JOIN sessions s ON m.id=s.movie_id
-- JOIN tickets t ON s.id=t.session_id
-- GROUP BY m.title
-- HAVING COUNT(t.id) > 0
--    AND COUNT(CASE WHEN t.status='paid' THEN 1 END)=0;

-- TASK 28
-- SELECT 
--     v.id,
--     v.full_name,
--     AVG(r.rating) AS viewer_avg_rating,
--     (SELECT AVG(r2.rating) FROM reviews r2) AS global_avg_rating,
--     AVG(r.rating) - (SELECT AVG(r2.rating) FROM reviews r2) AS diff
-- FROM viewers v
-- JOIN reviews r ON v.id=r.viewer_id
-- GROUP BY v.id, v.full_name;

-- TASK 29 
-- SELECT 
--     v.id,
--     v.full_name,
--     COUNT(DISTINCT m.genre) AS genres_count
-- FROM viewers v
-- JOIN tickets t ON v.id=t.viewer_id
-- JOIN sessions s ON t.session_id=s.id
-- JOIN movies m ON s.movie_id=m.id
-- WHERE t.status='paid'
-- GROUP BY v.id, v.full_name
-- HAVING COUNT(DISTINCT m.genre) >= 2;

-- TASK 30
-- WITH city_movie_counts AS (
--     SELECT 
--         v.city,
--         m.title,
--         COUNT(t.id) AS paid_count
--     FROM viewers v
--     JOIN tickets t ON v.id=t.viewer_id
--     JOIN sessions s ON t.session_id=s.id
--     JOIN movies m ON s.movie_id=m.id
--     WHERE t.status='paid'
--     GROUP BY v.city, m.title
-- )
-- SELECT city, title, paid_count
-- FROM city_movie_counts c1
-- WHERE paid_count = (
--     SELECT MAX(paid_count)
--     FROM city_movie_counts c2
--     WHERE c2.city = c1.city
-- );