<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<html>
<head>
    <title>Admin:Add Books</title>

    <%@ include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2;align-items: center;justify-content: center;">

<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<div class="conatiner p-5">
    <div class="row p-5">
        <div class="col-md-4  offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Add Books</h4>
                    <c:if test="${not empty succMsg}">
                        <p class="text-cenetr text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>
                    <c:if test="${not empty failMsg}">
                        <p class="text-cenetr text-danger">${failMsg}</p>
                        <c:remove var="failMsg" scope="session"/>
                    </c:if>


                    <form action="../add_books" enctype="multipart/form-data" method="post">
                        <!--<h3 class="text-center">Book Add</h3><br>-->
                        <div class="form-group">
                            <label for="exampleBook">Book Name</label>
                            <input type="text" class="form-control" id="exampleBook" name="name"
                                   placeholder="Enter Book Name">

                        </div>
                        <div class="form-group">
                            <label for="exampleAuthor">Author Name</label>
                            <input type="text" class="form-control" name="author" id="exampleAuthor"
                                   placeholder="Author">
                        </div>
                        <div class="form-group">
                            <label for="examplePrice">Price</label>
                            <input type="number" class="form-control" name="price" id="examplePrice"
                                   placeholder="Price">
                        </div>
                        <div class="form-group">
                            <label for="inputState">Book Categories</label>
                            <select class="form-control" id="inputState" name="categories">
                                <option selected>-- select --</option>
                                <option>New</option>
                                <option>Old</option>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleSelection2">Book Status</label>
                            <select class="form-control" id="exampleSelection2" name="status">
                                <option selected>-- select --</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFile">Upload Photo</label>
                            <input type="file" class="form-control-file" id="exampleFile" name="img">
                        </div>


                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<div style="margin-top: 10px;">
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
