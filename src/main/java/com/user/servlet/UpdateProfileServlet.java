package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phone"); // Corrected parameter name
		String password = req.getParameter("password");
		
		User us = new User();
		us.setId(id);
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phno);
		
		HttpSession session=req.getSession();
		
		UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
		boolean f = dao.checkPassword(id, password);
		if (f) {
			boolean f2=dao.updateProfile(us);
			
			if (f2) {
				session.setAttribute("succMsg","User Profile Updated Successfully...");
				resp.sendRedirect("profile.jsp");
				
				
			} else {

				session.setAttribute("failedMsg","Something Went Wront On Server");
				resp.sendRedirect("profile.jsp");
			}
			
			
			
			
		} else {
			session.setAttribute("failedMsg","Your Password is Incorrect?");
			resp.sendRedirect("profile.jsp");
			
			
		}

	}

}
