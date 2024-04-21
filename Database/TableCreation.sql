create database rms;

use rms;

create table menu_item (
item_id int primary key auto_increment,
item_name varchar(50),
cuisine_type varchar(50),
price int
);

create table order_status (
status_id int primary key auto_increment,
status_name bool
);

create table orders (
order_id int primary key auto_increment,
order_date_time datetime,
total_amount int,
payment_status bool,
status_id int,
foreign key(status_id) references order_status(status_id)
);

create table contains (
contain_id int primary key auto_increment,
order_id int,
foreign key(order_id) references orders(order_id),
item_id int,
foreign key(item_id) references menu_item(item_id)
);

create table customer (
customer_id int primary key auto_increment,
customer_name varchar(50),
phone_no long,
email_id varchar(50)
);

create table has (
has_id int primary key auto_increment,
customer_id int,
foreign key(customer_id) references customer(customer_id),
order_id int,
foreign key(order_id) references orders(order_id)
);
