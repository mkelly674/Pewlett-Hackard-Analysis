--getting the columns from employees and titles table and putting into new table
SELECT employees.emp_no, employees.first_name, employees.last_name,
titles.title, titles.from_date, titles.to_date
INTO Retirement_Titles
From employees
JOIN titles
On employees.emp_no = titles.emp_no
WHERE(employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;

--checking if the Retirement_titles table was made
Select * From Retirement_Titles;

--filter the employees for the people that already left
Select Distinct on (emp_no) to_date,
emp_no,
first_name,
last_name,
title

INTO Unique_Titles
FROM Retirement_Titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--checking if the table was made
Select * From Unique_Titles;

--getting the number of employees that are going to retire
SELECT COUNT(title), title
Into Retireing_Titles
From Unique_Titles
Group by title
order by COUNT(title) desc;

--checking if the table was made
select * FROM Retireing_Titles;

--creating potiential mentorship table
SELECT DISTINCT ON (employees.emp_no) employees.emp_no,employees.first_name,employees.last_name,employees.birth_date,
dept_emp.from_date,dept_emp.to_date,
titles.title
INTO Mentorship_Eligibility
FROM employees
JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
JOIN titles
on titles.emp_no = employees.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;

--Checking if the table was made
SELECT * FROM Mentorship_Eligibility;
