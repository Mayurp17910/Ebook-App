<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<%@include file="All_Components/allCss.jsp"%>

<style>
/* Profile Card Styles */
.profile-card {
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

.profile-card:hover {
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}

/* Profile Image Styles */
.profile-image-container {
	position: relative;
	margin-bottom: 20px;
}

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	border: 4px solid blue; /* Ensure a white border around the image */
	transition: transform 0.5s;
}

.profile-image:hover {
	transform: scale(1.1); /* Scale up the image on hover */
}

/* Edit Icon Styles */
.edit-icon {
	position: absolute;
	bottom: 5px;
	right: 5px;
	color: #fff;
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 50%;
	padding: 5px;
	cursor: pointer;
	opacity: 0; /* Initially hidden */
	transition: opacity 0.3s;
}

.profile-image-container:hover .edit-icon {
	opacity: 1; /* Show on hover */
}

/* Profile Details Styles */
.profile-details {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.profile-details input[type="text"], .profile-details input[type="email"],
	.profile-details input[type="tel"], .profile-details input[type="password"]
	{
	width: calc(100% - 20px); /* Adjust width as needed */
	margin-bottom: 10px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	display: block;
}

.profile-details .form-group {
	margin-bottom: 10px;
}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var editButton = document.getElementById("edit-button");
		var nameField = document.getElementById("name");
		var emailField = document.getElementById("email");
		var phoneField = document.getElementById("phone");
		var passwordField = document.getElementById("password");

		editButton.addEventListener("click", function(event) {
			event.preventDefault(); // Prevent form submission

			if (nameField.disabled) {
				// Enable input fields
				nameField.removeAttribute("disabled");
				emailField.removeAttribute("disabled");
				phoneField.removeAttribute("disabled");
				passwordField.removeAttribute("disabled");
			} else {
				// Disable input fields
				nameField.setAttribute("disabled", true);
				emailField.setAttribute("disabled", true);
				phoneField.setAttribute("disabled", true);
				passwordField.setAttribute("disabled", true);
			}
		});
	});
</script>
</head>

<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="All_Components/navbar.jsp"%>

	<div class="profile-card p-5 mt-4 mb-4">

		<c:if test="${not empty succMsg }">
			<p class="text-center text-success">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />

		</c:if>
		<c:if test="${not empty failedMsg }">
			<p class="text-center text-danger">${failedMsg}</p>
			<c:remove var="failedMsg" scope="session" />

		</c:if>
		<h3 style="text-align: center; color:;">Profile</h3>

		<form id="profile-form" action="upload_profile_image" method="post"
			enctype="multipart/form-data">
			<div class="profile-image-container">
				<c:if test="${not empty userobj.profileImagePath}">
					<img
						src="${pageContext.request.contextPath}/${userobj.profileImagePath}"
						alt="Profile Image" class="profile-image">
				</c:if>

				<c:if test="${empty userobj.profileImagePath}">
					<img src="images/dummyprof.jpg" alt="Default Photo"
						class="profile-image">
				</c:if>

				<label for="fileUpload" class="edit-icon"><i
					class="fas fa-edit"></i></label> <input type="file" id="fileUpload"
					name="profileImage" style="display: none;">
			</div>

			<!-- File Upload Input -->
			<div style="text-align: center;">
				<button type="submit" class="btn btn-primary">
					<i class="fa-solid fa-cloud-arrow-up"></i> Upload
				</button>
			</div>
		</form>

		<h4 style="text-align: center; color: grey;">Personal Details</h4>

		<form id="profile-form" action="update_profile" method="post">
			<input type="hidden" value="${userobj.id}" name="id">
			<div class="form-group">
				<label for="name">Name</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input
					type="text" id="name" name="name" value=" ${userobj.name}" disabled>
			</div>

			<div class="form-group">
				<label for="email">Email</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input
					type="email" id="email" name="email" value=" ${userobj.email}"
					disabled>
			</div>

			<div class="form-group">
				<label for="phone">Mobile</label>&nbsp&nbsp&nbsp&nbsp&nbsp <input
					type="tel" id="phone" name="phone" value=" ${userobj.phno}"
					disabled>
			</div>

			<div class="form-group">
				<label for="password">Password</label> <input type="text"
					id="password" name="password" disabled placeholder="Enter Password">
			</div>

			<div style="text-align: center;">
				<button id="edit-button" class="btn btn-danger">
					<i class="fa-regular fa-pen-to-square"></i> Edit
				</button>
				<button id="update-button" class="btn btn-warning"
					style="background-color: #ffc107; color: #fff;">
					<i class="fa-solid fa-circle-check" style="color: #fff;"></i>
					Update
				</button>
			</div>
		</form>
	</div>

	<%@include file="All_Components/footer.jsp"%>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var fileInput = document.getElementById("fileUpload");
			var uploadButton = document.getElementById("uploadButton"); // Assuming the upload button has an id "uploadButton"
			var profileImage = document.querySelector(".profile-image"); // Assuming the profile image has a class "profile-image"

			fileInput.addEventListener("change", function() {
				var file = this.files[0];
				if (file) {
					var reader = new FileReader();
					reader.onload = function(e) {
						profileImage.src = e.target.result; // Set the selected file's data URL as the image source
					};
					reader.readAsDataURL(file); // Read the selected file as a data URL
				}
			});

			uploadButton.addEventListener("click", function(event) {
				event.preventDefault(); // Prevent default form submission

				var file = fileInput.files[0];
				if (file) {
					var formData = new FormData();
					formData.append("profileImage", file);

					var xhr = new XMLHttpRequest();
					xhr.open("POST", "upload_profile_image", true);
					xhr.onload = function() {
						if (xhr.status === 200) {
							// Image uploaded successfully, update the UI with the new image URL
							var imageUrl = xhr.responseText;
							profileImage.src = imageUrl; // Update the src attribute of the image element
						} else {
							// Error handling
							console.error("Failed to upload image");
						}
					};
					xhr.send(formData);
				} else {
					console.error("No file selected");
				}
			});
		});
	</script>

</body>
</html>
