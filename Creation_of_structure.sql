set search_path to store;

create table customers (
  customer_id int not null PRIMARY KEY
  ,first_name varchar(25)
  ,last_name varchar(25) 
  ,gender varchar(10)
  ,DOB timestamp
  ,job_title varchar(30)
  ,job_industry_category varchar(20)
  ,wealth_segment varchar(20)
  ,deceased_indicator boolean
  ,owns_car boolean
  ,property_valuation int 
);

create table orders (
  order_id int not null PRIMARY KEY
  ,customer_id int not null
  ,online_order boolean
  ,order_status varchar(20)
  ,constraint fk_orders_to_customer
  		foreign key (customer_id)
    	references customers (customer_id)
);

create table transactions (
  transaction_id int not null PRIMARY KEY
  ,order_id int not null
  ,transaction_date timestamp 
  ,constraint fk_transactions_orders
  		foreign key (order_id)
  		references orders (order_id)
);

create table addresses (
  id int not null PRIMARY KEY
  ,customer_id int not null
  ,street_and_number varchar
  ,postcode int  
  ,state varchar(20)
  ,country varchar(20)
  ,constraint fk_addresses_customers
    	foreign key (customer_id)
    	references customers (customer_id)
);

create table products (
  product_id int not null PRIMARY KEY
  ,product_line varchar(10)
  ,product_class varchar(10)
  ,product_size varchar(10)
  ,list_price decimal(10, 2)
  ,standard_cost decimal(10, 2)
);

create table orders_products (
	order_id int not null
	,product_id int not null
	,product_quantity int not null DEFAULT 1
    ,constraint pk_orders_products PRIMARY KEY (order_id, product_id)
    ,constraint fk_orders_to_orders_products
    	foreign key (order_id)
    	references orders (order_id),
    constraint fk_orders_products_to_products
        foreign key (product_id)
        references products (product_id)
);

alter table store.customers
  alter column job_title type VARCHAR(100);

alter table store.products
   add column brand varchar(30);

delete from products;


