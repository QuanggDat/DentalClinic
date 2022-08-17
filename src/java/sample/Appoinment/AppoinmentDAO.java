/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Appoinment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class AppoinmentDAO {

    private static final String INSERT = "INSERT INTO tblAppoinment_details (fullName, email, phoneNumber, appointment_date, note, serviceID, doctorID, wkID, status) VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String APPOINMENT_BY_DOCTORID = "SELECT * FROM tblAppoinment_details where doctorID=? AND status='not examined'";
    private static final String APPOINMENT_ALL_BY_DOCTORID = "SELECT * FROM tblAppoinment_details where doctorID=?";
    private static final String APPOINMENT_BY_APPOINMENTID = "SELECT * FROM tblAppoinment_details where appoinmentID=?";
    private static final String VIEW_ALL_APPOINMENT = "SELECT * FROM tblAppoinment_details";
    private static final String VIEW_PROCESSING_APPOINMENT = "SELECT * FROM tblAppoinment_details WHERE doctorID=? AND status='processing'";
    private static final String COUNT_APPOINMENT = "SELECT COUNT(appoinmentID) AS appoinmentID FROM tblAppoinment_details";
    private static final String APPOINMENT_BY_DATE_DOCTOR_ID = "SELECT * FROM tblAppoinment_details WHERE doctorID=? AND appointment_date LIKE ?";
    
    
    public boolean insert(String fullName, String email, String phoneNumber, Date Appoinment_date, String note, int serviceID, int doctorID, int wkID, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(INSERT);
            ptm.setString(1, fullName);
            ptm.setString(2, email);
            ptm.setString(3, phoneNumber);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            ptm.setString(4, df.format(Appoinment_date));
            ptm.setString(5, note);
            ptm.setInt(6, serviceID);
            ptm.setInt(7, doctorID);
            ptm.setInt(8, wkID);
            ptm.setString(9, status);

            check = ptm.executeUpdate() > 0 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return check;
        }
    }
    
    public List<AppoinmentDTO> countAppoinmentID() throws SQLException {
        List<AppoinmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(COUNT_APPOINMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int appoinmentID = rs.getInt("appoinmentID");
                    list.add(new AppoinmentDTO(appoinmentID));
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
    
    //get list appoinment by doctorID
    public List<AppoinmentDTO> getAppoinmentByDoctorID(int doctorID) throws SQLException {
        List<AppoinmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(APPOINMENT_BY_DOCTORID);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int appoinmentID = rs.getInt("appoinmentID");
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    Date appointment_date = rs.getDate("appointment_date");
                    String note = rs.getString("note");
                    int serviceID = rs.getInt("serviceID");
                    int wkID = rs.getInt("wkID");
                    String status = rs.getString("status");
                    list.add(new AppoinmentDTO(appoinmentID,fullName, email, phoneNumber, appointment_date, note, serviceID, doctorID, wkID, status));
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
    
    //get list all appoinment by doctorID
    public List<AppoinmentDTO> getAllAppoinmentByDoctorID(int doctorID) throws SQLException {
        List<AppoinmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(APPOINMENT_ALL_BY_DOCTORID);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int appoinmentID = rs.getInt("appoinmentID");
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    Date appointment_date = rs.getDate("appointment_date");
                    String note = rs.getString("note");
                    int serviceID = rs.getInt("serviceID");
                    int wkID = rs.getInt("wkID");
                    String status = rs.getString("status");
                    list.add(new AppoinmentDTO(appoinmentID, fullName, email, phoneNumber, appointment_date, note, serviceID, doctorID, wkID, status));
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
    
    //get list all processing appoinment by doctorID
    public List<AppoinmentDTO> getAllProcessingAppoinmentByDoctorID(int doctorID) throws SQLException {
        List<AppoinmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(VIEW_PROCESSING_APPOINMENT);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int appoinmentID = rs.getInt("appoinmentID");
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    Date appointment_date = rs.getDate("appointment_date");
                    String note = rs.getString("note");
                    int serviceID = rs.getInt("serviceID");
                    int wkID = rs.getInt("wkID");
                    String status = rs.getString("status");
                    list.add(new AppoinmentDTO(appoinmentID, fullName, email, phoneNumber, appointment_date, note, serviceID, doctorID, wkID, status));
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
    
    //get list feedback by time
    public List<AppoinmentDTO> getListAppoinmentByDate(int doctorID, String appoinment_date) throws SQLException {
        List<AppoinmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(APPOINMENT_BY_DATE_DOCTOR_ID);
                stm.setInt(1, doctorID);
                stm.setString(2, "%"+appoinment_date+"%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int appoinmentID = rs.getInt("appoinmentID");
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    Date appointment_date = rs.getDate("appointment_date");
                    String note = rs.getString("note");
                    int serviceID = rs.getInt("serviceID");
                    int wkID = rs.getInt("wkID");
                    String status = rs.getString("status"); 
                    list.add(new AppoinmentDTO(appoinmentID, fullName, email, phoneNumber, appointment_date, note, serviceID, doctorID, wkID, status));
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
    
    //get list appoinment
    public List<AppoinmentDTO> getAllAppoinment() throws SQLException {
        List<AppoinmentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(VIEW_ALL_APPOINMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int appoinmentID = rs.getInt("appoinmentID");
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    Date appointment_date = rs.getDate("appointment_date");
                    String note = rs.getString("note");
                    int serviceID = rs.getInt("serviceID");
                    int doctorID = rs.getInt("doctorID");
                    int wkID = rs.getInt("wkID");
                    String status = rs.getString("status");
                    list.add(new AppoinmentDTO(appoinmentID, fullName, email, phoneNumber, appointment_date, note, serviceID, doctorID, wkID, status));
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
    
    //Update Appoinment by ID
    public void updateAppoinmentByID(int appoinmentID) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblAppoinment_details "
                        + "SET status='processing' "
                        + " WHERE appoinmentID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, appoinmentID);
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
    
    //Update Appoinment by ID
    public void deleteAppoinmentByID(int appoinmentID) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblAppoinment_details "
                        + "SET status='deleted' "
                        + " WHERE appoinmentID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, appoinmentID);
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
    
    
}
