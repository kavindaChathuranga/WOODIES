<%-- 
    Document   : removeFromCart
    Created on : Feb 2, 2025, 2:24:24 AM
    Author     : chanu
--%>

<%@page import="java.sql.*"%>
<%@page import="app.classes.DbConnector"%>
<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    int userId = 1; // Assuming the user is logged in and their ID is 1

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = DbConnector.getConnection();
        String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, userId);
        pstmt.setInt(2, productId);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (con != null) {
            con.close();
        }
    }

    response.sendRedirect("cart.jsp");
%>
