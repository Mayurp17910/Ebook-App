<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Index</title>
<%@include file="All_Components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("images/background.png");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s;
}

.crd-ho:hover {
	background-color: #e8dfe4;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}
</style>

</head>
<body style="background-color: #f7f7f7">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="All_Components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">
			<i class="fa-solid fa-book p-3"></i> E-Book Management System
		</h2>
	</div>
	<!-- -Start Recent Book -->
	<div class="container-fluid ">
		<h3 class="text-center">Recent Books</h3>
		<div class="row p-3">

			<%
			BooksDAOimpl dao0 = new BooksDAOimpl(DBConnect.getConn());
			List<BookDtls> list0 = dao0.getRecentBooks();
			for (BookDtls b : list0) {
			%><div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
						
						<div class="row">
							<a href="viewbooks.jsp?bookid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-2">View Details <i
								class="fa-regular fa-eye"></i></a> <a href=""
								class="btn btn-success ml-4"> Pay <%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						} else {
						%>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
							<a href="viewbooks.jsp?bookid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1">View Details <i
								class="fa-regular fa-eye"></i></a> <a href=""
								class="btn btn-success ml-1 "><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						}
						%>
						</p>


					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="AllRecentBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!--End Recent Books  -->




	<!-- NewBooks -->
	<hr>
	<div class="container-fluid ">
		<h3 class="text-center">New Books</h3>
		<div class="row p-3">

			<%
			BooksDAOimpl dao1 = new BooksDAOimpl(DBConnect.getConn());

			List<BookDtls> list1 = dao1.getNewBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>

							<a href="viewbooks.jsp?bookid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1">View Details <i
								class="fa-regular fa-eye"></i></a> <a href=""
								class="btn btn-success ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-3">
			<a href="AllNewBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<hr>
	<!-- -Start Old Book -->
	<div class="container-fluid ">
		<h3 class="text-center">Old Books</h3>
		<div class="row p-3">

			<%
			BooksDAOimpl dao2 = new BooksDAOimpl(DBConnect.getConn());

			List<BookDtls> list2 = dao2.getOldBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="viewbooks.jsp?bookid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-3">View Details <i
								class="fa-regular fa-eye"></i></a> <a href=""
								class="btn btn-success ml-3"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<a href="AllOldBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<%@include file="All_Components/footer.jsp"%>

	<!--Old Recent Books  -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var tooltipTriggerList = [].slice.call(document
					.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList
					.map(function(tooltipTriggerEl) {
						return new bootstrap.Tooltip(tooltipTriggerEl, {
							customClass : 'tooltip-custom'
						})
					})
		});
	</script>
</body>
</html>