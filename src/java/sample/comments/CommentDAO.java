/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.comments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class CommentDAO {
    private static final String INSERT = "INSERT INTO tblComments (name, rate, contentCmt, status, userID, doctorID, cmtDate) VALUES (?,?,?,?,?,?,?)";
    private static final String ALL_FEEDBACK = "SELECT * FROM tblComments, tblUser where tblComments.userID = tblUser.userID AND tblComments.status='Unavailable'";
    private static final String ALL_DELETED_FEEDBACK = "SELECT * FROM tblComments, tblUser where tblComments.userID = tblUser.userID AND tblComments.status='Deleted'";
    private static final String ALL_AVAILABLE_FEEDBACK = "SELECT * FROM tblComments, tblUser where tblComments.userID = tblUser.userID AND tblComments.status='Available'";
    private static final String FEEDBACK_UNAVAILABLE_BY_DOCTORID = "SELECT * FROM tblComments where doctorID=? AND status='Unavailable'";
    private static final String FEEDBACK_AVAILABLE_BY_DOCTORID = "SELECT * FROM tblComments where doctorID=? AND status='Available'";
    private static final String FEEDBACK_DELETED_BY_DOCTORID = "SELECT * FROM tblComments where doctorID=? AND status='Deleted'";
    private static final String FEEDBACK_BY_DOCTORID = "SELECT * FROM tblComments where doctorID=? AND status='Available'";
    private static final String FEEDBACK_BY_TIME = "SELECT * FROM tblComments WHERE cmtDate LIKE ? AND status='Unavailable'";
    private static final String FEEDBACK_BY_TIME_DOCTOR = "SELECT * FROM tblComments WHERE doctorID=? AND cmtDate LIKE ?";
    private static final String COUNT_COMMENT = "SELECT COUNT(CommentID) AS CommentID FROM tblComments";
    
    public boolean insert(CommentDTO comment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(INSERT);
            ptm.setString(1, comment.getName());
            ptm.setInt(2, comment.getRate());
            ptm.setString(3, comment.getContentCmt());
            ptm.setString(4,comment.getStatus());
            ptm.setInt(5, comment.getUserID());
            ptm.setInt(6, comment.getDoctorID());
            ptm.setString(7, comment.getCmtTime());
          
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
    public List<CommentDTO> countCommentID() throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(COUNT_COMMENT);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int CommentID = rs.getInt("CommentID");
                    list.add(new CommentDTO(CommentID));
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
    // Get all comment
    public List<CommentDTO> getListAllFeedback() throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ALL_FEEDBACK);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    int doctorID = rs.getInt("doctorID");
                    String cmtDate = rs.getString("cmtDate");
                    String status = rs.getString("status");                    
                    list.add(new CommentDTO(commentID,name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    // Get all deleted comment
    public List<CommentDTO> getListAllDeletedFeedback() throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ALL_DELETED_FEEDBACK);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    int doctorID = rs.getInt("doctorID");
                    String cmtDate = rs.getString("cmtDate");
                    String status = rs.getString("status");                    
                    list.add(new CommentDTO(commentID,name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    // Get all deleted comment
    public List<CommentDTO> getListAllAvailableFeedback() throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ALL_AVAILABLE_FEEDBACK);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    int doctorID = rs.getInt("doctorID");
                    String cmtDate = rs.getString("cmtDate");
                    String status = rs.getString("status");                    
                    list.add(new CommentDTO(commentID,name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    //get list feedback by doctorID
    public List<CommentDTO> getFeedbackByDoctorID(int doctorID) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FEEDBACK_BY_DOCTORID);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    String cmtDate = rs.getString("cmtDate");   
                    String status = rs.getString("status");   
                    list.add(new CommentDTO(commentID, name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    public List<CommentDTO> getListFeedbackByTime(String cmtDate) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FEEDBACK_BY_TIME);
                stm.setString(1, "%"+cmtDate+"%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");  
                    String status = rs.getString("status");   
                    int doctorID = rs.getInt("doctorID");   
                    list.add(new CommentDTO(commentID, name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    public List<CommentDTO> getListFeedbackByTimeDoctor(int doctorID, String cmtDate) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FEEDBACK_BY_TIME_DOCTOR);
                stm.setInt(1, doctorID);
                stm.setString(2, "%"+cmtDate+"%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");  
                    String status = rs.getString("status");  
                    list.add(new CommentDTO(commentID, name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    //get list feedback by doctorID
    public List<CommentDTO> getFeedbackUnavailableByDoctorID(int doctorID) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FEEDBACK_UNAVAILABLE_BY_DOCTORID);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    String cmtDate = rs.getString("cmtDate");   
                    String status = rs.getString("status");   
                    list.add(new CommentDTO(commentID, name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    //get list feedback by doctorID
    public List<CommentDTO> getFeedbackDeletedByDoctorID(int doctorID) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FEEDBACK_DELETED_BY_DOCTORID);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    String cmtDate = rs.getString("cmtDate");   
                    String status = rs.getString("status");   
                    list.add(new CommentDTO(commentID, name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    //get list feedback by doctorID
    public List<CommentDTO> getFeedbackAvailableByDoctorID(int doctorID) throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(FEEDBACK_AVAILABLE_BY_DOCTORID);
                stm.setInt(1, doctorID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("CommentID");
                    String name = rs.getString("name");
                    int rate = rs.getInt("rate");
                    String contentCmt = rs.getString("contentCmt");
                    int userID = rs.getInt("userID");
                    String cmtDate = rs.getString("cmtDate");   
                    String status = rs.getString("status");   
                    list.add(new CommentDTO(commentID, name, rate, contentCmt, userID, doctorID, cmtDate, status));
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
    
    //Delete feedback
    public void deleteFeedbackByID(int commentID) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblComments "
                        + "SET status='Deleted' "
                        + " WHERE CommentID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, commentID);
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
    
    //Update feedback by ID
    public void updateFeedbackByID(int commentID) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblComments "
                        + "SET status='Available' "
                        + " WHERE CommentID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, commentID);
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
    
    //Restore feedback by ID
    public void restoreFeedbackByID(int commentID) throws SQLException {
        
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblComments "
                        + "SET status='Unavailable' "
                        + " WHERE CommentID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, commentID);
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
    
    public static void main(String[] args) throws SQLException {
        CommentDAO dao = new CommentDAO();
        List<CommentDTO> list = dao.getFeedbackByDoctorID(2);
        for (CommentDTO o : list) {
            System.out.println(o);
        }
    }
}
