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
email_id varchar(50),
password varchar(100)
);

create table has (
has_id int primary key auto_increment,
customer_id int,
foreign key(customer_id) references customer(customer_id),
order_id int,
foreign key(order_id) references orders(order_id)
);

create table feedback (
feedback_id int primary key auto_increment,
feedback_date_time datetime,
rating int,
comments varchar(1000),
customer_id int,
foreign key(customer_id) references customer(customer_id)
);

create table staff(
staff_id int primary key auto_increment,
staff_name varchar(50),
phone_no long,
date_of_joining date,
salary int,
experience int,
role varchar(50)
);

create table chef (
staff_id int,
foreign key(staff_id) references staff(staff_id),
chef_name varchar(50),
specialization varchar(50)
);

create table prepares (
prepares_id int primary key auto_increment,
staff_id int,
foreign key(staff_id) references staff(staff_id),
order_id int,
foreign key(order_id) references orders(order_id)
);

-- below table is for storing images 
create table images (
item_id int,
foreign key(item_id) references menu_item(item_id),
item_name varchar(50),
img blob
);
