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

</head>
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="All_Components/navbar.jsp"%>

	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i><br><br>
		<h1>Thank You!</h1>
		<h2>Your Order Placed Successfully!</h2>
		<h3>Within 7 Days Your Product Will Be Delivered On Your Address.</h3>
<br>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="orders.jsp" class="btn btn-danger mt-3">View Orders</a>
	</div>
	<br><br><br><br>

	<%@include file="All_Components/footer.jsp"%>


</body>
</html>