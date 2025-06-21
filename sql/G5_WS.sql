-- Start fresh by dropping the database if it exists
DROP DATABASE IF EXISTS UniversityDB;

-- Create and use the database
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) UNIQUE
);

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) UNIQUE
);

-- Create Registrations Table
CREATE TABLE Registrations (
    RegistrationID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Departments
INSERT INTO Departments (DepartmentName) VALUES ('Biology');
INSERT INTO Departments (DepartmentName) VALUES ('Computer Science');
INSERT INTO Departments (DepartmentName) VALUES ('Engineering');
INSERT INTO Departments (DepartmentName) VALUES ('Mathematics');
INSERT INTO Departments (DepartmentName) VALUES ('Physics');
INSERT INTO Departments (DepartmentName) VALUES ('Statistics');

-- Insert Courses
INSERT INTO Courses (CourseName) VALUES ('AI');
INSERT INTO Courses (CourseName) VALUES ('DBMS');
INSERT INTO Courses (CourseName) VALUES ('DSA');
INSERT INTO Courses (CourseName) VALUES ('Math');
INSERT INTO Courses (CourseName) VALUES ('Networks');
INSERT INTO Courses (CourseName) VALUES ('OS');

-- Insert Students
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1001, 'Katelyn Johnston', 2);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1002, 'Rebecca Short', 6);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1003, 'Maria Jackson', 1);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1004, 'Brian Henderson', 3);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1005, 'Sean Tucker', 2);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1006, 'Brittany White', 3);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1007, 'Eric Holmes', 4);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1008, 'Samantha Brown', 2);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1009, 'Melissa Haynes', 1);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1010, 'William Lewis', 5);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1011, 'Emily Walker', 6);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1012, 'Kevin Ward', 4);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1013, 'Rachel Jenkins', 2);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1014, 'Andrew Griffin', 3);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1015, 'Laura Dixon', 5);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1016, 'George Andrews', 4);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1017, 'Deborah Morris', 1);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1018, 'Daniel Howard', 6);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1019, 'Chloe Martinez', 2);
INSERT INTO Students (StudentID, StudentName, DepartmentID) VALUES (1020, 'Anthony Rogers', 3);

-- Insert Registrations (No manual ID)
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1001, 6, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1001, 4, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1002, 5, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1002, 2, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1003, 3, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1003, 5, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1004, 5, 'C');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1004, 3, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1005, 1, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1005, 6, 'C+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1006, 6, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1006, 2, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1007, 4, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1007, 1, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1008, 2, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1008, 4, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1009, 1, 'C+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1009, 6, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1010, 4, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1010, 5, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1011, 2, 'C');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1011, 3, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1012, 6, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1012, 1, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1013, 3, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1013, 4, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1014, 6, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1014, 1, 'C+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1015, 2, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1015, 5, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1016, 1, 'C');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1016, 3, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1017, 4, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1017, 5, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1018, 2, 'B');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1018, 6, 'C');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1019, 1, 'A');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1019, 3, 'A+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1020, 4, 'B+');
INSERT INTO Registrations (StudentID, CourseID, Grade) VALUES (1020, 2, 'A');
