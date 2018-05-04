/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import Model_Class.DB_Connection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author farzana
 */
public class Login_Controller extends HttpServlet {

   

    //@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String emailAddr=request.getParameter("email");
        String password=request.getParameter("password");
        
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        HttpSession session=request.getSession(true);
        connection=DB_Connection.creatConnection();
                
        try {
            statement=connection.createStatement();
            resultSet=statement.executeQuery("select * from user_basic_info where email='"+emailAddr+"'"
                    + "and password='"+password+"'");
            if(resultSet.next()){
                String fname=resultSet.getString("firstName");
                String id=resultSet.getString("sid");
                String lname=resultSet.getString("lastName");
                String phnNo=resultSet.getString("phnNo");
                               // session.setAttribute("email", emailAddr);
                session.setAttribute("id", id);
                session.setAttribute("fname", fname);
                session.setAttribute("lname", lname);
               // session.setAttribute("phnNo", phnNo); sQuestion1, 
               resultSet=statement.executeQuery("select * from user_secutity_info where basicID='"+id+"'");
               if(resultSet.next()){
                response.sendRedirect("user_home.jsp");
               }
               else 
                   response.sendRedirect("index.jsp");
                   
            }
            else{
                response.sendRedirect("index.jsp");
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
        } 
        finally{
            try {
                resultSet.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        }      
    }
}
  
