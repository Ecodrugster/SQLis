-- CREATE TABLE students (
--     id SERIAL PRIMARY KEY,
--     full_name TEXT NOT NULL,
--     email TEXT UNIQUE NOT NULL
-- );

-- CREATE TABLE courses (
--     id SERIAL PRIMARY KEY,
--     title TEXT NOT NULL
-- );

-- CREATE TABLE lessons (
--     id SERIAL PRIMARY KEY,
--     course_id INT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
--     title TEXT NOT NULL,
--     position INT NOT NULL
-- );

-- CREATE TABLE enrollments (
--     student_id INT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
--     course_id INT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
--     enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     PRIMARY KEY (student_id, course_id)
-- );

-- CREATE TABLE progress (
--     student_id INT NOT NULL REFERENCES students(id) ON DELETE CASCADE,
--     lesson_id INT NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
--     status TEXT NOT NULL CHECK (status IN ('not_started','in_progress','done')),
--     score INT CHECK (score BETWEEN 0 AND 100),
--     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     PRIMARY KEY (student_id, lesson_id)
-- );

-- INSERT INTO students (id, full_name, email) VALUES
-- (1,'Aruzhan K.','aruzhan@gmail.com'),
-- (2,'Dana S.','dana@gmail.com'),
-- (3,'Mansur T.','mansur@gmail.com'),
-- (4,'Ali N.','ali@gmail.com'),
-- (5,'Saniya R.','saniya@gmail.com'),
-- (6,'Valeriy P.','valeriy@gmail.com'),
-- (7,'Diana M.','diana@gmail.com'),
-- (8,'Ratmir A.','ratmir@gmail.com'),
-- (9,'Amir Z.','amir@gmail.com'),
-- (10,'Beibit O.','beibit@gmail.com');

-- INSERT INTO courses (id, title) VALUES
-- (1, 'English for Beginners'),
-- (2, 'Public Speaking Basics'),
-- (3, 'Personal Finance 101'),
-- (4, 'Healthy Lifestyle'),
-- (5, 'Time Management'),
-- (6, 'Photography Basics');

-- INSERT INTO lessons (id, course_id, title, position) VALUES
-- (1,1,'Alphabet & Sounds',1),
-- (2,1,'Basic Greetings',2),
-- (3,1,'Simple Sentences',3),
-- (4,1,'Daily Conversations',4),

-- (5,2,'Overcoming Fear',1),
-- (6,2,'Body Language',2),
-- (7,2,'Voice Control',3),
-- (8,2,'Structuring a Speech',4),

-- (9,3,'Income & Expenses',1),
-- (10,3,'Saving Basics',2),
-- (11,3,'Budget Planning',3),
-- (12,3,'Investing Intro',4),

-- (13,4,'Healthy Eating',1),
-- (14,4,'Exercise Basics',2),
-- (15,4,'Sleep Importance',3),
-- (16,4,'Stress Management',4),

-- (17,5,'Goal Setting',1),
-- (18,5,'Prioritization',2),
-- (19,5,'Planning Tools',3),
-- (20,5,'Avoiding Procrastination',4),

-- (21,6,'Camera Basics',1),
-- (22,6,'Lighting',2),
-- (23,6,'Composition',3),
-- (24,6,'Editing Basics',4);

-- INSERT INTO enrollments (student_id, course_id) VALUES
-- (4,1),
-- (4,2),

-- (1,1),
-- (1,3),

-- (2,1),
-- (2,4),

-- (3,2),
-- (3,5),

-- (5,3),
-- (5,6),

-- (6,4),

-- (7,1),
-- (7,6),

-- (8,5),

-- (9,4),

-- (10,2);

-- INSERT INTO progress (student_id, lesson_id, status, score) VALUES
-- (4,1,'done',85),
-- (4,2,'done',90),
-- (4,3,'in_progress',NULL),

-- (4,5,'done',88),
-- (4,6,'in_progress',NULL),

-- (1,1,'done',95),
-- (1,2,'done',92),
-- (1,3,'done',89),
-- (1,4,'in_progress',NULL),

-- (1,9,'done',80),
-- (1,10,'in_progress',NULL),

-- (2,1,'done',78),
-- (2,2,'in_progress',NULL),

-- (2,13,'done',91),
-- (2,14,'done',87),

-- (3,5,'done',70),
-- (3,6,'done',75),
-- (3,7,'in_progress',NULL),

-- (5,9,'done',88),
-- (5,10,'done',82),

-- (7,21,'in_progress',NULL),

-- (8,17,'done',93),

-- (9,13,'in_progress',NULL),

-- (10,5,'done',77),
-- (10,6,'done',81);

-- ЗАДАНИЯ 
-- 1
-- CREATE OR REPLACE FUNCTION lessons_count_safe(p_course_id int)
-- RETURNS int
-- LANGUAGE sql
-- AS $$
-- SELECT COALESCE(
--     (SELECT COUNT(*) FROM lessons WHERE course_id = p_course_id),
--     0
-- );
-- $$;

-- SELECT student_started_count(4,1);

-- 2
-- CREATE OR REPLACE FUNCTION student_started_count(p_student int, p_course int)
-- RETURNS int
-- LANGUAGE sql
-- AS $$
-- SELECT COUNT(*)
-- FROM progress pr
-- JOIN lessons l ON pr.lesson_id = l.id
-- WHERE pr.student_id = p_student
--   AND l.course_id = p_course
--   AND pr.status = 'in_progress';
-- $$;

-- SELECT student_started_count(4,1);

