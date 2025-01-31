/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author chanu
 */
public class User {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String role;

    public User() {
    }

    public User(String email, String password) {
        this.email = email;
        this.password = MD5.getMd5(password);
    }

    public User(String firstname, String lastname, String email, String password, String role) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = MD5.getMd5(password);
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getRole() {
        return role;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public boolean register(Connection con){
        try {
            String query="INSERT INTO user(firstname,lastname,email,password,role)VALUES(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,this.firstname);
            pstmt.setString(2,this.lastname);
            pstmt.setString(3,this.email);
            pstmt.setString(4,this.password);
            pstmt.setString(5,this.role);
            return pstmt.executeUpdate()>0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean authenticate(Connection con){
         try {
            String query="SELECT id,password FROM user WHERE email=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,this.email);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                String db_password=rs.getString("password");
                if(db_password.equals(this.password)){
                    int user_id = rs.getInt("id");
                    this.setId(user_id);
                    return true;
                }else{
                    return false;
                }
                
            }else{
                return false;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
      public User getUserById(Connection con) {
        try {
            String query = "SELECT firstName,lastName,role FROM user WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1,this.id);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                this.setFirstname(rs.getString("firstName"));
                this.setLastname(rs.getString("lastName"));
                this.setRole(rs.getString("role"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return this;
   } 
}
