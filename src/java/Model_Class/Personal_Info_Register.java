/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model_Class;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author farzana
 */
public class Personal_Info_Register {
    public String personalInfoRegister(User_Personal_info registrationInfo){
        String streetAddress=registrationInfo.getStreetAddress();
        String city=registrationInfo.getCity();
        String country=registrationInfo.getCountry();
        String religion=registrationInfo.getReligion();
        String birthday=registrationInfo.getBirthday();
        String altEmail=registrationInfo.getAltEmail();
        String altPhnNo=registrationInfo.getAltPhnNo();
        String gender=registrationInfo.getGender();
        String id=registrationInfo.getId();
        
        Connection connection=null;
        Statement statement=null;
        int count=0;
        
        try {
            connection=DB_Connection.creatConnection();
            statement=connection.createStatement();
           
            ResultSet rs = statement.executeQuery("SELECT * from personal_info where basicId='" + id + "'");
            if(rs.next()){
                return "duplicate";
            }
            else{
                count=statement.executeUpdate("insert into personal_info(basicId, streetAddress, city, country, religion, birthday, altEmail, altPhnNo, gender) "
                 + "values('"+id+"','"+streetAddress+"','"+city+"','"+country+"','"+religion+"','"+birthday+"','"+altEmail+"','"+altPhnNo+"','"+gender+"')");

                if(count!=0)

                    return "success";
        
            }
        } catch (Exception e) {
           System.out.print("database problem");
        }
       finally{
            try {
                statement.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Personal_Info_Register.class.getName()).log(Level.SEVERE, null, ex);
            }
        
         }
        return "something wrong there" ;

    }
}
