-- CREATE TABLE employees_hw (
--   id BIGSERIAL PRIMARY KEY,
--   full_name VARCHAR(120) NOT NULL,
--   email VARCHAR(120) UNIQUE NOT NULL,
--   age INT CHECK (age >= 0),
--   department VARCHAR(60) NOT NULL,
--   salary INT CHECK (salary >= 0),
--   hired_at DATE DEFAULT CURRENT_DATE,
--   fired_at DATE,
--   created_at TIMESTAMPTZ DEFAULT NOW()
-- );

-- INSERT INTO employees_hw (full_name, email, age, department, salary, fired_at) VALUES
-- ('Макс Кочин', 'maks@gmail.com', 22, 'IT', 600000, NULL),
-- ('Анна Смирнова', 'anna.smirnova@gmail.com', 19, 'HR', 400000, NULL),
-- ('Мария Иванова', 'maria.ivanova@gmail.com', 28, 'Sales', 550000, NULL),
-- ('Дмитрий Петров', 'dmitry.petrov@gmail.com', 35, 'Marketing', 700000, NULL),
-- ('Ауреан Блюм', 'blum@gmail.com', 18, 'IT', 650000, NULL),
-- ('Даниэль Кинг', 'daniel.king@gmail.com', 45, 'HR', 800000, NULL),
-- ('Анджела Уайт', 'angela.white@gmail.com', 32, 'Sales', 600000, '2026-01-01'),
-- ('Роберт Блэк', 'robert.black@gmail.com', 25, 'Marketing', 450000, NULL),
-- ('Фрэнк Мур', 'frank.moore@gmail.com', 17, 'IT', 550000, NULL),
-- ('София Адамс', 'sophia.adams@gmail.com', 27, 'HR', 500000, NULL),
-- ('Брайан Кларк', 'brian.clark@gmail.com', 21, 'Sales', 650000, NULL),
-- ('Аманда Хилл', 'amanda.hill@gmail.com', 23, 'Marketing', 550000, '2026-01-01'),
-- ('Кевин Скотт', 'kevin.scott@gmail.com', 29, 'IT', 400000, NULL),
-- ('Натали Тернер', 'natalie.turner@gmail.com', 20, 'Sales', 300000, NULL),
-- ('Марк Эванс', 'mark.evans@gmail.com', 19, 'HR', 200000, '2026-01-01');

-- SELECT * FROM employees_hw;


-- SELECT * FROM employees_hw WHERE salary > 500000;

-- SELECT * FROM employees_hw WHERE age >= 18;

-- SELECT * FROM employees_hw WHERE department = 'IT';

-- SELECT * FROM employees_hw WHERE department != 'IT';

-- SELECT * FROM employees_hw WHERE id = 1;

-- SELECT * FROM employees_hw WHERE department = 'IT' AND salary >= 600000;

-- SELECT * FROM employees_hw WHERE department IN ('HR','Marketing');

-- SELECT * FROM employees_hw WHERE age < 20 OR salary > 700000;

-- SELECT * FROM employees_hw WHERE department = 'Sales' AND (age < 25 OR salary > 500000);

-- SELECT * FROM employees_hw WHERE age BETWEEN 20 AND 30;

-- SELECT * FROM employees_hw WHERE salary BETWEEN 300000 AND 600000;

-- SELECT * FROM employees_hw WHERE fired_at IS NULL;

-- SELECT * FROM employees_hw WHERE fired_at IS NOT NULL;

-- SELECT * FROM employees_hw WHERE full_name ILIKE '%aн%';

-- SELECT * FROM employees_hw WHERE full_name ILIKE 'A%';

-- SELECT * FROM employees_hw WHERE email ILIKE '%gmail%';

-- SELECT * FROM employees_hw WHERE department ILIKE '%s%';

-- SELECT * FROM employees_hw ORDER BY salary DESC;

-- SELECT * FROM employees_hw ORDER BY salary DESC LIMIT 5;

-- SELECT * FROM employees_hw ORDER BY age ASC LIMIT 3;

-- SELECT * FROM employees_hw ORDER BY created_at DESC LIMIT 5;

-- SELECT * FROM employees_hw ORDER BY department ASC, full_name ASC;

-- UPDATE employees_hw SET salary = salary * 1.10 WHERE department = 'IT';
-- SELECT * FROM employees_hw WHERE department = 'IT';

-- UPDATE employees_hw SET salary = salary * 0.95 WHERE department = 'Sales';
-- SELECT * FROM employees_hw WHERE department = 'Sales';

-- UPDATE employees_hw SET department = 'Marketing' WHERE email = 'kevin.scott@gmail.com';
-- SELECT * FROM employees_hw WHERE email = 'kevin.scott@gmail.com';

-- UPDATE employees_hw SET full_name = 'Макс' WHERE id = 1;
-- SELECT * FROM employees_hw WHERE id = 1;

-- UPDATE employees_hw SET fired_at = CURRENT_DATE WHERE id = 2;
-- SELECT * FROM employees_hw WHERE id = 2;

-- UPDATE employees_hw SET salary = salary + 50000 WHERE age < 18;
-- SELECT * FROM employees_hw WHERE age < 18;

-- DELETE FROM employees_hw WHERE id = 3;
-- SELECT * FROM employees_hw;

-- DELETE FROM employees_hw WHERE salary < 200000;
-- SELECT * FROM employees_hw;

-- DELETE FROM employees_hw WHERE fired_at IS NOT NULL;
-- SELECT * FROM employees_hw;

-- SELECT COUNT(*) FROM employees_hw;

-- SELECT MIN(salary), MAX(salary) FROM employees_hw;

SELECT * FROM employees_hw ORDER BY id;