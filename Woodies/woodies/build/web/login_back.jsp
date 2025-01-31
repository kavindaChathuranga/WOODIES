<%-- 
    Document   : login_back
    Created on : Jan 23, 2025, 8:45:16 AM
    Author     : chanu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.User"%>
<%@page import="app.classes.DbConnector"%>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
User user = new User(email,password);
if(user.authenticate(DbConnector.getConnection())){
    session.setAttribute("user_id", user.getId());
    response.sendRedirect("home.jsp");       //change
}else{
    response.sendRedirect("login.jsp?s=0");       //change
}

%>