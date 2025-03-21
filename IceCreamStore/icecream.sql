drop table if exists store, employee, manager, flavor, cone, customer;

create table if not exists store (
  id serial primary key,
  name varchar(255),
  location varchar(255)
);

INSERT INTO store(name, location) VALUES('store 1', '111 location');
INSERT INTO store(name, location) VALUES('store 2', '222 location');
INSERT INTO store(name, location) VALUES('store 3', '333 location');

create table if not exists employee (
  id serial primary key,
  name varchar(255),
  current_store_id integer,
  currently_active boolean,
  hours_worked integer,
  foreign key (current_store_id) references store(id)
);

INSERT INTO employee(name, current_store_id, currently_active, hours_worked) VALUES('chungus', 2, true, 2053);
INSERT INTO employee(name, current_store_id, currently_active, hours_worked) VALUES('bupkis', 2, false, 192);
INSERT INTO employee(name, current_store_id, currently_active, hours_worked) VALUES('tryhard', 3, true, 203574);
INSERT INTO employee(name, current_store_id, currently_active, hours_worked) VALUES('employee 4', 1, true, 2352);


create table if not exists manager (
  id serial primary key,
  store_id int,
  employee_id int,
  foreign key (store_id) references store(id),
  foreign key (employee_id) references employee(id)
);

INSERT INTO manager(store_id, employee_id) VALUES(1, 4);
INSERT INTO manager(store_id, employee_id) VALUES(2, 1);
INSERT INTO manager(store_id, employee_id) VALUES(3, 3);

create table if not exists cone (
  id serial primary key,
  cone_name varchar(255)

);

create table if not exists flavor (
  id serial primary key,
  flavor_name varchar(255)
);

create table if not exists customer (
  id serial primary key,
  name varchar(255),
  purchases integer
);

INSERT INTO customer(name, purchases) VALUES('cust 1', 5)



