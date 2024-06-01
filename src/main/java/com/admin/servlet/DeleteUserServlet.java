package com.admin.servlet;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteuser")
public class DeleteUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
            boolean deleted = dao.UserDelete(id);

            HttpSession session = req.getSession();

            if (deleted) {
                session.setAttribute("succMsg", "User Deleted Successfully");
            } else {
                session.setAttribute("failedMsg", "Failed to delete user");
            }
            resp.sendRedirect("admin/allusers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }
}
