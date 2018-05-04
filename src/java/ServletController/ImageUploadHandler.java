/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.annotation.MultipartConfig;
import Model_Class.DB_Connection;

/**
 *
 * @author farzana
 */
@MultipartConfig
public class ImageUploadHandler extends HttpServlet {
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String id = request.getParameter("id");
        
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
         
       
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the databaseid, , 
            conn =DB_Connection.creatConnection();
 
            // constructs SQL statement
            String sql = "INSERT INTO profilepic (basicID, image) values (?, ?)";
            java.sql.PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}