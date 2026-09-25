# 📚 Online Books Ordering System

A Java-based web application for browsing books, adding books to a shopping cart, placing orders, and viewing order history.

The application uses **Java, JSP, Servlets, JDBC, MySQL, HTML, and CSS**. It provides a simple and user-friendly interface for managing the complete book-ordering flow.

---

## 🚀 Features

- 👤 User registration and login
- 📚 Browse available books
- 🏷️ View book category and price
- 🛒 Add books to a shopping cart
- 📦 Place book orders
- 📋 View previous orders
- 🚪 Logout functionality
- 🎨 Responsive and clean user interface
- 💾 MySQL database integration

---

## 🖥️ Application Screenshots

### 🔐 Login Page

<img width="1920" height="1080" alt="01-login" src="https://github.com/user-attachments/assets/a0b08bd0-b1e7-45ab-bdbd-3aff597d04c5" />

### 📝 Registration Page

<img width="1920" height="1020" alt="02-register" src="https://github.com/user-attachments/assets/49351c24-f9fb-4e6d-9a97-bc14bcb2ed13" />

### 📚 Book Catalogue

<img width="1920" height="1020" alt="03-book-catalogue" src="https://github.com/user-attachments/assets/4fa530ca-bee3-4809-aab2-a71916186f33" />

### 🛒 Shopping Cart

<img width="1920" height="1020" alt="04-shopping-cart" src="https://github.com/user-attachments/assets/ee4867d4-bba6-413f-9373-1a8b7b57b7f6" />

### 📦 Order History

<img width="1920" height="1020" alt="05-order-history" src="https://github.com/user-attachments/assets/f321a2f5-1dda-41f2-ac92-26d5574ca22e" />

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java 17 | Backend development |
| JSP | Dynamic web pages |
| Jakarta Servlets | Request and response handling |
| JDBC | Database connectivity |
| MySQL | Database |
| HTML5 | Page structure |
| CSS3 | User interface styling |
| Maven | Project/build management |
| Apache Tomcat 10.1+ | Application server |

---

## 🏗️ Application Architecture

The project follows a simple MVC-style structure:

```text
User
  ↓
JSP Pages
  ↓
Servlets
  ↓
DAO Classes
  ↓
JDBC
  ↓
MySQL Database
```

### Main Components

**JSP Pages**
- Provide the user interface.
- Display books, cart information, and orders.

**Servlets**
- Handle user requests.
- Process login and registration.
- Manage books, cart, and orders.

**DAO Classes**
- Perform database operations.
- Keep database logic separate from the UI and servlet layer.

**MySQL**
- Stores users, books, cart records, and orders.

---

## 📂 Project Structure

```text
Online_Books_Ordering/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── ...
│       │
│       └── webapp/
│           ├── *.jsp
│           ├── css/
│           └── ...
│
├── pom.xml
├── README.md
└── .gitignore
```

---

## ⚙️ Requirements

Install the following before running the project:

- **JDK 17**
- **Apache Maven**
- **MySQL Server**
- **Apache Tomcat 10.1+**
- **Eclipse, IntelliJ IDEA, or another Java IDE**

---

## 🔧 Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/mohitpachpande5/Online_Books_Ordering.git
cd Online_Books_Ordering
```

### 2. Create the MySQL Database

```sql
CREATE DATABASE book_db;
USE book_db;
```

### 3. Create the Required Tables

#### Users

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
```

#### Books

```sql
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
```

#### Cart

```sql
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);
```

#### Orders

```sql
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### 4. Add Sample Books

```sql
INSERT INTO books (name, category, price) VALUES
('Java Programming', 'Programming', 650.00),
('Advanced Java', 'Programming', 780.00),
('Core Java', 'Programming', 550.00),
('Python Basics', 'Programming', 600.00),
('Advanced Python', 'Programming', 750.00),
('C Programming', 'Programming', 500.00);
```

### 5. Configure Database Connection

Update your JDBC/database configuration with your local MySQL details.

```text
Database: book_db
Username: your_mysql_username
Password: your_mysql_password
```

**Do not commit your actual database password or other secrets to GitHub.**

### 6. Build the Project

```bash
mvn clean package
```

### 7. Run with Apache Tomcat

Deploy the generated WAR file to **Apache Tomcat 10.1+** and start the server.

Then open:

```text
http://localhost:8080/Online_Books_Ordering/
```

---

## 🔄 Application Workflow

```text
Register
   ↓
Login
   ↓
Browse Books
   ↓
Add Book to Cart
   ↓
View Cart
   ↓
Place Order
   ↓
Order Saved in Database
   ↓
View Order History
```

---

## 📌 Key Learning Outcomes

This project provided practical experience with:

- Java web application development
- JSP and Servlet programming
- JDBC connectivity
- MySQL database management
- CRUD operations
- Session management
- Shopping cart implementation
- Order management
- Maven project management
- Tomcat deployment
- MVC-style application organization

---

## 🔮 Future Enhancements

Possible improvements include:

- 🔍 Book search and filtering
- 👨‍💼 Admin dashboard
- 💳 Online payment integration
- ⭐ Book ratings and reviews
- 📧 Email order confirmation
- 🔐 Password hashing/encryption
- 👤 User profile management
- 📦 Order status tracking
- 📄 Pagination for large book collections

---

## 👨‍💻 Author

**Mohit Pachpande**

GitHub: [mohitpachpande5](https://github.com/mohitpachpande5)

---

## ⭐ Repository

If you find this project useful, consider giving the repository a ⭐.

**GitHub Repository:**  
https://github.com/mohitpachpande5/Online_Books_Ordering
