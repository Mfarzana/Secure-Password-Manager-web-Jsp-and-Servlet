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
    <body style="background-image: url(images/stickyn8.png)">       
         <% if(id !=null){ %>
        
         <div class="container well-lg">    
             
         <%  
            Connection conn=null;
            Statement st=null;
            ResultSet resultSet;
            conn=DB_Connection.creatConnection();
            st=conn.createStatement();
            st.executeQuery ("select * from sticky_note where basicId='"+id+"'");
            resultSet = st.getResultSet();
            while (resultSet.next ()){
            %> 
     
            <form class="form-horizontal" action="Delete_Note_Controller" method="post">
                <div class="col-md-5 col-lg-offset-3">
                    <div class="panel panel-info">
                        <div class="panel-heading"><h3><B> Title : <%= resultSet.getString("noteSubject")%></b></h3></div>
                        <div class="panel-body hide"><input type="text"  name="noteSubject" value="<%= resultSet.getString("noteSubject")%>" class="hide" > </div>
                        <div class="panel-body hide"><input type="text"  name="basicId" value="<%= resultSet.getString("basicId")%>" class="hide" > </div>
                        <div class="panel-body bg-warning"><p><b>Note description : </b></p><%= resultSet.getString("noteDetails")%></div>
                        <div class="panel-body hide"><input type="text"  name="noteDetails" value="<%= resultSet.getString("noteDetails")%>" class="hide" > </div>
                        <div class="panel-body bg-warning"><p><b>Saved date and time : </b><%= resultSet.getString("saveDate")%></p></div>
                        <div class="panel-body hide"><input type="text"  name="dateTime" value="<%= resultSet.getString("saveDate")%>" class="hide" > </div>
                        <div class="panel-body bg-warning">
                            <button type="submit" class="btn btn-info pull-right" name="submit" value="delete">Delete Note</button>
                            <button type="submit" class="btn btn-info col-md-offset-6" name="submit" value="edit">Edit Note</button>
                        </div>
                    </div>    
                </div>                 
            </form> 
            <% 
                    }
                    resultSet.close();
                    st.close();
                    conn.close();                
                 %>                               
            
        </div>
         <% } 
            else {
            request.setAttribute("id", id);
            response.sendRedirect("logout.jsp");

             } %>
    </body>
</html>
