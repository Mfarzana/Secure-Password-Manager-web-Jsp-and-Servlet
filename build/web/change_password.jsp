<%-- 
    Document   : change_password
    Created on : Oct 27, 2017, 4:06:57 PM
    Author     : farzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Change password</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="myCSS/style.css" />
        <script type="text/javascript" src="js/javascript.js"></script> 
    </head>
    <body>
        <%@include file="html/navbar.html" %>
        <%  
          HttpSession sss=request.getSession(false);
          String id=(String)sss.getAttribute("id");
        %>  
        <div class="container col-md-offset-3 well-lg">
            <div class="text-left col-md-offset-2">
                <h2>Change Your password</h2>
            </div>
            <form class="form-horizontal" method="post" action="Password_Change_Controller">
                <input type="text" class="text-success invisible" name="id" value="<%= id%>">
                <div class="form-group">
                    <label class="control-label col-md-2" for="password">New Password:</label>
                    <div class="col-md-4">
                        <input type="password" class="form-control" name="pass1" id="pass1"  >
                    </div>
               </div>
                <div class="form-group">
                  <label class="control-label col-md-2" for="confirmPassword">Confirm Password:</label>
                  <div class="col-md-4">          
                      <input type="password" class="form-control" name="pass2" id="pass2" onkeyup="checkPass(); return false;" placeholder="re enter password">
                      <span id="confirmMessage" class="confirmMessage" ></span>
                  </div>
                </div>
                <div class="col-lg-offset-4 col-md-4">
                    <button type="submit" class="btn btn-primary"value="stepOne">Submit</button>
                    <button type="submit" class="btn btn-default" name="submit" value="cancel" formaction="index.jsp">Cancel</button>
                </div> 
           </form>
        </div> 
    </body> 
</html>
