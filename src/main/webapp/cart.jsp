<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
@SuppressWarnings("unchecked")
Map<Integer,Integer> cart = (Map<Integer,Integer>) session.getAttribute("cart");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Cart | Online Books Ordering</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/book.css?v=2">
</head>
<body>
<div class="navbar">
	<a class="brand" href="menuServlet">Book Store</a>
        <nav class="nav-links" aria-label="Main navigation">
        <a class="nav-link" href="menuServlet">Books</a>
        <a class="nav-link active" href="viewCart" aria-current="page">My Cart</a>
        <a class="nav-link" href="viewOrders">My Orders</a>
        <a class="nav-link nav-logout" href="logout">Logout</a>
    </nav>
</div>
<main class="page-shell">
    <section class="page-heading">
        <p>Ready to Order</p>
        <h1>Your Cart</h1>
    </section>
    <section class="table-panel">
        <% if (cart != null && !cart.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <% for (Integer bookId : cart.keySet()) { %>
                <tr>
                    <td>#<%= bookId %></td>
                    <td><%= cart.get(bookId) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <div class="table-actions">
            <a href="orderServlet" class="primary-action">Place Order</a>
        </div>
        <% } else { %>
        <div class="empty-state">Your cart is empty.</div>
        <div class="table-actions">
            <a href="menuServlet" class="primary-action">Browse Books</a>
        </div>
        <% } %>
    </section>
</main>
</body>
</html>
