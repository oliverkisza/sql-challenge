CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE employees (
    emp_no VARCHAR PRIMARY KEY,
    emp_title VARCHAR REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no VARCHAR REFERENCES employees(emp_no),
    salary VARCHAR,
    PRIMARY KEY (emp_no, salary)
);

CREATE TABLE dept_emp (
    emp_no VARCHAR REFERENCES employees(emp_no),
    dept_no VARCHAR REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR REFERENCES departments(dept_no),
	emp_no VARCHAR,
    PRIMARY KEY (emp_no, dept_no)
);

-- Import order: titles, departments, employees, salaries, dept_emp, dept_manager