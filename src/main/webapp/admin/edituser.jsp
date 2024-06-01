<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Account Info</title>
<%@include file="allCss.jsp"%>
<style>
/* Custom card styling */
.card-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
}

.card {
    width: 100%; /* Ensure the card takes full width */
    max-width: 600px; /* Adjust the width as needed */
    padding: 20px;
    border-radius: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    background-color: #ffffff;
    transition: box-shadow 0.3s;
}

.card:hover {
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-image: url('loginbg.png'); background-size: cover; background-position: center; margin: 0;">
    <%@include file="navbar.jsp"%>
    <div class="card-container p-3 justify-content:center">
        <div class="card p-5">
            <div class="card-body p-3">
                <h4 class="text-center" style="color: blue;">Edit Account Info</h4>
                
                <%
                // Retrieve user information from request parameter
                int id = Integer.parseInt(request.getParameter("id"));
                UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
                User u = dao.getUserById(id);
                %>

                <form action="../edituser" method="post" class="text-center">
                    <input type="hidden" name="id" value="<%=u.getId()%>">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" class="form-control" id="Name" name="name" value="<%=u.getName()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%=u.getEmail()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="phonenum">Phone Number</label>
                        <input type="tel" class="form-control" id="phno" name="phno" value="<%=u.getPhno()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%=u.getPassword()%>" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div style="margin-top: 4px;">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
