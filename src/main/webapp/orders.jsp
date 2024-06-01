<%@page import="com.entity.Book_Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrdersimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All_Books</title>
<%@include file="All_Components/allCss.jsp"%>
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

	<%@include file="All_Components/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>



	<div class="card p-5 mt-4 ml-4 mr-4">
		<h5 class="text-center">MY ORDERS</h5>
		<table class="table table-striped">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Order Status</th>

				</tr>
			</thead>
			<tbody>


				<%
				User u = (User) session.getAttribute("userobj");
				BookOrdersimpl dao = new BookOrdersimpl(DBConnect.getConn());
				List<Book_Orders> blist = dao.getBook(u.getEmail());
				for (Book_Orders b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrder_id()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPayment()%></td>
					<td><%=dao.getOrderStatus(b.getOrder_id())%></td>
					<!-- Fetch order status using order_id -->

				</tr>
				<%
				}
				%>


			</tbody>
		</table>
		<br>
	<br>
	<br>
	<br>
	<br>
		<a href="trackorder.jsp" class="btn btn-success"> <i class="fa-solid fa-location-crosshairs"></i> Track Your Status
	</a>
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
		<%@include file="All_Components/footer.jsp"%>
	</div>
</body>
</html>