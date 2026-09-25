<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
List<String[]> list = (List<String[]>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders | Online Books Ordering</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/book.css?v=2">
</head>
<body>
<div class="navbar">
    <a class="brand" href="menuServlet">Book Store</a>
    <nav class="nav-links" aria-label="Main navigation">
        <a class="nav-link" href="menuServlet">Books</a>
        <a class="nav-link" href="viewCart">My Cart</a>
        <a class="nav-link active" href="viewOrders" aria-current="page">My Orders</a>
        <a class="nav-link nav-logout" href="logout">Logout</a>
    </nav>
</div>
<main class="page-shell">
    <section class="page-heading">
        <p>Purchase History</p>
        <h1>My Orders</h1>
    </section>
    <div class="card-container">
<%
if (list != null && !list.isEmpty()) {
    for (String[] o : list) {
%>
        <div class="order-card">
            <div class="card-header">
                <h3>Order #<%= o[0] %></h3>
            </div>
            <div class="card-body">
                <p><strong>Total:</strong> Rs. <%= o[1] %></p>
                <p><strong>Date:</strong> <%= o[2] %></p>
                <p><strong>Status:</strong> Delivered</p>
            </div>
            <div class="card-footer">
                <span class="status-pill">Ordered</span>
            </div>
        </div>
<%
    }
} else {
%>
        <div class="empty-state">No orders found.</div>
<%
}
%>
    </div>
</main>
</body>
</html>
