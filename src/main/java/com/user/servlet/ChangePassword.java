package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserInsert;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
		
		int uid = Integer.parseInt(request.getParameter("id"));
		String oldPassword = request.getParameter("oldpassword");
		String newPassword = request.getParameter("newpassword");
		
		UserInsert dao = new UserInsert();
		HttpSession session = request.getSession();
		
		try {
			if(dao.checkOldPassword(uid, oldPassword))
			{
				if(dao.changePassword(uid, newPassword))
				{
					session.setAttribute("succMsg", "Password Changed Sucessfully");
				}
				else
				{
					session.setAttribute("errorMsg", "Something wrong on server");
				}
			}
			else
			{
				session.setAttribute("errorMsg", "Old Password Is Incorrect");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
