/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.doctor;

import sample.users.UserDTO;

/**
 *
 * @author win
 */
public class DoctorDTO extends UserDTO{

    private int id;
    private String level;
    private int experience_year;
    private String education;
    private int specialize;
    private int wkID;
    private int slot_book;

    public DoctorDTO() {
        super();
    }

    public DoctorDTO(int id, String level, int experience_year, String education, int specialize, int wkID, int slot_book, int UserID, int age, String address, String email, int gender, String phoneNumber, String status, String img, String fullName, String bio, String userName, String password, int roleID) {
        super(UserID, age, address, email, gender, phoneNumber, status, img, fullName, bio, userName, password, roleID);
        this.id = id;
        this.level = level;
        this.experience_year = experience_year;
        this.education = education;
        this.specialize = specialize;
        this.wkID = wkID;
        this.slot_book = slot_book;
    }

    public DoctorDTO(int id) {
        this.id = id;
    }
    
    
    //getter && setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getExperience_year() {
        return experience_year;
    }

    public void setExperience_year(int experience_year) {
        this.experience_year = experience_year;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public int getSpecialize() {
        return specialize;
    }

    public void setSpecialize(int specialize) {
        this.specialize = specialize;
    }

    public int getWkID() {
        return wkID;
    }

    public void setWkID(int wkID) {
        this.wkID = wkID;
    }

    public int getSlot_book() {
        return slot_book;
    }

    public void setSlot_book(int slot_book) {
        this.slot_book = slot_book;
    }

   
    
    
    
}
