package com.doctor.servlet;

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
 * Servlet implementation class DoctorLogin
 */
@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLogin() {
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
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		DoctorInsert dao = new DoctorInsert();
		Doctor doctor;
		try {
			doctor = dao.login(email, password);
			if(doctor != null)
			{
				session.setAttribute("doctObj", doctor);
				response.sendRedirect("doctor/doctor_index.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "invalid email and password");
				response.sendRedirect("doctor_login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
