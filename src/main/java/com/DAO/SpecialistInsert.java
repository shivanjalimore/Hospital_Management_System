package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Beans.Specialist;

public class SpecialistInsert {
//	private Connection con;
	
	public boolean SpecialistInsert(Specialist s) throws SQLException {
	     boolean f=false;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
		
		
		PreparedStatement ps= con.prepareStatement("insert into specialist(spec_name) values(?)");
		ps.setString(1,s.getSpecialistName());
		
		
		int result=ps.executeUpdate();
		
		if(result>0) {
	    	System.out.println("Specialist Inserted Successfully!!...");
	    	f=true;
	    }
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return f;
		
	}
	
	public List<Specialist> getAllSpecialist() {
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");
			String sql = "select * from specialist";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
