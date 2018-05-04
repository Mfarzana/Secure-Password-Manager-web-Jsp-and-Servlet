/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model_Class;
/**
 *
 * @author farzana
 */
public class Encrypt_Password {
    private String password;
    private String passwordUpr;
    private char[] passwordArray;
    private String passwordChyper;
    private String passwordChyperConcat;
   
    private int i;
    public String getEncriptPassword(String password){
        this.password=password;
        passwordUpr=password.toUpperCase();
        passwordArray=passwordUpr.toCharArray();
        for(i=0;i<password.length();i++){
            passwordArray[i]=(char) (passwordArray[i]+25);
        }
       passwordChyper=String.valueOf(passwordArray);
       passwordChyperConcat=passwordChyper.concat(passwordChyper);
       return passwordChyperConcat;
    }

}
