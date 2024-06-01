<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
<%@include file="All_Components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #e8dfe4;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="All_Components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BooksDAOimpl dao1 = new BooksDAOimpl(DBConnect.getConn());

			List<BookDtls> list1 = dao1.getAllOldBooks();
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
							<a href="viewbooks.jsp?bookid=<%=b.getBookid() %>"
								class="btn btn-danger btn-sm ml-2">View Details <i class="fa-regular fa-eye"></i></a> <a href=""
								class="btn btn-success ml-4">Pay <%=b.getPrice()%> <i
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