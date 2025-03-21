-- drop table if exists delivery, pizza_order, driver, available_pizza, available_topping, customer, store;
-- drop table if exists store, available_pizza, available_topping, driver ,customer, pizza_order, delivery;
create table IF NOT EXISTS store (
  id serial primary key,
  location varchar(255)
);

create table IF NOT EXISTS available_pizza (
  id serial primary key,
  name varchar(255),
  cost integer
);

create table IF NOT EXISTS available_topping (
  id serial primary key,
  name varchar(255),
  cost_per_pizza varchar(255)
);

create table IF NOT EXISTS driver (
  id serial primary key,
  store_id int,
  full_name varchar(255),
  foreign key (store_id) references store(id) ON DELETE CASCADE
);


create table IF NOT EXISTS customer (
  id serial primary key,
  street varchar(255),
  city varchar(255),
  zip varchar(255),
  country varchar(255)
);


create table IF NOT EXISTS pizza_order (
  id serial primary key,
  customer_id integer,
  date date,
  pizza_type varchar(255),
  store_id integer,
  toppings text[],
  foreign key (store_id) references store(id) ON DELETE CASCADE,
  foreign key (customer_id) references customer(id) ON DELETE CASCADE
);

create table IF NOT EXISTS delivery (
  driver_id integer,
  order_id integer,
  started_delivery time,
  completed_delivery time,
  foreign key (driver_id) references driver(id) ON DELETE CASCADE,
  foreign key (order_id) references pizza_order(id) ON DELETE CASCADE
);



\COPY store FROM './data/stores.csv' WITH CSV HEADER;
\COPY driver FROM './data/drivers.csv' WITH CSV HEADER;
\COPY customer FROM './data/customers.csv' WITH CSV HEADER;
\COPY pizza_order FROM './data/orders.csv' WITH CSV HEADER;
\COPY available_pizza FROM './data/available_pizza.csv' WITH CSV HEADER;
\COPY available_topping FROM './data/available_toppings.csv' WITH CSV HEADER;
\COPY delivery FROM './data/deliveries.csv' WITH CSV HEADER;
