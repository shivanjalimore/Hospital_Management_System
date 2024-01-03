package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Beans.Appointment;

public class AppointmentDAO {

	public boolean addAppointment(Appointment ap) throws SQLException
	{
		boolean f=false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("insert into appointment(userId,fullName,gender,age,appoinDate,email,phNo,diseases,doctorId,address,status)values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,ap.getUserId());
			ps.setString(2,ap.getFullName());
			ps.setString(3,ap.getGender());
			ps.setString(4,ap.getAge());
			ps.setString(5,ap.getAppoinDate());
			ps.setString(6,ap.getEmail());
			ps.setString(7,ap.getPhNo());
			ps.setString(8,ap.getDiseases());
			ps.setInt(9,ap.getDoctorId());
			ps.setString(10,ap.getAddress());
			ps.setString(11,ap.getStatus());
			
			
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
	
	public List<Appointment> getAllAppointmentByLoginUser(int userId) throws SQLException
	{
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("select * from appointment where userId=?");
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);	
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
				
	}
	
	
	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) throws SQLException
	{
		List<Appointment> list = new ArrayList<>();
		Appointment ap = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("select * from appointment where doctorId=?");
			ps.setInt(1, doctorId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);	
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
				
	}
	
	
	public Appointment getAllAppointmentById(int id) throws SQLException
	{
		
		Appointment ap = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("select * from appointment where id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ap;
				
	}
	
	public boolean updateCommentStatus(int id,int doctId,String comm) throws SQLException
	{
		boolean f=false;
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root");		
			
			
			PreparedStatement ps= con.prepareStatement("UPDATE appointment SET status = ? WHERE id = ? AND doctorId = ?;");
			ps.setString(1, comm);
			ps.setInt(2,id);
			ps.setInt(3, doctId);
			
			
			int result=ps.executeUpdate();
			if(result>0) {
				f = true;
		    	System.out.println("Update successfully!!...");
		    }
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return f;
	}
}
