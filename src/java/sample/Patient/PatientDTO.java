/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Patient;

import java.util.Date;
import sample.users.UserDTO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class PatientDTO extends UserDTO{
    private int patientID;
    private String note;
    private String pt_status;
    private Date re_examination_date;

    public PatientDTO() {
        super();
    }   

    public PatientDTO(int patientID, String note, String pt_status, Date re_examination_date, int UserID, int age, String address, String email, int gender, String phoneNumber, String status, String img, String fullName, String bio, String userName, String password, int roleID) {
        super(UserID, age, address, email, gender, phoneNumber, status, img, fullName, bio, userName, password, roleID);
        this.patientID = patientID;
        this.note = note;
        this.pt_status = pt_status;
        this.re_examination_date = re_examination_date;
    }
    
    
    //getter && setter
    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRe_examination_date() {
        return re_examination_date;
    }

    public void setRe_examination_date(Date re_examination_date) {
        this.re_examination_date = re_examination_date;
    }
    
    
    
}
