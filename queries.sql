--List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.employee_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on
salaries.employee_no = employees.employee_no
order by employees.last_name;

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01'
and hire_date < '1987-01-01';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
select departments.dept_name, department_managers.dept_no, department_managers.employee_no, employees.last_name, employees.first_name
from departments
left join department_managers
on departments.dept_no = department_managers.dept_no
left join employees
on department_managers.employee_no = employees.employee_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.employee_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join department_employees
on employees.employee_no = department_employees.employee_no
left join departments
on department_employees.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select departments.dept_name, employees.last_name, employees.first_name, employees.employee_no
from employees
left join department_employees
on employees.employee_no = department_employees.employee_no
left join departments
on department_employees.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
order by employees.last_name;

--List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
select departments.dept_name, employees.last_name, employees.first_name, employees.employee_no
from employees
left join department_employees
on employees.employee_no = department_employees.employee_no
left join departments
on department_employees.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development'
order by employees.last_name;

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
-- answer cribbed from: http://joshfrankel.me/blog/calculating-frequency-distribution-in-postgresql/
SELECT 
  employees.last_name, 
  COUNT(employees.last_name) as total_names
FROM employees
GROUP BY employees.last_name
ORDER BY total_names DESC;


--Find the terrible pun
select employees.last_name, employees.first_name
from employees
where employees.employee_no = '499942';
