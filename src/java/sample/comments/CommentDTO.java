/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comments;

import java.util.Date;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class CommentDTO {
    private int commentID;
    private String name;
    private int rate;
    private String contentCmt;
    private String status;
    private int userID;
    private int doctorID;
    private String cmtTime;

    public CommentDTO() {
    }

    public CommentDTO(int commentID, String name,int rate, String contentCmt, int userID, int doctorID, String cmtTime, String status) {
        this.commentID = commentID;
        this.name = name;
        this.rate = rate;
        this.contentCmt = contentCmt;
        this.userID = userID;
        this.doctorID = doctorID;
        this.cmtTime = cmtTime;
        this.status = status;
    }
    
    public CommentDTO(int commentID) {
        this.commentID = commentID;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getContentCmt() {
        return contentCmt;
    }

    public void setContentCmt(String contentCmt) {
        this.contentCmt = contentCmt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getCmtTime() {
        return cmtTime;
    }

    public void setCmtTime(String cmtTime) {
        this.cmtTime = cmtTime;
    }

 
    
    
}
