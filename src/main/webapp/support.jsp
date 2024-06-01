<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>24/7 Service</title>
<%@include file="All_Components/allCss.jsp"%>

<style type="text/css">
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
    animation: fadeInUp 0.5s ease; /* Fade-in animation */
}

.card:hover {
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}

@keyframes fadeInUp {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.icon {
    font-size: 4rem;
    color: #28a745;
    margin-bottom: 20px;
}

.icon.bounce {
    animation: bounce 1.5s; /* Bounce animation */
}

@keyframes bounce {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-20px);
    }
}

.icon.vibrate {
    animation: vibrate 0.3s infinite; /* Vibrate animation */
}

@keyframes vibrate {
    0% {
        transform: translateX(0);
    }
    25% {
        transform: translateX(-2px);
    }
    50% {
        transform: translateX(0);
    }
    75% {
        transform: translateX(2px);
    }
    100% {
        transform: translateX(0);
    }
}

.animate-text, .animate-button {
    opacity: 0;
    animation: fadeInText 1s forwards;
}

@keyframes fadeInText {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
</head>
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
    <c:if test="${empty userobj }">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <%@include file="All_Components/navbar.jsp"%>
    <br><br><br><br>
    <div class="card p-3 mb-4 mt-4">
        <div class="text-center p-5">
            <h1 class="icon vibrate" id="icon">
                <i class="fa-solid fa-phone fa-2x"></i>
            </h1>
            <h3 class="animate-text">24 X 7 Service is Available!</h3>
            <h4 class="animate-text">Help Line Number</h4>
            <hr>
            <h5 class="animate-text">+91 7768812226</h5>
            <br>
            <a href="index.jsp" class="btn btn-primary animate-button">Home</a>
        </div>
    </div>
<br><br><br><br><br><br>
    <%@include file="All_Components/footer.jsp"%>

    <script>
        // Add bounce animation class to icon on page load
        window.onload = function() {
            document.getElementById('icon').classList.add('bounce');
        };
    </script>
</body>
</html>
