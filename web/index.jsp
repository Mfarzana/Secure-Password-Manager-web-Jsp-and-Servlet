<%-- 
    Document   : index
    Created on : Sep 30, 2017, 10:57:18 AM
    Author     : farzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> System Login </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/bootstrap.min.css">
         <link rel="stylesheet" href="css/style.css"
     </head>
    <body>
        <ul id="ul_home">
            <li><p id="p_home"> Secure Password Manager</p></li>
        </ul>
      
        <div class="container well-lg " id="body_content">
            <p class="text warning">Use a valid email address and password to gain access to the user's home page</p>
            <div class="well col-md-5 ">
                <form method="post" action="Login_Controller">
                    <div class="form-group col-md-8 col-md-offset-2">
                      <label class="control-label" for="email">Email </label>
                      <input type="email" class="form-control" name="email"  required="">
                    </div>        

                    <div class="form-group col-md-8 col-md-offset-2">
                      <label class="control-label" for="password">Password</label>
                      <input type="password" class="form-control" name="password"  required="">
                    </div>         
                    <div class="col-md-8 col-md-offset-2 linkOverflow"> 
                        <a href="forgot_password_step1.jsp">Forgotten Password? </a> 
                    </div> 
                    <div class="col-md-offset-8 col-md-4">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
                <div class="col-md-8 col-md-offset-2 linkOverflow"> 
                    <a href="user_registration_form.jsp">Create New Account </a> 
                </div>      
            </div>      
            

            <div class="sidenav col-md-4 col-md-offset-3 ">
                <h2 class="text-primary">Welcome to secure password manager</h2>
                <h4>User friendly + Secure + Convenient  </h4>
                <img height="250px" width="250px" src="images/key1.jpg">
             </div>
            <div class="col-md-offset-8">
                <h4>Store your password in secure place</h4>
            </div> 
       
       </div>
    </body>
</html>

