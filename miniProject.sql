select first_name as First , last_name as Last from employees;
SELECT DISTINCT department_id FROM employees;
select*from employees;
select * from employees order by first_name asc;

select first_name ,last_name ,salary * 0.15  as PF from employees;
select employee_id,first_name,last_name,salary from employees order by salary asc;
SELECT SUM(salary) AS total_salary FROM employees;
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM employees;
SELECT AVG(salary) AS Average FROM employees;
SELECT COUNT(*) as count FROM employees;
SELECT UPPER(first_name) AS first_name_upper FROM employees;
SELECT SUBSTRING(first_name, 1, 3) AS first_name_initials FROM employees;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
SELECT first_name, last_name,(LENGTH(first_name) + LENGTH(last_name)) AS full_name_length FROM employees
SELECT first_name FROM employees WHERE first_name REGEXP'[0-9]';
SELECT * FROM employees LIMIT 10;

------>exercice2
select*from employees;
select first_name,last_name,salary from employees where salary between 10000 and 15000;
select first_name,last_name,hire_date from employees where date_part('year',hire_date) = 1987;
select * from employees where first_name LIKE '%c%' AND first_name LIKE '%e%';
SELECT last_name, job, salary FROM employees WHERE job NOT IN ('Programmer', 'Shipping Clerk') AND salary NOT IN (4500, 10000, 15000);
SELECT last_name FROM employees WHERE LENGTH(last_name) = 6;
SELECT last_name FROM employees WHERE SUBSTRING(last_name, 3, 1) = 'e';
select * from departments;

select  E.last_name,E.salary,D.department_name 
	from employees as E  
	inner join departments as D 
	on E.department_id=D.department_id
	 WHERE department_name NOT IN ('Programmer', 'Shipping Clerk') 
	 AND salary NOT IN (4500, 10000, 15000);
	 
	SELECT * FROM employees WHERE last_name IN ('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');
	
	
	select E.*,J.job_title 
	from employees as E inner join jobs as J 
	on E.job_id=J.job_id 
























