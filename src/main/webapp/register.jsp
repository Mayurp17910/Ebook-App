<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book:Register</title>
<%@include file="All_Components/allCss.jsp"%>
<style type="text/css">
.card {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width:auto;
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
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">

	<%@include file="All_Components/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-3">
					<div class="card-body">
						<h4 class="text-center">Register</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>

						<form id="registerform" action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" required name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="tel" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" required name="phno">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required name="password">
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms & Conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button onclick="resetForm()" class="btn btn-danger ml-2">Reset</button>

							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div><br><br><br><br>
	<%@ include file="All_Components/footer.jsp"%>
	<script>
		function resetForm() {
			document.getElementById("registerform").reset();
		}
	</script>
</body>
</html>