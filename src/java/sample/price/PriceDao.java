/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.price;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.price.PriceDto;
import sample.utils.DBUtils;

/**
 *
 * @author SE150435 Nguyen Quoc Bao Long
 */
public class PriceDao {

    private static final String ALL_PRICE = "SELECT [ID], [name] ,[price] FROM tblPrice_list";

    public List<PriceDto> getPriceByServiceId() throws SQLException {
        List<PriceDto> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();

            stm = conn.prepareStatement(ALL_PRICE);
            rs = stm.executeQuery();
            if (rs != null) {
                list = new ArrayList<>();
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    PriceDto dto = new PriceDto(id, name, price);
                    list.add(dto);
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

}
