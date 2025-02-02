<%-- 
    Document   : deleteProduct
    Created on : Jan 31, 2025, 11:56:30 AM
    Author     : chanu
--%>

<%@page import="java.util.List"%>
<%@page import="app.classes.DbConnector" %>
<%@page import="app.classes.Products" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String productIdStr = request.getParameter("product_id");
    System.out.println("\n=== Delete Request Received ===");
    System.out.println("Attempting to delete product ID: " + productIdStr);
    
    if (productIdStr != null && !productIdStr.isEmpty()) {
        try {
            int productId = Integer.parseInt(productIdStr);
            Products product = new Products();
            
            // Log the current products before deletion
            System.out.println("\nCurrent products before deletion:");
            List<Products> beforeList = product.getAllProducts(DbConnector.getConnection());
            for (Products p : beforeList) {
                System.out.println("ID: " + p.getProduct_id() + ", Name: " + p.getName());
            }
            
            // Perform deletion
            boolean deleted = product.deleteProduct(DbConnector.getConnection(), productId);
            System.out.println("\nAttempted to delete product ID: " + productId);
            System.out.println("Delete operation result: " + deleted);
            
            // Log the products after deletion
            System.out.println("\nProducts after deletion:");
            List<Products> afterList = product.getAllProducts(DbConnector.getConnection());
            for (Products p : afterList) {
                System.out.println("ID: " + p.getProduct_id() + ", Name: " + p.getName());
            }
            
            if (deleted) {
                response.sendRedirect("admin.jsp?s=2"); // Success
            } else {
                response.sendRedirect("admin.jsp?s=3"); // Failure
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing product ID: " + e.getMessage());
            response.sendRedirect("admin.jsp?s=3");
        }
    } else {
        System.out.println("No product ID received");
        response.sendRedirect("admin.jsp?s=3");
    }
%>