<%@page import="com.entity.Book_Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrdersimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Status</title>
<%@include file="All_Components/allCss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

.card:hover {
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}

.progress-bar {
    width: 100%;
    background-color: #f0f0f0;
    border-radius: 5px;
    overflow: hidden;
    position: relative;
}

.progress-bar-inner {
    display: flex;
    align-items: center;
    height: 40px;
    background-color: #f0f0f0;
    border-radius: 5px;
    overflow: hidden;
    position: relative;
    animation: grow 2s ease-out forwards;
}

.progress-point {
    flex: 1;
    height: 100%;
    text-align: center;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.3s, transform 0.3s;
}

.progress-point.red {
    background-color: #ff0000 !important; /* Red */
}

.progress-point.blue {
    background-color: #0000ff !important; /* Blue */
}

.progress-point.yellow {
    background-color: #ffff00 !important; /* Yellow */
    color: #000; /* Black text for visibility */
}

.progress-point.green {
    background-color: #00ff00 !important; /* Green */
}

.progress-point i {
    margin-right: 5px;
}

.progress-point:hover {
    transform: scale(1.1);
}

.progress-points {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}

.progress-point-text {
    text-align: center;
    flex: 1;
}

@keyframes grow {
    0% { width: 0%; }
    100% { width: 100%; }
}
</style>
</head>
<body style="background-image: url('images/loginbg.png'); background-size: cover; background-position: center; height: 100vh; margin: 0;">
    <%@include file="All_Components/navbar.jsp"%>
    <%
    User u = (User) session.getAttribute("userobj");
    BookOrdersimpl dao = new BookOrdersimpl(DBConnect.getConn());
    List<Book_Orders> blist = dao.getBook(u.getEmail());
    %><br><br><br><br><br><br>
    <div class="container p-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card p-3 mt-6">
                    <div class="card-body">
                        <h2 class="text-center">Order Status</h2>
                        
                        <%
                        
                        for (Book_Orders b : blist) {
                            String orderStatus = dao.getOrderStatus(b.getOrder_id());
                      
                            String progressBarClass = "";
                            String progressBarWidth = "0%";
                            String iconClass = "";
                            switch (orderStatus) {
                                case "Packed":
                                    progressBarClass = "progress-point red";
                                    progressBarWidth = "25%";
                                    iconClass = "fa-solid fa-box-open";
                                    break;
                                case "Shipped":
                                    progressBarClass = "progress-point blue";
                                    progressBarWidth = "50%";
                                    iconClass = "fa-solid fa-dolly";
                                    break;
                                case "On the Way":
                                    progressBarClass = "progress-point yellow";
                                    progressBarWidth = "75%";
                                    iconClass = "fa-solid fa-truck";
                                    break;

                                case "Delivered":
                                    progressBarClass = "progress-point green";
                                    progressBarWidth = "100%";
                                    iconClass = "fa-solid fa-truck-ramp-box";
                                    break;
                                default:
                                    progressBarClass = "progress-point";
                                    iconClass = "";
                            }
                        %>
                                                <h5 class="text-center"><%=b.getBookName() %></h5>
                        
                        <div class="progress-bar">
                            <div class="progress-bar-inner" style="width: <%=progressBarWidth%>;">
                                <div class="progress-point <%=progressBarClass%>"
                                    style="flex: 1;">
                                    <i class="<%=iconClass%>" aria-hidden="true"></i>
                                    <%=orderStatus%>
                                </div>
                            </div>
                        </div>

                        <div class="progress-points">
                            <div class="progress-point-text">Packed</div>
                            <div class="progress-point-text">Shipped</div>
                            <div class="progress-point-text">On the Way</div>
                            <div class="progress-point-text">Delivered</div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br><br><br><br><br><br><br><br><br><br>

    <%@include file="All_Components/footer.jsp"%>

</body>
</html>
