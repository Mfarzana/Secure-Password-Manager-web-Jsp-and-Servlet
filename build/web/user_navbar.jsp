<%-- 
    Document   : user_navbar
    Created on : Oct 18, 2017, 12:15:20 PM
    Author     : farzana
--%>
  <%@page import="Model_Class.DB_Connection"%>
 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
 <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page language="java"%>
 <%@ page session="true"%>
 <%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setDateHeader("Expires",-1);
    %>
    
    
 <%      
    HttpSession sss=request.getSession(false);
    String id=(String)sss.getAttribute("id"); 
  //String email=(String)sss.getAttribute("email");
    String fname=(String)sss.getAttribute("fname");
    String lname=(String)sss.getAttribute("lname");
  //String phnNo=(String)sss.getAttribute("phnNo");
%>  

<% 
    Blob image = null;
    Connection con = null;
    Statement stmt = null;
    ResultSet rs1 = null;
    String iurl1=null;
    //String image=null;
    String imgDataBase64=null;
    byte[ ] imgData = null ;
    try { 
    con = DB_Connection.creatConnection();
    stmt = con.createStatement();
    rs1 = stmt.executeQuery("select * from profilepic where basicID ='"+id+"' ");
    if(rs1.next()){
    image =rs1.getBlob("image");
    imgData = image.getBytes(1,(int)image.length());
    imgDataBase64=new String(Base64.getEncoder().encode(imgData));
    }
    %>
    
    <%}
    catch (Exception e) {
    out.println("DB problem"); 
    return;
    }
finally {
try {
rs1.close();
stmt.close();
con.close();
}
catch (SQLException e) {
e.printStackTrace();
}
}
%>



<html>
    <head>
        <title> Home Page </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="Jquery/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="myJS/javascript.js"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    
    <body>
         <% 
           if(id !=null) 
           {%> 
           
    <ul id="ul_user">
        <li id="li_user" ><a href="" class="active li_a_user" id=" a_user"><p id="li_p_user"><b>Secure Password Manager</b></p></a></li>
        <li id="li_user"><a href="user_home.jsp" class="li_a_user" id=" a_user">Home</a></li>
          <%--<li id="li_user" style="float:right" class="active"><a href="user_profile_info.jsp" class="li_a_user"><%=fname%></a></li> --%>
        <li id="li_a_user"  class="active" style="float:right"> 
            <a href="#" data-toggle="popover" class="li_a_user" data-html="true" title="<%=fname%> <%=lname%>" data-placement="bottom" 
                 data-content="<a href='add_info.jsp'>Add information</a><br>
                 <a href='view_information.jsp'>Acc information </a><br>
                 <a href='view_profile_pic.jsp'>Profile picture </a><br>
                 <a href='logout.jsp'>Sign out</a>">                
                <%--  <img src="images/profile.PNG" class="img-circle" width="40" height="40" style="margin-right:20px;margin-left:20px "> --%>
                <img src="data:image/gif;base64,<%= imgDataBase64 %>" class="img-circle" width="42" height="40" style="margin-left:10px; margin-right:5px" />
                <%=fname%>
                <img src="images/arrow-down2.png" class="img-circle" width="25" height="25" style="margin-right:5px"/>

             </a>
               
        </li>
    </ul>
                  <% } %>
</body>
</html>
