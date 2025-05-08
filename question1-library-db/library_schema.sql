-- Library Management System SQL Script
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Sample data
INSERT INTO Authors (name) VALUES ('W.M. HARUN'), ('JACOB JUMA');
INSERT INTO Books (title, author_id, published_year) VALUES ('Harry Sifuna', 2, 1996), ('1995', 5, 1997);
INSERT INTO Members (name, email) VALUES ('Mama Harun', 'mamaharun@gmail.com'), ('Phanice Nabwire', 'nabwire@gmail.com');
INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES (1, 1, '2025-01-10', '2025-01-20');
