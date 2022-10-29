=begin
As a shop manager
So I can know which items I have in stock
I want to keep a list of my shop items with their name and unit price.

As a shop manager
So I can know which items I have in stock
I want to know which quantity (a number) I have for each item.

As a shop manager
So I can manage items
I want to be able to create a new item.

As a shop manager
So I can know which orders were made
I want to keep a list of orders with their customer name.

As a shop manager
So I can know which orders were made
I want to assign each order to their corresponding item.

As a shop manager
So I can know which orders were made
I want to know on which date an order was placed. 

As a shop manager
So I can manage orders
I want to be able to create a new order.

NOUNS:
shop, names, unit_price, quantity, orders, customer_name, order_date

TABLE items:
id SERIAL PRIMARY KEY,
name text,
unit_price int,
quantity int,

TABLE orders:
id SERIAL PRIMARY KEY,
customer_name text,
order_date text,
item_id

extra: create orders, create items
