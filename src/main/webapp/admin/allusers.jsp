<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOimpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All_Books</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.card {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: auto;
	margin: auto;
	font-family: Arial, sans-serif;
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 20px;
	background-color: #fff;
	transition: box-shadow 0.3s;
}

card:hover {
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>
	
	<div class="card p-5 ml-4 mr-4 mt-4">

		<h5 class="text-center">All USERS</h5>
		<c:if test="${not empty succMsg }">
			<p class="text-center text-success">${succMsg}</p>
		</c:if>
		<c:remove var="succMsg" scope="session" />
		<c:if test="${not empty failedMsg }">
			<p class="text-center text-danger">${failedMsg}</p>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<div class="table text-center">
			<table class="table table-striped boder-1px solid black">
				<thead class="bg-dark text-white">
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone Number</th>
						<th scope="col">Password</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<tbody>
					<%
					UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
					List<User> userlist = dao.getAllUsers();
					for (User user : userlist) {
					%>
					<tr>
						<td><%=user.getId()%></td>
						<td><%=user.getName()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getPhno()%></td>
						<td><%=user.getPassword()%></td>
						<td><a href="edituser.jsp?id=<%=user.getId()%>"
							class="btn btn-sm btn-primary"><i
								class="fa-solid fa-pen-to-square"></i> Edit</a> <a
							href="../deleteuser?id=<%=user.getId()%>"
							class="btn btn-sm btn-danger"><i
								class="fa-solid fa-trash-can"></i> Delete</a></td>
					</tr>
					</tr>
					<%
					}
					%>



				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="margin-top: 4px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>