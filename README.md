# Online Books Ordering

A Java web application for browsing a book catalogue, adding books to a shopping cart, and viewing placed orders. The interface is built with JSP and CSS, while Java servlets handle requests and JDBC DAOs access MySQL.

## Screenshots

### Login

![Login page](docs/screenshots/login.png)

### Register

![Registration page](docs/screenshots/register.png)

### Book catalogue

![Book catalogue with a three-column card layout](docs/screenshots/books.png)

### Shopping cart

![Shopping cart](docs/screenshots/cart.png)

### Order history

![Order history](docs/screenshots/orders.png)

## Features

- Register and sign in to an account.
- Browse books with category and price details.
- Add books to a session-based cart.
- Place orders and view order history.
- Responsive navigation and book cards.

## Technology

- Java 17
- Jakarta Servlet API 6.0
- JSP
- MySQL with MySQL Connector/J 8.0.33
- Maven WAR packaging

## Requirements

- JDK 17
- Maven
- MySQL Server
- A Jakarta EE 10 compatible servlet container, such as Tomcat 10.1+

## Database setup

Create the database and tables expected by the DAOs:

```sql
CREATE DATABASE book_db;
USE book_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

```sql
INSERT INTO books (name, category, price) VALUES
    ('Java Programming', 'Programming', 650.00),
    ('Advanced Java', 'Programming', 780.00),
    ('Core Java', 'Programming', 550.00);
```
