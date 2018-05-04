/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Model_Class.DB_Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author farzana
 */
public class Password_Recovery_Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String emailAddr=request.getParameter("email");      
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        HttpSession session=request.getSession(true);
        connection=DB_Connection.creatConnection();
        ArrayList<String> questionList=new ArrayList<>();
        try {
            statement=connection.createStatement();
            resultSet=statement.executeQuery("select * from user_secutity_info,user_basic_info where "
                    + "user_basic_info.sid=user_secutity_info.basicID and user_basic_info.email='"+emailAddr+"'");
            if(resultSet.next()){
             questionList.add(resultSet.getString("basicID"));
             questionList.add(resultSet.getString("sQuestion1"));
             questionList.add(resultSet.getString("sQuestion2"));
             questionList.add(resultSet.getString("sQuestion3"));
             questionList.add(resultSet.getString("addNewQuestion"));
             
             session.setAttribute("question", questionList);             
             response.sendRedirect("forgot_password_step2.jsp");
            }
            else{
                response.sendRedirect("forgot_password_step1.jsp");
            
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
        
           
            
        }
 }

