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
public class Save_Account_DB {
    public String saveAccount(Saving_Account_Info account_Info){
        String id=account_Info.getSid();
        String url=account_Info.getUrl();
        String userName=account_Info.getUserName();
        String password=account_Info.getPassword();
        String sQuestion=account_Info.getsQestion();
        String sQestionAns=account_Info.getsQAnswer();
        
        Generate_Random_Number random_Number=new Generate_Random_Number();
        int randomNumber=random_Number.getRandomNumber();
              
        Connection connection=null;
        Statement statement=null;
        int count=0;
        try {    
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
            count=statement.executeUpdate("insert into save_account(basicInfoId, url, userName, password, sQuestion, sQuestionAns, sCode) "
             + "values('"+id+"','"+url+"','"+userName+"','"+password+"','"+sQuestion+"','"+sQestionAns+"','"+randomNumber+"')");
              
        if(count!=0)
            
            return "success";
            
        } catch (SQLException ex) {
            Logger.getLogger(Save_Account_DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                statement.close();;
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Save_Account_DB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }       
        return "something wrong here";
    }
    
}
