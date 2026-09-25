package com.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.org.util.DBConnection;

public class OrderDAO {
	public static boolean placeOrder(int userId, double total) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement(
                            "insert into orders(user_id,total) values(?,?)");
            ps.setInt(1, userId);
            ps.setDouble(2, total);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<String[]> getOrders(int userId) {
        List<String[]> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement(
                            "select * from orders where user_id=?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new String[] {
                        rs.getString("id"),
                        rs.getString("total"),
                        rs.getString("order_date")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}