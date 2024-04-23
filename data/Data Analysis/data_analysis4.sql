--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
SELECT 
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    de.dept_no AS department_number,
    d.dept_name AS department_name
FROM 
    dept_emp de
JOIN 
    employees e ON de.emp_no = e.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;