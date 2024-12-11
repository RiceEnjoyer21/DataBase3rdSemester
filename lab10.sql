create database lab10;

create table Books(
    book_id integer primary key,
    title varchar(250),
    author varchar(250),
    price decimal(10, 2),
    quantity integer
);

create table Orders(
    order_id integer primary key,
    book_id integer,
    customer_id integer,
    order_date date,
    quantity integer,
    foreign key (book_id) references Books (book_id),
    foreign key (customer_id) references Customers (customer_id)
);

create table Customers(
    customer_id integer primary key,
    name varchar(250),
    email varchar(250)
);

insert into Books values
    (1, 'Database 101', 'A.Smith', 40.00, 10),
    (2, 'Learn SQL', 'B.Johnson', 35.00, 15),
    (3, 'Advanced SQL', 'C.Lee', 50.00, 5);

insert into Customers values
    (101, 'John Doe', 'johndoe@example.com'),
    (102, 'Jane Doe', 'janedoe@example.com');

---1
begin;
insert into Orders values (1, 1, 101, current_date, 2);
update Books set quantity = quantity - 2 where book_id = 1;
commit;

---2
begin;
insert into Orders values (2, 3, 102, current_date, 10);
update Books set quantity = quantity - 10 where book_id = 3;
rollback;
commit;

---3
begin transaction isolation level read committed;
update Books set price = 60.00 where book_id = 2;
begin transaction isolation level read committed;
select * from Books where book_id = 2;
commit;

---4
begin transaction;
update Customers set email = 'bebramoment@zxc.com' where customer_id = 101;
commit;

/*
---2
begin;
savepoint bebra;
insert into Orders values (2, 3, 102, current_date, 10);
do $$
    begin
        if (select Books.quantity from Books where book_id = 3) < 10
            then rollback to bebra;
        else update Books set quantity = quantity - 10 where book_id = 3;
        end if;
end $$;
commit;
*/