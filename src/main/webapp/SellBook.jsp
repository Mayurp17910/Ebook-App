<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Your Book</title>
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
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="All_Components/navbar.jsp"%>
	<div class="container p-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<h4 class="text-center text-primary">Sell Book</h4>


						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="add_old_book" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email}" name="user">

							<div class="form-group">
								<label for="bookName">Book Name</label> <input type="text"
									class="form-control" id="bookName" name="bookname" required>
							</div>
							<div class="form-group">
								<label for="authorName">Author Name</label> <input type="text"
									class="form-control" id="authorName" name="authorname" required>
							</div>
							<div class="form-group">
								<label for="bookPrice">Price</label> <input type="number"
									class="form-control" id="bookPrice" name="bookprice" required>
							</div>
							<div class="form-group">
								<label for="bookCategory">Book Category</label> <select
									id="bookCategory" name="bookCategory"
									class="form-control text-center" required>
									<option selected hidden>---Select---</option>
									<option value="Old">Old</option>
									<option disabled value="New">New</option>
								</select>
							</div>
							<div class="form-group">
								<label for="fileUpload">Upload Photo</label> <input type="file"
									class="form-control text-center" name="fileUpload"
									id="fileUpload" required>
							</div>
							<div class="form-group text-center">
								<button type="submit" class="btn btn-success">Sell Book</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="All_Components/footer.jsp"%>
</body>
</html>
