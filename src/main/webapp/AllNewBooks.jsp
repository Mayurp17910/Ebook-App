<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@include file="All_Components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #e8dfe4;
}

#toast {
    min-width: 300px;
    position: fixed;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    background: #fff; /* White background for the toast */
    padding: 20px;
    color: #000; /* Text color */
    text-align: center;
    z-index: 1;
    font-size: 18px;
    visibility: hidden;
    box-shadow: 0px 0px 100px #000;
    border-radius: 10px; /* Add rounded corners */
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

#toast.display {
    visibility: visible;
    animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
    from {
        bottom: 0;
        opacity: 0;
    }
    to {
        bottom: 30px;
        opacity: 1;
    }
}

@keyframes fadeOut {
    from {
        bottom: 30px;
        opacity: 1;
    }
    to {
        bottom: 0;
        opacity: 0;
    }
}

#toast .toast-content {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

#toast .toast-circle {
    width: 50px;
    height: 50px;
    background-color: #007bff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
    position: relative;
    overflow: hidden;
    animation: bounce 1s ease-in-out infinite;
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
    }
    40% {
        transform: translateY(-30px);
    }
    60% {
        transform: translateY(-15px);
    }
}

#toast .toast-circle i {
    color: white;
    font-size: 24px;
    position: relative;
    z-index: 1;
    animation: fadeInMark 1.5s ease-in-out forwards;
}

@keyframes fadeInMark {
    from {
        opacity: 0;
        transform: scale(0);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.sparkle {
    position: absolute;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.3) 10%, transparent 10%) center center / 3px 3px;
    animation: sparkle 1s infinite linear;
    z-index: 0;
}

@keyframes sparkle {
    0%, 100% {
        transform: translate(0, 0);
    }
    50% {
        transform: translate(-10px, -10px);
    }
}

.star {
    position: absolute;
    width: 20px;
    height: 20px;
    background-color: transparent;
    clip-path: polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%);
    animation: confetti-fall 1s infinite;
}

@keyframes confetti-fall {
    0% {
        transform: translateY(0);
    }
    100% {
        transform: translateY(30px);
    }
}

.star:nth-child(1) {
    top: -10px;
    right: -10px;
    background-color: #ffce00;
    animation-delay: 0s;
}

.star:nth-child(2) {
    top: -10px;
    left: -10px;
    background-color: #ff4081;
    animation-delay: 0.2s;
}

.star:nth-child(3) {
    bottom: -10px;
    right: -10px;
    background-color: #4caf50;
    animation-delay: 0.4s;
}

.star:nth-child(4) {
    bottom: -10px;
    left: -10px;
    background-color: #03a9f4;
    animation-delay: 0.6s;
}

.star:nth-child(5) {
    top: 10px;
    right: 10px;
    background-color: yellow;
    animation-delay: 0.8s;
}


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body style="background-color: #f7f7f7">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<c:if test="${not empty addCart }">
    <div id="toast">
        <div class="toast-content">
            <div class="toast-circle">
                <div class="sparkle"></div>
                <i class="fa fa-check"></i>
            </div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div>${addCart}</div>
        </div>
    </div>
    <audio id="toastSound" src="successtune.mp3"></audio> <!-- Add path to your sound file here -->
    <script type="text/javascript">
        $(document).ready(function() {
            showToast('${addCart}');
        });

        function showToast(content) {
            $('#toast').addClass("display");
            $('#toast').find('div').last().html(content);
            
            // Play the sound
            var audio = document.getElementById("toastSound");
            audio.play();
            
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 3000); // Adjust the duration if needed
        }
    </script>
    <c:remove var="addCart" scope="session" />
</c:if>



	<%@include file="All_Components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BooksDAOimpl dao1 = new BooksDAOimpl(DBConnect.getConn());

			List<BookDtls> list1 = dao1.getAllNewBooks();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-4">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoname()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary btn-sm ml-2"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							<%
							}
							%>
							<a href="viewbooks.jsp?bookid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1">View Details <i
								class="fa-regular fa-eye"></i></a> <a href=""
								class="btn btn-success ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>


	</div>
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