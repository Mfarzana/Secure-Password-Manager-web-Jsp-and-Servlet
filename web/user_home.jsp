<%-- 
    Document   : user_home
    Created on : Oct 18, 2017, 9:56:43 AM
    Author     : farzana
--%>

<%@page import="Model_Class.DB_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@include file="user_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Home</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="Jquery/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/javascript.js"></script> 
    </head>
    <body>
         <% 
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
            response.setDateHeader("Expires",-1);   

           if(id !=null) 
           {%> 
           
           
        <%  Connection connection=null;
            Statement statement=null;
            ResultSet rs;
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
            statement.executeQuery ("select url from save_account where basicInfoId='"+id+"'");
            rs = statement.getResultSet();
            %>
        <div class="container  well-lg">
           <div class="col-md-3">
                <button type="button" class="btn btn-block well-sm " data-toggle="modal" data-target="#savePass">Save Password </button>
                <button type="button" class="btn btn-block well-sm" data-toggle="modal" data-target="#gscModal">Generate Security Code </button>
                <button type="button" class="btn btn-block well-sm" data-toggle="modal" data-target="#deleteAccount">Delete Save Account </button>
                <button type="button" class="btn btn-block well-sm"><a href="save_sticky_note.jsp" style="text-decoration: none; color: black">Save Sticky Note</a> </button>
                <button type="button" class="btn btn-block well-sm"><a href="view_sticky_note.jsp" style="text-decoration: none; color: black">View Previous Note</a> </button>
           </div>           
            <div class="col-md-7 col-md-offset-1">
                <div class="form-group well-lg" style="background-color:#F2F2F2">                     
                            
                    <form id="from_id" method="" action="">
                        <p class="text-info"><b>Security term : Select the URL which user name and password you want to see.</b></p>
                        <input type="text" class="form-control hide" name="sid" value="<%= id%>" required="">
                        <div class="form-group">  
                            <label for="sel1">Select URL:</label>                              
                            <select class="form-control select_menu" name="url" required="">
                               <option value="" selected disabled>Please select one</option>
                               <option value="0">None</option>
                               
                             <% while (rs.next ()){ %>   <option><%= rs.getString("url")%></option>   <% } %>   
                            </select>                            
                        </div>                               
                    </form>                      
                    <p id="showinfo"></p>                         
                </div>
                        
                 <h3>Or</h3>
                 
                <div class="form-group well-lg" style="background-color:#F2F2F2">
                    <form method="post" action="Show_Save_Password_Controlller">  
                        <input type="text" class="form-control hide" name="sid" value="<%= id%>" required="">
                        <p class="text-info"><b>Generate security code for view your own save password from this side .</b></p>  
                        <% if(sss.getAttribute("newCode") !=null) {%>
                        <%-- <P> your Code is  : <%= sss.getAttribute("newCode")%></p> --%>
                        <% } %>
                        <label class="control-label " for="password">Enter Security Code </label>
                        <input type="text" class="form-control" name="sCode" required="">
                        <div class="well-sm">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </form>                   
                </div>           
            </div>  
                        
         <%-- save password modal --%> 
          <% if(id !=null){ %>
            <div class="modal fade" id="savePass" role="dialog">              
                <form method="post" action="Password_Save_Controller">
                    <div class="modal-dialog well-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title ">Save your password in secure way</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                                    <label class="control-label" for="url"> URL</label>
                                    <input type="text" class="form-control" name="url" placeholder="Ex : www.facebook.com" required="">
                                </div>       
                                <div class="form-group">
                                   <label class="control-label" for="Name">User Name</label>
                                   <input type="text" class="form-control" name="uName" placeholder="" required="">
                                </div> 
                                <div class="form-group">
                                   <label class="control-label " for="password">Password</label>
                                   <input type="password" class="form-control" name="pass1" id="pass1"  required="">
                               </div>

                               <div class="form-group">
                                   <label class="control-label" for="confirmPassword">Confirm Password</label>
                                    <input type="password" class="form-control" name="pass2" id="pass2" onkeyup="checkPass(); return false;" placeholder="re enter password" required="">
                                    <span id="confirmMessage" class="confirmMessage" ></span>
                               </div>                                                                          
                                <div class="form-group">
                                    <label class="control-label" for="sQuestion">Set Security Question </label>     
                                    <div>
                                        <select class="form-control " name="sQuestion" required="">
                                            <option value="" selected disabled>Please select</option>
                                            <option>what was your favorite food as a child?</option>        
                                            <option>When you were young, what did you want to be when you grew up?</option>
                                            <option>Who was your childhood hero?</option>
                                            <option>What is the name of a college you applied to but did not attend?.</option>
                                            <option>who is your favorite author?</option>
                                            <option>what was favorite singer in high school?</option>
                                            <option> what is the name of your favorite book?</option>
                                            <option>what is the name of your favorite cannel TV show?</option>
                                            <option>what is your favorite movie character?</option>
                                            <option>what is your favorite cartoon character?</option>
                                            <option>who is your favorite historical person?</option>
                                            <option>who was your first roommate?</option>
                                            <option>what is your favorite place to visit as a child?</option>
                                            <option>what your favorite cousin nick name ?</option>
                                        </select>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label class="control-label " for="sQAnswer">Answer</label>
                                    <input type="text" class="form-control" name="sQAnswer" id="ans"  required="">
                                </div>                                     
                            </div>   
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">save</button>
                            </div>                                 
                        </div>
                    </div>     
                </form>                                        
            </div>
             <% } %>
                                    <%-- generate security code --%>    
            <div class="modal fade" id="gscModal" role="dialog">                       
                 <form method="post" action="Security_Code_Generator">
                    <div class="modal-dialog modal-sm">
                      <div class="modal-content">
                        <div class="modal-header bg-primary">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Security code generator</h4>
                        </div>
                        <div class="modal-body">
                          <p>security code will be send your phone number soon.</p>
                          <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                          <div class="form-group">  
                            <label for="sel1">Select URL:</label>                              
                            <select class="form-control" name="url" required="">
                               <option value="" selected disabled>Please select one</option>
                             <% if(id !=null){
                                 statement.executeQuery ("select url from save_account where basicInfoId='"+id+"'");
                                 rs = statement.getResultSet();
                                 while (rs.next ()){ %>   <option><%= rs.getString("url")%></option>   
                                 <% }
                                 }
                                %>   
                            </select> 
                          </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default">Send</button>
                        </div>
                      </div>
                    </div>
                </form>  
            </div>
 
                        <%-- Delete Save Account  --%>    
            <div class="modal fade" id="deleteAccount" role="dialog">                       
                 <form method="post" action="Delete_Save_Account_Controller">
                    <div class="modal-dialog modal-sm">
                      <div class="modal-content">
                        <div class="modal-header bg-primary">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Delete account</h4>
                        </div>
                        <div class="modal-body">
                          <p>Select the URL which account do you want to delete.</p>
                          <input type="text" class="form-control hide" name="id" value="<%= id%>" required="">
                          <div class="form-group">  
                            <label for="sel1">Select URL:</label>                              
                            <select class="form-control" name="url" required="">
                               <option value="" selected disabled>Please select one</option>
                             <%  if(id !=null){
                                 statement.executeQuery ("select url from save_account where basicInfoId='"+id+"'");
                                 rs = statement.getResultSet();
                                 while (rs.next ()){ %>   <option><%= rs.getString("url")%></option>   
                                 <% }
                                }
                                %>   
                            </select> 
                          </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-default"> Confirm</button>
                        </div>
                      </div>
                    </div>
                </form>  
            </div>
                            
                            
                            
                            
                            
            
                            <%  rs.close();
                                 statement.close();
                                connection.close();
                            %>                        
        </div>
        <% } 
            else {
            response.sendRedirect("index.jsp");
             } %>
             
    </body>
    
    <script>
        $('.select_menu').change(function() {
            $.ajax({
		type: "GET",
		url: "Get_PasswordQuestion_Controller",
		data: $("#from_id").serialize(),
		success: function(data) {
			$("#showinfo").html(data); 
		},
	});
        });
    </script>
</html>
