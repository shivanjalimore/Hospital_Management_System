package com.Controller;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Beans.Doctor;
import com.DAO.DoctorInsert;


/**
 * Servlet implementation class UpdateDoctor
 */
@WebServlet("/UpdateDoctor")
public class UpdateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctor() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String qualification = request.getParameter("qualification");
		String spec = request.getParameter("spec");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		String password = request.getParameter("password");
		
		Doctor doctor = new Doctor();
		doctor.setId(id);
		doctor.setFullName(name);
		doctor.setDob(dob);
		doctor.setQualification(qualification);
		doctor.setSpecialist(spec);
		doctor.setEmail(email);
		doctor.setMobNo(mobno);
		doctor.setPassword(password);
		
		DoctorInsert udoctor = new DoctorInsert();
		HttpSession session = request.getSession();
		try {
			 if(udoctor.updateDoctor(doctor))
			 {
			 session.setAttribute("succMsg","Doctor info updated sucessfully");
			response.sendRedirect("admin/doctor.jsp");
			 }
			 else
			 {
				 session.setAttribute("errorMsg","Something wrong on server");
					response.sendRedirect("admin/doctor.jsp");
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
