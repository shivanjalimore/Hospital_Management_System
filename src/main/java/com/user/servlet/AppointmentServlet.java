package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Beans.Appointment;
import com.DAO.AppointmentDAO;

/**
 * Servlet implementation class InsertAppointment
 */
@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userID = Integer.parseInt(request.getParameter("userid"));
		String fullname = request.getParameter("fullname");
		String age = request.getParameter("age");
		String gender =  request.getParameter("gender");
		String appoinDate = request.getParameter("appointment_date");
		String email = request.getParameter("email");
		String phNo = request.getParameter("phone");
		String diseases = request.getParameter("diseases");
		int doctorId = Integer.parseInt(request.getParameter("doctor"));
		String address = request.getParameter("address");
		
		
		Appointment ap = new Appointment();
		ap.setUserId(userID);
		ap.setFullName(fullname);
		ap.setGender(gender);
		ap.setAge(age);
		ap.setAppoinDate(appoinDate);
		ap.setEmail(email);
		ap.setPhNo(phNo);
		ap.setDiseases(diseases);
		ap.setDoctorId(doctorId);
		ap.setAddress(address);
		ap.setStatus("Pending");
		
		AppointmentDAO dao = new AppointmentDAO();
		HttpSession session = request.getSession();
		
		try {
			if(dao.addAppointment(ap))
			{
				session.setAttribute("succMsg","Appointment Added Sucsessfully");
				response.sendRedirect("appointment.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","Something wrong on server");
				response.sendRedirect("appointment.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	

	



}
