<%-- 
    Document   : signupcontrol
    Created on : Apr 22, 2017, 3:33:45 AM
    Author     : sumaiya
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
          <%
            String username=request.getParameter("userName");
            String name=request.getParameter("fullName");
            String address=request.getParameter("address");
            String phoneNo=request.getParameter("phoneNo");
            String email=request.getParameter("email");
           String password=request.getParameter("password");
            
            
       try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom", "root", "");
       
       Statement st=con.createStatement();
       Object res=st.executeUpdate("insert into user(userName,fullName,address,phoneNo,email,password)values('"+username+"','"+name+"','"+address+"','"+phoneNo+"','"+email+"','"+password+"')");
       out.println("data inserted");
      out.println("something"+res);
      ResultSet res1=st.executeQuery("select * from user");
      out.print(res1);
       con.close();
       out.println("connection closed");
       }
       catch(Exception e){
           out.print(e);
       }
      






            %>
    </body>
</html>