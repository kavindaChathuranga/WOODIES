<%@page import="app.classes.*"%>
<%@page import="java.sql.Connection"%>
<%
    String productId = request.getParameter("productId");
    Connection con = null;
    
    if (productId != null && !productId.isEmpty()) {
        try {
            con = DbConnector.getConnection();
            Cart cart = new Cart();
            
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                userId = 1;
            }
            
            cart.addToCart(con, userId, Integer.parseInt(productId));
            response.sendRedirect("cart.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("product.jsp?id=" + productId);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    } else {
        response.sendRedirect("home.jsp");
    }
%>