<%-- 
    Document   : User_Registration_Form
    Created on : Sep 30, 2017, 11:12:31 AM
    Author     : farzana
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
       <title>User registration form</title>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="css/bootstrap.min.css">
       <link rel="stylesheet" href="css/style.css">
       <script type="text/javascript" src="js/javascript.js"></script> 
    </head>
    
    <body>
        <%@include file="html/navbar.html" %>
        <div class="container  col-md-offset-3" id="body_user">
            <div class="text-left col-md-offset-2">
                <h2>Create an account </h2>
            </div>
      
            <form class="form-horizontal well-lg " method="post" action="User_BasicInfo_Form_Controller">         
                <div class="form-group">
                    <label class="control-label col-md-2" for="Name"> Name:</label>
                    <div class="col-md-2">
                        <input type="text" class="form-control" name="uFirstName" placeholder="first name" required="">
                     </div>
                    <div class="col-md-2">
                        <input type="text" class="form-control" name="uLasttName" placeholder="last name" required="">
                    </div>
                </div>         
                <div class="form-group">
                    <label class="control-label col-md-2" for="email">Email:</label>
                    <div class="col-md-4">
                        <input type="email" class="form-control" name="email" placeholder="ee@gmail.com" required="">
                    </div>
                </div>        
                <div class="form-group">
                    <label class="control-label col-md-2" for="phoneNo">Phone Number:</label>
                    <div class="col-md-4">
                         <input type="text" class="form-control" name="phoneNo" placeholder="+880" required="">
                    </div>
                </div>       
                <div class="form-group">
                    <label class="control-label col-md-2" for="password">Password:</label>
                    <div class="col-md-4">
                        <input type="password" class="form-control" name="pass1" id="pass1"  required="">
                    </div>
                </div>
      
                <div class="form-group">
                    <label class="control-label col-md-2" for="confirmPassword">Confirm Password:</label>
                    <div class="col-md-4">          
                      <input type="password" class="form-control" name="pass2" id="pass2" onkeyup="checkPass(); return false;" placeholder="re enter password" required="">
                      <span id="confirmMessage" class="confirmMessage" ></span>
                    </div>
                </div>  
               <div class="form-group well-lg">        
                    <div class="col-md-offset-2 col-md-4">
                    <button type="submit" class="btn btn-info"value="stepOne">Next</button>
                         <a class="btn btn-default" href="index.jsp">Cancel</a>
                    </div>
                </div>       
            </form>               
         </div>
    </body>
</html>
