/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.DB_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author farzana
 */
public class Security_AnsCheck_Controller extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("sid");
        String ans1=request.getParameter("ans1");
        String ans2=request.getParameter("ans2");
        String ans3=request.getParameter("ans3");
        String ans4=request.getParameter("ans4");
        
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        HttpSession session=request.getSession(true);
        connection=DB_Connection.creatConnection();
        try {
            statement=connection.createStatement();
            resultSet=statement.executeQuery("select basicID from user_secutity_info where sAns1='"+ans1+"'"
                    + "and sAns2='"+ans2+"'and sAns3='"+ans3+"' and addNewAns='"+ans4+"'");
            if(resultSet.next()){
             String sid=resultSet.getString("basicID");             
             session.setAttribute("id", sid);
             
             response.sendRedirect("change_password.jsp");
            }
            else{
                response.sendRedirect("forgot_password_step2.jsp");
            
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(Security_AnsCheck_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(Security_AnsCheck_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {       
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Security_AnsCheck_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
         }  
    }
}
