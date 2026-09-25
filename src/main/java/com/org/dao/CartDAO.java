package com.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.org.util.DBConnection;


public class CartDAO {

	  public static boolean addCart(int userId, int bookId) {
	        try (Connection con = DBConnection.getConnection()) {
	            PreparedStatement ps =
                    con.prepareStatement(
                            "insert into cart(user_id,book_id) values(?,?)");
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<String[]> getCart(int userId) {
        List<String[]> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement(
                            "select c.id,b.name,b.category,b.price " +
                            "from cart c join books b " +
                            "on c.book_id=b.id where c.user_id=?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new String[] {
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean remove(int cartId) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement(
                            "delete from cart where id=?");
            ps.setInt(1, cartId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}