/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model_Class.User_Personal_info;
import Model_Class.Personal_Info_Register;
import java.io.PrintWriter;
/**
 *
 * @author farzana
 */
public class User_PersonaInfo_Controllerl extends HttpServlet {
         @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {    
        String id=request.getParameter("id");
        String streetAddress=request.getParameter("address");
        String city=request.getParameter("city");
        String country=request.getParameter("country");
        String religion=request.getParameter("religion");
        String birthDate=request.getParameter("birthDate");
        String altEmail=request.getParameter("altEmail");
        String altPhnNo=request.getParameter("altPhnNo");
        String gender=request.getParameter("sex");
        
        User_Personal_info personal_info=new User_Personal_info();
        personal_info.setId(id);
        personal_info.setStreetAddress(streetAddress);  
        personal_info.setCity(city);
        personal_info.setCountry(country);
        personal_info.setReligion(religion);
        personal_info.setBirthday(birthDate);
        personal_info.setAltEmail(altEmail);
        personal_info.setAltPhnNo(altPhnNo);
        if(gender.equals("male")){
            personal_info.setGender("male");
        }
        else{
            personal_info.setGender("female");
        }
              
        Personal_Info_Register info_Register=new Personal_Info_Register();
        String personaInfoReg=  info_Register.personalInfoRegister(personal_info);
        if(personaInfoReg=="success"){
            response.sendRedirect("view_information.jsp");
        }
        else if(personaInfoReg=="duplicate"){
             String duplicate="Information is already uploaded please check it in view information link";
             HttpSession session=request.getSession(true);
             session.setAttribute("msg", duplicate);        
             response.sendRedirect("add_info.jsp");

        }
        else
            response.sendRedirect("add_info.jsp");
    
    }
}
