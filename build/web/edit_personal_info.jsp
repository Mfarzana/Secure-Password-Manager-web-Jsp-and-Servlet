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
            statement.executeQuery ("select * from personal_info where basicId='"+id+"'");
            rs = statement.getResultSet();
            while (rs.next ()){
            %> 
        <div class="container">
            <div class="well-sm col-md-10 col-md-offset-1" style="background-color:#F2F2F2; margin-top: 40px">
                <div class="col-md-offset-3 well-sm"><b> <h2>Update Personal Information</h2></b></div>
                <form class="form-horizontal " method="post" action="Update_Personal_Info_Controller">
                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="address">Street Address:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="address" value="<%= rs.getString("streetAddress")%>" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="city">City:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="city" value="<%= rs.getString("city") %>" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="country">Country:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="country" value="<%= rs.getString("country")%>">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="religion">Religion:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="religion" value="<%=rs.getString("religion") %> " >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="birthDate">Date Of Birth</label>
                        <div class="col-md-6">
                            <input class="form-control" type="date" value="<%= rs.getString("birthday")%>" name="birthDate"  >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="altEmail">Alternate Email:</label>
                        <div class="col-md-6">
                            <input type="email" class="form-control" name="altEmail" placeholder="" value="<%= rs.getString("altEmail")%> ">
                        </div>
                   </div>
                    <div class="form-group">
                      <label class="control-label col-md-3" for="altPhnNo">Alternate Phone Number:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="altPhnNo" value="<%= rs.getString("altPhnNo")%>">
                        </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3" for="gender">Gender:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="gender" value="<%= rs.getString("gender")%> ">
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
