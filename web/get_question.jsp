<%-- 
    Document   : get_question
    Created on : Feb 22, 2018, 12:17:59 AM
    Author     : farzana
--%>
<%@page import="java.util.logging.Level"%>
<%@page import="Model_Class.DB_Connection"%>
<%@page import="java.sql.*"%>
<%
        String sid=request.getParameter("sid");
        String selectedUrl=request.getParameter("url");
       
        String question="";
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        
        connection=DB_Connection.creatConnection();
        try {
            statement=connection.createStatement();
            resultSet=statement.executeQuery("select sQuestion from save_account where basicInfoId='"+sid+"' and url='"+selectedUrl+"'");
            if(resultSet.next()){
                
                question=resultSet.getString("sQuestion");
                
            }
            else{
                response.sendRedirect("user_home.jsp");
            
            }
            connection.close();
                
        } catch (Exception e) {
        e.printStackTrace();
   }
            
 
%>
Security Question:<%out.print(question);%>