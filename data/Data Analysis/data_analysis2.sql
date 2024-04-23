--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year', TO_DATE(hire_date, 'MM/DD/YYYY')) = 1986;
