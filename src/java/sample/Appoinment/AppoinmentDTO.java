/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Appoinment;

import java.util.Date;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class AppoinmentDTO {
    private int appoinmentID;
    private String fullName;
    private String email;
    private String phoneNumber;
    private Date appointment_date;
    private String note;
    private int serviceID;
    private int doctorID;
    private int wkID;
    private String status;

    public AppoinmentDTO() {
    }

    public AppoinmentDTO(int appoinmentID, String fullName, String email, String phoneNumber, Date appointment_date, String note, int serviceID, int doctorID, int wkID, String status) {
        this.appoinmentID = appoinmentID;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.appointment_date = appointment_date;
        this.note = note;
        this.serviceID = serviceID;
        this.doctorID = doctorID;
        this.wkID = wkID;
        this.status = status;
    }
    public AppoinmentDTO(int appoinmentID) {
        this.appoinmentID = appoinmentID;
    }

    public int getAppoinmentID() {
        return appoinmentID;
    }

    public void setAppoinmentID(int appoinmentID) {
        this.appoinmentID = appoinmentID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(Date appointment_date) {
        this.appointment_date = appointment_date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public int getWkID() {
        return wkID;
    }

    public void setWkID(int wkID) {
        this.wkID = wkID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
       
}
