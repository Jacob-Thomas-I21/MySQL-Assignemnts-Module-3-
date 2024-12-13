CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

desc Worker;
DELIMITER //
# 1.Stored Procedure to Add a New Record
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;
CALL AddWorker(101, 'John', 'Doe', 50000, '2024-01-01 09:00:00', 'IT');
CALL AddWorker(102, 'Jane', 'Smith', 60000, '2023-05-10 09:00:00', 'HR');
CALL AddWorker(103, 'Alice', 'Brown', 55000, '2022-03-15 09:00:00', 'Finance');
CALL AddWorker(104, 'Bob', 'Taylor', 70000, '2021-07-20 09:00:00', 'IT');
CALL AddWorker(105, 'Emma', 'Davis', 65000, '2020-11-25 09:00:00', 'HR');

select*from Worker;

# 2.Stored Procedure to Retrieve Worker Salary

DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL GetWorkerSalary(101, @Salary);
SELECT @Salary AS Salary;

# 3.Stored Procedure to Update Worker Department

DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL UpdateWorkerDepartment(103, 'Marketing');

# 4.Stored Procedure to Count Workers in a Department

DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL GetWorkerCountByDepartment('IT', @WorkerCount);
SELECT @WorkerCount AS WorkerCount;


# 5.Stored Procedure to Calculate Average Salary in a Department

DELIMITER //

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;


CALL GetAverageSalaryByDepartment('HR', @AvgSalary);
SELECT @AvgSalary AS AverageSalary;


select*from Worker;






