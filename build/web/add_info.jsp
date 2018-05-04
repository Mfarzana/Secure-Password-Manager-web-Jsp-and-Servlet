<%-- 
    Document   : user_home
    Created on : Oct 18, 2017, 9:56:43 AM
    Author     : farzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>  
<%@include file="user_navbar.jsp" %>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
           <%
               String msg=(String)sss.getAttribute("msg");
               if(msg !=null){
           %>

           <h1 class="col-md-offset-1 text-warning"><%=msg%></h1>
             <% } %>
      
             <% 
           if(id !=null) 
           {%> 
        <div class="container">                        
            <div class="well-sm col-md-9 col-md-offset-1" style="background-color:#F2F2F2; margin-top: 40px">
                <div class="col-md-offset-3 well-sm"><b> <h2>Personal Information</h2></b></div>
                <form class="form-horizontal " method="post" action="User_PersonaInfo_Controllerl">
                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="address">Street Address:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="address" placeholder="" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="city">City:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="city" placeholder="" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="country">Country:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="country" placeholder="" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="religion">Religion:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="religion" placeholder="" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="birthDate">Date Of Birth</label>
                        <div class="col-md-6">
                            <input class="form-control" type="date" value="2011-08-19" name="birthDate">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="altEmail">Alternate Email:</label>
                        <div class="col-md-6">
                            <input type="email" class="form-control" name="altEmail" placeholder="" >
                        </div>
                   </div>
                    <div class="form-group">
                      <label class="control-label col-md-3" for="altPhnNo">Alternate Phone Number:</label>
                        <div class="col-md-6">
                          <input type="text" class="form-control" name="altPhnNo" placeholder="">
                        </div>
                    </div>  
                    <div class="form-group">
                      <label class="control-label col-md-3" for="gender">Gender:</label>
                        <div class="col-md-offset-3">
                          <label class="radio-inline">
                              <input type="radio" name="sex" value="male">Male
                          </label>
                          <label class="radio-inline">
                              <input type="radio" name="sex" value="female">Female
                          </label>
                        </div>
                    </div>
                    <div class="form-group well-sm">        
                        <div class="col-md-offset-3 col-md-4">
                            <button type="submit" class="btn btn-primary"value="stepOne">Save info</button>
                            <a class="btn btn-default" href="user_home.jsp">Cancel</a>
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
