Create database schooldb;
use schooldb;
create table teachers (
Field_Id int auto_increment primary key,
Name varchar(100) not null,
Subject varchar(60) not null,
Experience int not null,
salary decimal(10,2) not null
);
desc teachers;

insert into teachers (Name, Subject , Experience , salary) values
('John Doe', 'Mathematics', 8, 50000),
('Jane Smith', 'Physics', 12, 60000),
('Alice Brown', 'Chemistry', 6, 45000),
('Bob Taylor', 'Biology', 15, 70000),
('Emma Davis', 'History', 5, 48000),
('Raj Verma', 'English', 11, 52000),
('Sophia Wilson', 'Geography', 9, 51000),
('Mike Johnson', 'Computer Science', 3, 47000);

select*from teachers;



CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);


#Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW 
BEGIN 
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be Negative';
    END IF;
END //

DELIMITER ;

show triggers;
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Tom Black', 'Music', 4, -20000);



#Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 



DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp) 
    VALUES (NEW.Field_id, 'INSERT', NOW());
END //

DELIMITER ;


show triggers;

INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Alice', 'Physics', 5, 50000);

SELECT * FROM teacher_log;


# Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.


DELIMITER //

CREATE TRIGGER before_delete_trigger
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN 
    IF OLD.Experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END //

DELIMITER ;




show triggers;

DELETE FROM teachers WHERE Field_id = 4;

DELIMITER //

DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.Field_id, 'DELETE', NOW());
END //

DELIMITER ;

DELETE FROM teachers WHERE Field_id = 1;


select*from teacher_log;




