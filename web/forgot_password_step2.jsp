<%-- 
    Document   : forgot_password_step2
    Created on : Oct 25, 2017, 1:36:25 AM
    Author     : farzana
--%>

<%@page import="Model_Class.DB_Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recovery password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="Jquery/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script> 
        <style>
            #footer{
            position: relative;
            left: 0;
            bottom: 0;
            height:70px; 
            width: 100%;
            background-color:buttonhighlight;
            color: white;
            text-align: center;
          }
        </style>
    </head>
    <body>
        <%@include file="html/navbar.html" %>
        <%  
            HttpSession sss=request.getSession(false);
            ArrayList<String> questionList=new ArrayList<String>();
           questionList =(ArrayList<String>)sss.getAttribute("question");
        %>  
        <div class="well-lg">
            <input class="hide" type="text" name="sid" value="<%=questionList.get(0)%>" > 
        </div>
        <div class="container">
            <form class="form-horizontal" method="post" action="Security_AnsCheck_Controller">
                <div class="panel panel-info col-md-8 col-lg-offset-2">
                    <div class="panel-heading"><b><p>Question 1 : <%=questionList.get(1)%> </p></b></div>
                        <div class="form-group well-sm">
                            <label class="control-label col-md-2" for="ans1">Answer :</label>
                            <div class="col-md-8 ">
                                <input type="text" class="form-control" name="ans1" required="">
                            </div>
                        </div>
                </div>
                    <div class="panel panel-info col-md-8 col-lg-offset-2">
                        <div class="panel-heading"><b><p>question 2 : <%=questionList.get(2)%></p></b></div>
                            <div class="form-group well-sm">
                                <label class="control-label col-md-2" for="ans2">Answer :</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="ans2" required="">
                            </div>
                        </div>
                    </div>   
                            
                 <div class="panel panel-info col-md-8 col-lg-offset-2">
                     <div class="panel-heading"><b><p>question 3: <%=questionList.get(3)%></p></b></div>
                        <div class="form-group well-sm">
                            <label class="control-label col-md-2" for="ans3">Answer :</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="ans3" required="">
                            </div>
                        </div>
                   </div>  
                        
                    <% 
                        String addNewQuestion=questionList.get(4); 
                        if(addNewQuestion.isEmpty())
                    {
                    %>                    
                    
                              <input type="text" class="form-control hide" name="ans4" value=" " >
                 <% }
                            else
                            {                       
                        %> 
                        <div class="panel panel-info col-md-8 col-lg-offset-2">
                        <div class="panel-heading"><b><p>question 4 : <%= addNewQuestion %></p></b></div>
                        <div class="form-group well-sm">
                            <label class="control-label col-md-2" for="ans4">Answer :</label>
                            <div class="col-md-8">
                               <input type="text" class="form-control" name="ans4" required="">
                            </div>
                        </div>
                    </div> 
                        <% } %>
                    <div class="col-lg-offset-8 col-md-4 well-sm">
                        <button type="submit" class="btn btn-info"value="stepOne">Continue</button>
                        <a class="btn btn-default" href="index.jsp">Cancel</a>
                    </div> 
            </form>

           
                <div class="col-md-10 col-md-offset-2 well-lg">
                    <h2 class="text-info">Did you forget your security question's answer ?.</h2>
                    <p class=""><b>Please enter your phone number to recovery account.</b></p>
                    <div class="form-group col-md-5 ">
                        <input type="text" class="form-control" name="phnNo" id="phnNo" required="" >
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#gscModal" >send code</button>
                    </div> 
                </div>
                <div class="col-md-10 col-md-offset-1">
                    <img src="images/sucurityCode.png">
                </div>                                
            
       </div> 
               
                    
                    
                    
     <%-- security code for password recovery  --%>
    <div class="modal fade" id="gscModal" role="dialog">                       
        <form method="post" action="index.jsp">
                    <div class="modal-dialog modal-sm">
                      <div class="modal-content">
                        <div class="modal-header bg-primary">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Security code generator</h4>
                        </div>
                        <div class="modal-body">
                          <p>security code will be send your phone number soon.</p>                          
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">close</button>
                        </div>
                      </div>
                    </div>
                </form>  
            </div>
             
                    
       
        <div id="footer">
       </div>       
           
    </body>
</html>
