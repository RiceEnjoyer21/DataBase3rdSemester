create database lab2;

create table countries
(
    country_id serial primary key,
    country_name varchar(50),
    region_id integer,
    population integer
);

insert into countries (country_name, region_id, population)
values ('Japan', 21, 20000000);

insert into countries (country_id, country_name)
values (20, 'Germany');

insert into countries (region_id)
values (null);

insert into countries (country_name, region_id, population)
values ('Belgium', 7, 300000000),
       ('Slovenia', 8, 400000000),
       ('Albania', 9, 1000);

alter table countries alter column country_name set default 'Kazakhstan';

insert into countries(country_name, region_id, population) values (default, 91, 100000000);

insert into countries default values;

create table countries_new (like countries including all);

insert into countries_new select * from countries;

update countries_new set region_id = 1 where region_id is null;

update countries_new set population = population * 1.1 where population is null returning country_name, population as new_population;

delete from countries where population < 100000;

delete from countries_new using countries where countries_new.country_id = countries.country_id returning countries_new.*;

delete from countries returning *;








