-- 01- Create the database.
CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

-- 02-Create Books table.
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Publisher VARCHAR(255),
    Year INT,
    Genre VARCHAR(100),
    CopiesAvailable INT DEFAULT 1
);

-- 03-Create Members table.
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    MembershipType VARCHAR(50)
);

-- 04-Create Loans table.
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    IssueDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 05-Insert data into Books table.
INSERT INTO Books 
(Title, Author, ISBN, Publisher, Year, Genre, CopiesAvailable)VALUES
('Aag Ka Darya', 'Qurratulain Hyder','0123456789','Edu. Publishers Delhi',1959,'Fiction', 5),
('Peer-e-Kamil', 'Umera Ahmed', '9788194893752', 'Alif Publishers', 2022, 'Religious', 5),
('Khuda Ki Basti','Shaukat Siddiqui','9780904404999','Edu. Book House Ali Garh.',1957,'Fiction',5);

-- 06-Insert data into Members table.
INSERT INTO Members (Name, Address, Phone, Email, MembershipType) VALUES
('M.Shoaib Khan', 'Muzaffargarh', '03146644798', 'shoaibchughtai8070@gmail.com', 'Premium'),
('Talal Zafar', 'Shekhopura', '03407396025', 'talalzaffar786@gmail.com', 'Regular'),
('Abdullah', 'Muzaffargarh', '03156663907', 'abkmaster18@gmail.com', 'Regular');

-- 07-To Add a new book.
INSERT INTO Books (Title, Author, ISBN, Publisher, Year, Genre, CopiesAvailable) VALUES
('Jannat Kay Pattay','Nimra Ahmed','9780060850524','Chughtai Publishers', 2012,'Socio-romantic novel',5);

-- 08- To Register a new member.
INSERT INTO Members (Name, Address, Phone, Email, MembershipType) VALUES
('Adeel', 'Multan Chungi NO.9', '03106440407', 'adeel.khan@gmail.com', 'Regular');

-- 09- To Issue a book.
INSERT INTO Loans (MemberID, BookID, IssueDate, DueDate) VALUES
(1, 1, '2024-06-01', '2024-06-15');

-- 10-Update the number of available copies when a book is issued.
UPDATE Books
SET CopiesAvailable = CopiesAvailable - 1
WHERE BookID = 1;

-- 11- When a member Returns a book.
UPDATE Loans
SET ReturnDate = '2024-06-10'
WHERE LoanID = 1;

-- 12-Update the number of available copies when a book is returned.
UPDATE Books
SET CopiesAvailable = CopiesAvailable + 1
WHERE BookID = 1;

-- 13-To List all books.
SELECT * FROM Books;

-- 14- To List all members.
SELECT * FROM Members;

-- 15- To List all loans.
SELECT * FROM Loans;

-- Created By Muhammad Shoaib Khan 
-- Roll.No. F23BDOCS1E02095




