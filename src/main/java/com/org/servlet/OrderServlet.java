package com.org.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.org.dao.BookDAO;
import com.org.dao.OrderDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int userId = (Integer) session.getAttribute("userId");

        @SuppressWarnings("unchecked")
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("viewCart");
            return;
        }

        double total = calculateTotal(cart);
        OrderDAO.placeOrder(userId, total);
        request.setAttribute("orders", OrderDAO.getOrders(userId));
        session.removeAttribute("cart");
        request.getRequestDispatcher("orders.jsp")
               .forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private double calculateTotal(Map<Integer, Integer> cart) {
        double total = 0;
        List<String[]> books = BookDAO.getBooks();
        for (String[] book : books) {
            int bookId = Integer.parseInt(book[0]);
            if (cart.containsKey(bookId)) {
                total += Double.parseDouble(book[3]) * cart.get(bookId);
            }
        }
        return total;
    }
}
