--  Create the Database
CREATE DATABASE library;
USE library;

-- Create the Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255) NOT NULL,
    Contact_no VARCHAR(15) NOT NULL
);

desc Branch;

-- Create the Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

desc employee;

-- Create the Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Rental_Price DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR(100) NOT NULL,
    Publisher VARCHAR(100) NOT NULL
);

desc Books;

-- Create the Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Customer_address VARCHAR(255) NOT NULL,
    Reg_date DATE NOT NULL
);

desc Customer;


-- 6. Create the IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

desc Issuestatus;


-- Create the ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


desc ReturnStatus;

--  Insert Data into Branch Table
INSERT INTO Branch VALUES
(1, 101, 'Downtown', '1234567890'),
(2, 102, 'Uptown', '0987654321'),
(3, 103, 'Suburban', '1112223334');

select*from Branch;


--  Insert Data into Employee Table
INSERT INTO Employee VALUES
(101, 'Alice Johnson', 'Manager', 80000, 1),
(102, 'Bob Smith', 'Clerk', 45000, 1),
(103, 'Carol Lee', 'Manager', 75000, 2),
(104, 'David Clark', 'Clerk', 50000, 2),
(105, 'Emma Brown', 'Assistant', 30000, 3);


select*from Employee;

--  Insert Data into Books Table
INSERT INTO Books VALUES
(1001, 'The Great Gatsby', 'Fiction', 20.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
(1002, 'To Kill a Mockingbird', 'Fiction', 25.00, 'No', 'Harper Lee', 'J.B. Lippincott'),
(1003, 'A Brief History of Time', 'Science', 30.00, 'Yes', 'Stephen Hawking', 'Bantam'),
(1004, '1984', 'Fiction', 15.00, 'Yes', 'George Orwell', 'Harcourt'),
(1005, 'The Art of War', 'History', 18.00, 'Yes', 'Sun Tzu', 'Unknown');

select*from Books;
ALTER TABLE Customer ADD UNIQUE (Customer_name, Customer_address);
desc Customer;

--  Insert Data into Customer Table
INSERT INTO Customer VALUES
(201, 'John Doe', '123 Elm Street', '2020-05-15'),
(202, 'Jane Smith', '456 Oak Avenue', '2021-08-20'),
(203, 'Alice Brown', '789 Pine Road', '2022-03-10'),
(204, 'Bob Taylor', '321 Maple Lane', '2023-01-25'),
(205, 'Emma Davis', '654 Cedar Way', '2021-12-12');
select*from Customer;


--  Insert Data into IssueStatus Table
INSERT INTO IssueStatus VALUES
(301, 201, 'The Great Gatsby', '2023-06-05', 1001),
(302, 202, '1984', '2023-06-10', 1004);
select*from IssueStatus;

--  Insert Data into ReturnStatus Table
INSERT INTO ReturnStatus VALUES
(401, 201, 'The Great Gatsby', '2023-07-05', 1001);

select*from Returnstatus;


--  Queries
-- 1 Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';


-- 2 List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3 Retrieve the book titles and the corresponding customers who have issued those books
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;


-- 4 Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- 5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;


-- 6 List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7 Display the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- 8 Display the names of customers who have issued books in the month of June 2023
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

-- 9 Retrieve book_title from the Books table containing 'History'
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- 10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11 Retrieve the names of employees who manage branches and their respective branch addresses
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

-- 12 Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;
