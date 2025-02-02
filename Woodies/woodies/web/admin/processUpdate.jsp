<%-- 
    Document   : processUpdate
    Created on : Jan 31, 2025, 11:58:50 AM
    Author     : chanu
--%>

<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("image_url");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        
        Products product = new Products(productId, category, imageUrl, name, price, quantity, description);
        boolean updated = product.updateProduct(DbConnector.getConnection());
        
        if (updated) {
            response.sendRedirect("admin.jsp?s=5"); // Update successful
        } else {
            response.sendRedirect("admin.jsp?s=6"); // Update failed
        }
    } catch (Exception e) {
        System.out.println("Error in update: " + e.getMessage());
        response.sendRedirect("admin.jsp?s=6");
    }
%>
