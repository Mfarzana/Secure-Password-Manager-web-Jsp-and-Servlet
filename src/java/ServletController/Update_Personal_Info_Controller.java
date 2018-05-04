/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model_Class.DB_Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author farzana
 */
public class Update_Personal_Info_Controller extends HttpServlet {

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
        String gender=request.getParameter("gender");
        
        Connection connection=null;
        Statement statement=null;
       
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();            
            int upd=statement.executeUpdate("update personal_info set streetAddress='"+ streetAddress+"',"
                    + " city='"+city+"', country='"+country+"',religion='"+religion +"',birthday='"+ birthDate+"',"
                            + "altEmail='"+altEmail +"', altPhnNo='"+ altPhnNo+"', gender='"+ gender+"' "
                                    + "where basicId='"+id+"'");
            if(upd>0){
                     response.sendRedirect("view_information.jsp");
                     }
                    else {
                        response.sendRedirect("edit_personal_info.jsp");

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
