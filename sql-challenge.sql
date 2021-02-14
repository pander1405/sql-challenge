-- Table Creation Exported from QuickDBD

CREATE TABLE "departments" (
    "dept_no" varchar(255)   NOT NULL, 
    "dept_name" varchar(255)   NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(255)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(255)   NOT NULL,
	"emp_no" int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(255)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--This alter table needs help
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

--Query

--Need help here

--List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no

--List the first name, last name and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name
SELECT e.first_name, e.last_name, d.dept_no, d.dept_name, dm.emp_no
FROM departments AS d
JOIN dept_manager AS dm ON
d.dept_no = dm.dept_no
JOIN employees 
AS e ON dm.emp_no = e.emp_no

--List the department of each employee witht he following information: employee number, last name, firstname and department number
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no

--List the first name, last name and sex for employees whos first name is Hercules and last name begins with B
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales Department, including their employee number, last name, first name and department name
SELECT e.first_name, e.last_name, d.dept_no, d.dept_name, dm.emp_no
FROM departments AS d
JOIN dept_manager AS dm ON
d.dept_no = dm.dept_no
JOIN employees 
AS e ON dm.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--List all emplyees in the Sales and Development deparments including their employee number, last name, first name and department name
SELECT e.first_name, e.last_name, d.dept_no, d.dept_name, dm.emp_no
FROM departments AS d
JOIN dept_manager AS dm ON
d.dept_no = dm.dept_no
JOIN employees 
AS e ON dm.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names.
SELECT last_name, COUNT(emp_no) AS "Total for Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Total for Last Name" desc;