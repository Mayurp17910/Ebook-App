<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Follow Us</title>
<%@include file="All_Components/allCss.jsp"%>
<style type="text/css">
.card {
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 700px;
    margin: auto;
    font-family: Arial, sans-serif;
    border-radius: 20px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    padding: 20px;
    background-color: #fff;
    transition: box-shadow 0.3s;
}

.card:hover {
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}

.follow-icons {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.follow-icons a {
    margin: 0 10px;
    color: #333; /* Default icon color */
    font-size: 24px;
    text-decoration: none;
}

/* Bounce animation for follow icons */
@keyframes bounce {
    0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
    40% { transform: translateY(-30px); }
    60% { transform: translateY(-15px); }
}

.bounce-once {
    animation: bounce 1s ease-in-out;
}
</style>
</head>
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
    <%@include file="All_Components/navbar.jsp"%><br><br><br><Br><br>
    <div class="container">
        <div class="card p-3">
            <div class="card-body text-center">
                            <div class="follow-icons">
            
                <h2 style="color: #333;"><i class="fa-brands fa-twitter fa-6x flying-twitter"></i>Follow Us On</h2>
                </div>
                <hr>
                <!-- Change text color -->
                <div class="follow-icons">
                    <a href="https://www.instagram.com/mayur_17910"><i class="fa-brands fa-instagram fa-4x"></i></a>
                    <a href="https://www.facebook.com/mayur_17910"><i class="fa-brands fa-facebook-f fa-4x"></i></a>
                    <a href="https://www.linkedin.com/in/mayur-patil-a87811254/"><i class="fa-brands fa-linkedin-in  fa-4x"></i></a>
                    <a href="https://github.com/Mayurp17910"><i class="fa-brands fa-github fa-4x"></i></a>
                </div>
            </div>
        </div>
    </div>
    <script>
    // Function to add bounce effect to icons
    function addBounceEffect() {
        var icons = document.querySelectorAll('.follow-icons a');
        icons.forEach(function(icon, index) {
            setTimeout(function() {
                icon.classList.add('bounce-once');
                // Remove bounce class after animation completes
                setTimeout(function() {
                    icon.classList.remove('bounce-once');
                }, 1000); // Adjust this time to match animation duration
            }, index * 500); // Adjust delay between each icon bounce
        });
    }

    // Call the function on page load
    window.onload = addBounceEffect;
    </script>	<br><br><br><br>
    <%@include file="All_Components/footer.jsp"%>
    
</body>
</html>
