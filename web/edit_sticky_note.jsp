<%-- 
    Document   : edit_sticky_note
    Created on : Jan 29, 2018, 9:32:28 PM
    Author     : farzana
--%>
<%@include file="user_navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
           if(id !=null) 
           {%> 
        <div class="container">
            <div class="well-sm col-md-9 col-md-offset-1" style="background-color:#F2F2F2; margin-top: 60px">
                <div class="col-md-offset-3 well-sm"><b> <h2>Edit sticky note</h2></b></div>
                <form class="form-horizontal " method="post" action="Edit_StickyNote_Controller">
                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <div class="form-group">
                        <label class="control-label col-md-3" for="title">Title:</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" name="title" value="<%=sss.getAttribute("subject")%>" required="" >
                        </div> 
                    </div>                    
                    <div class="form-group">
                        <label class="control-label col-md-3" for="sortNote">Write short Note </label>
                        <div class="col-md-5">
                            <textarea class="form-control" rows="11" cols="10" name="sortNote" maxlength="500" required=""><%= sss.getAttribute("details") %></textarea>
                        </div>
                    </div>    
                    <div class="form-group">
                        <label class="control-label col-md-3" for="date">Saved date:</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" name="date" value="<%=sss.getAttribute("date") %>" required="" >
                        </div> 
                    </div>      
                    <div class="form-group well-sm">        
                        <div class="col-md-offset-3 col-md-4">
                            <button type="submit" class="btn btn-primary"value="stepOne">Update</button>
                            <a class="btn btn-default" href="view_sticky_note.jsp">Cancel</a>
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