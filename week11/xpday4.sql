SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Bull'
)


SELECT first_name, last_name
FROM employees
WHERE manager_id = (
    SELECT employee_id
    FROM employees
    WHERE department_id IN (
        SELECT department_id
        FROM departments
        WHERE country = 'United States'
    )
);


SELECT first_name, last_name
FROM employees
WHERE employee_id IN (
    SELECT DISTINCT manager_id
    FROM employees
);


SELECT first_name, last_name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


SELECT first_name, last_name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


SELECT first_name, last_name
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
    WHERE job_id = employees.job_id
);


SELECT first_name, last_name
FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT manager_id
    FROM employees
);



SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = employees.department_id
);


SELECT salary
FROM employees
ORDER BY salary DESC
OFFSET 4 ROWS FETCH NEXT 1 ROW ONLY;



SELECT salary
FROM employees
ORDER BY salary
OFFSET 3 ROWS FETCH NEXT 1 ROW ONLY;


SELECT department_name, department_id
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees
);



---------------> Joins


SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;



SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;


SELECT e.first_name, e.last_name, e.job_id, d.department_name, d.department_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'London';



SELECT e.employee_id, e.last_name AS Employee, e.manager_id, m.last_name AS Manager
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;



SELECT e.employee_id, e.first_name, e.last_name, d.department_name, d.department_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id;



SELECT e.employee_id, e.job_title, TRUNC(sysdate) - TRUNC(e.hire_date) AS days_worked
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = 90;



SELECT d.department_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, l.city
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
JOIN locations l ON d.location_id = l.location_id;



SELECT j.job_title, AVG(e.salary) AS average_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title;


SELECT d.department_name, e.first_name, e.last_name, e.hire_date, e.salary
FROM employees e
JOIN departments d ON


--------------->Function

UPDATE employees
SET phone_number = '999'
WHERE INSTR(phone_number, '124') > 0;



SELECT *
FROM employees
WHERE LENGTH(first_name) >= 8;



SELECT CONCAT(UPPER(SUBSTR(first_name, 1, 1)), last_name, '@example.com') AS EMAIL
FROM employees;




SELECT employee_id, SUBSTR(email, 1, LENGTH(email) - 3) AS email_truncated
FROM employees;



SELECT SUBSTR(job_title, 1, INSTR(job_title, ' ') - 1) AS first_word_job_title
FROM employees
WHERE INSTR(job_title, ' ') > 0;



SELECT first_name AS First_Name, LENGTH(first_name) AS First_Name_Length
FROM employees
WHERE first_name LIKE 'A%' OR first_name LIKE 'J%' OR first_name LIKE 'M%'
ORDER BY first_name;




SELECT first_name, CONCAT('$', salary) AS SALARY
FROM employees;


-----------------------------dailY------------------------------------------------
CREATE TABLE product_orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_name VARCHAR(100)
);

CREATE TABLE items (
  item_id INT PRIMARY KEY,
  order_id INT,
  item_name VARCHAR(100),
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES product_orders(order_id)
);


CREATE FUNCTION calculate_total_price(order_id_param INT) 
RETURNS DECIMAL(10, 2)
AS
$$
DECLARE
  total_price DECIMAL(10, 2);
BEGIN
  SELECT SUM(price) INTO total_price
  FROM items
  WHERE order_id = order_id_param;
  
  RETURN total_price;
END;
$$
LANGUAGE plpgsql;



CREATE TABLE users (
  user_id INT PRIMARY KEY,
  user_name VARCHAR(100)
);

CREATE TABLE product_orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  order_date DATE,
  customer_name VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items (
  item_id INT PRIMARY KEY,
  order_id INT,
  item_name VARCHAR(100),
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES product_orders(order_id)
);

CREATE OR REPLACE FUNCTION calculate_total_price_for_user(user_id_param INT, order_id_param INT)
RETURNS DECIMAL(10, 2) AS $$
DECLARE
  total_price DECIMAL(10, 2);
BEGIN
  SELECT SUM(price) INTO total_price
  FROM items
  WHERE order_id = order_id_param
    AND order_id IN (
      SELECT order_id
      FROM product_orders
      WHERE user_id = user_id_param
    );
  
  RETURN total_price;
END;
$$ LANGUAGE plpgsql;
