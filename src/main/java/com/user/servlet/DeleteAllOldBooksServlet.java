package com.user.servlet;

import java.io.IOException;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delete_all_old_books")
public class DeleteAllOldBooksServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        HttpSession session = req.getSession();
	        User user = (User) session.getAttribute("userobj");
	        String useremail = user.getEmail();
	        
	        BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
	        boolean f = dao.deleteAllOldBooksByUser(useremail);
	        
	        if (f) {
	            session.setAttribute("succMsg", "All Old Books Deleted Successfully");
	        } else {
	            session.setAttribute("failedMsg", "Failed to delete all old books");
	        }
	        
	        resp.sendRedirect("OldBooks.jsp");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}