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
public class Saving_Account_Info {
    private String sid;
    private String url;
    private String userName;
    private String password;
    private String sQestion;
    private String sQAnswer;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getsQestion() {
        return sQestion;
    }

    public void setsQestion(String sQestion) {
        this.sQestion = sQestion;
    }

    public String getsQAnswer() {
        return sQAnswer;
    }

    public void setsQAnswer(String sQAnswer) {
        this.sQAnswer = sQAnswer;
    }
    
}

   