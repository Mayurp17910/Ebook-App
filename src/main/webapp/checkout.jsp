<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />

	</c:if>
	<div class="container-fluid ml-4 mr-4">
		<div class="row p4 mr-4">
			<div class="col-md-6">
				<div class="card bg-white mt-4 ">
					<div class="card-body">
						<h3 class="text-center text-primary">Your Selected Items</h3>

						<div class="table-container">
							<table class="table  boder-1px solid black">
								<thead class="bg-dark text-white">
									<tr>
										<th scope="col">Book Name</th>
										<th scope="col">Author</th>
										<th scope="col">Price</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									User u = (User) session.getAttribute("userobj");
									CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
									List<Cart> cart = dao.getBookByUser(u.getId());
									Double totalPrice = 0.00;
									for (Cart c : cart) {
									%><tr>
										<th scope="row"><%=c.getBookName()%></th>
										<td><%=c.getAuthor()%></td>
										<td><%=c.getPrice()%></td>
										<td><a
											href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
											class="btn btn-sm btn-danger">Remove</a></td>
									</tr>
									<%
									totalPrice += c.getPrice(); // Add the price of each book to the total price

									}
									%>
									<tr>
										<th>Total Price</th>
										<td></td>
										<td></td>
										<td><%=totalPrice%></td>
									</tr>
								</tbody>
							</table>
							<div class="text-center">
								<button class="btn btn-primary" id="print" disabled>Print</button>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<div class="card bg-white mt-4 mb-5">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>
						<form action="orders" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputname"
										value="<%=u.getName()%>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputemail"
										value="<%=u.getEmail()%>" readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input type="tel"
										name="phno" class="form-control" id="inputphone"
										value="<%=u.getPhno()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputaddress" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputlandmark"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputcity" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputstate" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input
										type="number" name="pincode" class="form-control"
										id="inputpin" required>
								</div>
							</div>
							<div class="form-group text-center">
								<label>Payment Mode</label> <select
									class="form-control text-center" name="cod" id="paymentMod">
									<option value="noselect">---Select---</option>
									<option value="cod">Cash On Delivery</option>
									<option value="online" disabled>Online</option>
								</select>
							</div>
							<br>
							<div class="text-center">

								<button class="btn btn-warning" id="order">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>




	<%@include file="All_Components/footer.jsp"%>
	<script>
    document.addEventListener('DOMContentLoaded', function() {
        var tooltipTriggerList = [].slice.call(document
            .querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList
            .map(function(tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl, {
                    customClass : 'tooltip-custom'
                })
            });

        var paymentMode = document.getElementById('paymentMod');
        var printButton = document.getElementById('print');

        paymentMode.addEventListener('change', function() {
            if (paymentMode.value !== 'noselect') {
                printButton.disabled = false;
            } else {
                printButton.disabled = true;
            }
        });

        printButton.addEventListener('click', function() {
            window.print(); // Trigger print functionality
        });
    });
</script>

	
</body>
</html>