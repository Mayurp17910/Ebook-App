<%@page import="com.DAO.BooksDAOimpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="All_Components/allCss.jsp"%>
<style type="text/css">
.card {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 600px;
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
<body
	style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<%@include file="All_Components/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>
	<div class="container p-3">
		<div class="card bg-white mt-4">
			<div class="card-body">
				<div class="text-center text-secondary">
					<h4>All Old Books</h4>
				</div>


				<table class="table boder-1px solid black">
					<thead class="bg-primary text-black">
						<tr>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Category</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						User u = (User) session.getAttribute("userobj");
						String useremail = u.getEmail();
						BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
						List<BookDtls> list = dao.getBookByOld(useremail, "old");
						for (BookDtls b : list) {
						%>
						<tr>

							<td><%=b.getBookname()%></td>
							<td><%=b.getAuthor()%></td>

							<td><%=b.getPrice()%></td>
							<td><%=b.getBookCategory()%></td>

							<td><a
								href="delete_old_book?email=<%=useremail%>&&id=<%=b.getBookid()%>"
								class="btn btn-sm btn-danger">Delete</a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="text-center">
					<a href="delete_all_old_books" class="btn btn-sm btn-danger">Delete
						All</a>
				</div>
				
				<script>
					function deleteAllBooks() {
						if (confirm("Are you sure you want to delete all books?")) {
							// AJAX call to delete all books
							var xhr = new XMLHttpRequest();
							xhr.onreadystatechange = function() {
								if (xhr.readyState === 4 && xhr.status === 200) {
									// Refresh the page after successful deletion
									location.reload();
								}
							};
							xhr.open("GET", "delete_all_books", true);
							xhr.send();
						}
					}
				</script>
				<br>
			</div>
		</div>
	</div><br><br><br><br><br><br><br><br><br><br>
	<%@include file="All_Components/footer.jsp"%>

</body>
</html>