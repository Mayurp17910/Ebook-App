package com.user.servlet;

import java.io.IOException;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBooksServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
        String email=req.getParameter("email");
        int id=Integer.parseInt(req.getParameter("id"));
        
        
        BooksDAOimpl dao=new BooksDAOimpl(DBConnect.getConn());
        boolean f=dao.OldBookDelete(email, "Old",id);
		
        HttpSession session = req.getSession();

		if (f) {

			session.setAttribute("succMsg", "Old Book Deleted Successfully");
			resp.sendRedirect("OldBooks.jsp");
		} else {
			session.setAttribute("failedMsg", "Somthing Went Wrong On Server");
			resp.sendRedirect("OldBooks.jsp");
		}
        
        
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
