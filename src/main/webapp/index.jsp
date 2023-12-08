<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ebook Index</title>

    <%@include file="all_component/allCss.jsp" %>


    <style type="text/css">
        .back-img {
            background: url("img/b.jpg");
            height: 50vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .crd-ho:hover {
            background-color: #D7DED6;
        }
    </style>

</head>
<body style="background-color: #f7f7f7;">

<%
    User u=(User) session.getAttribute("userobj");
%>

<%@include file="all_component/navbar.jsp" %>


<div class="container-fluid back-img">
    <h2 class="text-center text-danger">E-book managment system</h2>
</div>

<%-- 	<%@ page import="com.DB.DBConnect" %> --%>
<%-- <%@ page import="java.sql.Connection" %> --%>
<%-- <%@ page import="java.io.PrintWriter" %> --%>
<%-- <%@ page import="java.sql.DriverManager"%> --%>
<%-- <%   --%>
<!-- //    Connection conn = DBConnect.getConn(); -->
<!-- //    out.println(conn); -->
<%-- %> --%>

<!-- start recent book -->
<div class="container">
    <h3 class="text-center m-2">Recent Book</h3>
    <br>
    <div class="row  ">

        <%
            BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
            List<BookDtls> list2 = dao2.getRecentBook();

            for (BookDtls b : list2) {
        %>

        <div class="col-md-3" >
            <div class="card crd-ho">
                <div class="card-body text-center"  >
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px"
                         class="img-thumblin">
                    <p><%=b.getBookName() %>
                    </p>
                    <p><%=b.getAuthor() %>
                    </p>
                    <p>Catergories:<%=b.getBookcategory()%>
                    </p>
                    <%
                        if (b.getBookcategory().equals("Old")) {

                    %>
                    <div class="row ml-3"  >


                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">view details</a>
                        <a href="#" class="btn btn-danger btn-sm ml-1"><i
                            class="fa-solid fa-rupee-sign"></i>. <%=b.getPrice() %></a>
                    </div>

                    <%
                    } else {

                    %>
                    <div class="row " >

                        <%
                            if(u==null){
                        %>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Cart</a>

                        <%
                        }else{
                        %>

                        <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Cart</a>

                        <%
                            }
                        %>

                        <%--<a href="#" class="btn btn-danger btn-sm ml-3"><i class="fa-solid fa-cart-shopping"></i> Cart</a>--%>
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">view details</a>

                        <a href="#" class="btn btn-danger btn-sm ml-1"><i
                            class="fa-solid fa-rupee-sign"></i>. <%=b.getPrice() %>
                        </a>
                    </div>
                    <%
                        }
                    %>


                </div>
            </div>
        </div>
        <%
            }

        %>


    </div>
    <br>
    <div class="text-center mt-1">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm txt-white">View All</a>
    </div>
</div>
<!-- end recent book -->

<hr>

<!-- start new book -->

<div class="container">
    <h3 class="text-center m-2">New Book</h3>
    <br>
    <div class="row">


        <%
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            List<BookDtls> list = dao.getNewBook();

            for (BookDtls b : list) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px"
                         class="img-thumblin">
                    <p><%=b.getBookName() %>
                    </p>
                    <p><%=b.getAuthor() %>
                    </p>
                    <p>Catergories:<%=b.getBookcategory()%>
                    </p>
                    <div class="row">

                        <%
                            if(u==null){
                        %>
                            <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Cart</a>

                        <%
                            }else{
                        %>

                        <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Cart</a>

                        <%
                            }
                        %>



                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">view details</a>

                        <a href="#" class="btn btn-danger btn-sm ml-1 text-center">
                        <i class="fa-solid fa-rupee-sign"></i>. <%=b.getPrice() %>
                    </a>
                    </div>
                </div>
            </div>
        </div>

        <%
            }

        %>


    </div>


</div>
<br>
<div class="text-center mt-1">
    <a href="all_new_book.jsp" class="btn btn-danger btn-sm txt-white">View All</a>
</div>
</div>
<!-- end new book -->

<hr>

<!-- start old book -->
<div class="container">
    <h3 class="text-center m-2">Old Book</h3>
    <br>
    <div class="row">
        <%
            BookDAOimpl dao3 = new BookDAOimpl(DBConnect.getConn());
            List<BookDtls> list3 = dao2.getOldBook();

            for (BookDtls b : list3) {
        %>

        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px"
                         class="img-thumblin">
                    <p><%=b.getBookName() %>
                    </p>
                    <p><%=b.getAuthor() %>
                    </p>
                    <p>Catergories:<%=b.getBookcategory()%>
                    </p>
                    <div class="row ml-1">

                        <%--<a href="#" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add
                            cart</a>--%>
                        <a
                                href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-4">view details</a> <a
                            href="#" class="btn btn-danger btn-sm ml-1 text-center">
                        <i class="fa-solid fa-rupee-sign"></i>. <%=b.getPrice() %>
                    </a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }

        %>

    </div>
    <br>
    <div class="text-center mt-1">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm txt-white">View All</a>
    </div>
</div>
<!-- end old book -->
<a href="feedback.jsp">hello</a>

<!-- Footer -->
<%@include file="all_component/footer.jsp" %>

</body>
</html>