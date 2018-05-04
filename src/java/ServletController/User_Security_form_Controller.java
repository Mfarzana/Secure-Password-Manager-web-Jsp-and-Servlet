/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model_Class.User_Security_Info;
import Model_Class.User_SecurityInfo_Register;
import javax.servlet.http.HttpSession;
/**
 *
 * @author farzana
 */
public class User_Security_form_Controller extends HttpServlet {

    //@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     String sid=request.getParameter("id");
     String securityQuestion1=request.getParameter("squestion1");
     String securityQuestionAns1=request.getParameter("answer1");
     String securityQuestion2=request.getParameter("squestion2");
     String securityQuestionAns2=request.getParameter("answer2");
     String securityQuestion3=request.getParameter("squestion3");
     String securityQuestionAns3=request.getParameter("answer3");
     String addNewQuestion=request.getParameter("addQuestion");
     String addNewAns=request.getParameter("addAnswer");
     
     
     User_Security_Info user_security_info=new User_Security_Info();
     user_security_info.setId(sid);
     user_security_info.setSecurityQuestion1(securityQuestion1);
     user_security_info.setSecurityQuestionAns1(securityQuestionAns1);
     user_security_info.setSecurityQuestion2(securityQuestion2);
     user_security_info.setSecurityQuestionAns2(securityQuestionAns2);
     user_security_info.setSecurityQuestion3(securityQuestion3);
     user_security_info.setSecurityQuestionAns3(securityQuestionAns3);
     user_security_info.setAddNewQuestion(addNewQuestion);
     user_security_info.setAddNewAns(addNewAns);
     
     User_SecurityInfo_Register uSecurityInfoRegister=new User_SecurityInfo_Register();
     String registerUser=uSecurityInfoRegister.securityInfo(user_security_info);
     HttpSession session=request.getSession(true);

     
      if(registerUser=="success"){
            session.setAttribute("sid",sid);
            response.sendRedirect("set_profile_pic.jsp");
              
          }
          else
               response.sendRedirect("user_registraion_form2.jsp");
     
    }

}
