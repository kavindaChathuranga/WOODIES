<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.User"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.AuthenticationManager"%>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String rememberMe = request.getParameter("remember_me");
    
    User user = new User(email, password);
    Connection conn = DbConnector.getConnection();
    
    if(user.authenticate(conn)){
        // Create session
        session.setAttribute("user_id", user.getId());
        
        // Add remember me functionality
        if (rememberMe != null && rememberMe.equals("on")) {
            AuthenticationManager.createRememberMeToken(user, response, conn);
        }
        
        response.sendRedirect("home.jsp");
    } else {
        response.sendRedirect("login.jsp?s=0");
    }
%>