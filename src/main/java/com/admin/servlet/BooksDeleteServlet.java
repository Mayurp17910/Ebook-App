package com.admin.servlet;

import java.io.IOException;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			BooksDAOimpl dao=new BooksDAOimpl(DBConnect.getConn());
			boolean f=dao.deleteBooks(id);
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("succMsg","Book Deleted Successfully...");
				resp.sendRedirect("admin/allbooks.jsp");
			}else {
				session.setAttribute("failedMsg","Somthing Went Wrong...");
				resp.sendRedirect("admin/allbooks.jsp");
			
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
