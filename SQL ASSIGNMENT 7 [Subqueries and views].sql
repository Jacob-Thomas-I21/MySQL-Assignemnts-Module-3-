CREATE DATABASE POPULATIONDB;
use populationdb;

create table Country(
Id int auto_increment primary key ,
Country_name varchar(50) not null, 
Population_in_millions varchar(4) default 5 not null,
Areainsqft decimal(10,2) not null
);

desc Country;

Create table Persons(
Id int auto_increment primary key ,
Fname varchar(50) not null, 
Lname varchar(50), 
Population_in_millions varchar(4),
rating decimal(4,2),
Country_name varchar(50),
Country_id int,
foreign key (Country_id)  References Country(id)
);
desc Persons;
insert into Country ( Country_name, Population_in_millions, Areainsqft) values
('India', '1380', 3287263.0),
('USA', '331', 9833517.0),
('Canada', '37', 9984670.0),
('UK', '68', 243610.0),
('Australia', '25', 7692024.0),
('France', '65', 551695.0),
('Germany', '83', 357022.0),
('China', '1439', 9596961.0),
('Japan', '126', 377975.0),
('Brazil', '212', 8515770.0),
('Iceland', 0.37, 103000.0),
('Malta', 0.52, 316.0),
('Barbados', 0.29, 430.0),
('Bhutan', 0.77, 38394.0),
('Monaco', 0.04, 2.02);

select*from Country;


INSERT INTO Persons (Fname, Lname, Population_in_millions, Rating, Country_Id, Country_name) VALUES
('John', 'Doe', '331', 4.5, 2, 'USA'),
('Aaliya', 'Khan', '1380', 4.2, 1, 'India'),
('Emma', 'Smith', '37', 4.8, 3, 'Canada'),
('Liam', 'Brown', '68', 4.0, 4, 'UK'),
('Sophia', 'Taylor', 0.04, 4.7, 15 , 'Monaco'),
('Raj', 'Verma', '1380', 3.9, 1, 'India'),
('Lucas', 'Green', '25', 4.9, 5, 'Australia'),
('Holly', 'Irwin', '65', 3.5, 6, 'France'),
('George', 'Hill', '83', 4.1, 7, 'Germany'),
('Olivia', 'Davis', '126', 4.6, 8, 'Japan');
 
 
select*from Persons;


# 1. Find the number of persons in each country.

SELECT Country_name, COUNT(*) AS Number_Of_Persons
FROM Persons
GROUP BY Country_name;

# 2. Find the number of persons in each country sorted from high to low.  

SELECT Country_name, COUNT(*) AS Number_Of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_Of_Persons DESC;




#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 

SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

INSERT INTO Persons (Fname, Lname, Population_in_millions, Rating, Country_Id, Country_name)
VALUES
('Alice', 'Johnson', '25', 4.5, 9, 'Brazil'),
('Ethan', 'Brown', '83', 4.5, 7, 'Germany'),
('Mia', 'Taylor', '37', 4.5, 3, 'Canada'),
('Noah', 'Wilson', '65', 4.5, 6, 'France'),
('Olivia', 'Martinez', '68', 4.5, 4, 'UK');



#4. Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');


#5. Select all countries whose population is greater than the average population of all nations. 
SELECT Country_name, Population_in_millions
FROM Country
WHERE Population_in_millions > (SELECT AVG(Population_in_millions) 
                                FROM Country);

# Create a database named Product and create a table called Customer with the following fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 

-- Create the Product database
CREATE DATABASE Product;
USE Product;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);




INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'New York', 'NY', '10001', 'US'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'US'),
('Alice', 'Johnson', 'alice.johnson@example.com', '3456789012', '789 Pine Road', 'Houston', 'TX', '77001', 'US'),
('Bob', 'Brown', 'bob.brown@example.com', '4567890123', '321 Maple Lane', 'Chicago', 'IL', '60601', 'US'),
('Ethan', 'Clark', 'ethan.clark@example.com', '5678901234', '654 Cedar Way', 'Phoenix', 'AZ', '85001', 'US'),
('Sophia', 'Taylor', 'sophia.taylor@example.com', '6789012345', '987 Birch Street', 'Seattle', 'WA', '98101', 'US'),
('Mia', 'Martinez', 'mia.martinez@example.com', '7890123456', '123 Willow Court', 'Miami', 'FL', '33101', 'US'),
('Liam', 'Wilson', 'liam.wilson@example.com', '8901234567', '456 Spruce Circle', 'Boston', 'MA', '02101', 'US'),
('Emma', 'Anderson', 'emma.anderson@example.com', '9012345678', '789 Cherry Drive', 'Denver', 'CO', '80201', 'US'),
('Olivia', 'Davis', 'olivia.davis@example.com', '0123456789', '321 Aspen Boulevard', 'San Francisco', 'CA', '94101', 'US');



-- Perform a SELECT operation on the customer_info view


# 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;
SELECT * FROM customer_info;
#2. Create a view named US_Customers that displays customers located in the US. 

CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'US';

-- Select from the view
SELECT * FROM US_Customers;


#3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

-- Select from the view
SELECT * FROM Customer_details;

#4. Update phone numbers of customers who live in California for Customer_details view. 
UPDATE Customer
SET Phone_no = '9999999999'
WHERE State = 'CA';

-- Verify the update in the Customer_details view
SELECT * FROM Customer_details WHERE State = 'CA';


INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('Emily', 'Clark', 'emily.clark@example.com', '1231231234', '123 Birch Avenue', 'San Diego', 'CA', '92001', 'US'),
('Jacob', 'Miller', 'jacob.miller@example.com', '2342342345', '456 Palm Road', 'San Jose', 'CA', '95101', 'US'),
('Ava', 'Brown', 'ava.brown@example.com', '3453453456', '789 Cypress Lane', 'Los Angeles', 'CA', '90002', 'US'),
('Mason', 'Wilson', 'mason.wilson@example.com', '4564564567', '321 Maple Street', 'Sacramento', 'CA', '94203', 'US'),
('Sophia', 'Davis', 'sophia.davis@example.com', '5675675678', '654 Oak Circle', 'Fresno', 'CA', '93701', 'US');


#5. Count the number of customers in each state and show only states with more than 5 customers.

CREATE view Customers_By_State AS
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
SELECT * FROM Customers_By_State;

# 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 

SELECT State, COUNT(*) AS Number_Of_Customers
FROM customer_details
GROUP BY State;


#7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

CREATE VIEW Sorted_Customer_Details AS
SELECT *
FROM customer_details
ORDER BY State ASC;

SELECT * FROM Sorted_Customer_Details;


