---1
create database lab6;

---2
create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

insert into locations (street_address, postal_code, city, state_province) values
    ('Popham Road', '173463', 'Miami', 'Florida'),
    ('Centre Way', '325673', 'Denver', 'Colorado'),
    ('Croft Avenue', '876543', 'New York', 'New York'),
    ('Fresham Close', '485625', 'Chicago', 'Illinois');

insert into departments (department_name, budget, location_id) values
    ('Human Resources', 5000000, 1),
    ('Informational Technologies', 1000000000, 2),
    ('Marketing and Communications', 2100000000, 3),
    ('Research and Development', 540000, 4);

insert into employees (first_name, last_name, email, phone_number, salary, department_id) values
    ('Dayan', 'Ospanov', 'dayanosp@gmail.com', '87074573884', 20000, 1),
    ('Alen', 'Omarbayev', 'kolenoalena@mail.ru', '87774871653', 30000, 2),
    ('Nursultan', 'Aliaskarov', 'cumeo666@gmail.com', '96665742665', 10000, 3),
    ('Nuridin', 'Nurman', 'nurmannuridin@gmail.com', '+77074324859', 70000, 4);

---3
select employees.first_name, employees.last_name, departments.department_id, departments.department_name
    from employees join departments on employees.department_id = departments.department_id;

---4
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
    from employees join departments on employees.department_id = departments.department_id where employees.department_id in (80, 40);

---5
select employees.first_name, employees.last_name, departments.department_name, locations.city, locations.state_province
    from employees join departments departments on employees.department_id = departments.department_id
    join locations locations on departments.location_id = locations.location_id;

---6
select departments.department_name from departments
    left join employees on departments.department_id = employees.department_id;

---7
select employees.first_name, employees.last_name, employees.department_id, departments.department_name from employees
    left join departments on employees.department_id = departments.department_id;
