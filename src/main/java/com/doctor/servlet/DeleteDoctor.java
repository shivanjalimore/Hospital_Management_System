package com.doctor.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.*;

/**
 * Servlet implementation class DeletedDoctor
 */
@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDoctor() {
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
     
     // creating object of DoctorInsert DAO 
     DoctorInsert dao = new DoctorInsert();
     HttpSession session = request.getSession();
     try {
    	 //calling deleteDoctor method passing parameter id
		if(dao.deleteDoctor(id))
		{
			session.setAttribute("succMsg", "Doctor delete successfully");
			response.sendRedirect("admin/doctor.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("admin/doctor.jsp");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
	}

}
