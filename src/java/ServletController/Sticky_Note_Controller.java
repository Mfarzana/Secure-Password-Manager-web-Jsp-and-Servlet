/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;


import Model_Class.DB_Connection;
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

/**
 *
 * @author farzana
 */
public class Sticky_Note_Controller extends HttpServlet {
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        String sid=request.getParameter("id");
        String noteSubject=request.getParameter("subject");
        String noteDetails=request.getParameter("sortNote");
        String date=request.getParameter("dateTime");      
        
        Connection connection=null;
        Statement statement=null;
       
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();               
            
            int count=statement.executeUpdate("insert into sticky_note(basicId, noteSubject, noteDetails, saveDate) "
            + "values('"+sid+"','"+noteSubject+"','"+noteDetails+"','"+date+"')");
            
            if(count>0){
                response.sendRedirect("user_home.jsp");
            }
            else {
                response.sendRedirect("save_sticky_note.jsp");
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
