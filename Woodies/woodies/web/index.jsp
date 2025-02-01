
<%
    // Check if user is already logged in
    Integer userId = (Integer) session.getAttribute("user_id");
    if (userId != null) {
        // User is logged in, redirect to home page
        response.sendRedirect("home.jsp");
        return;
    }
%>


<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>woodies</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <iframe src="signup.jsp" style="width: 100%; height: 97vh; border: none;"></iframe>
    </body>
</html>