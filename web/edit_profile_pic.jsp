<%-- 
    Document   : edit_personal_info
    Created on : Nov 30, 2017, 3:11:41 PM
    Author     : farzana
--%>
<%@include file="user_navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <title>edit profile pic</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    </head>
    <body>
        <% 
           if(id !=null) 
           {%> 
           
        <div class="container">         
            <div class="well-lg col-md-8 col-md-offset-2" style="background-color:#F2F2F2; margin-top: 60px">
                <h3>Update Your Profile Picture  </h3> 
                <form action="Update_profilePic_Controller" method ="post" enctype ="multipart/form-data" class="form-group">
                   <input type="text" class="form-control hide" name="sid" value="<%= id%>" required="">
                    <input type = "file" name = "photo" size = "50"/><br>
                    <input type = "submit" value = "Update Image"  class="btn btn-primary"/>    
                    <a class="btn btn-default" href="view_profile_pic.jsp">Cancel<a/>     
                </form>    
            </div> 
        </div>
            <% } 
            else {
            response.sendRedirect("index.jsp");
             } %>
    </body>
</html>
