<%-- 
    Document   : updateCart
    Created on : Feb 2, 2025, 2:23:44 AM
    Author     : chanu
--%>

<%@page import="java.sql.*"%>
<%@page import="app.classes.DbConnector"%>
<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    int userId = 1; // Assuming the user is logged in and their ID is 1

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = DbConnector.getConnection();
        String sql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, quantity);
        pstmt.setInt(2, userId);
        pstmt.setInt(3, productId);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }

    response.sendRedirect("cart.jsp");
%>
