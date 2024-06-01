package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.BookOrdersimpl;
import com.DAO.CartDAOimpl;
import com.DB.DBConnect;
import com.entity.Book_Orders;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");

			String email = req.getParameter("email");

			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String payment = req.getParameter("cod");
			String orderstatus=req.getParameter("orderstatus");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
			List<Cart> blist = dao.getBookByUser(id);
			

			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Please Add Items to Cart");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrdersimpl dao2 = new BookOrdersimpl(DBConnect.getConn());

				Book_Orders o = null;

				ArrayList<Book_Orders> orderList = new ArrayList<Book_Orders>();
				Random r = new Random();

				for (Cart c : blist) {
					o = new Book_Orders();
					o.setOrder_id("BOOK-ORD-00" + r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPayment(payment);
				o.setOrderstatus(orderstatus);
					orderList.add(o);
				}

				if ("noselect".equals(payment)) {
					resp.sendRedirect("checkout.jsp");
					session.setAttribute("failedMsg", "Please Choose Payment Method");
				} else {
					boolean f = dao2.saveOrders(orderList);

					if (f) {

						resp.sendRedirect("orders_success.jsp");
					} else {
						System.out.println("order fail");
						resp.sendRedirect("checkout.jsp");
						session.setAttribute("failedMsg", "Your Orders Failed");
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
