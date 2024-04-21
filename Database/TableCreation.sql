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
