package com.admin.servlet;

import java.io.IOException;


import com.DAO.BooksDAOimpl;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edituser")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");

            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setEmail(email);
            u.setPhno(phno);
            u.setPassword(password);

            UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
            boolean f = dao.updateEditUser(u);
            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "User Updated Successfully...");
                resp.sendRedirect("admin/allusers.jsp");
            } else {
                session.setAttribute("failedMsg", "Something Went Wrong...");
                resp.sendRedirect("admin/allusers.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle the case where the ID parameter is not a valid integer
            e.printStackTrace(); // Log the error for debugging
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID provided: " + e.getMessage());
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace(); // Log the error for debugging
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error: " + e.getMessage());
        }

    }
}
