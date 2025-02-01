<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.AuthenticationManager"%>

<%
    // Clear persistent login token
    Connection conn = DbConnector.getConnection();
    AuthenticationManager.clearRememberMeToken(request, response, conn);

    // Invalidate session
    session.invalidate();
    
    // Redirect to login page
    response.sendRedirect("login.jsp");
%>