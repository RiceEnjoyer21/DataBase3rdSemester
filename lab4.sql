create database lab4;

create table Warehouses
(
    code      serial,
    location varchar(255),
    capacity int
);

create table Boxes
(
    code char(4) primary key,
    contents varchar(255),
    value real,
    warehouse int
);

insert into Warehouses (location, capacity) values ('Chicago', 3);
insert into Warehouses (location, capacity) values ('Chicago', 4);
insert into Warehouses (location, capacity) values ('New York', 7);
insert into Warehouses (location, capacity) values ('Los Angeles', 2);
insert into Warehouses (location, capacity) values ('San Francisco', 8);

insert into boxes (code, contents, value, warehouse) values ('OMN7', 'Rocks', 180, 3);
insert into boxes (code, contents, value, warehouse) values ('4H8P', 'Rocks', 250, 1);
insert into boxes (code, contents, value, warehouse) values ('4RT3', 'Scissors', 190, 4);
insert into boxes (code, contents, value, warehouse) values ('7G3H', 'Rocks', 200, 1);
insert into boxes (code, contents, value, warehouse) values ('8JN6', 'Papers', 75, 1);
insert into boxes (code, contents, value, warehouse) values ('8Y6U', 'Papers', 50, 3);
insert into boxes (code, contents, value, warehouse) values ('9J6F', 'Papers', 175, 2);
insert into boxes (code, contents, value, warehouse) values ('LL08', 'Rocks', 140, 4);
insert into boxes (code, contents, value, warehouse) values ('P0H6', 'Scissors', 125, 1);
insert into boxes (code, contents, value, warehouse) values ('P2T6', 'Scissors', 150, 2);
insert into boxes (code, contents, value, warehouse) values ('TU55', 'Papers', 90, 5);

select * from Warehouses;

select * from Boxes where value > 150;

select distinct on(contents) from Boxes;

select warehouse, count(*) from boxes group by warehouse order by warehouse;

select warehouse, count(*) from boxes group by warehouse having count(*) > 2;

insert into Warehouses (location, capacity) values ('New York', 3);

insert into Boxes (code, contents, value, warehouse) values ('H5RT', 'Papers', 200, 2);

update Boxes set value = value * 0.85 where code = (select code from Boxes order by value desc offset 2 limit 1);

delete from Boxes where value < 150;

delete from Boxes where warehouse in (select code from warehouses where location = 'New York') returning *;