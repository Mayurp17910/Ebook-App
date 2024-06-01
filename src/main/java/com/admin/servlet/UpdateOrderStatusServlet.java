package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookOrdersimpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String orderId = request.getParameter("orderId");
	    String trackStatus = request.getParameter("trackStatus");
	    HttpSession session = request.getSession();


	    // Assuming you have a session object available
	    BookOrdersimpl dao = new BookOrdersimpl(DBConnect.getConn());
	    boolean success = dao.updateOrderStatus(orderId, trackStatus);

	    if (success) {
	        session.setAttribute("succMsg", "Status Updated Successfully...");
	    } else {
	        session.setAttribute("failedMsg", "Something Went Wrong...");
	    }
	    response.sendRedirect("orders.jsp");
	}
}