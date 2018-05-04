/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model_Class;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author farzana
 */
public class DB_Connection {
   public static Connection creatConnection(){
     Connection connection=null;
     String url="jdbc:mysql://localhost:3306/Secure_Password_Manager";
     String root="root";
     String password="allah";
      try {
         try {
             Class.forName("com.mysql.jdbc.Driver");
             
             
         } catch (ClassNotFoundException ex) {
             System.out.println("driver class not found");
             Logger.getLogger(DB_Connection.class.getName()).log(Level.SEVERE, null, ex);
         }
      
          connection=DriverManager.getConnection(url,root,password);
          
        } catch (SQLException ex) {
             System.out.println("connection class not found");
            Logger.getLogger(DB_Connection.class.getName()).log(Level.SEVERE, null, ex);
        }
     
     
     return connection;
    }
     
    
    
}
