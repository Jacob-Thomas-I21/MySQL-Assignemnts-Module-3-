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
('Sophia', 'Taylor', NULL, 4.7, NULL, NULL),
('Raj', 'Verma', '1380', 3.9, 1, 'India'),
('Lucas', 'Green', '25', 4.9, 5, 'Australia'),
('Holly', 'Irwin', '65', 3.5, 6, 'France'),
('George', 'Hill', '83', 4.1, 7, 'Germany'),
('Olivia', 'Davis', '126', 4.6, 8, 'Japan');
 
 
select*from Persons;


select left(Country_name, 3) as first_hree_characters from country ;
-- Write an SQL query to concatenate first name and last name from Persons table
select concat(Fname,' ', Lname) as  Full_Name from Persons;

-- 3. Write an SQL query to count the number of unique country names from Persons table
select count(distinct Country_name) as no_of_countries from Country;

-- 4. Write a query to print the maximum population from the Country table.

select Max(Population_in_millions) as Maximum_Population_in_millions from Country;

 --  5. Write a query to print the minimum population from Persons table. 
 
 select Min(Population_in_millions) as Maximum_Population_in_millions from Country;
 
 --  6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
 
 INSERT INTO Persons (Fname, Lname, Population_in_millions, Rating, Country_Id, Country_name) VALUES
('Alex', NULL, '5', 3.8, 9, 'Brazil'),
('Eva', NULL, '1', 4.0, 10, 'Japan');


select count(Lname) as Number_of_Lastnames from Persons;
 
 
 --  7. Write a query to find the number of rows in the Persons table.
 
 select count(*) as number_of_rows from Persons;
 
 -- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
 
 select population_in_millions from Country limit 3;
 
 --  9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
 
 select * from country order by rand() limit 3 ;
 
 --  10. List all persons ordered by their rating in descending order.
 
 select * from Persons order by rating desc ;
 
 --  11. Find the total population for each country in the Persons table. 
 
 select country_name, sum(population_in_millions) as total_populations from Persons group by Country_name;
 
 -- 12. Find countries in the Persons table with a total population greater than 50,000 
 
 select country_name, sum(population_in_millions) as total_populations from Persons group by Country_name having Total_Populations > 0.05;
 
 --  13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
 
 INSERT INTO Persons (Fname, Lname, Population_in_millions, Rating, Country_Id, Country_name) VALUES
('Priya', 'Sharma', '1380', 4.0, 1, 'India'),
('Amit', 'Gupta', '1380', 3.8, 1, 'India'),
('Mike', 'Brown', '331', 4.2, 2, 'USA'),
('Jessica', 'Smith', '331', 4.6, 2, 'USA'),
('Emily', 'Davis', '37', 4.7, 3, 'Canada'),
('Noah', 'Wilson', '37', 4.1, 3, 'Canada'),
('Oliver', 'Taylor', '25', 4.5, 5, 'Australia'),
('Sophia', 'Johnson', '25', 4.2, 5, 'Australia'),
('Jack', 'Evans', '25', 4.4, 5, 'Australia');
 
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating FROM Persons GROUP BY Country_name HAVING COUNT(*) > 2 ORDER BY Average_Rating ASC;

 -- 
 -- 



 
 


 




