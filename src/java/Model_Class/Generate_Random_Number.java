/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model_Class;

import java.util.Random;

/**
 *
 * @author farzana
 */
public class Generate_Random_Number {
    private int randNumber;
    public int getRandomNumber(){
        Random rand = new Random();
            // Generate random integers in range 0 to 999
           randNumber = rand.nextInt(9999);
           return  randNumber;  
    }    
}
