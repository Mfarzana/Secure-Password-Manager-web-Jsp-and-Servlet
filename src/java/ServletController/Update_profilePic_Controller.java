/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.DB_Connection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author farzana
 */
@MultipartConfig
public class Update_profilePic_Controller extends HttpServlet {
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String id = request.getParameter("sid");        
        
       // PrintWriter writer = response.getWriter();         
        // build HTML code
        //String htmlRespone = "<html>";
        //htmlRespone += "<h2>Value is : " + id + "<br/>";      
        //htmlRespone += "</html>";         
        // return response
       // writer.println(htmlRespone);       
         
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
            String sql = "update profilepic set  image= ? where basicID ='"+id+"' ";
            java.sql.PreparedStatement statement = conn.prepareStatement(sql);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("view_profile_pic.jsp");
            }
            else
                response.sendRedirect("edit_profile_pic.jsp");

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
             
            // forwards to the message page
        }
    }
} 