<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="All_Components/allCss.jsp"%>
<style>
.card {
	display: flex;
	flex-direction: column;
	align-items: center;
	min-height: auto; /* Adjust as needed */
	max-width: auto; /* Adjusted maximum width */
	margin: auto;
	font-family: Arial, sans-serif;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 50px;
	background-color: #fff;
	transition: box-shadow 0.3s;
}

.card:hover {
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}

</style>
</head>
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="All_Components/navbar.jsp"%>
	<%
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bookid);
	%>
	<div class="container p-3">
		<div class="row p-5">
			<div class="col-md-6">
				<div class="card mb-4 mx-6">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoname()%>"
							style="height: 200px; width: 150px" class="card-img-top"
							alt="Book Image">
						<h4 class="card-title">
							Book Name: <span class="text-success"><%=b.getBookname()%></span>
						</h4>
						<h5 class="card-title">
							Author Name: <span class="text-danger"><%=b.getAuthor()%></span>
						</h5>
						<h5 class="card-title">
							Category Name: <span class="text-primary"><%=b.getBookCategory()%></span>
						</h5>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-4 mx-6">
					<div class="card-body text-center">
						<h2 style="color:green; font-weight: bold"><%=b.getBookname()%></h2>

						<%
						if ("Old".equals(b.getBookCategory())) {
						%>
						<h5 class="text-danger">Contact To Seller</h5>
						<h5 class="text-primary">
							<i class="fa-regular fa-envelope"></i> Email:<%=b.getUseremail()%></h5>
						<%
						}else{%>
						<h5 class="text-danger">Contact To Seller</h5>
						<h5 class="text-primary">
							<i class="fa-regular fa-envelope"></i> Email:admin@gmail.com
						</h5>
						<%}
						%>
						<div class="row">
							<div class="col-md-4 text-success p-2">
								<i class="fa-solid fa-money-bill-wave fa-3x"></i>
								<p>Cash On Delivery</p>
							</div>
							<div class="col-md-4 text-danger p-2">
								<i class="fa-solid fa-rotate-left fa-3x"></i>
								<p>Return Available</p>
							</div>
							<div class="col-md-4 text-primary p-2">
								<i class="fa-solid fa-truck fa-3x"></i>
								<p>Free Shipping</p>
							</div>
						</div>
						<%
						if ("Old".equals(b.getBookCategory())) {
						%>
						<div class="text-center p-3">
							<div class="row justify-content-center">
								<div class="col-md-6">
									<a href="" class="btn btn-secondary btn-block disabled"><i
										class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
								</div>
								<div class="col-md-6">
									<a href="index.jsp" class="btn btn-info btn-block "><i
										class="fa-solid fa-cart-plus"></i> Shopping</a>
								</div>
							</div>
						</div>
						<%
						} else {
						%>
						<div class="text-center p-3">

							<a href="" class="btn btn-secondary"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary  ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="All_Components/footer.jsp"%>
</body>
</html>
