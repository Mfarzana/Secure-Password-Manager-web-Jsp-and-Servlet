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
        <title>personal information</title>
    </head>
    <body>
         <% 
             if(id !=null) 
           {%> 
        <div class="container">            
                      
            <%  
            Connection conn=null;
            Statement st=null;
            ResultSet resultSet;
            conn=DB_Connection.creatConnection();
            st=conn.createStatement();
            st.executeQuery ("select * from user_basic_info where sid='"+id+"'");
            resultSet = st.getResultSet();
            while (resultSet.next ()){
            %> 
            
            <div class="col-md-offset-2">                
                <h4> <a href="reset_password.jsp"><img src="images/key_3.jpg" height="60px" width="60px"> <b>Change Password</b></a></h4>
            </div>  
            <div class="col-md-7  col-md-offset-2 well-sm">  
                <form class="form-horizontal" action="edit_basic_info.jsp" method="post">
                    <div class="panel panel-info">                        
                        <div class="panel-heading"><h4><B>Basic Account Information</b></h4></div>
                        <div style="background-color:#F2F2F2">
                            <div class="panel-body "><p><b>First Name : </b><%= resultSet.getString("firstName")%></p></div>
                            <div class="panel-body"><p><b>Last Name : </b><%= resultSet.getString("lastName")%></p></div>
                            <div class="panel-body"><p><b>Email : </b><%= resultSet.getString("email")%></p></div>
                            <div class="panel-body"><p><b>Phone Number : </b><%= resultSet.getString("phnNo")%></p></div>
                            <div class="panel-body"><button type="submit" class="btn btn-info">Edit</button></div>
                        </div>
                    </div>    
               
                 <% 
                    }
                    resultSet.close();
                    st.close();
                    conn.close();                
                 %>       
                </form>
            </div>
                        
            

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
             <div class="col-md-7 col-md-offset-2 well-sm">
                <form class="form-horizontal" method="post" action="edit_personal_info.jsp">               
                    <div class="panel panel-info">
                        <div class="panel-heading"><h4><b>Personal Details Information</b></h4></div>
                         <div style="background-color:#F2F2F2">
                            <div class="panel-body"><p><b>Street Address : </b><%= rs.getString("streetAddress")%></p></div>
                            <div class="panel-body"><p><b>City : </b><%= rs.getString("city") %></p></div>
                            <div class="panel-body"><p><b>Country : </b><%= rs.getString("country")%></p></div>
                            <div class="panel-body "><p><b>Religion : </b><%=rs.getString("religion") %> </p></div>
                            <div class="panel-body"><p><b>Date Of Birth : </b><%= rs.getString("birthday")%></p></div>
                            <div class="panel-body "><p><b>Alternate Email : </b><%= rs.getString("altEmail")%></p></div>
                            <div class="panel-body"><p><b>Alternate Phone Number: </b><%= rs.getString("altPhnNo")%> </p></div>
                            <div class="panel-body"><p><b>Gender : </b><%= rs.getString("gender")%> </p></div>
                            <div class="panel-body"><button type="submit" class="btn btn-info">Edit</button></div>
                         </div>    
                    </div>    
                </form>
                 <% 
                }
                rs.close();
                statement.close();
                connection.close();                
                %>    
            
            </div>
                
        </div>
           <% } 
            else {
            response.sendRedirect("index.jsp");
             } %>
    </body>
</html>
