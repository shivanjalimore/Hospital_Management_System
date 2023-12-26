package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Beans.Specialist;

public class ShowSpecialist {

	public List<Specialist> getAllSpecialist() throws SQLException{
		
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("select * from specialist");
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
