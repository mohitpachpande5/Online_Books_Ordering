package com.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.org.util.DBConnection;

public class BookDAO {
	
	public static boolean addBook(String name,String category,double price) {
		try(Connection con=DBConnection.getConnection()) {
			PreparedStatement ps=con.prepareStatement(
					"insert into books(name,category,price) "
					+ "values (?,?,?)");
			ps.setString(1, name);
			ps.setString(2, category);
			ps.setDouble(3, price);
			return ps.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static List<String[]> getBooks() {
		List<String[]> list=new ArrayList<String[]>();
		try(Connection con=DBConnection.getConnection()) {
			ResultSet rs=con.createStatement()
					.executeQuery("select * from books");
			
			while(rs.next()) {
				list.add(new String[] {
						rs.getString("id"),
						rs.getString("name"),
						rs.getString("category"),
						rs.getString("price")
				});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
