package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Beans.Doctor;
import com.Beans.Specialist;

public class DoctorInsert {

	public void doctorInsert(Doctor doctor) throws SQLException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("insert into doctor(fullname,dob,qualification,specialist,email,mobNo,password)values(?,?,?,?,?,?,?)");
			ps.setString(1,doctor.getFullName());
			ps.setString(2,doctor.getDob());
			ps.setString(3,doctor.getQualification());
			ps.setString(4,doctor.getSpecialist());
			ps.setString(5,doctor.getEmail());
			ps.setString(6,doctor.getMobNo());
			ps.setString(7,doctor.getPassword());
			
			
			int result=ps.executeUpdate();
			if(result>0) {
		    	System.out.println("Registration successfully!!...");
		    }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor s = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");
			String sql = "select * from doctor";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Doctor();
				s.setId(rs.getInt(1));
				s.setFullName(rs.getString(2));
				s.setDob(rs.getString(3));
				s.setQualification(rs.getString(4));
				s.setSpecialist(rs.getString(5));
				s.setEmail(rs.getString(6));
				s.setMobNo(rs.getString(7));
				s.setPassword(rs.getString(8));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
