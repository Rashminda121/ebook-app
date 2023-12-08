<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>All New Books</title>

    <%@include file="all_component/allCss.jsp" %>

    <style type="text/css">
        .crd-ho:hover {
            background-color: #D7DED6;
        }
        #toast {
            min-width: 300px;
            position: fixed;
            bottom: 30px;
            left: 50%;
            margin-left: -125px;
            background: #333;
            padding: 10px;
            color: white;
            text-align: center;
            z-index: 1;
            font-size: 18px;
            visibility: hidden;
            box-shadow: 0px 0px 100px #000;
        }

        #toast.display {
            visibility: visible;
            animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {from { bottom:0;
            opacity: 0;
        }

            to {
                bottom: 30px;
                opacity: 1;
            }

        }
        @keyframes fadeOut {form { bottom:30px;
            opacity: 1;
        }

            to {
                bottom: 0;
                opacity: 0;
            }
        }


    </style>
</head>
<body>

<%
    User u=(User) session.getAttribute("userobj");
%>


<c:if test="${not empty  addcart}">

    <div id="toast">${addcart}</div>

    <script type="text/javascript">

        showToast();
        function showToast(content)
        {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(()=>{
                $("#toast").removeClass("display");
            },2000)
        }
    </script>
    <c:remove var="addcart" scope="session"/>

</c:if>




<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid">
    <h3 class="text-center">New Book</h3>
    <div class="row p-5">

        <%
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            List<BookDtls> list = dao.getAllNewBook();

            for (BookDtls b : list) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100px; height: 150px"
                         class="img-thumblin">
                    <p><%=b.getBookName() %>
                    </p>
                    <p><%=b.getAuthor() %>
                    </p>
                    <p>Catergories:<%=b.getBookcategory()%>
                    </p>
                    <div class="row ml-2">


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


                        <a href="#" class="btn btn-success btn-sm ml-1">view details</a>

                        <a href="#" class="btn btn-danger btn-sm ml-1 text-center">
                        <i class="fa-solid fa-rupee-sign"></i>. <%=b.getPrice() %></a>

                    </div>
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
