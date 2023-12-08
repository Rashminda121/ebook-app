<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %><%--
  Created by IntelliJ IDEA.
  User: Rashminda
  Date: 11/20/2023
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Details</title>

    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2">


<%@include file="all_component/navbar.jsp" %>
<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
    BookDtls b = dao.getBookById(bid);

%>


<dic class="container ">
    <div class="row m-4 ">

        <div class="col-md-6 text-center p-5 border  bg-white">
            <img src="book/<%=b.getPhotoName()%>" style="height:200px;width:150px;"><br>
            <h4 class="mt-3">Book name: <span class="text-success"><%=b.getBookName()%></span></h4>
            <h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
            <h4>Category: <span class="text-success"><%=b.getBookcategory()%></span></h4>
        </div>
        <div class="col-md-6 text-center p-5 border bg-white">
            <h2 class="mb-4"><%=b.getBookName()%>
            </h2>

            <%
                if ("Old".equals(b.getBookcategory())) {
            %>
            <h5 class="text-primary"> Contact to Seller</h5>
            <a href="mailto:rashmindansbm@gamil.com" style="text-decoration: none;">
                <h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email:<%=b.getEmail()%></h5></a>


            <%
                }
            %>

            <div class="row m-2 ">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
                    <p>Cash on Delivery</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-rotate-left fa-2x"></i>
                    <p>Return Available</p>

                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-truck fa-2x"></i>
                    <p>Free Shipping</p>
                </div>
            </div>

            <%
                if ("Old".equals(b.getBookcategory())) {
            %>

            <div class=" text-center p-3">
                <a href="index.jsp" class="btn btn-success"> Continue Shopping</a>
                <a href="" class="btn btn-danger"><i class="fa-solid fa-rupee-sign"></i>.<%=b.getPrice()%>
                </a>

            </div>
            <%
                }else{
            %>
            <div class=" text-center p-3">
                <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                <a href="" class="btn btn-danger"><i class="fa-solid fa-rupee-sign"></i>.<%=b.getPrice()%>
                </a>

            </div>

            <%
                }
            %>

        </div>
    </div>
</dic>

</body>
</html>
