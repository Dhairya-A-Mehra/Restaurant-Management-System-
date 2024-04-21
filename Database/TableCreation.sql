create database rms;

use rms;

create table menu_item (
item_id int primary key auto_increment,
item_name varchar(50),
cuisine_type varchar(50),
price int
);
