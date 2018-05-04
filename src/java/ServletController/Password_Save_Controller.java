/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model_Class.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author farzana
 */
public class Password_Save_Controller extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id=request.getParameter("id");
        String url=request.getParameter("url");
        String userName=request.getParameter("uName");
        String password=request.getParameter("pass2");    
        String sQuestion=request.getParameter("sQuestion");   
        String sQAnswer=request.getParameter("sQAnswer");
        
        Encrypt_Password encrypt_Password=new Encrypt_Password();
        String encrptPass=encrypt_Password.getEncriptPassword(password);
        String passwordEncAes="";
        
        try {
             passwordEncAes = Encryption_Decryption.encrypt(encrptPass);
            
        } catch (Exception ex) {
            Logger.getLogger(Password_Save_Controller.class.getName()).log(Level.SEVERE, null, ex);
        }

       
        //HttpSession session=request.getSession(true);        
        //session.setAttribute("ep", encrptPass);
        // response.sendRedirect("user_home.jsp");

        
        Saving_Account_Info account_Info=new Saving_Account_Info();
        account_Info.setSid(id);
        account_Info.setUrl(url);
        account_Info.setUserName(userName);
        account_Info.setPassword(passwordEncAes);
        account_Info.setsQAnswer(sQAnswer);
        account_Info.setsQestion(sQuestion);
        
        Save_Account_DB save_Account_DB=new Save_Account_DB();
        String saveaccount=save_Account_DB.saveAccount(account_Info);       
        
        if(saveaccount=="success"){
            response.sendRedirect("user_home.jsp");
        }
        else
            response.sendRedirect("user_home.jsp");

       
    }
    
}


