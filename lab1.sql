create database lab1;

create table users
(
    id        serial,
    firstname varchar(50),
    lastname  varchar(50)
);

alter table users add column isadmin integer;

alter table users alter column isadmin type boolean using isadmin::boolean;

alter table users alter column isadmin set default false;

alter table users add constraint user_id primary key(id);

create table tasks
(
    id serial,
    name varchar(50),
    user_id integer
);

drop table tasks;

drop database lab1;