<%-- 
    Document   : forgot_password
    Created on : Oct 23, 2017, 8:54:02 PM
    Author     : farzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Forgot password </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="myCSS/style.css" />
        <script type="text/javascript" src="js/javascript.js"></script> 
        <style> 
            #padding {
            border: 1px solid black;
            background-color: #f7f7f7;
            padding: 20px;
            height:200px; 
            width: 600px;
            margin: 200px;
         }
        </style> 
    </head>
    <body>
        <%@include file="html/navbar.html" %>
        <%  
          HttpSession sss=request.getSession(false);
          String id=(String)sss.getAttribute("sid");
        %>  
        <div class="container"> 
            <div class=" well-lg col-md-3">
                <h3>Set Profile Picture  </h3> <%--${requestScope["iName"]} --%>
                <form action="ImageUploadHandler" method = "post" enctype = "multipart/form-data">
                   <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                    <input type = "file" name = "photo" size = "50"/><br>
                    <input type = "submit" value = "Upload Image"  class="btn btn-primary"/>  
                </form>
                    
                <form action="Default_Image_Controller" method = "post" enctype = "multipart/form-data">
                   <input type="text" class="form-control invisible" name="id" value="<%= id%>" required="">
                   <input type = "submit" value = "Skip"  class="btn btn-default"/>  
                </form>    
                   
            </div>
        </div>
    </body>
</html>

