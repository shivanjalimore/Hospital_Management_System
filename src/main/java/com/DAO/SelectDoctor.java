package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Beans.Doctor;

public class SelectDoctor {

	public Doctor selectDoctor(int id) throws SQLException {
		
		Doctor existingDoctor=null;
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("select * from doctor where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				existingDoctor = new Doctor();
				existingDoctor.setId(rs.getInt(1));
				existingDoctor.setFullName(rs.getString(2));
				existingDoctor.setDob(rs.getString(3));
				existingDoctor.setQualification(rs.getString(4));
				existingDoctor.setSpecialist(rs.getString(5));
				existingDoctor.setEmail(rs.getString(6));
				existingDoctor.setMobNo(rs.getString(7));
				existingDoctor.setPassword(rs.getString(8));
	             System.out.println("Doctor Retrieved: " + existingDoctor.getFullName());
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	 return existingDoctor;

}
	
}
