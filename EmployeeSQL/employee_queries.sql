-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no AS "Employee Number", 
	employees.last_name AS "Last Name", 
	employees.first_name AS "First Name", 
	employees.sex AS "Gender", 
	salaries.salary AS "Salary"
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "First Name", 
	last_name AS "Last Name", 
	hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(year FROM "hire_date") = 1986;

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no AS "Department Number", 
	departments.dept_name AS "Department Name", 
	dept_manager.emp_no AS "Employee Number", 
	employees.last_name AS "Last Name", 
	employees.first_name AS "First Name"
FROM dept_manager
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
ORDER BY departments.dept_no;

-- List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.
SELECT employees.emp_no AS "Employee Number", 
	employees.last_name AS "Last Name", 
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY employees.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names 
-- begin with "B."
SELECT first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Gender"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'
ORDER BY employees.emp_no;

-- In descending order, list the frequency count of employee last names, i.e., how many employees 
-- share each last name
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;