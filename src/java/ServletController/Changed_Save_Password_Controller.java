/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.DB_Connection;
import Model_Class.Encrypt_Password;
import Model_Class.Encryption_Decryption;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
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
public class Changed_Save_Password_Controller extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        String url=request.getParameter("url");
        String uName=request.getParameter("userName");
        String pass=request.getParameter("password");
        String securityQuestion=request.getParameter("question");
        String answer=request.getParameter("answer");
        
        Encrypt_Password encrypt_Password=new Encrypt_Password();
        String encrptPass=encrypt_Password.getEncriptPassword(pass);
        String passwordEncAes="";
    try {
        passwordEncAes = Encryption_Decryption.encrypt(encrptPass);
    } catch (Exception ex) {
        Logger.getLogger(Changed_Save_Password_Controller.class.getName()).log(Level.SEVERE, null, ex);
    }

        HttpSession session=request.getSession(true);
        Connection connection=null;
        Statement statement=null;        
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();            
            int upd=statement.executeUpdate("update save_account set userName='"+uName+"',"
                    + " password='"+passwordEncAes+"', sQuestion='"+securityQuestion+"',sQuestionAns='"+answer+"' where basicInfoId='"+id+"' and url='"+url+"'");
            if(upd>0){
                session.setAttribute("url",url);
                session.setAttribute("userName",uName);
                session.setAttribute("password",pass);
                
                 response.sendRedirect("view_save_password.jsp");
                
                     //response.sendRedirect("user_home.jsp");
                     }
                    else {
                        response.sendRedirect("edit_save_password.jsp");

                    }
            
        } catch (SQLException ex) {
            Logger.getLogger(Update_Personal_Info_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{ 
            try {
                statement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Update_Personal_Info_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }    
}
