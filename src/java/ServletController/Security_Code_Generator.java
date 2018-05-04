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
import Model_Class.DB_Connection;
import Model_Class.Generate_Random_Number;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author farzana
 */
public class Security_Code_Generator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id=request.getParameter("id");
        String url=request.getParameter("url");
        Generate_Random_Number number=new Generate_Random_Number();
        int sCodenew=number.getRandomNumber();
        Connection connection=null;
        Statement statement=null;
        HttpSession session=request.getSession(true);

        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();            
            int upd=statement.executeUpdate("update save_account set sCode='"+ sCodenew+"' where basicInfoId='"+id+"'"
                    + " and url='"+url+"'");
            session.setAttribute("newCode", sCodenew);
            if(upd>0){   
                response.sendRedirect("user_home.jsp");
                }
             else {
                response.sendRedirect("user_home.jsp");
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
