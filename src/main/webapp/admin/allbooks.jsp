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
	<div class="card p-5 ml-4 mr-4 mt-4">

		<h5 class="text-center">All BOOKS</h5>
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
						<th scope="col">No</th>
						<th scope="col">Image</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Category</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
					List<BookDtls> list = dao.getAllBooks();
					for (BookDtls b : list) {
						// Check if the status is inactive
						boolean inactive = b.getStatus().equalsIgnoreCase("inactive");
					%>
					<tr <%if (inactive) {%> style="background-color: yellow;" <%}%>>
						<td><%=b.getBookid()%></td>
						<td><img src="../book/<%=b.getPhotoname()%>"
							style="width: 50px; height: 50px"></td>
						<td><%=b.getBookname()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getBookCategory()%></td>
						<td><%=b.getStatus()%></td>
						<td><a href="editbook.jsp?id=<%=b.getBookid()%>"
							class="btn btn-sm btn-primary"> <i
								class="fa-solid fa-pen-to-square"></i> Edit
						</a> <a href="../delete?id=<%=b.getBookid()%>"
							class="btn btn-sm btn-danger"> <i
								class="fa-solid fa-trash-can"></i> Delete
						</a></td>
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