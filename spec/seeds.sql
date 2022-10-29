-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE items RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE orders RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO items (name, unit_price, quantity) VALUES ('soap', 2, 250);
INSERT INTO items (name, unit_price, quantity) VALUES ('toothpaste', 3, 140);
INSERT INTO items (name, unit_price, quantity) VALUES ('tp', 8, 90);
INSERT INTO items (name, unit_price, quantity) VALUES ('pasta', 1, 500);
INSERT INTO items (name, unit_price, quantity) VALUES ('rice', 3, 140);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Tim', 'Jan 08', 2);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Jon', 'Jan 20', 2);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Amy', 'Jan 22', 4);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Sarah', 'Feb 10', 5);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Angus', 'Feb 15', 4);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Sam', 'March 11', 3);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Holly', 'March 12', 1);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Dollar', 'March 13', 2);
INSERT INTO orders (customer_name, order_date, item_id) VALUES ('Dan', 'April 30', 4);