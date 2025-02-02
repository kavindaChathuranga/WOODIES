<%-- 
    Document   : admin_back
    Created on : Jan 31, 2025, 11:55:15 AM
    Author     : chanu
--%>

<%@page import="app.classes.DbConnector" %>
<%@page import="app.classes.Products" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Retrieve form data
    String category = request.getParameter("category");
    String imageUrl = request.getParameter("image_url");
    String name = request.getParameter("name");
    String priceStr = request.getParameter("price");
    String quantityStr = request.getParameter("quantity");
    String description = request.getParameter("description"); 

    try {
        // Parse price and quantity
        double price = Double.parseDouble(priceStr);
        int quantity = Integer.parseInt(quantityStr);

        // Create a Products object
        Products product = new Products(category, imageUrl, name, price, quantity,description);

        // Add product to database
        if (product.addProducts(DbConnector.getConnection())) {
            response.sendRedirect("admin.jsp?s=1"); // Success
        } else {
            response.sendRedirect("admin.jsp?s=0"); // Failure
        }
    } catch (NumberFormatException e) {
        e.printStackTrace();
        response.sendRedirect("admin.jsp?s=0"); // Invalid input
    }
%>
 

