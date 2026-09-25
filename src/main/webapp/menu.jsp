<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
List<String[]> list = (List<String[]>) request.getAttribute("books");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Store | Online Books Ordering</title>
<link rel="stylesheet" href="css/book.css">
</head>
<body>
<div class="navbar">
    <a class="brand" href="menuServlet">Book Store</a>
    <a href="viewCart">My Cart</a>
    <a href="viewOrders">My Orders</a>
    <a href="logout">Logout</a>
</div>
<main class="page-shell">
    <section class="page-heading">
        <p>Browse Collection</p>
        <h1>Book Store</h1>
    </section>
    <div class="card-container">
<%
if (list != null && !list.isEmpty()) {
    for (String[] b : list) {
%>
        <div class="book-card">
            <div class="card-header">
                <h3><%= b[1] %></h3>
            </div>
            <div class="card-body">
                <p><strong>Category:</strong> <%= b[2] %></p>
                <p><strong>Price:</strong> Rs. <%= b[3] %></p>
            </div>
            <div class="card-footer">
                <a href="cart?id=<%= b[0] %>" class="primary-action">Add to Cart</a>
            </div>
        </div>
<%
    }
} else {
%>
        <div class="empty-state">No books available.</div>
<%
}
%>
    </div>
</main>
</body>
</html>