/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.DB_Connection;
import Model_Class.Decrept_Password;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model_Class.User_Basic_Info;
import Model_Class.User_BasicInfo_Register;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author farzana
 */
public class User_BasicInfo_Form_Controller extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        String userFirstName=request.getParameter("uFirstName");
        String userLastName=request.getParameter("uLasttName");
        String email=request.getParameter("email");
        String phoneNo=request.getParameter("phoneNo");
        String passwor=request.getParameter("pass2");

       //HttpSession session=request.getSession();
        //session.setAttribute("email", email);
    
        User_Basic_Info userRegistrationInfo=new User_Basic_Info();
        userRegistrationInfo.setFirstName(userFirstName);
        userRegistrationInfo.setLastName(userLastName);
        userRegistrationInfo.setEmail(email);
        userRegistrationInfo.setPhoneNo(phoneNo);
        userRegistrationInfo.setPassword(passwor);
     
        User_BasicInfo_Register user_Register=new User_BasicInfo_Register();
        String registerUser=user_Register.userRegister(userRegistrationInfo);
        String id="";
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        HttpSession session=request.getSession(true);
        connection=DB_Connection.creatConnection();
         
        if(registerUser=="success"){
            try {
                statement=connection.createStatement();
                resultSet=statement.executeQuery("select * from user_basic_info where email='"+email+"'");
               if(resultSet.next()){
                   id=resultSet.getString("sid");
               }  
            } catch (SQLException ex) {
                Logger.getLogger(User_BasicInfo_Form_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
                session.setAttribute("sid",id);
                response.sendRedirect("user_registraion_form2.jsp");   
             }
        else
            response.sendRedirect("user_registration_form.jsp");
    
    }
}
