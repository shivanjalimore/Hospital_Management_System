package com.Controller;

import java.io.IOException;
import java.sql.SQLException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Beans.Doctor;
import com.DAO.DoctorInsert;

/**
 * Servlet implementation class AddDoctor
 */
@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctor() {
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
		String fullname = request.getParameter("fullname");
		String dob = request.getParameter("dob");
		String qualification = request.getParameter("qualification");
		String spec = request.getParameter("spec");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		String password = request.getParameter("password");
		
		Doctor doctor = new Doctor();
		doctor.setFullName(fullname);
		doctor.setDob(dob);
		doctor.setQualification(qualification);
		doctor.setSpecialist(spec);
		doctor.setEmail(email);
		doctor.setMobNo(mobno);
		doctor.setPassword(password);
		
		DoctorInsert dinsert = new DoctorInsert();
		
		HttpSession session = request.getSession();
		try {
			 if(dinsert.doctorInsert(doctor))
			 {
			 session.setAttribute("succMsg","Doctor Added Sucessfully");
			// Get the RequestDispatcher for the "doctor.jsp" page
//			 RequestDispatcher dispatcher = request.getRequestDispatcher
			 response.sendRedirect("admin/doctor.jsp");	 
//			 ("admin/doctor.jsp");
			 // Forward the request to the target JSP page using RequestDispatcher
//			    dispatcher.forward(request, response);
			
			 }
			 else
			 {
				 session.setAttribute("errorMsg","Something wrong on server");
				 
				 response.sendRedirect("admin/doctor.jsp");	
				 
//				 RequestDispatcher dispatcher = request.getRequestDispatcher("admin/doctor.jsp");
//				 dispatcher.forward(request, response);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
