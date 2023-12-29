package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Beans.Doctor;
import com.Beans.User;

public class UserInsert {

	public void insertUser(User user) throws SQLException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("insert into user_details(fullname,email,password)values(?,?,?)");
			ps.setString(1,user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			int result=ps.executeUpdate();
			
			if(result>0) {
		    	System.out.println("Registration successfully!!...");
		    }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	public User login(String email, String password) throws SQLException {
		// TODO Auto-generated method stub
		User u = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("select * from user_details where email=? and password=?");
			ps.setString(1,email);
			ps.setString(2, password);
			
			System.out.println("-----------------------------");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
			    u.setEmail(rs.getString(3));
			    u.setPassword(rs.getString(4));
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
		
	}

}
