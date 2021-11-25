
CREATE TYPE status AS ENUM (
	'pending',
	'approved',
	'rejected',
	'cancelled',
	'expired',
	'refunded');

CREATE TYPE transaction_type AS ENUM (
	'creating',
	'pending',
	'payment',
	'cancelling',
	'refunding',
	'expiring',
	'notifying',
	'callback',
	'confirm');

CREATE TABLE orders (
	id serial NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	uuid varchar(36) NULL,
	total_order int8 NULL,
	"status" status NOT NULL,
	psp_id int4 NULL,
	pos_id int4 NULL,
	meta_data json NULL,
	callback_url varchar(255) NULL,
	expiration_date timestamp NULL,
	payment_date timestamp NULL,
	CONSTRAINT orders_pkey PRIMARY KEY (id)
);

CREATE TABLE order_items (
	id serial NOT NULL,
	"name" varchar(100) NULL,
	unit_price int8 NULL,
	quantity float8 NULL,
	order_id int4 NULL,
	ean varchar(15) NULL,
	sku varchar(50) NULL,
	CONSTRAINT order_items_pkey PRIMARY KEY (id)
);

CREATE TABLE customers (
	id serial NOT NULL,
	uuid varchar(36) NULL,
	"name" varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	cnpj varchar(14) NOT NULL,
	customer_key varchar(30) NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT customers_pkey PRIMARY KEY (id)
);

CREATE TABLE addresses (
	id serial NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	nickname varchar(100) NULL,
	uuid varchar(36) NULL,
	active bool NULL,
	zip_code varchar(8) NULL,
	street_name varchar(100) NULL,
	street_number varchar(10) NULL,
	city_name varchar(50) NULL,
	state_name varchar(2) NULL,
	latitude float8 NULL,
	longitude float8 NULL,
	reference text NULL,
	neighborhood varchar(100) NULL,
	CONSTRAINT addresses_pkey PRIMARY KEY (id)
);


CREATE TABLE customer_addresses (
	address_id int4 NOT NULL,
	customer_id int4 NOT NULL
);


CREATE TABLE pos (
	id serial NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	"name" varchar(100) NULL,
	active bool NULL,
	uuid varchar(36) NULL,
	meta_data json NULL,
	customer_id int4 NULL,
	pos_type_id int4 NULL,
	CONSTRAINT pos_pkey PRIMARY KEY (id)
);

CREATE TABLE pos_type (
	id serial NOT NULL,
	description varchar(20) NOT NULL,
	CONSTRAINT pos_type_pkey PRIMARY KEY (id)
);

CREATE TABLE psp (
	id serial NOT NULL,
	psp_name varchar(20) NOT NULL,
	active bool NULL,
	payment_fee float8 NULL,
	minimum_payment float8 NULL,
	meta_data json NULL,
	CONSTRAINT psp_pkey PRIMARY KEY (id)
);


CREATE TABLE transaction_logs (
	id serial NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	"transaction_type" transaction_type NULL,
	psp_response json NULL,
	order_id int4 NULL,
	pos_id int4 NULL,
	created_at_date date NULL,
	CONSTRAINT transaction_logs_pkey PRIMARY KEY (id)
);


ALTER TABLE orders ADD CONSTRAINT orders_pos_id_fkey FOREIGN KEY (pos_id) REFERENCES pos(id);
ALTER TABLE orders ADD CONSTRAINT orders_psp_id_fkey FOREIGN KEY (psp_id) REFERENCES psp(id);
ALTER TABLE order_items ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);
ALTER TABLE customer_addresses ADD CONSTRAINT customer_addresses_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(id);
ALTER TABLE customer_addresses ADD CONSTRAINT customer_addresses_address_id_fkey FOREIGN KEY (address_id) REFERENCES addresses(id);
ALTER TABLE pos ADD CONSTRAINT pos_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(id);
ALTER TABLE transaction_logs ADD CONSTRAINT transaction_logs_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);
ALTER TABLE transaction_logs ADD CONSTRAINT transaction_logs_store_id_fkey FOREIGN KEY (pos_id) REFERENCES pos(id);
ALTER TABLE pos ADD CONSTRAINT pos_type_id_fkey FOREIGN KEY (pos_type_id) REFERENCES pos_type(id);
