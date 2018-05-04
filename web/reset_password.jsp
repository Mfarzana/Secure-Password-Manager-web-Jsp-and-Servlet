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
        <title>reset password</title>
    </head>
    <body>
         <% 
             if(id !=null) 
           {%> 
        <div class="container">
            <div class="text-left col-md-offset-4 well-lg">
                <h2 class="text-info">Reset password</h2>
            </div>
            <div class="col-md-8 col-md-offset-2 well-lg bg-info">
                <form class="form-horizontal" method="post" action="Reset_Password_Controller">
                    <input type="text" class="text-success invisible" name="id" value="<%= id%>">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="currentPassword">Current Password:</label>
                        <div class="col-md-5">
                            <input type="password" class="form-control" name="currentPassword" required=""  >
                        </div>
                   </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="password">New Password:</label>
                        <div class="col-md-5">
                            <input type="password" class="form-control" name="pass1" id="pass1" required="" >
                        </div>
                   </div>
                    <div class="form-group">
                      <label class="control-label col-md-3" for="confirmPassword">Confirm Password:</label>
                      <div class="col-md-5">          
                          <input type="password" class="form-control" name="pass2" id="pass2" onkeyup="checkPass(); return false;" placeholder="re enter password" required="">
                          <span id="confirmMessage" class="confirmMessage" ></span>
                      </div>
                    </div>
                    <div class="col-lg-offset-4 col-md-4">
                        <button type="submit" class="btn btn-primary"value="stepOne">Submit</button>
                        <a class="btn btn-default" name="submit" href="view_information.jsp">Cancel</a>
                    </div> 
               </form>
            </div>        
            
        </div>
           
        <% } 
            else {
            response.sendRedirect("index.jsp");
             } %>
    </body>
</html>    
                        
            