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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author farzana
 */
public class Reset_Password_Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sid=request.getParameter("id");
        String oldPass=request.getParameter("currentPassword");
        String newpass=request.getParameter("pass2");
        
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        connection=DB_Connection.creatConnection();
        int count=0;
         try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
            count=statement.executeUpdate("update user_basic_info set password='"+newpass+"' where sid='"+sid+"' and"
                    + " password='"+oldPass+"'  ");
        if(count>0){
            
             response.sendRedirect("user_home.jsp");
            }
            else{
                response.sendRedirect("reset_password.jsp");
            
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
        } 
         finally{
            try {
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(Password_Change_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {       
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Password_Change_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
         }
 
        
        
        
        
    }
}
