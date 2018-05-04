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
public class User_SecurityInfo_Register {
    
    public String securityInfo(User_Security_Info securityInfo){
        String id=securityInfo.getId();
        String securityQuestion1=securityInfo.getSecurityQuestion1();
        String securityQuestionAns1=securityInfo.getSecurityQuestionAns1();
        String securityQuestion2=securityInfo.getSecurityQuestion2();
        String securityQuestionAns2=securityInfo.getSecurityQuestionAns2();
        String securityQuestion3=securityInfo.getSecurityQuestion3();
        String securityQuestionAns3=securityInfo.getSecurityQuestionAns3();
        String addNewQuestsion=securityInfo.getAddNewQuestion();
        String addNewAns=securityInfo.getAddNewAns();
        Connection connection=null;
        Statement statement=null;
        int count=0;
         try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
            
            count=statement.executeUpdate("insert into user_secutity_info(basicID, sQuestion1, sAns1, sQuestion2, sAns2, sQuestion3, sAns3, addNewQuestion, addNewAns) "
                 + "values('"+id+"','"+securityQuestion1+"','"+securityQuestionAns1+"','"+securityQuestion2+"','"+securityQuestionAns2+"','"+securityQuestion3+"','"+securityQuestionAns3+"','"+addNewQuestsion+"','"+addNewAns+"')");

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
                Logger.getLogger(User_SecurityInfo_Register.class.getName()).log(Level.SEVERE, null, ex);
            }
        
         }   
         return "something wrong there" ;     
    }
}
