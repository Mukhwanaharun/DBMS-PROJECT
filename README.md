# Assignment 8 - DBMS Project

## Question 1: Library Management System

Built with MySQL
Includes relationships: 1-M (Authors to Books), M-M (Books to Members via Loans)

## Question 2: Contact Book API

- FastAPI + MySQL
- Simple CRUD for managing contacts

## How to Run

1. Import the SQL scripts in a MySQL database.
2. Install FastAPI dependencies and run the app:

```bash
pip install fastapi uvicorn mysql-connector-python
uvicorn main:app --reload
```
## Entity Relationship Diagram (Library Management System)

```mermaid
erDiagram
    AUTHORS ||--o{ BOOKS : writes
    MEMBERS ||--o{ LOANS : borrows
    BOOKS ||--o{ LOANS : loaned

    AUTHORS {
        int author_id PK
        string name
    }
    BOOKS {
        int book_id PK
        string title
        int author_id FK
        int published_year
    }
    MEMBERS {
        int member_id PK
        string name
        string email
    }
    LOANS {
        int loan_id PK
        int book_id FK
        int member_id FK
        date loan_date
        date return_date
    }
```
