CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    AuthorName VARCHAR(255));

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255),
    AuthorID INT,
    Price DECIMAL(10, 2),
    PublishedYear INT,
    Quantity INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID));
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255));

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    BookID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID));
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    GenreName VARCHAR(255)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    CustomerID INT,
    Rating INT,
    ReviewText VARCHAR(1000),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



INSERT INTO Authors (AuthorName) VALUES 
('J.K. Rowling'),
('George Orwell'),
('J.R.R. Tolkien'),
('George R. R. Martin');

INSERT INTO Books (Title, AuthorID, Price, PublishedYear, Quantity) VALUES 
('Harry Potter and the Sorcerer''s Stone', 1, 10.99, 1997, 10),
('1984', 2, 9.99, 1949, 5),
('The Lord of the Rings', 3, 15.99, 1954, 8),
('A Song of Ice and Fire',4,30.99,1996,15);

INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('Samiul', 'Hasan', 'Sami.has61@example.com'),
('Tanvir', 'Ahmed', 'Tanvir.ahm94@example.com');

INSERT INTO Orders (CustomerID, OrderDate) VALUES 
(1, '2024-03-24'),
(2, '2024-03-25');

INSERT INTO OrderDetails (OrderID, BookID, Quantity) VALUES 
(1, 1, 2),
(2, 3, 1);
INSERT INTO Genres (GenreName) VALUES 
('Fantasy'),
('Science Fiction'),
('Dystopian');

INSERT INTO Reviews (BookID, CustomerID, Rating, ReviewText) VALUES 
(1, 1, 5, 'Fantastic read!'),
(2, 2, 4, 'Thought-provoking.'),
(3, 1, 5, 'Classic epic fantasy.');

INSERT INTO Payments (OrderID, Amount, PaymentDate) VALUES 
(1, 21.98, '2024-03-25'),
(2, 15.99, '2024-03-26');




