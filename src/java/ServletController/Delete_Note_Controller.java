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
import javax.servlet.http.HttpSession;

/**
 *
 * @author farzana
 */
public class Delete_Note_Controller extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tilte=request.getParameter("noteSubject");
        String id=request.getParameter("basicId");
        String description=request.getParameter("noteDetails");
        String dateAndTime=request.getParameter("dateTime");
        String butttonValue=request.getParameter("submit");
             
        if(butttonValue.equals("delete")){
            Connection connection=null;
            Statement statement=null;
            try { 
                connection=DB_Connection.creatConnection();
                statement=connection.createStatement();            
                int upd=statement.executeUpdate("delete from sticky_note where basicId='"+id+"' and saveDate='"+dateAndTime+"'");
                if(upd>0){
                         response.sendRedirect("view_sticky_note.jsp");
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
        else if(butttonValue.equals("edit")){
            HttpSession session=request.getSession(true);
            session.setAttribute("subject", tilte);
            session.setAttribute("details", description);
            session.setAttribute("date", dateAndTime); 
            response.sendRedirect("edit_sticky_note.jsp");            
            }
        else{
            response.sendRedirect("view_sticky_note.jsp");
        }
    }    
}

   
  