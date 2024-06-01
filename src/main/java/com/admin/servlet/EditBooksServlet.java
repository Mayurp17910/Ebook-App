package com.admin.servlet;

import java.io.IOException;
import jakarta.servlet.http.HttpSession;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editbook")
public class EditBooksServlet extends  HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
            	int id=Integer.parseInt(req.getParameter("id"));
            	String bookname = req.getParameter("bookname");
    			String author = req.getParameter("authorname");
    			String price = req.getParameter("bookprice");
    			String status = req.getParameter("bookStatus");
    			
    			BookDtls b=new BookDtls();
    			b.setBookid(id);
    			b.setBookname(bookname);
    			b.setAuthor(author);
    			b.setPrice(price);
    			b.setStatus(status);
    			
    			BooksDAOimpl dao=new BooksDAOimpl(DBConnect.getConn());
    			boolean f=dao.updateEditBooks(b);
    			HttpSession session = req.getSession();
    			
    			if(f) {
    				
    				session.setAttribute("succMsg","Book Updated Successfully...");
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
