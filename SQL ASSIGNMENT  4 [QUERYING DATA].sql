create database populationdb;
use populationdb;

 Create table Country(
 Id int auto_increment primary key, 
 Country_name varchar(50) not null, 
 Population_in_millions int default 5 not null,
 Area_in_sqft decimal(10, 2) not null
 );
 
 desc Country;
 
 Create table Persons(
 Id int auto_increment primary key , 
 Fname varchar(20) not null, 
 Lname varchar(30) not null,
 Population int ,
 Rating decimal(3,1),
 Country_id int,
 Country_name varchar(50),
 Foreign key (Country_id) References Country(id)
 );
 
 desc Persons;
 
 
 
 Insert into Country (Country_name, Population_in_millions,Area_in_sqft) VALUES
('India', 1380, 3287263.0),
('USA', 331, 9833517.0),
('Canada', 37, 9984670.0),
('UK', 68, 243610.0),
('Australia', 25, 7692024.0),
('France', 65, 551695.0),
('Germany', 83, 357022.0),
('China', 1439, 9596961.0),
('Japan', 126, 377975.0),
('Brazil', 212, 8515770.0);

select*from Country;

INSERT INTO Persons(Fname,Lname,Population,Rating,Country_id,Country_name) Values
('John', 'Doe', 331000000, 4.5, 2, 'USA'),
('Aaliya', 'Khan', 1380000000, 4.2, 1, 'India'),
('Emma', 'Smith', 37700000, 4.8, 3, 'Canada'),
('Liam', 'Brown', 67886011, 4.0, 4, 'UK'),
('Sophia', 'Taylor', NULL, 4.7, NULL, NULL),
('Raj', 'Verma', 1380000000, 3.9, 1, 'India'),
('Lucas', 'Green', 25687041, 4.9, 5, 'Australia'),
('Holly', 'Irwin', 65273511, 3.5, 6, 'France'),
('George', 'Hill', 83783942, 4.1, 7, 'Germany'),
('Olivia', 'Davis', 126476461, 4.6, 8, 'Japan');
 
 
select*from Persons;

-- (1)List the distinct country names from the Persons table

select distinct country_name from Persons;

-- (2)Select first names and last names from the Persons table with aliases. 

SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- (3)Find all persons with a rating greater than 4.0. 

select Fname as First_Name , Lname as Last_Name  from Persons where rating > 4.0;

INSERT INTO Country (Country_name, Population_in_millions, Area_in_sqft) VALUES
('Iceland', 0.37, 103000.0),
('Malta', 0.52, 316.0),
('Barbados', 0.29, 430.0),
('Bhutan', 0.77, 38394.0),
('Monaco', 0.04, 2.02);

select*from Country;
-- (4)Find countries with a population greater than 10 lakhs. 10 lakshs is 1 million.
select Country_name from country where Population_in_millions >1.0;

-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
select fname as First_Name, Lname as Last_name from persons where country_name ='USA' or rating >4.5;


-- (6)Find all persons where the country name is NULL. 
select fname as First_Name, Lname as Last_name from persons where country_name is null;

-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
select fname as First_Name, Lname as Last_name from persons where country_name in ('USA', 'UK','CANADA');

-- (8)Find all persons not from the countries 'India' and 'Australia'.
select fname as First_Name, Lname as Last_name from persons where country_name not in ('INDIA', 'AUSTRALIA');

--  (9)Find all countries with a population between 5 lakhs and 20 lakhs. 5lakhs is 0.5 million and 20 lakhs is 2 millions.
select Country_name from Country where population_in_millions between 0.5 and 2 ;

-- (10)Find all countries whose names do not start with 'C'.
select Country_name from Country where Country_name NOT LIKE 'C%';
