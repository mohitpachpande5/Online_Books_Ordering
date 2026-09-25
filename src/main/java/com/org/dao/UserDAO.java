package com.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.org.util.DBConnection;

public class UserDAO {
	public static boolean register(String name,String email,String pass) {
		try(Connection con=DBConnection.getConnection()) {
			PreparedStatement ps=con.prepareStatement(
					"insert into users(name,email,password) "
					+ "values (?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pass);
			return ps.executeUpdate()>0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String[] login(String email,String pass) {
		try(Connection con=DBConnection.getConnection()) {
			PreparedStatement ps=con.prepareStatement("select * from users "
					+ "where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) 
				return new String[] {rs.getString("id"),rs.getString("name")};
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
