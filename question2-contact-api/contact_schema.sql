-- Contact Book SQL Script
CREATE DATABASE IF NOT EXISTS ContactDB;
USE ContactDB;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Sample data
INSERT INTO contacts (name, email, phone) VALUES 
('Harun Wan', 'wanharun@gmal.com', '0712345678'),
('Tracy Sibolo', 'john@example.com', '0798765432');
