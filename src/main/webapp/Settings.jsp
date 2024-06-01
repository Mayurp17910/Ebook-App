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
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
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
    	background-color: #e8dfe4;
    
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="All_Components/navbar.jsp"%>
	<div class="container ">
		<h3 class="text-center p-2">
			<i class="fa-solid fa-user-check fa-2x"></i>
		</h3>
		<h3 class="text-center">Hello, ${userobj.name}!</h3>
		<div class="row p-3">
			<div class="col-md-4">
				<a href="SellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-4x"></i>
							</div>

							<h3 class="text-center">Sell Old Books</h3>
						</div>

					</div>

				</a>
			</div>
			<div class="col-md-4">
				<a href="OldBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-pen-to-square fa-4x"></i>
							</div>

							<h3 class="text-center">Edit Old Books</h3>
						</div>

					</div>

				</a>
			</div>
			
			
			<div class="col-md-4">
				<a href="profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user-pen fa-4x"></i>
							</div>

							<h3 class="text-center">Edit Profile</h3>
						</div>

					</div>

				</a>
			</div>

			

			<div class="col-md-6 mt-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-solid fa-box-open fa-4x"></i>
							</div>

							<h3 class="text-center">My Orders</h3>
							<p>Track Your Orders</p>
						</div>

					</div>

				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="support.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-headset fa-4x"></i>
							</div>

							<h3 class="text-center">Help Center</h3>
							<p>24 X 7 Service</p>
						</div>

					</div>

				</a>
			</div>


		</div>

	</div>

	<br>
	<br>
	<%@include file="All_Components/footer.jsp"%>
<script>
        document.addEventListener('DOMContentLoaded', function () {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl, {
                    customClass: 'tooltip-custom'
                })
            })
        });
    </script>
</body>
</html>