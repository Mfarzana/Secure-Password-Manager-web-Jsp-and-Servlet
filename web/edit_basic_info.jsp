<%-- 
    Document   : edit_personal_info
    Created on : Nov 30, 2017, 3:11:41 PM
    Author     : farzana
--%>
<%@page import="Model_Class.DB_Connection"%>
<%@include file="user_navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <title>edit personal information</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    </head>
    <body>
       
        <% 
           if(id !=null) 
           {%> 
        
        <%
            Connection connection=null;
            Statement statement=null;
            ResultSet rs;
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
            statement.executeQuery ("select * from user_basic_info where sid='"+id+"'");
            rs = statement.getResultSet();
            while (rs.next ()){
            %> 
        <div class="container">
            <div class="well-sm col-md-10 col-md-offset-1" style="background-color:#F2F2F2; margin-top: 60px">
                <div class="col-md-offset-3 well-sm"><b> <h2>Update Basic Information</h2></b></div>
                <form class="form-horizontal " method="post" action="Update_Basic_Info_Controller">
                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="firstName">First Name:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="firstName" value="<%= rs.getString("firstName")%>" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="lastName">Last Name:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="lastName" value="<%= rs.getString("lastName") %>" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="email">Email:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="email" value="<%= rs.getString("email")%>">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="phnNo">Phone Number:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="phnNo" value="<%=rs.getString("phnNo") %> " >
                        </div> 
                    </div>
                    <div class="form-group well-sm">        
                        <div class="col-md-offset-3 col-md-4">
                            <button type="submit" class="btn btn-primary"value="stepOne">Update info</button>
                            <a class="btn btn-default" href="view_information.jsp">Cancel</a>
                        </div>
                    </div>
                    <% 
                }
                rs.close();
                statement.close();
                connection.close();                
            %>       
                 </form>             
            </div>     
        </div>
                 
                   <% } 
            else {
            response.sendRedirect("index.jsp");
             } %>
    </body>
</html>
