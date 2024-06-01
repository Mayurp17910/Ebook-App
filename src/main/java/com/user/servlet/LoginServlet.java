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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
			HttpSession session=req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");
		
			String gRecaptchaResponse = req.getParameter("g-recaptcha-response"); // Retrieve CAPTCHA response

           // Verify CAPTCHA
           boolean captchaVerified = verifyCaptcha(gRecaptchaResponse);

            if (!captchaVerified) {
               session.setAttribute("failedMsg", "Please complete the CAPTCHA verification.");
                resp.sendRedirect("login.jsp");
               return;
          }

			if ("admin@gmail.com".equals(email) && "admin@123".equals(password)) {
				User us=new User();
				us.setName("Admin-Mayur Sir!!!");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			    session.setAttribute("succMsg", "Welcome, Admin!");

				
			} else {
				  User us=dao.login(email, password);
				if (us != null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				   // session.setAttribute("succMsg", "Welcome, User!");


				}else {
					session.setAttribute("failedMsg", "Email & Password Invalid???");
		     		resp.sendRedirect("login.jsp");
				
				
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

	}
	private boolean verifyCaptcha(String gRecaptchaResponse) {
	       
	       return gRecaptchaResponse != null && !gRecaptchaResponse.isEmpty();
	  }

}
