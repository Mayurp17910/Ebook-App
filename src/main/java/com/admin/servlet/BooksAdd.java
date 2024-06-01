package com.admin.servlet;

import java.io.IOException;
import java.io.File;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addbooks")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			String bookname = req.getParameter("bookname");
			String author = req.getParameter("authorname");
			String price = req.getParameter("bookprice");
			String category = req.getParameter("bookCategory");
			String status = req.getParameter("bookStatus");
			Part part = req.getPart("fileUpload");
			String filename = part.getSubmittedFileName();
			BookDtls b = new BookDtls(bookname, author, price, category, status, filename, "admin");
			BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
			
			//String path = getServletContext().getRealPath("");

			boolean f = dao.addBooks(b);
			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + File.separator + "book";
				File file = new File(path);
				part.write(path + File.separator + filename);

				session.setAttribute("succMsg", "Book Added Successfully...");
				;
				resp.sendRedirect("admin/addbooks.jsp");
			} else {
				session.setAttribute("failedMsg", "Somthing Went Wrong???");
				;
				resp.sendRedirect("admin/addbooks.jsp");

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
