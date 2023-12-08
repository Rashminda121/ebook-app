
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<div class="container-fluid"
     style="height: 10px; background-color: #303f9f"></div>


<div class="container-fluid p-3 bg-light">
    <div class="row">

        <div class="col-md-3 text-success">
            <a href="index.jsp" class="text-success">
                <h3 class="ah">
                    <i class="fa-solid fa-book"></i> Ebooks
                </h3>
            </a>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search"
                       placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>

        </div>


        <c:if test="${not empty userobj}">


            <div class="col-md-3">

                <a href="../checkout.jsp" class=" btn mr-1 text-dark"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>


                <a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> ${userobj.name} </a>
                <a href="Logout" class="btn btn-primary text-white"><i class="fa-solid fa-right-to-bracket"></i>
                    Logout</a>


            </div>

        </c:if>

        <c:if test="${empty userobj}">


            <div class="col-md-3">



                <a href="./login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> login</a>
                <a href="./register.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user"></i>
                    Register</a>

            </div>
        </c:if>

    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="index.jsp">
                Home <span class="sr-only">(current)</span>
            </a></li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i
                        class="fa-solid fa-book"></i> Recent Book </a></li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"><i
                        class="fa-solid fa-book"></i> New Book </a></li>
            <li class="nav-item active"><a class="nav-link disabled"
                                           href="all_old_book.jsp"><i class="fa-solid fa-book"></i> Old Book</a></li>
        </ul>
        <form class="form-inline my-2 my-lg-0">

            <button class="btn btn-Light my-2 my-sm-0 mr-1" type="submit">
                <i class="fa-solid fa-gear"></i> Settings
            </button>
            <button class="btn btn-Light my-2 my-sm-0" type="submit">
                <i class="fa-solid fa-phone"></i> Contact Us
            </button>

        </form>
    </div>
</nav>