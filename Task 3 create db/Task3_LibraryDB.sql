CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50),
    UNIQUE(FirstName, LastName)
);
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT NOT NULL,
    PublishedYear YEAR CHECK (PublishedYear >= 1900),
    Genre VARCHAR(50) DEFAULT 'Unknown',
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
CREATE TABLE Borrowers (
    BorrowerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);
ALTER TABLE Books ADD COLUMN Pages INT DEFAULT 100;

ALTER TABLE Borrowers MODIFY COLUMN Phone VARCHAR(30);

ALTER TABLE Books ADD CONSTRAINT chk_pages CHECK (Pages > 0);
-- Авторы
INSERT INTO Authors (FirstName, LastName, Country) VALUES
('J.K.', 'Rowling', 'UK'),
('George', 'Orwell', 'UK'),
('Harper', 'Lee', 'USA'),
('F. Scott', 'Fitzgerald', 'USA'),
('Leo', 'Tolstoy', 'Russia');

-- Книги
INSERT INTO Books (Title, AuthorID, PublishedYear, Genre, Pages) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy', 223),
('1984', 2, 1949, 'Dystopian', 328),
('To Kill a Mockingbird', 3, 1960, 'Fiction', 281),
('The Great Gatsby', 4, 1925, 'Classic', 180),
('War and Peace', 5, 1869, 'Historical', 1225);

-- Читатели
INSERT INTO Borrowers (FirstName, LastName, Email, Phone) VALUES
('Alice', 'Smith', 'alice@example.com', '1234567890'),
('Bob', 'Johnson', 'bob@example.com', '0987654321'),
('Carol', 'Williams', 'carol@example.com', '5555555555'),
('David', 'Brown', 'david@example.com', '4444444444'),
('Eve', 'Davis', 'eve@example.com', '3333333333');
-- Проверка таблиц
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Borrowers;

-- Проверка связей
SELECT b.Title, a.FirstName, a.LastName
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;