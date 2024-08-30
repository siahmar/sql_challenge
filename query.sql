--Data Analysis 

-- 1) List the employee number, last name, first name, sex, and salary of each employee.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
Join salaries s
on (e.emp_no = s.emp_no)
order by emp_no;

-- 2) List the first name, last name, and hire date for the employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date like '%1986'
order by first_name;

-- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
 
select d.dept_name, d.dept_no, dm.emp_no, e.last_name, e.first_name 
from departments d
	Join dept_manager dm
	on (d.dept_no = dm.dept_no)
		Join employees e
		on (dm.emp_no = e.emp_no)
order by dept_name;

-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
	join employees e
	on (de.emp_no = e.emp_no)
		join departments d
		on (de.dept_no = d.dept_no)
order by emp_no;

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
AND last_name like 'B%';

-- 6) List each employee in the Sales department, including their employee number, last name, and first name.

select emp_no, last_name, first_name 
from employees
where emp_no IN
(
	select emp_no
	from dept_emp
	where dept_no 
	In (
		select dept_no
		from departments
		where dept_name = 'Sales'
		)
)
order by emp_no;

-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

	--CREATE VIEW 
Create view emp_in_sales_dev as 
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
	join dept_emp de
	on (e.emp_no = de.emp_no)
		join departments d
		on (d.dept_no = de.dept_no);

	--Query the view
select emp_no, last_name, first_name, dept_name
from emp_in_sales_dev
where dept_name = 'Sales' or dept_name ='Development'
order by emp_no;
		
-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count(*) as last_name_count
from employees
group by last_name
order by last_name desc;
