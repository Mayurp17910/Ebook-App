package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.BooksDAOimpl;
import com.DAO.CartDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
           int bid=Integer.parseInt(req.getParameter("bid"));
           int uid=Integer.parseInt(req.getParameter("uid"));
      
            BooksDAOimpl dao=new BooksDAOimpl(DBConnect.getConn());
            BookDtls b=dao.getBookById(bid);
            
            Cart c= new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookname());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));
            
           CartDAOimpl dao2=new CartDAOimpl(DBConnect.getConn());
           boolean f=dao2.addCart(c);
           
           HttpSession session=req.getSession();
           
           if(f)
           {
        	   session.setAttribute("addCart", "Book Added to Cart");
        	   resp.sendRedirect("AllNewBooks.jsp");
           }else {
        	   session.setAttribute("failed", "Somthing Wrong on Server???");
        	   resp.sendRedirect("AllNewBooks.jsp");
           }
            
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
