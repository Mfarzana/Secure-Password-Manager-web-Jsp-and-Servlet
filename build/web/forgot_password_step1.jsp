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
        <script type="text/javascript" src="js/javascript.js"></script> 
        <style> 
            #padding {
            border: 1px solid black;
            background-color: #f7f7f7;
            padding: 20px;
            height:200px; 
            width: 600px;
            margin: 150px;
         }
        </style> 
    </head>
    <body>
        <%@include file="html/navbar.html" %>
        <div class="container">
           <form id="padding" method="post" action="Password_Recovery_Controller">   
                <div class="text-primary">
                    <h4>Find Your Account</h4>
                </div>
                <div class="form-group col-md-8 col-lg-offset-2">
                    <label class="control-label" for="email">Please enter your email address to search for your account.</label>
                    <input type="email" class="form-control" name="email" id="email" required="" >
                </div>
                <div class="col-lg-offset-8 col-md-4">
                    <button type="submit" class="btn btn-primary" name="submit" value="continue" onclick="validateForm()">Continue</button>
                    <a class="btn btn-default" href="index.jsp">Cancel</a>
                </div> 
            </form>     
        </div>
    </body>
</html>

