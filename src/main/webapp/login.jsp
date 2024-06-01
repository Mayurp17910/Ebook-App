<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book:Login</title>
<%@include file="All_Components/allCss.jsp"%>

<script src="https://www.google.com/recaptcha/api.js" async defer>
	
</script>
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
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<%@include file="All_Components/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-3">
					<div class="card-body">
						<h5 class="text-center">Login</h5>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>
						<form id="loginform" action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required
									name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required name="password"><br>
								<label for="toggleCheckbox"> <input type="checkbox"
									id="toggleCheckbox" onchange="togglePasswordVisibility()">
									Show Password
								</label>
							</div>
							<div class="g-recaptcha"
								data-sitekey="6LcHfNEpAAAAAKpP3fBrsuugCDYhVZNRNRG24i8X"></div>

							<!--Site Key-6LcHfNEpAAAAAKpP3fBrsuugCDYhVZNRNRG24i8X

							Secrete Key-6LcHfNEpAAAAAMRCm4n145_wP2zi7m8h1Xygelff

							 -->
							<br> <br>
							<div class="row">
								<div class="col text-center">
									<button type="submit" class="btn btn-primary"
										onclick="executeRecaptcha()">Submit</button>
									<button onclick="resetForm()" class="btn btn-danger ml-2">Reset</button>
									<br> <br> <a href="register.jsp">Create Account</a>
								</div>
							</div>

						</form>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>
						<c:if test="${not empty succsMsg}">
							<p class="text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>
<br><br><br><br>

	<%@include file="All_Components/footer.jsp"%>
	<script>
		function togglePasswordVisibility() {
			var passwordInput = document
					.getElementById("exampleInputPassword1");
			var toggleCheckbox = document.getElementById("toggleCheckbox");

			passwordInput.type = toggleCheckbox.checked ? "text" : "password";
		}
	</script>
	<script>
		function resetForm() {
			document.getElementById("loginform").reset();
		}
	</script>


</body>
</html>