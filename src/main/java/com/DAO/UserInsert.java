package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

}
