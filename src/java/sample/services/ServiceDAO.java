/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.services;

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
public class ServiceDAO {

    private static final String ALL_SERVICE = "SELECT * FROM tblService WHERE status='Available'";
    private static final String DELETED_SERVICE = "SELECT * FROM tblService WHERE status='Deleted'";
    private static final String ONE_SERVICE = "SELECT * FROM tblService WHERE serviceID=?";
    private static final String COUNT_SERVICE = "SELECT COUNT(serviceID) AS serviceID FROM tblService";
    private static final String CREATE_NEW_SERVICE = "INSERT INTO tblService (serviceID, serviceName, demo, description1, description2, description3, title1, title2, title3, title1_img, title2_img, title3_img, service_img, status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    public List<ServiceDTO> getListAllService() throws SQLException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ALL_SERVICE);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String demo = rs.getString("demo");
                    String title1 = rs.getString("title1");
                    String title2 = rs.getString("title2");
                    String title3 = rs.getString("title3");
                    String description1 = rs.getString("description1");
                    String description2 = rs.getString("description2");
                    String description3 = rs.getString("description3");
                    String title1_img = rs.getString("title1_img");
                    String title2_img = rs.getString("title2_img");
                    String title3_img = rs.getString("title3_img");
                    String service_img = rs.getString("service_img");
                    list.add(new ServiceDTO(serviceID, serviceName, demo, title1, title2, title3, description1, description2, description3, title1_img, title2_img, title3_img, service_img));
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
    
    public List<ServiceDTO> countServiceID() throws SQLException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(COUNT_SERVICE);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int serviceID = rs.getInt("serviceID");
                    list.add(new ServiceDTO(serviceID));
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
    
    //Deleted service
    public List<ServiceDTO> getListAllDeletedService() throws SQLException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(DELETED_SERVICE);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String demo = rs.getString("demo");
                    String title1 = rs.getString("title1");
                    String title2 = rs.getString("title2");
                    String title3 = rs.getString("title3");
                    String description1 = rs.getString("description1");
                    String description2 = rs.getString("description2");
                    String description3 = rs.getString("description3");
                    String title1_img = rs.getString("title1_img");
                    String title2_img = rs.getString("title2_img");
                    String title3_img = rs.getString("title3_img");
                    String service_img = rs.getString("service_img");
                    list.add(new ServiceDTO(serviceID, serviceName, demo, title1, title2, title3, description1, description2, description3, title1_img, title2_img, title3_img, service_img));
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

    //update service
    public void updateService(int serviceID, String serviceName, String demo, String description1, String description2, String description3, String title1, String title2, String title3) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblService "
                        + "SET serviceName=?, demo=?, description1=?, description2=?, description3=?, title1=?, title2=?, title3=? "
                        + " WHERE serviceID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, serviceName);
                stm.setString(2, demo);
                stm.setString(3, description1);
                stm.setString(4, description2);
                stm.setString(5, description3);
                stm.setString(6, title1);
                stm.setString(7, title2);
                stm.setString(8, title3);
                stm.setInt(9, serviceID);
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
    
    //delete service by id
    public void deleteServiceByID(int serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblService "
                        + "SET status='Deleted'"
                        + " WHERE serviceID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, serviceID);
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
    
    //restore service by id
    public void restoreServiceByID(int serviceID) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblService "
                        + "SET status='Available'"
                        + " WHERE serviceID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, serviceID);
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
    
    //update service Img
    public void updateServiceImage(int serviceID, String title1_img, String title2_img, String title3_img, String service_img) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblService "
                        + "SET title1_img=?, title2_img=?, title3_img=?, service_img=? "
                        + " WHERE serviceID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, title1_img);
                stm.setString(2, title2_img);
                stm.setString(3, title3_img);
                stm.setString(4, service_img);
                stm.setInt(5, serviceID);
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

    //get service by ID
    public ServiceDTO getServiceByID(int id) throws SQLException {
        ServiceDTO service = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(ONE_SERVICE);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String demo = rs.getString("demo");
                    String title1 = rs.getString("title1");
                    String title2 = rs.getString("title2");
                    String title3 = rs.getString("title3");
                    String description1 = rs.getString("description1");
                    String description2 = rs.getString("description2");
                    String description3 = rs.getString("description3");
                    String title1_img = rs.getString("title1_img");
                    String title2_img = rs.getString("title2_img");
                    String title3_img = rs.getString("title3_img");
                    String service_img = rs.getString("service_img");
                    service = new ServiceDTO(serviceID, serviceName, demo, title1, title2, title3, description1, description2, description3, title1_img, title2_img, title3_img, service_img);
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
        return service;
    }
    
    //Create Service
    public boolean createNewService(int serviceID, String serviceName, String demo, String description1, String description2, String description3, String title1, String title2, String title3, String title1_img, String title2_img, String title3_img, String service_img, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CREATE_NEW_SERVICE);
            ptm.setInt(1, serviceID);
            ptm.setString(2, serviceName);
            ptm.setString(3, demo);
            ptm.setString(4, description1);
            ptm.setString(5, description2);
            ptm.setString(6, description3);
            ptm.setString(7, title1);
            ptm.setString(8, title2);
            ptm.setString(9, title3);
            ptm.setString(10, title1_img);
            ptm.setString(11, title2_img);
            ptm.setString(12, title3_img);
            ptm.setString(13, service_img);
            ptm.setString(14, status);
            check = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
