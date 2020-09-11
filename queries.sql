--Data Analysis

--Once you have a complete database, do the following:

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employee as emp
inner join  salaries as sal
on emp.emp_no = sal.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employee
where hire_date between '1986-01-01' and '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, 
--   the manager's employee number, last name, first name.

select dm.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
from dept_manager as dm
inner join departments as dept
on dm.dept_no = dept.dept_no
inner join employee as emp
on dm.emp_no = emp.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employee as emp
inner join dept_emp as de
on emp.emp_no = de.emp_no
inner join departments as dept
on de.dept_no = dept.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select emp.first_name, emp.last_name, emp.sex
from employee as emp
where first_name like 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select 
		e.emp_no,
		e.last_name,
		e.first_name,
		dept.dept_name
	from employee e
		join dept_emp d
			on e.emp_no = d.emp_no
		join departments dept
			on d.dept_no = dept.dept_no
	where dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select 
		e.emp_no,
		e.last_name,
		e.first_name,
		dept.dept_name
	from employee e
		join dept_emp d
			on e.emp_no = d.emp_no
		join departments dept
			on d.dept_no = dept.dept_no
	where dept_name in ('Sales', 'Development')

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select 
		last_name,
		count(*) count
	from employee e
	group by last_name
	order by 2 desc