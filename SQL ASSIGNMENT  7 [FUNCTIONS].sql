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
 
 
 ALTER TABLE PERSONS 
 ADD DOB date;
 
UPDATE Persons
SET DOB = '1990-05-15' WHERE Fname = 'John' AND Lname = 'Doe';

UPDATE Persons
SET DOB = '1988-08-22' WHERE Fname = 'Aaliya' AND Lname = 'Khan';

UPDATE Persons
SET DOB = '1995-12-10' WHERE Fname = 'Emma' AND Lname = 'Smith';

UPDATE Persons
SET DOB = '1992-03-18' WHERE Fname = 'Liam' AND Lname = 'Brown';

UPDATE Persons
SET DOB = '1997-07-25' WHERE Fname = 'Sophia' AND Lname = 'Taylor';

UPDATE Persons
SET DOB = '1985-01-10' WHERE Fname = 'Raj' AND Lname = 'Verma';

UPDATE Persons
SET DOB = '1993-11-05' WHERE Fname = 'Lucas' AND Lname = 'Green';

UPDATE Persons
SET DOB = '1990-06-08' WHERE Fname = 'Holly' AND Lname = 'Irwin';

UPDATE Persons
SET DOB = '1987-09-14' WHERE Fname = 'George' AND Lname = 'Hill';

UPDATE Persons
SET DOB = '1994-04-19' WHERE Fname = 'Olivia' AND Lname = 'Davis';


DELIMITER //
Create function Age(Dob date)
returns int
deterministic 
begin 
declare age int;
set age  = timestampdiff(year, dob , curdate());
return age;
end //
delimiter ;


select fname, lname, dob, Age(DOB) as Age from persons;


SELECT COUNTRY_NAME , char_length(COUNTRY_NAME) FROM Country;

select country_name, left(country_name, 3) as first_three_characters from country;

select country_name, upper(country_name) as COUNTRYNAME_IN_CAPITAL , lower(country_name) as countryname_in_lowercase from country ;