-- 3
-- CREATE OR REPLACE FUNCTION student_avg_score_done(p_student int, p_course int)
-- RETURNS numeric
-- LANGUAGE sql
-- AS $$
-- SELECT COALESCE(
--          ROUND(AVG(pr.score)::numeric, 2),
--          0
--        )
-- FROM progress pr
-- JOIN lessons l ON pr.lesson_id = l.id
-- WHERE pr.student_id = p_student
--   AND l.course_id = p_course
--   AND pr.status = 'done';
-- $$;

-- SELECT student_avg_score_done(4,1);

-- 4
-- CREATE OR REPLACE VIEW v_student_course_progress AS
-- SELECT
--     s.id AS student_id,
--     s.full_name,
--     c.id AS course_id,
--     c.title AS course_title,
--     COUNT(l.id) AS total_lessons,
--     COUNT(CASE WHEN pr.status = 'done' THEN 1 END) AS done_lessons,
--     COUNT(CASE WHEN pr.status = 'in_progress' THEN 1 END) AS in_progress_lessons,
--     CASE 
--         WHEN COUNT(l.id) = 0 THEN 0
--         ELSE ROUND(
--             COUNT(CASE WHEN pr.status = 'done' THEN 1 END)::numeric
--             * 100 / COUNT(l.id),
--         2)
--     END AS completion_percent
-- FROM enrollments e
-- JOIN students s ON s.id = e.student_id
-- JOIN courses c ON c.id = e.course_id
-- LEFT JOIN lessons l ON l.course_id = c.id
-- LEFT JOIN progress pr 
--     ON pr.lesson_id = l.id
--    AND pr.student_id = s.id
-- GROUP BY s.id, s.full_name, c.id, c.title;

-- SELECT * FROM v_student_course_progress
-- ORDER BY student_id, course_id;

-- 5
-- CREATE OR REPLACE FUNCTION student_course_lessons(p_student int, p_course int)
-- RETURNS TABLE(
--     lesson_title text,
--     status text,
--     score int
-- )
-- LANGUAGE sql
-- AS $$
-- SELECT
--     l.title,
--     COALESCE(pr.status, 'not_started'),
--     COALESCE(pr.score, 0)
-- FROM lessons l
-- LEFT JOIN progress pr
--     ON pr.lesson_id = l.id
--    AND pr.student_id = p_student
-- WHERE l.course_id = p_course
-- ORDER BY l.position;
-- $$;

-- SELECT * FROM student_course_lessons(4,1);

-- 6
-- SELECT 
--     s.full_name,
--     COUNT(*) AS done_count
-- FROM progress pr
-- JOIN students s ON s.id = pr.student_id
-- WHERE pr.status = 'done'
-- GROUP BY s.full_name
-- ORDER BY done_count DESC
-- LIMIT 3;

-- SELECT pr.student_id, pr.status
-- FROM progress pr
-- WHERE pr.status = 'done';

-- 7
-- SELECT
--     c.title AS course_title,
--     l.title AS lesson_title,
--     COUNT(*) AS in_progress_cnt
-- FROM lessons l
-- JOIN courses c ON c.id = l.course_id
-- JOIN progress pr ON pr.lesson_id = l.id
-- WHERE pr.status = 'in_progress'
-- GROUP BY c.title, l.title
-- HAVING COUNT(*) >= 2
-- ORDER BY in_progress_cnt DESC;

-- SELECT l.title, pr.student_id
-- FROM progress pr
-- JOIN lessons l ON pr.lesson_id = l.id
-- WHERE pr.status = 'in_progress'
-- ORDER BY l.title;

-- 8
-- CREATE OR REPLACE FUNCTION best_course_for_student(p_student int)
-- RETURNS TABLE(
--     course_id int,
--     course_title text,
--     completion_percent numeric
-- )
-- LANGUAGE sql
-- AS $$
-- SELECT *
-- FROM (
--     SELECT
--         c.id,
--         c.title,
--         CASE 
--             WHEN COUNT(l.id) = 0 THEN 0
--             ELSE ROUND(
--                 COUNT(CASE WHEN pr.status = 'done' THEN 1 END)::numeric
--                 * 100 / COUNT(l.id),
--             2)
--         END AS percent
--     FROM enrollments e
--     JOIN courses c ON c.id = e.course_id
--     LEFT JOIN lessons l ON l.course_id = c.id
--     LEFT JOIN progress pr
--         ON pr.lesson_id = l.id
--        AND pr.student_id = p_student
--     WHERE e.student_id = p_student
--     GROUP BY c.id, c.title
-- ) t
-- ORDER BY percent DESC
-- LIMIT 1;
-- $$;

-- SELECT * FROM best_course_for_student(4);

-- 9
-- SELECT
--     s.email AS student_email,
--     c.title AS course_title,
--     l.title AS lesson_title,
--     pr.status
-- FROM progress pr
-- JOIN students s ON s.id = pr.student_id
-- JOIN lessons l ON l.id = pr.lesson_id
-- JOIN courses c ON c.id = l.course_id
-- LEFT JOIN enrollments e
--     ON e.student_id = s.id
--    AND e.course_id = c.id
-- WHERE e.student_id IS NULL;

-- 10
-- CREATE OR REPLACE FUNCTION student_done_count(p_student int, p_course int)
-- RETURNS int
-- LANGUAGE sql
-- AS $$
-- SELECT COUNT(*)
-- FROM progress pr
-- WHERE pr.student_id = p_student
--   AND pr.status = 'done'
--   AND pr.lesson_id IN (
--         SELECT id FROM lessons WHERE course_id = p_course
--   );
-- $$;

-- SELECT student_done_count(4,1);