<%-- 
    Document   : profileController
    Created on : Apr 12, 2017, 3:23:32 PM
    Author     : sumaiya
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="shop.html">Shop page</a></li>
                        <li><a href="single-product.html">Single product</a></li>
                        <li><a href="cart.html">Cart</a></li>
                        <li class="active"><a href="checkout.html">Checkout</a></li>
                        <li><a href="#">Category</a></li>
                        <li><a href="#">Others</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div> 
        <%!
            String str;
            Connection con;
            Statement stm;
            File file;
            int maxSize=5000*100;
            int maxFactSize=5000*5000;
            String path="C:/Users/sumaiya/Documents/NetBeansProjects/ecommercefinalpro/web/img";
        %>
         
        <%
         
          String id1=session.getAttribute("id").toString();%>
          <h1><%out.print(id1);%></h1><%
          String type=request.getContentType();
          out.print(type);
          DiskFileItemFactory disFact=new DiskFileItemFactory();
          disFact.setSizeThreshold(maxFactSize);
          disFact.setRepository(new File("c://temp"));
          ServletFileUpload upload=new ServletFileUpload(disFact);
          upload.setFileSizeMax(maxSize);
          List lis=upload.parseRequest(request);
          Iterator itr=lis.iterator();
              while(itr.hasNext()){
                  
                  FileItem item=(FileItem)itr.next();
                  if(!item.isFormField()){
                      str=item.getName();
                      str=str.substring(0, 4)+"akpid"+str.substring(str.indexOf("."));
                      out.print(str);
                      file=new File(path,str);
                      item.write(file);
                  }
              }
            %>
            <%
                try{
                    String query="update products set imgpath='"+str+"' where productID='"+id1+"'";
              Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","");
             stm=con.createStatement();
             stm.executeUpdate(query);
                }
                catch(Exception ex){
                ex.printStackTrace();
                }
                %>
     
    
    </body>
</html>
