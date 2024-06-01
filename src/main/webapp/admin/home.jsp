<%@ page import="com.DAO.BooksDAOimpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
<!-- Include Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

* {
	padding: 0;
	margin: 0;
}

.content {
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 40vh;
}

.value {
	font-size: 40px;
	display: block;
	font-weight: bold;
	color: #fff;
}

.card {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 400px;
	margin: auto;
	font-family: Arial, sans-serif;
	border-radius: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 20px;
	background-color: #fff;
	transition: box-shadow 0.3s;
}

.crd-ho:hover {
	background-color: #e8dfe4;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body
	style="background-image: url('loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<center>
		<h1 style="color: black font-bold">
			<i class="fa-solid fa-user-tie"></i> <br>Hello, Admin!
		</h1>
	</center>

	<div class="container text-center">
		<div class="row justify-content-center p-2">
			<div class="col-md-2" style="margin-bottom: 15px;">
				<div
					style="background: linear-gradient(to bottom, #0000FF, #87CEEB); width: 100%; padding-top: 80%; position: relative;">
					<div
						style="position: absolute; top: 0; bottom: 0; left: 0; right: 0; display: flex; align-items: center; justify-content: center; color: white;">
						<div>
							<h5 style="display: inline; font-weight: bold;">New Books</h5>
							<div class="value" akhi="008">-50</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2" style="margin-bottom: 15px;">
				<div
					style="background: linear-gradient(to bottom, #008000, #ADFF2F); width: 100%; padding-top: 80%; position: relative;">
					<div
						style="position: absolute; top: 0; bottom: 0; left: 0; right: 0; display: flex; align-items: center; justify-content: center; color: white;">
						<div>
							<h5 style="display: inline; font-weight: bold;">Old Books</h5>
							<div class="value" akhi="008">-50</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2" style="margin-bottom: 15px;">
				<div
					style="background: linear-gradient(to bottom, #FFFF00, #FFD700); width: 100%; padding-top: 80%; position: relative;">
					<div
						style="position: absolute; top: 0; bottom: 0; left: 0; right: 0; display: flex; align-items: center; justify-content: center; color: white;">
						<div>
							<h5 style="display: inline; font-weight: bold;">Active Books</h5>
							<div class="value" akhi="16">-50</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2" style="margin-bottom: 15px;">
				<div
					style="background: linear-gradient(to bottom, #FF0000, #FF6347); width: 100%; padding-top: 80%; position: relative;">
					<div
						style="position: absolute; top: 0; bottom: 0; left: 0; right: 0; display: flex; align-items: center; justify-content: center; color: white;">
						<div>
							<h5 style="display: inline; font-weight: bold;">Inactive
								Books</h5>
							<div class="value" akhi="1">-50</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container p-3 ">
    <div class="row justify-content-center mb-0"> <!-- Added justify-content-center class -->
			<div class="col-md-3">
				<a href="allusers.jsp">
					<div class="card  crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-users fa-3x text-secondary"></i><br>
							<h4>All Users</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<div class="container p-0">
		<div class="row p-5 mt-0">
			<div class="col-md-3">
				<a href="addbooks.jsp">
					<div class="card  crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="allbooks.jsp">
					<div class="card  crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-3x text-success"></i><br>
							<h4>All Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card  crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="javascript:void(0)" onclick="redirectToOrdersAndPrint()">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<i class="fas fa-print fa-3x text-danger"></i><br>
							<h4>Print Orders</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Alert!!!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you want to logout???</h4>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
						<a href="../logout" type="button" class="btn btn-danger">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
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
    // Function to trigger number counting animation
    const counters = document.querySelectorAll('.value');
    const speed = 200;

    counters.forEach(counter => {
        const animate = () => {
            const value = +counter.getAttribute('akhi');
            const data = +counter.innerText;

            const time = value / speed;
            if (data < value) {
                counter.innerText = Math.ceil(data + time);
                setTimeout(animate, 1);
            } else {
                counter.innerText = value;
            }
        }

        animate();
    });
</script>
	<script>
    // Function to redirect to the orders page and add query parameter
    function redirectToOrdersAndPrint() {
        // Redirect to the orders page with query parameter
        window.location.href = "orders.jsp?print=true";
    }
</script>
</body>
</html>
