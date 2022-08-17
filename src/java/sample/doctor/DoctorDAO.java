/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author win
 */
public class DoctorDAO {

    public static final String ALL_DOCTOR = "SELECT * FROM tblDoctors, tblUser where tblDoctors.userID =  tblUser.userID ";
    private static final String ONE_DOCTOR = "SELECT * FROM tblDoctors, tblUser where tblDoctors.userID =? AND tblUser.userID =?";
    private static final String COUNT_DOCTOR = "SELECT COUNT(doctorID) AS doctorID FROM tblDoctors";
    
    
    public List<DoctorDTO> getListAllDoctor() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ALL_DOCTOR);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("doctorID");
                    String level = rs.getString("level");
                    int experience_year = rs.getInt("experience_year");
                    String education = rs.getString("education");
                    int specialize = rs.getInt("specialize");
                    int wkID = rs.getInt("wkID");
                    int slot_book = rs.getInt("slot_book");
                    int userID = rs.getInt("userID");
                    int age = rs.getInt("age");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    int gender = rs.getInt("gender");
                    String phoneNumber = rs.getString("phoneNumber");
                    String status = rs.getString("status");
                    String img = rs.getString("img");
                    String fullName = rs.getString("fullName");
                    String bio = rs.getString("bio");
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    int roleID = rs.getInt("roleID");   
                    list.add(new DoctorDTO(id, level, experience_year, education, specialize, wkID, slot_book, userID, age, address, email, gender, phoneNumber, status, img, fullName, bio, userName, password, roleID));

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<DoctorDTO> countDoctorID() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(COUNT_DOCTOR);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int doctorID = rs.getInt("doctorID");
                    list.add(new DoctorDTO(doctorID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    //get service by ID
    public DoctorDTO getDoctorByID(int docid) throws SQLException {
        DoctorDTO doctor = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ONE_DOCTOR);
                stm.setInt(1, docid);
                stm.setInt(2, docid);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("doctorID");
                    String level = rs.getString("level");
                    int experience_year = rs.getInt("experience_year");
                    String education = rs.getString("education");
                    int specialize = rs.getInt("specialize");
                    int wkID = rs.getInt("wkID");
                    int slot_book = rs.getInt("slot_book");
                    int userID = rs.getInt("userID");
                    int age = rs.getInt("age");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    int gender = rs.getInt("gender");
                    String phoneNumber = rs.getString("phoneNumber");
                    String status = rs.getString("status");
                    String img = rs.getString("img");
                    String fullName = rs.getString("fullName");
                    String bio = rs.getString("bio");
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    int roleID = rs.getInt("roleID");   
                    doctor = new DoctorDTO(id, level, experience_year, education, specialize, wkID, slot_book, userID, age, address, email, gender, phoneNumber, status, img, fullName, bio, userName, password, roleID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return doctor;
    }
    
    //Update Slot_book
    public void updateSlot (int doctorID ,int slot_book) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblDoctors "
                        + "SET slot_book=? "
                        + " WHERE doctorID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, slot_book);
                stm.setInt(2, doctorID);
                stm.executeUpdate() ;
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }        
    }
    
    //Update working time for doctor
    public void updateWorkingTime(int doctorID ,int wkID) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblDoctors "
                        + "SET wkID=? "
                        + " WHERE doctorID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, wkID);
                stm.setInt(2, doctorID);
                stm.executeUpdate() ;
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }        
    }
    
    //update Role Doctor To User
    public void updateRoleDoctorToUser(int userID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + "SET roleID=3"
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userID);
                stm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }
    
    //update Role Doctor To User
    public void RestoreRoleDoctor(int userID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblUser "
                        + "SET roleID=4"
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userID);
                stm.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }
    public static void main(String[] args) throws SQLException {
        DoctorDAO dao = new DoctorDAO();
        List<DoctorDTO> list = dao.getListAllDoctor();

        for (DoctorDTO o : list) {
            System.out.println(o);
        }
    }

}
