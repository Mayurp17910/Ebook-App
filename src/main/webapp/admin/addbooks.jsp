<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin:Add Books</title>
    <%@include file="allCss.jsp"%>
    <style type="text/css">
    .card-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
    .card {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 600px;
	
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
<body style="background-image: url('loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
    <%@include file="navbar.jsp"%>
    <c:if test="${empty userobj }">
			<c:redirect url="../login.jsp"/>
			</c:if>
			<br><br><br><br><br>
    <div class="container p-3">
        <div class="row p-5">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center" style="color:blue">ADD BOOKS</h4><br><br>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
                        <c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
                       </c:if>
						
                        <form action="../addbooks" method="post" enctype="multipart/form-data">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="bookName">Book Name</label> 
                                    <input type="text" class="form-control" id="bookName" name="bookname" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="authorName">Author Name</label> 
                                    <input type="text" class="form-control" id="authorName" name="authorname"required>
                                </div><br>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="bookPrice">Price</label> 
                                    <input type="number" class="form-control" id="bookPrice" name="bookprice"required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bookCategory">Book Category</label> 
                                    <select id="bookCategory" name="bookCategory" class="form-control"required>
                                        <option selected disabled hidden>---Select---</option>
                                        <option value="New">New</option>
                                        <option value="Old">Old</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="bookStatus">Book Status</label> 
                                    <select id="bookStatus" name="bookStatus" class="form-control"required>
                                        <option selected disabled hidden>---Select---</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="fileUpload">Upload Photo</label> 
                                    <input type="file" class="form-control" name="fileUpload" id="fileUpload"required>
                                </div>
                            </div><br><br>
                            <center><button type="submit" class="btn btn-primary">Add</button></center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><br><br><br><br><br><br><br>
    <div style="margin-top:4px">	<%@include file="footer.jsp"%>
	</div>
</body>
</html>
