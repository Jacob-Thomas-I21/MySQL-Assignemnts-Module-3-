-- creating database Companydb
create database companydb;
use companydb;

-- 1.creating table 
Create table Managers(
Manager_id INT NOT NULL auto_increment primary KEY,
First_Name VARCHAR(40) NOT NULL, 
Last_name VARCHAR(40) NOT NULL,
DOB date NOT NULL,
Age INT check(Age between 22 and 55),
Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
Gender VARCHAR(1) check(Gender IN  ('M', 'F')),
Department VARCHAR(50) NOT NULL,
Salary decimal(10, 2) NOT NULL
);
desc Managers;
-- 2.inserting data into the table
insert into managers(First_name,Last_name,DOB,Age,Gender,Department,Salary) Values
('John', 'Doe', '1980-05-15', 44, 'M', 'IT', 30000),
('Aaliya', 'Khan', '1992-08-20', 32, 'F', 'HR', 25000),
('Ravi', 'Sharma', '1985-11-12', 39, 'M', 'Finance', 28000),
('Sophia', 'Brown', '1988-07-07', 36, 'F', 'IT', 32000),
('Michael', 'Lee', '1975-03-01', 49, 'M', 'Marketing', 40000),
('Sarah', 'Taylor', '1990-12-25', 33, 'F', 'Sales', 27000),
('Raj', 'Verma', '1983-06-18', 41, 'M', 'IT', 24000),
('Emma', 'Davis', '1989-09-10', 35, 'F', 'Finance', 31000),
('Liam', 'Johnson', '1978-02-20', 46, 'M', 'HR', 29000),
('Olivia', 'Smith', '1993-04-15', 31, 'F', 'Marketing', 35000);

select*from managers;
-- 3.querying data 
select First_name , Last_name , DOB from Managers where manager_id = 1;

-- 4.quqerying Annual salary data
select First_name, Last_name, (salary *12) as Annual_Income from managers;
 -- 5.querying table all except AALIYA
select *from managers where first_name != 'Aaliya';
INSERT INTO Managers (First_name, Last_name, DOB, Age, Gender, Department, Salary) VALUES
('Lucas', 'Green', '1987-05-22', 36, 'M', 'IT', 40000),  -- Salary > 35,000
('Anna', 'White', '1994-08-15', 29, 'F', 'HR', 9000);     -- Salary < 10,000);

select*from managers;

-- 6. query to display details of managers whose department is IT and earns more than 25000 per month. 
select *from Managers where department ='IT'and salary > 25000;


-- 7.a query to display details of managers whose salary is between 10000 and 35000.
Select * from managers where salary between 10000 and 35000;



