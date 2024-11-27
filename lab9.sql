create database lab9;

create table employees(
    employee_id serial primary key,
    name varchar(50),
    salary integer
);

create table products(
    product_id serial primary key,
    product_name varchar(50),
    category varchar(50)
);

insert into products (product_name, category)
values ('Laptop', 'Electronics'),
       ('Shampoo', 'Personal Care'),
       ('Notebook', 'Stationery'),
       ('Smartphone', 'Electronics'),
       ('Table', 'Furniture');


insert into employees(name, salary)
values ('Dayan', 2000),
       ('Alen', 5000),
       ('Nuridin', 8000);


---1
create function increased_by_ten(value integer) returns numeric as
$$
    begin
        return value + 10;
    end;
$$
language plpgsql;
---select increased_by_ten(0);

---2
create function compare_numbers(a integer, b integer) returns varchar as
    $$
    begin
        if a > b then return 'Greater';
        elsif a = b then return 'Equal';
        else return 'Lesser';
    end if;
    end;
    $$
language plpgsql;
---select compare_numbers(2, 3);

---3
create function number_series(n integer) returns text as
    $$
    declare
        result text := '';
    begin
        for i in 1..n loop
            result := result || i || ' ';
            end loop;
        return result;
    end;
    $$
language plpgsql;
---select number_series(5);

---4
create function find_employee(emp_name varchar) returns table(employee_id integer, name varchar, salary integer) as
    $$
    begin
        return query
        select employees.employee_id, employees.name, employees.salary
        from employees where employees.name = emp_name;
    end;
    $$
language plpgsql;
---select * from find_employee('Alen');

---5
create function list_products(category_name varchar) returns table(id integer, product_name varchar, category varchar) as
    $$
    begin
        return query
        select products.product_id, products.product_name, products.category
        from products where products.category = category_name;
    end;
    $$
language plpgsql;
---select * from list_products('Electronics');

---6
create function calculate_bonus(emp_id integer) returns integer as
    $$
    declare
        bonus integer;
    begin
        select employees.salary * 0.1 into bonus from employees where employees.employee_id = emp_id;
        return bonus;
    end;
    $$
language plpgsql;
---select * from calculate_bonus(2);

create function update_salary(emp_id integer) returns integer as
    $$
    declare
        bonus integer;
        updated_salary integer;
    begin
        bonus := calculate_bonus(emp_id);
        update employees set salary = salary + bonus where employee_id = emp_id returning salary into updated_salary;
        return updated_salary;
    end;
    $$
language plpgsql;
---select update_salary(2);
---select * from employees where name = 'Alen';

create function complex_calculation(a integer, str varchar) returns varchar as
    $$
    <<main_block>>
    declare
        result varchar;
        bonus integer;
        names varchar;
    begin
        <<subblock1>>
        begin
            bonus := calculate_bonus(a);
        end subblock1;
        <<subblock2>>
        begin
            names := find_employee(str);
        end subblock2;
        result := 'Bros info: ' || names || ', Bros bonus: ' || bonus;
        return result;
    end main_block;
    $$
language plpgsql;
---select complex_calculation(2, 'Alen');



