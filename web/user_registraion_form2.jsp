<%-- 
    Document   : User_Registraion_Form2
    Created on : Oct 12, 2017, 12:58:08 PM
    Author     : farzana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User registration form</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="myCSS/style.css">
    </head>
    <body>
        <%@include file="html/navbar.html"%>
        <%  
          HttpSession sss=request.getSession(false);
          String id=(String)sss.getAttribute("sid");
        %>  
        <div class="container col-md-offset-3">
            <div class="text-left well-sm">
                <h3><b>Answer all security question for get better secure environment .</b></h3>
            </div>
            <form class="form-horizontal" method="post" action="User_Security_form_Controller">
                <input type="text" class="text-success hide" name="id" value="<%= id%>">        
                <div class="form-group">
                    <label class="control-label col-md-2" for="complaint">Security Question #1: </label>     
                    <div class="col-md-4">
                        <select class="form-control " name="squestion1" required="">                            
                            <option>What was your favorite food as a child?.</option>        
                           <option>When you were young, what did you want to be when you grew up?.</option>
                           <option>Who was your childhood hero?.</option>
                           <option>What is the name of a college you applied to but did not attend?.</option>
                           <option>Who is your favorite author?.</option>
                           <option>What was favorite singer in high school?.</option>
                           <option>What is the name of your favorite book?.</option>
                           <option>What is the name of your favorite cannel TV show?.</option>
                           <option>What is your favorite movie character?.</option>
                           <option>What is your favorite cartoon character?.</option>
                           <option>Who is your favorite historical person? historical person?.</option>
                           <option>Who was your first roommate?.</option>
                           <option>What is your favorite place to visit as a child?.</option>
                           <option>What your favorite cousin nick name?.</option>
                        </select>
                    </div>
                </div>      
                <div class="form-group">
                     <label class="control-label col-md-2" for="answer1">Answer:</label>
                    <div class="col-md-4">          
                        <input type="answer" class="form-control" name="answer1" placeholder=" Ex :Icecream" required="">
                    </div>
                </div>      
                <div class="form-group  ">
                    <label class="control-label col-md-2" for="complaint">Security Question #2: </label>     
                    <div class="col-md-4">
                       <select class="form-control" name="squestion2" required="">
                            <option>What your favorite cousin nick name?.</option>
                            <option>What was your favorite food as a child?.</option>        
                           <option>When you were young, what did you want to be when you grew up?.</option>
                           <option>Who was your childhood hero?</option>
                           <option>What is the name of a college you applied to but did not attend?.</option>
                           <option>Who is your favorite author?.</option>
                           <option>What was favorite singer in high school?.</option>
                           <option>What is the name of your favorite book?.</option>
                           <option>What is the name of your favorite cannel TV show?.</option>
                           <option>What is your favorite movie character?.</option>
                           <option>What is your favorite cartoon character?.</option>
                           <option>Who is your favorite historical person? historical person?.</option>
                           <option>Who was your first roommate?.</option>
                           <option>What is your favorite place to visit as a child?.</option>
                        </select>
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label col-md-2" for="answer2">Answer:</label>
                    <div class="col-md-4">          
                        <input type="answer" class="form-control" name="answer2" placeholder="Ex : Farzana" required="">
                    </div>
                </div>         
                <div class="form-group  ">
                    <label class="control-label col-md-2" for="complaint">Security Question #3: </label>     
                    <div class="col-md-4">
                        <select class="form-control " name="squestion3" required="">
                             <option>What is the name of your favorite book?.</option>
                            <option>What was your favorite food as a child?.</option>        
                            <option>When you were young, what did you want to be when you grew up?.</option>
                            <option>Who was your childhood hero?.</option>
                            <option>What is the name of a college you applied to but did not attend?.</option>
                            <option>Who is your favorite author?.</option>
                            <option>What was favorite singer in high school?.</option>                           
                            <option>What is the name of your favorite cannel TV show?.</option>
                            <option>What is your favorite movie character?.</option>
                            <option>What is your favorite cartoon character?.</option>
                            <option>Who is your favorite historical person? historical person?.</option>
                            <option>Who was your first roommate?.</option>
                            <option>What is your favorite place to visit as a child?.</option>
                            <option>What your favorite cousin nick name ?.</option>
                        </select>
                    </div>
                </div> 
                <div class="form-group">
                    <label class="control-label col-md-2" for="answer3">Answer:</label>
                    <div class="col-md-4">          
                         <input type="answer" class="form-control" name="answer3" placeholder="Ex : Al Quran" required="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2" for="qestion">Add New Question:</label>
                     <div class="col-md-4">
                        <textarea class="form-control" rows="3" name="addQuestion"></textarea>
                     </div>
                </div>        
                <div class="form-group">
                    <label class="control-label col-md-2" for="addAnswer">Answer:</label>
                    <div class="col-md-4">          
                        <input type="answer" class="form-control" name="addAnswer" placeholder="answer">
                    </div>
                </div>        
                <div class="form-group">        
                    <div class="col-md-offset-2 col-md-4">
                        <button type="submit" class="btn btn-info">Submit</button>
                    </div>
                </div>        
            </form>
        </div>
    </body>
</html>
