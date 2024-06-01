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

.order-status-update {
	margin: 10px 0;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f9f9f9;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.status-update-form {
	display: flex;
	align-items: center;
}

.status-select {
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
	font-size: 16px;
}

.update-button {
	margin-left: 10px;
	padding: 8px 16px;
	border: none;
	border-radius: 3px;
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.update-button:hover {
	background-color: #0056b3;
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

	<div class="card p-5 mt-4 ml-4 mr-4">
		<h5 class="text-center">ORDERS</h5>
		<table class="table">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Phone No</th>
					<th scope="col">Address</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col"><center>Set Order Status</center></th>

				</tr>
			</thead>
			<tbody>


				<%
				User u = (User) session.getAttribute("userobj");
				BookOrdersimpl dao = new BookOrdersimpl(DBConnect.getConn());
				List<Book_Orders> blist = dao.getAllBookOrders();
				for (Book_Orders b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrder_id()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getPhno()%></td>
					<td><%=b.getFulladd()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPayment()%></td>

					<!-- Inside the table loop -->
					<td>
						<div class="order-status-update">
							<form action="UpdateOrderStatusServlet" method="post"
								class="status-update-form">
								<input type="hidden" name="orderId" value="<%=b.getOrder_id()%>">
								 <select name="trackStatus" class="status-select">
                                    <option value="Not Found" <%= ("Not Found".equals(b.getOrderstatus()) || ("Not Found".equals(session.getAttribute("selectedStatus_" + b.getOrder_id())))) ? "selected" : "" %>>Not Found</option>
                                    <option value="Packed" <%= ("Packed".equals(b.getOrderstatus()) || ("Packed".equals(session.getAttribute("selectedStatus_" + b.getOrder_id())))) ? "selected" : "" %>>Packed</option>
                                    <option value="Shipped" <%= ("Shipped".equals(b.getOrderstatus()) || ("Shipped".equals(session.getAttribute("selectedStatus_" + b.getOrder_id())))) ? "selected" : "" %>>Shipped</option>
                                    <option value="On The Way" <%= ("On The Way".equals(b.getOrderstatus()) || ("On The Way".equals(session.getAttribute("selectedStatus_" + b.getOrder_id())))) ? "selected" : "" %>>On The Way</option>
                                    <option value="Delivered" <%= ("Delivered".equals(b.getOrderstatus()) || ("Delivered".equals(session.getAttribute("selectedStatus_" + b.getOrder_id())))) ? "selected" : "" %>>Delivered</option>
                                </select>
								<button type="submit" class="update-button">Update</button>
							</form>
						</div>
					</td>

				</tr>
				<%
				}
				%>


			</tbody>
		</table>
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
	<script>
    // Function to check if query parameter is present in URL
    function getParameterByName(name, url) {
        if (!url)
            url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex
                .exec(url);
        if (!results)
            return null;
        if (!results[2])
            return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    // Check if print query parameter is present
    var printParam = getParameterByName('print');
    if (printParam === 'true') {
        // Trigger printing process
        window.print();
    }

    // Store selected status in local storage
    document.addEventListener('DOMContentLoaded', function() {
        var selectElements = document.querySelectorAll('.status-select');
        selectElements.forEach(function(selectElement) {
            var orderId = selectElement.parentNode.querySelector('input[name="orderId"]').value;
            var storedStatus = localStorage.getItem('selectedStatus_' + orderId);
            if (storedStatus) {
                selectElement.value = storedStatus;
            }

            selectElement.addEventListener('change', function() {
                localStorage.setItem('selectedStatus_' + orderId, this.value);
            });
        });
    });
</script>

</body>
</html>