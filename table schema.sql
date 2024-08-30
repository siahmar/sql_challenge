DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager; 
DROP TABLE IF EXISTS titles; 
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries; 
DROP TABLE IF EXISTS employees;

-- Create table
Create table employees (
	emp_no integer PRIMARY KEY, 
	emp_title_id VARCHAR(10) NOT NULL, 
	birth_date VARCHAR(15) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL, 
	sex VARCHAR(2) NOT NULL, 
	hire_date varchar(15) NOT NULL	
);

Create table dept_emp (
	emp_no integer Not null, 
	dept_no VARCHAR(10) NOT NULL 
);

Create table salaries (
	emp_no integer PRIMARY KEY, 
	salary integer NOT NULL,
	Foreign key (emp_no) References employees(emp_no)
);

Create table titles (
	title_id VARCHAR(10) Primary key, 
	title VARCHAR(25) NOT NULL
);

Create table departments (
	dept_no varchar(7) PRIMARY KEY, 
	dept_name VARCHAR(25) NOT NULL
);

Create table dept_manager (
	dept_no varchar(7) not null,
	emp_no integer Primary key
);
-- Data was manually uploaded using the import option
