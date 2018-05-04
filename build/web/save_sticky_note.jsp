<%-- 
    Document   : edit_personal_info
    Created on : Nov 30, 2017, 3:11:41 PM
    Author     : farzana
--%>

<%@include file="user_navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>      
        <title>sticky note</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    </head>
    <body style="background-color:lightyellow">
       
        <% if(id !=null) 
           {%> 
        <div class="container well-lg ">
            <div class="col-md-3">
                <h2>keep sticky note </h2>
                <img src="images/stickyn.jpg" class="img-circle">
            </div>
            <div class="col-md-9 well-lg">
                <form class="form-horizontal"  method="post" action="Sticky_Note_Controller">

                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="subject">Title </label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="subject" required="" placeholder="Example: office task" >
                        </div>
                    </div>                    

                    <div class="form-group">
                        <label class="control-label col-md-3" for="sortNote">Write short Note </label>
                        <div class="col-md-6">
                            <textarea class="form-control" rows="11" cols="10" name="sortNote" maxlength="500" required="" placeholder="start here.. "></textarea>
                        </div>
                    </div>
                   
                     <%
                        Date date =new Date();
                        String currentDate=date.toString();                        
                     %>
                   
                     <h4 class="col-md-offset-3">Date and Time : <%=currentDate %></h4>
                    <input type="text" class="form-control hide" name="dateTime" value="<%= currentDate%>" required="">
                    <div>
                        <div class="col-md-offset-6 col-md-6 well-sm">
                           <button type="submit" class="btn btn-warning"> Save</button> 
                           <a class="btn btn-default" href="user_home.jsp"> Cancel</a> 
                        </div>    
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
