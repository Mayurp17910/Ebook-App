<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@include file="allCss.jsp"%>
<style>
.card-container {
  transition: box-shadow 0.3s ease;
}

.card-container:hover {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-image: url('loginbg.png'); background-size: cover; background-position: center; margin: 0;">
  <%@include file="navbar.jsp"%>
  <div class="container p-3">
    <div class="row p-5">
      <div class="col-md-6 offset-md-3">
        <div class="card-container">
          <div class="card">
            <div class="card-body">
              <h4 class="text-center" style="color: blue">EDIT BOOKS</h4>
              <%
              int id = Integer.parseInt(request.getParameter("id"));
              BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
              BookDtls b = dao.getBookById(id);
              %>
              
              <form action="../editbook" method="post" class="text-center">
              <input type="hidden" name="id" value="<%=b.getBookid()%>">
                  <div class="form-group col-md-6 mx-auto" >
                    <label for="bookName">Book Name</label> <input type="text"
                      class="form-control" id="bookName" name="bookname"
                      value="<%= b.getBookname()%>" required>
                  </div>
                  <div class="form-group col-md-6 mx-auto">
                    <label for="authorName">Author Name</label> <input type="text"
                      class="form-control" id="authorName" name="authorname"
                      value="<%= b.getAuthor()%>" required>
                  </div>
                
                  <div class="form-group col-md-6 mx-auto">
                    <label for="bookPrice">Price</label> <input type="number"
                      class="form-control" id="bookPrice" name="bookprice"
                      value="<%=b.getPrice()%>" required>
                  </div>

                  <div class="form-group col-md-6 mx-auto">
                    <label for="bookStatus">Book Status</label> <select
                      id="bookStatus" name="bookStatus" class="form-control"
                      required>
                      <%
                      if ("Active".equals(b.getStatus())) {
                      %>
                      <option value="Active">Active</option>
                                              <option value="Inactive">Inactive</option>
                      
                      <%
                      } else {
                      %>
                      <option value="Inactive">Inactive</option>
                                              <option value="Active">Active</option>
                      
                      <%
                      }
                      %>
                    </select>
                  </div>

              <div class="text-center">
                <button type="submit" class="btn btn-primary">Update</button>
              </div>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div><br><br><br><br><br><br><br><br>
  <div style="margin-top: 4px">
    <%@include file="footer.jsp"%>
  </div>
</body>
</html>
