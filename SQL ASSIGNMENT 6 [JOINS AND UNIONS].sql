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

-- (1)Perform inner join, Left join, and Right join on the tables. 
-- INNER JOIN
SELECT COUNTRY.Country_name, Country.Population_in_millions, Persons.Fname,Persons.Lname,Persons.rating from country inner join persons on country.id = persons.country_id;
-- LEFT JOIN
SELECT 
    COUNTRY.Country_name,
    Country.Population_in_millions,
    Persons.Fname,
    Persons.Lname,
    Persons.rating
FROM
    country
        RIGHT JOIN
    persons ON country.id = persons.country_id;
    
    
-- (2)List all distinct country names from both the Country and Persons tables. 

SELECT Country_name FROM Country
UNION
SELECT Country_name FROM Persons;

-- (3)List all country names from both the Country and Persons tables, including duplicates. 

select Country_name from country union all select country_name from persons;

-- (4)Round the ratings of all persons to the nearest integer in the Persons table..

select fname, lname, country_name , round(rating, 0) as rounded_rating from persons;