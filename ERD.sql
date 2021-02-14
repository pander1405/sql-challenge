-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DtphBd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

*Note* My SQL table schema will be different than this. Once I had this imported into PGAdmin I noticed several
mistakes and decided to make the changes in PGAdmine and not in QDBD


CREATE TABLE "Department" (
    "Dept_no" varchar(255)   NOT NULL,
    "Dept_name" varchar(255)   NOT NULL
);

CREATE TABLE "Department Employees" (
    "emp_no" int   NOT NULL,
    "Dept_no" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Department Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department Manager" (
    "emp_no" intD   NOT NULL,
    "Dept_no" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Department Manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" string   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" intD   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department Employees" ADD CONSTRAINT "fk_Department Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department Employees" ADD CONSTRAINT "fk_Department Employees_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Department" ("Dept_no");

ALTER TABLE "Department Manager" ADD CONSTRAINT "fk_Department Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

