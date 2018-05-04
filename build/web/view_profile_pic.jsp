<%-- 
    Document   : view_information
    Created on : Nov 25, 2017, 9:20:26 PM
    Author     : farzana
--%>

<%@page import="Model_Class.DB_Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="user_navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile picture</title>
    </head>
    <body>
         <% 
             if(id !=null) 
           {%> 
        <div class="container">
            
            <form class="form-horizontal" action="edit_profile_pic.jsp" method="post">
                <div class="col-md-8 col-lg-offset-2 well-lg">
                    <div class="panel panel-info">
                        <div class="panel-heading"><h4><B>Profile Picture</b></h4></div>
                        <div class="panel-body"> 
                            <img src="data:image/gif;base64,<%= imgDataBase64 %>" width="250" height="200" style="margin-right:20px;margin-left:20px "/>
                        </div>
                       <div class="panel-body"><button type="submit" class="btn btn-info">Change picture</button></div>
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
                        
            