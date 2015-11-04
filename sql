SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS blackList;
DROP TABLE IF EXISTS inquiry;
DROP TABLE IF EXISTS itemImage;
DROP TABLE IF EXISTS orderDetails;
DROP TABLE IF EXISTS shop_item;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS deliveryDestination;
DROP TABLE IF EXISTS deliveryMethod;
DROP TABLE IF EXISTS itemOrder;
DROP TABLE IF EXISTS mailBox;
DROP TABLE IF EXISTS shop;
DROP TABLE IF EXISTS map;
DROP TABLE IF EXISTS postage;
DROP TABLE IF EXISTS userAvatar;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE blackList
(
	user_id varchar(255) NOT NULL,
	summary text,
	register_date datetime
);


CREATE TABLE category
(
	kategory_id varchar(255) NOT NULL,
	name varchar(255),
	PRIMARY KEY (kategory_id)
);


CREATE TABLE delivery
(
	delivery_method_id varchar(255) NOT NULL,
	shop_id varchar(255) NOT NULL,
	PRIMARY KEY (delivery_method_id, shop_id)
);


CREATE TABLE deliveryDestination
(
	order_id varchar(255) NOT NULL,
	postnumber varchar(255),
	prefectures varchar(255),
	district varchar(255),
	address_building varchar(255),
	tell varchar(11),
	name varchar(255),
	PRIMARY KEY (order_id)
);


CREATE TABLE deliveryMethod
(
	delivery_method_id varchar(255) NOT NULL,
	name varchar(255),
	PRIMARY KEY (delivery_method_id)
);


CREATE TABLE inquiry
(
	QA_id varchar(255) NOT NULL,
	item_id varchar(255) NOT NULL,
	user_id varchar(255) NOT NULL,
	inquiry_data text,
	inquiry_date datetime,
	PRIMARY KEY (QA_id),
	UNIQUE (item_id)
);


CREATE TABLE item
(
	item_id varchar(255) NOT NULL,
	kategory_id varchar(255) NOT NULL,
	name varchar(255),
	price int,
	size int,
	info text,
	register_date datetime,
	stock int,
	is_alive int,
	exterior_path varchar(255),
	PRIMARY KEY (item_id),
	UNIQUE (item_id)
);


CREATE TABLE itemImage
(
	item_image_id varchar(255) NOT NULL,
	item_id varchar(255) NOT NULL,
	register_date datetime,
	path varchar(255),
	type int,
	rank int,
	PRIMARY KEY (item_image_id),
	UNIQUE (item_id)
);


CREATE TABLE itemOrder
(
	order_id varchar(255) NOT NULL,
	payment_method varchar(255),
	delivery_method varchar(255),
	delivery_price int,
	order_date datetime,
	order_user_id varchar(255) NOT NULL,
	shop_id varchar(255) NOT NULL,
	status varchar(255),
	PRIMARY KEY (order_id)
);


CREATE TABLE mailBox
(
	mail_id varchar(255) NOT NULL,
	user_id varchar(255) NOT NULL,
	from_id varchar(255) NOT NULL,
	title varchar(255),
	body text,
	send_date datetime,
	PRIMARY KEY (mail_id)
);


CREATE TABLE map
(
	map_id varchar(255) NOT NULL,
	point_x int,
	map_y int,
	image_path varchar(255),
	drawing_data varchar(255),
	object_data varchar(255),
	collision_data varchar(255),
	shop_puttable_data varchar(255),
	PRIMARY KEY (map_id)
);


CREATE TABLE orderDetails
(
	order_id varchar(255) NOT NULL,
	item_id varchar(255) NOT NULL,
	count int,
	PRIMARY KEY (order_id, item_id)
);


CREATE TABLE postage
(
	company varchar(255) NOT NULL,
	method varchar(255) NOT NULL,
	size int NOT NULL,
	from_prefectures varchar(255) NOT NULL,
	to_prefectures varchar(255) NOT NULL,
	price int,
	PRIMARY KEY (company, method, size, from_prefectures, to_prefectures)
);


CREATE TABLE shop
(
	shop_id varchar(255) NOT NULL,
	user_id varchar(255) NOT NULL,
	name varchar(255),
	made_date datetime,
	exterior_image_path varchar(255),
	map_id varchar(255) NOT NULL,
	point_x int,
	point_y int,
	is_alive int,
	interior_image_path varchar(255),
	interior_draw_data varchar(255),
	interior_object_data varchar(255),
	interior_collision_data varchar(255),
	PRIMARY KEY (shop_id)
);


CREATE TABLE shop_item
(
	shop_id varchar(255) NOT NULL,
	item_id varchar(255) NOT NULL,
	register_date datetime,
	PRIMARY KEY (shop_id, item_id),
	UNIQUE (item_id)
);


CREATE TABLE user
(
	user_id varchar(255) NOT NULL,
	account_name varchar(255),
	pass varchar(255),
	postnumber varchar(7),
	prefectures varchar(255),
	district varchar(255),
	address_building varchar(255),
	tell varchar(15),
	category int,
	is_alive int,
	name varchar(255),
	PRIMARY KEY (user_id)
);


CREATE TABLE userAvatar
(
	user_avatar_id varchar(255) NOT NULL,
	user_id varchar(255) NOT NULL,
	path varchar(255),
	PRIMARY KEY (user_avatar_id)
);



/* Create Foreign Keys */

ALTER TABLE item
	ADD FOREIGN KEY (kategory_id)
	REFERENCES category (kategory_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE delivery
	ADD FOREIGN KEY (delivery_method_id)
	REFERENCES deliveryMethod (delivery_method_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE inquiry
	ADD FOREIGN KEY (item_id)
	REFERENCES item (item_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemImage
	ADD FOREIGN KEY (item_id)
	REFERENCES item (item_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderDetails
	ADD FOREIGN KEY (item_id)
	REFERENCES item (item_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_item
	ADD FOREIGN KEY (item_id)
	REFERENCES item (item_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE deliveryDestination
	ADD FOREIGN KEY (order_id)
	REFERENCES itemOrder (order_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderDetails
	ADD FOREIGN KEY (order_id)
	REFERENCES itemOrder (order_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop
	ADD FOREIGN KEY (map_id)
	REFERENCES map (map_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE delivery
	ADD FOREIGN KEY (shop_id)
	REFERENCES shop (shop_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemOrder
	ADD FOREIGN KEY (shop_id)
	REFERENCES shop (shop_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_item
	ADD FOREIGN KEY (shop_id)
	REFERENCES shop (shop_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE blackList
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE inquiry
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE itemOrder
	ADD FOREIGN KEY (order_user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mailBox
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mailBox
	ADD FOREIGN KEY (from_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE userAvatar
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



