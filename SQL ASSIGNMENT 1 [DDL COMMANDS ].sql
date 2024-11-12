create database School;
Use School;

CREATE TABLE CLASS (
    Class_ID INT PRIMARY KEY ,
    Class_Section VARCHAR(1) NOT NULL Check(Class_Section in ('A', 'B','C'))
);
SELECT * FROM CLASS;
desc class;
Create table STUDENT(Roll_No INT auto_increment primary key, 
	Name VARCHAR(50) NOT NULL,
	Marks INT DEFAULT 0 CHECK(Marks between 0 and 100),
	Grade VARCHAR(1) DEFAULT 'F' Check(Grade IN('A','B','C','D', 'E')),
	Class_ID INT, 
	Foreign key (Class_ID) REFERENCES CLASS(Class_ID)
);
select *from Student;
Desc Student;

INSERT INTO CLASS (Class_ID, Class_Section) VALUES
    (10, 'A'), 
    (5, 'B');
desc class;
select*from class;

ALTER TABLE Student 
ADD contacts VARCHAR(10) DEFAULT 'NOT GIVEN';

Desc Student;

insert into Student(Name, Marks, Grade, Class_ID, Contacts) VALUES
	('Nathan' , 67, 'C' , 10 , 9761045877),
	('Bob', 78, 'B', 10, '987654321'),
	('Dwight', 65, 'C', 10, '9122334455'),
    ('Dave', 97, 'A', 10, 9845020300);  
select*from Student;
Alter table Student Drop Grade;
select*from Student;

Alter Table Student RENAME CLASSTEN;
select*from CLASSTEN;
DESC CLASSTEN;

TRUNCATE TABLE CLASSTEN;
DESC CLASSTEN;
select*from CLASSTEN;
DROP TABLE CLASSTEN;
DESC CLASSTEN;
