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
public class Update_Basic_Info_Controller extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        String fName=request.getParameter("firstName");
        String lName=request.getParameter("lastName");
        String emailAddr=request.getParameter("email");
        String phonenNo=request.getParameter("phnNo");
        
        Connection connection=null;
        Statement statement=null;
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();            
            int upd=statement.executeUpdate("update user_basic_info set firstName='"+fName+"',"
                    + " lastName='"+lName+"', email='"+emailAddr+"',phnNo='"+phonenNo+"' where sid='"+id+"'");
            if(upd>0){
                     response.sendRedirect("view_information.jsp");
                     }
                    else {
                        response.sendRedirect("edit_basic_info.jsp");

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
