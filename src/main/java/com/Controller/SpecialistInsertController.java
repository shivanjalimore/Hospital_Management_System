package com.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Beans.Specialist;
import com.DAO.SpecialistInsert;

/**
 * Servlet implementation class SpecialistInsertController
 */
@WebServlet("/SpecialistInsertController")
public class SpecialistInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpecialistInsertController() {
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
		
		String Sname = request.getParameter("Sname");
		
		System.out.println(Sname);
		
		Specialist s = new Specialist();
		s.setSpecialistName(Sname);
		
		SpecialistInsert sinsert = new SpecialistInsert();
		try {
			boolean f = sinsert.SpecialistInsert(s);
			HttpSession session = request.getSession();
			
			if(f)
			{
				session.setAttribute("errorMsg", "Specialist Added");
				response.sendRedirect("admin/adminindex.jsp");
			}
			else
			{
				session.setAttribute("errorMsg","Something wrong on server");
				response.sendRedirect("admin/adminindex.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
