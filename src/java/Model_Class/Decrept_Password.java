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
public class Decrept_Password {
    
    private String password;
    private String passwordlwr;
    private String passwordDecipher;
    private char[] passwordCiperArray;
    private String passwordChyperSub;
    private int i;
    private int lenHalf;
    
    public String getDecreptpassword(String password){
        this.password=password;
        lenHalf=password.length()/2;
        passwordChyperSub=password.substring(0, lenHalf);
        passwordCiperArray=passwordChyperSub.toCharArray();
        for(i=0;i<passwordChyperSub.length();i++){
            passwordCiperArray[i]=(char) (passwordCiperArray[i]-25);
        }
        passwordDecipher=String.valueOf(passwordCiperArray);
        passwordlwr=passwordDecipher.toLowerCase();
        
       return passwordlwr;
    }
 }
