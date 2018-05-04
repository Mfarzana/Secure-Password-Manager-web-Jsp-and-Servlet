/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model_Class;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author farzana
 */
public class User_BasicInfo_Register {
    
    public String userRegister(User_Basic_Info registration_Info){
        String firstName=registration_Info.getFirstName();
        String lastname=registration_Info.getLastName();
        String email=registration_Info.getEmail();
        String phnNo=registration_Info.getPhoneNo();
        String pass=registration_Info.getPassword();
        
        Connection connection=null;
        Statement statement=null;
        int count=0;
        
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
            
            count=statement.executeUpdate("insert into user_basic_info(firstName, lastName, email, phnNo, password) "
                 + "values('"+firstName+"','"+lastname+"','"+email+"','"+phnNo+"','"+pass+"')");

        if(count!=0)
            
            return "success";
        
        } catch (Exception e) {
           System.out.print("database problem");
        }
        finally{
            try {
                statement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(User_BasicInfo_Register.class.getName()).log(Level.SEVERE, null, ex);
            }
        
         }   
        return "something wrong there" ;

    }
}