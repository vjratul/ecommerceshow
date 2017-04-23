<%-- 
    Document   : logincontrol
    Created on : Apr 22, 2017, 4:09:00 AM
    Author     : sumaiya
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
          String username=request.getParameter("name");
          String password=request.getParameter("password");
          
      %>
      <%=username%>


<%! String userdbname;
    String userdbpassword;
%>
      <%
       try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom", "root", "");
       Statement st=con.createStatement();
       ResultSet res=st.executeQuery("select * from user");
       if(res.next()){
           userdbname=res.getString("userName");
           userdbpassword=res.getString("password");
           if((username.equals(userdbname))&&(password.equals(userdbpassword))){
               session.setAttribute("username1", userdbname);
               response.sendRedirect("index.jsp");
           }
           else
               out.println("error");
       }
      out.print(res);
       con.close();
       out.println("connection closed");
       }
       catch(Exception e){
           out.print(e);
       }
       %>
    </body>
</html>
