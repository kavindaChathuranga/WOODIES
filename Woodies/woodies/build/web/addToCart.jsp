<%-- 
    Document   : addToCart
    Created on : Feb 2, 2025, 2:18:59 AM
    Author     : chanu
--%>

<%@page import="java.sql.*"%>
<%@page import="app.classes.DbConnector"%>
<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    int userId = 1;

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = DbConnector.getConnection();
        String sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, 1) ON DUPLICATE KEY UPDATE quantity = quantity + 1";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, userId);
        pstmt.setInt(2, productId);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }

    response.sendRedirect("cart.jsp");
%>