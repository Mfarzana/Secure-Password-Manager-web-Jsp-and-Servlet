<%-- 
    Document   : edit_personal_info
    Created on : Nov 30, 2017, 3:11:41 PM
    Author     : farzana
--%>
<%@page import="Model_Class.Encryption_Decryption"%>
<%@page import="Model_Class.Decrept_Password"%>
<%@page import="Model_Class.DB_Connection"%>
<%@include file="user_navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <title>change save password</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    </head>
    <body>
        <% if(id !=null){ %>
        
        <%      Connection connection=null;
                Statement statement=null;
                ResultSet rs;
                connection=DB_Connection.creatConnection();
                statement=connection.createStatement();
                String url=request.getParameter("url");

                statement.executeQuery ("select * from save_account where basicInfoId='"+id+"' and url='"+url+"' ");
                rs = statement.getResultSet();
                if(rs.next()){                
                %>  
        
        <div class="container">
            <div class="well-sm col-md-10 col-md-offset-1" style="background-color:#F2F2F2; margin-top: 60px">
                <div class="col-md-offset-3 well-sm"><b> <h2>Change save password</h2></b></div>
                <form class="form-horizontal " method="post" action="Changed_Save_Password_Controller">
                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="url">URL:</label>
                        <div class="col-md-6 ">
                            <input type="text" class="form-control" name="url" value="<%= url %>" readonly="" >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="userName">User Name:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="userName" value="<%= rs.getString("userName") %>" >
                        </div> 
                    </div>
                            <%
                                String pass=rs.getString("password");
                                Decrept_Password decrept_Password=new Decrept_Password();
                                String passwordDecAes = Encryption_Decryption.decrypt(pass);
                                String orginalPass=decrept_Password.getDecreptpassword(passwordDecAes);
                            %>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="password">Password:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="password" value="<%=orginalPass %>">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="question">Security question :</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="question" value="<%= rs.getString("sQuestion")%>">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3" for="answer">Answer :</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="answer" value="<%= rs.getString("sQuestionAns")%>">
                        </div> 
                    </div>    
                            <% }
                              rs.close();
                              statement.close();
                              connection.close();
                            %>                       
                    <div class="form-group well-sm">        
                        <div class="col-md-offset-3 col-md-4">
                            <button type="submit" class="btn btn-primary" >changed info</button>
                            <a class="btn btn-default" href="view_save_password.jsp">Cancel</a>
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
