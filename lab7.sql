create database lab7;

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50) UNIQUE NOT NULL,
    region VARCHAR(50)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    country_id INTEGER REFERENCES countries
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO countries (country_name, region) VALUES
('United States', 'North America'),
('Canada', 'North America'),
('Germany', 'Europe'),
('India', 'Asia'),
('Japan', 'Asia');

INSERT INTO departments (department_name, budget, country_id) VALUES
('Human Resources', 50000, 1),
('Finance', 75000, 2),
('Engineering', 120000, 3),
('Marketing', 60000, 1),
('Sales', 70000, 4);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
('John', 'Doe', 'johndoe@example.com', '555-1234', 55000, 1),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', 62000, 2),
('Alice', 'Johnson', 'alicej@example.com', '555-8765', 85000, 3),
('Bob', 'Brown', 'bobb@example.com', '555-4321', 48000, 4),
('Charlie', 'Davis', 'charlied@example.com', '555-6789', 51000, 5);

---1
---SELECT * FROM countries WHERE country_name = ‘string’;
create index idx_countries_name on countries(country_name);

---2
---SELECT * FROM employees WHERE first_name = ‘string’ AND last_name = ‘string’;
create index idx_employees_firstAndLastName on employees(first_name, last_name);

---3
---SELECT * FROM employees WHERE salary < value1 AND salary > value2;
create unique index idx_employees_salary on employees(salary);

---4
---SELECT * FROM employees WHERE substring(first_name from 1 for 4) = ‘abcd’;
create index idx_employees_subsrtingName on employees(first_name);

---5
---SELECT * FROM employees e JOIN departments d ON d.department_id = e.department_id WHERE d.budget > value2 AND e.salary < value2;
create index idx_departments_budget on departments(department_id, budget);
create index idx_employees_department_salary on employees(department_id, salary);