<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Rashminda
  Date: 11/19/2023
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Recent Books</title>

    <%@include file="all_component/allCss.jsp" %>

    <style type="text/css">
        .crd-ho:hover {
            background-color: #D7DED6;
        }
    </style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid">
    <h3 class="text-center">Recent Book</h3>
    <div class="row p-5">

            <%
                BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
                List<BookDtls> list2 = dao2.getAllRecentBook();

                for (BookDtls b : list2) {
            %>

            <div class="col-md-3">
                <div class="card crd-ho mt-2">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px"
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
                        <div class="row ml-5">


                            <a
                                    href="#" class="btn btn-success btn-sm ml-3">view details</a> <a
                                href="#" class="btn btn-danger btn-sm ml-1"><i
                                class="fa-solid fa-rupee-sign"></i>. <%=b.getPrice() %>
                        </a>
                        </div>

                        <%
                        } else {

                        %>
                        <div class="row ml-2">

                            <a href="#" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add
                                cart</a> <a
                                href="#" class="btn btn-success btn-sm ml-1">view details</a> <a
                                href="#" class="btn btn-danger btn-sm ml-1"><i
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
</div>

</body>
</html>
