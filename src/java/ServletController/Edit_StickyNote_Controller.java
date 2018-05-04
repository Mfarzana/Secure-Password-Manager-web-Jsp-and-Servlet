/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.DB_Connection;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Edit_StickyNote_Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        String title=request.getParameter("title");
        String noteDetails=request.getParameter("sortNote");
        String dateAndTime=request.getParameter("date");
        
        
        Connection connection=null;
        Statement statement=null;
      
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();            
            int upd=statement.executeUpdate("update sticky_note set noteSubject='"+ title+"',"
                    + " noteDetails='"+noteDetails+"' where basicId='"+id+"' and saveDate='"+dateAndTime+"' ");
            if(upd>0){
                     response.sendRedirect("view_sticky_note.jsp");
                     }
                    else {
                        response.sendRedirect("edit_sticky_note.jsp");

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
