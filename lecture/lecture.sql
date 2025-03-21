drop table if exists student;

create table student (
  id int,
  name varchar DEFAULT 'lugma',
  money int DEFAULT 69
);

insert into student(name, money) values(DEFAULT, default)