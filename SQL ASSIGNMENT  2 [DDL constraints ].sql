-- 1. Create the Sales database
create database Sales;
-- Use the Sales database
use Sales;
-- 2. Create the Orders table with specified columns and constraints
Create table Orders(
Order_Id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
Customer_Name VARCHAR(60) NOT NULL,
Product_Category VARCHAR(20) NOT NULL CHECK(Product_Category in ('Electronics', 'Home Appliances', 'Furniture', 'Clothing')),
Ordered_item VARCHAR(50) NOT NULL, 
Contact_No VARCHAR(11) UNIQUE NOT NULL DEFAULT 'NOT GIVEN'
);
desc Orders;
Select * From Orders;
-- 3.Adding a coloumn to existing tabel called order_quantity
Alter table Orders add order_quantity int default 0;
desc Orders;
Select * From Orders;
 -- 4.Rename the orders table to the sales_orders table
 Alter table orders rename Sales_orders;
desc Sales_orders;
select* from sales_orders;
-- 5.Insert 10 rows into the sales_orders table.
INSERT INTO sales_orders(Customer_Name, Product_Category , Ordered_Item, Contact_No,Order_quantity) values
('Alice Brown', 'Electronics', 'Laptop', '1234567890', 1),
('Bob Smith', 'Home Appliances', 'Microwave', '2345678901', 2),
('Charlie Davis', 'Electronics', 'Headphones', '3456789012', 1),
('Diana Evans', 'Furniture', 'Chair', '4567890123', 4),
('Ethan Frost', 'Clothing', 'T-shirt', '5678901234', 3),
('Fiona Green', 'Electronics', 'Smartphone', '6789012345', 1),
('George Hill', 'Home Appliances', 'Blender', '7890123456', 2),
('Holly Irwin', 'Furniture', 'Table', '8901234567', 1),
('Ivan James', 'Clothing', 'Jacket', '9012345678', 2),
('Julia Knight', 'Electronics', 'Tablet', '0123456789', 1);

select * from sales_orders;
create table Payments(
Payment_id int auto_increment not null primary key , 
Order_Id int not null,
Amount decimal(10,2) not null,
Payment_date date not null,
Payment_method varchar(20) not null Default'Cash' Check(Payment_method in ('UPI','Credit card','Bank Transfer')),
Foreign key(Order_id) References sales_orders(Order_id)
);
desc Payments;
INSERT INTO Payments (Order_Id, Payment_date, Amount, Payment_method) VALUES
(1, '2024-11-01', 250.00, 'Credit card'),
(2, '2024-11-02', 100.00, 'UPI'),
(3, '2024-11-03', 150.00, 'UPI');

select*from Payments;
-- 6. Retrieve customer_name and Ordered_Item from the sales_orders table.
CREATE INDEX idx_customer_item ON sales_orders (Customer_name, Ordered_item);
SELECT Customer_name, Ordered_item FROM sales_orders;
-- 7.Use the update command to change the name of the product for any row. 
Update sales_orders set ordered_item='Washing Machine' WHERE customer_name='Bob Smith' and Ordered_item='Microwave';
desc sales_orders;
select*from sales_orders;
-- 8.Delete the sales_orders table from the database.
drop table payments;
drop table Sales_orders;
