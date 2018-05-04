<%-- 
    Document   : user_home
    Created on : Oct 18, 2017, 9:56:43 AM
    Author     : farzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@include file="user_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>view save password</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
         <% if(id !=null){ %>
     
        <div class="container well-lg">
             <%     
                    String url=(String)sss.getAttribute("url");
                    String userName=(String)sss.getAttribute("userName");
                    String password=(String)sss.getAttribute("password");
                    String answer=(String)sss.getAttribute("answer");
                %>  
                
            <form class="form-horizontal" action="edit_save_password.jsp" method="post">
                <div class="col-md-8 col-lg-offset-2 well-lg">
                    <div class="panel panel-default">
                        <div class="panel-heading"><h3><B>Account information</b></h3></div>
                        <div class="panel-body"><p><b>URL : </b><%=url %></p></div>
                        <div class="panel-body"><p><b>User Name : </b><%=userName %></p></div>
                        <div class="panel-body "><p><b>Password : </b><%=password %></p></div> 
                        
                        <input type="text" name="url"  class="hide" value="<%=url %>" > 
                        
                        <div class="panel-body"><button type="submit" class="btn btn-primary">Edit</button></div>
                    </div>    
                </div>                
            </form>
         
        </div>
         <% } 
            else {
            response.sendRedirect("index.jsp");
             } %>
    </body>
</html>
