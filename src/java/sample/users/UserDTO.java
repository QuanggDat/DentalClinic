/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.users;

/**
 *
 * @author win
 */
public class UserDTO {

    protected int UserID;
    protected int age;
    protected String address;
    protected String email;
    protected int gender;
    protected String phoneNumber;
    protected String status;
    protected String img;
    protected String fullName;
    protected String bio;
    protected String userName;
    protected String password;
    protected int roleID;
    
    // Constructor

    public UserDTO() {
    }

    public UserDTO(int UserID, int age, String address, String email, int gender, String phoneNumber, String status, String img, String fullName, String bio, String userName, String password, int roleID) {
        this.UserID = UserID;
        this.age = age;
        this.address = address;
        this.email = email;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.status = status;
        this.img = img;
        this.fullName = fullName;
        this.bio = bio;
        this.userName = userName;
        this.password = password;
        this.roleID = roleID;
    }
    
    public UserDTO(String userName, String password, int roleID, String email) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }
    
    //setter & getter

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
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

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    

}
