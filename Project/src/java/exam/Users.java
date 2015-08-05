/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package exam;

/**
 *
 * @author c0653616
 */
public class Users {
 int uid;
    String firstname;
    String lastname;
    String username;
    String emailid;
    String password;  
    
    public Users(){
        
    }
    
    
    public Users(String firstname,String lastname,String username,String emailid,String password){
        this.firstname=firstname;
        this.lastname=lastname;
        this.username=username;
        this.emailid=emailid;        
        this.password=password;
    }
    
    
    public int getUserId() {
        return uid;
    }

    public void setUserId(int uid) {
        this.uid = uid;
    }

    public String getFirstName() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastName() {
        return lastname;
    }

    public void setLastName(String lastname) {
        this.lastname = lastname;
    }

    public String getUserName() {
        return username;
    }

    public void setUserName(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmailId() {
        return emailid;
    }

    public void setEmailId(String emailid) {
        this.emailid = emailid;
    }
    
}
