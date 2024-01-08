package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Beans.Doctor;


public class DoctorInsert {

	public boolean doctorInsert(Doctor doctor) throws SQLException {
		boolean f = false;
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
				f = true;
		    	System.out.println("Registration successfully!!...");
		    }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}
	
	//To show all list
	
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
	
	
	// For Edit Page
	
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
        
    // -------------------------------- For Update Doctor Data in Database ----------------------
        
        public boolean updateDoctor(Doctor doctor) throws SQLException {
    		boolean f = false;
    		
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");
    			
//    			System.out.println("Update ...");
    			
    			PreparedStatement ps = con.prepareStatement("update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobNo=?,password=?  where id=?; ");
    			ps.setString(1,doctor.getFullName());
    			ps.setString(2,doctor.getDob());
    			ps.setString(3,doctor.getQualification());
    			ps.setString(4,doctor.getSpecialist());
    			ps.setString(5,doctor.getEmail());
    			ps.setString(6,doctor.getMobNo());
    			ps.setString(7,doctor.getPassword());
    			ps.setInt(8,doctor.getId());
    			
    	//System.out.println(" ID : "+newuser.getId());
    			System.out.println("-----------------------------");
    			int result=ps.executeUpdate();
    			
    			if(result>0) {
    				f=true;
    		    	System.out.println("Updated Successfully!!...");
    		    }
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
			return f;
    		
    		
    	}

        public boolean deleteDoctor(int id) throws SQLException
        {
        	boolean f = false;
        	
        	try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");
    			
//    			System.out.println("Update ...");
    			
    			PreparedStatement ps = con.prepareStatement("delete from doctor where id=?");
    			ps.setInt(1,id);
    			
    	//System.out.println(" ID : "+newuser.getId());
    			System.out.println("-----------------------------");
    			int result=ps.executeUpdate();
    			
    			if(result>0) {
    				f=true;
    		    	System.out.println("deleted Successfully!!...");
    		    }
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        	
        	
        	return f;
        }

        
        //--------------------------- for doctor login ---------------------
        
        public Doctor login(String email,String password) throws SQLException
        {
        	Doctor d = null;
        	
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
				
				
				PreparedStatement ps= con.prepareStatement("select * from doctor where email=? and password=?");
				ps.setString(1,email);
				ps.setString(2, password);
				
				System.out.println("-----------------------------");
				ResultSet rs =ps.executeQuery();
				while(rs.next())
				{
					d = new Doctor();
					d.setId(rs.getInt(1));
					d.setFullName(rs.getString(2));
					d.setDob(rs.getString(3));
					d.setQualification(rs.getString(4));
					d.setSpecialist(rs.getString(5));
					d.setEmail(rs.getString(6));
					d.setMobNo(rs.getString(7));
					d.setPassword(rs.getString(8));
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return d;
			
			
			
        }
        
        
        public int countDoctor() throws SQLException
        {
        	int i =0;
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
				
				
				PreparedStatement ps= con.prepareStatement("select * from doctor");
				ResultSet rs= ps.executeQuery();
				while(rs.next())
				{
					i++;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return i;
        }
        
        public int countAppointment() throws SQLException
        {
        	int i =0;
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
				
				
				PreparedStatement ps= con.prepareStatement("select * from appointment");
				ResultSet rs= ps.executeQuery();
				while(rs.next())
				{
					i++;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return i;
        }
        
        public int countUser() throws SQLException
        {
        	int i =0;
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
				
				
				PreparedStatement ps= con.prepareStatement("select * from user_details");
				ResultSet rs= ps.executeQuery();
				while(rs.next())
				{
					i++;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return i;
        }
        
        public int countSpecialist() throws SQLException
        {
        	int i =0;
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
				
				
				PreparedStatement ps= con.prepareStatement("select * from specialist");
				ResultSet rs= ps.executeQuery();
				while(rs.next())
				{
					i++;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return i;
        }
        
        public int countAppointmentByDoctorID(int did) throws SQLException
        {
        	int i =0;
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
				
				
				PreparedStatement ps= con.prepareStatement("select * from appointment where doctorId=?");
				ps.setInt(1, did);
				ResultSet rs= ps.executeQuery();
				while(rs.next())
				{
					i++;
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return i;
        }
        
        
}
