/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.*;
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
public class Show_Save_Password_Controlller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String sid=request.getParameter("sid");
        String ans=request.getParameter("sAns");
        String sCode=request.getParameter("sCode");

        String url="";
        String userName="";
        String password="";
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        
        HttpSession session=request.getSession(true);
        connection=DB_Connection.creatConnection();
        Decrept_Password decrept_Password=new Decrept_Password();
        
        try {
            statement=connection.createStatement();
            resultSet=statement.executeQuery("select * from save_account where basicInfoId='"+sid+"' and sQuestionAns='"+ans+"'"
                    + " or sCode='"+sCode+"'");
            if(resultSet.next()){
                url=resultSet.getString("url");
                userName=resultSet.getString("userName");
                password=resultSet.getString("password");
                
                // used AES algorithm here
                String passwordDecAes = Encryption_Decryption.decrypt(password);
                
                //Basic decryption here
                String orginalPass=decrept_Password.getDecreptpassword(passwordDecAes);
             
                session.setAttribute("url",url);
                session.setAttribute("userName",userName);
                session.setAttribute("password",orginalPass);
                
                 response.sendRedirect("view_save_password.jsp");
            }
            else{
                response.sendRedirect("user_home.jsp");
            
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Show_Save_Password_Controlller.class.getName()).log(Level.SEVERE, null, ex);
        } 
 
    }
  }
