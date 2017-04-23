<%-- 
    Document   : logoutcontrol
    Created on : Apr 23, 2017, 10:50:43 AM
    Author     : sumaiya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>J</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%session.invalidate();
        response.sendRedirect("index.jsp");
                
                %>
    </body>
</html>
