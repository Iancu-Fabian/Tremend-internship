Pulled the image

	- docker pull postgres

Ran the container with the ituser user

	- docker run --name postgres-container -e POSTGRES_USER=ituser -e POSTGRES_PASSWORD=ituser -d postgres 

Logged into the container with the created user

	- docker exec -it postgres-container psql -U ituser

Created the database with

	- CREATE DATABASE app;
Then switched to the new database with

	\c app

I ran the SQL script provided, but i kept getting an error related to a foreign key between salaries and employees. I figured out that the script was trying to insert more values into the salaries table than there were employees, so I limited the number of entries to the salaries table to 54, which is the number of employees.

To get number of employees

	SELECT COUNT(*) AS total_employees
	FROM employees;

To prompt the user 

	\prompt 'Enter department name: ' dept_name

To get employee names from input department

	SELECT first_name, last_name
	FROM employees e
	JOIN departments d ON e.department_id = d.department_id
	WHERE d.department_name = :'dept_name';

To get highest and lowest salary by department

	SELECT d.department_name,
       MAX(s.salary) AS highest_salary,
       MIN(s.salary) AS lowest_salary
	FROM employees e
	JOIN salaries s ON e.employee_id = s.employee_id
	JOIN departments d ON e.department_id = d.department_id
	GROUP BY d.department_name;

Created the dump file inside /tmp in the container

	docker exec -it 458d2513c10d pg_dump -U ituser -d app -F c -f /tmp/app.dump

Copied the dump to my local machine

	docker cp 458d2513c10d:/tmp/app.dump .   

