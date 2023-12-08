<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.admin.servlet.BooksAdd" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%> --%>


<html>
<head>
    <title>Admin:Add Books</title>

    <%@ include file ="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;align-items: center;justify-content: center;">
<%@ include file ="navbar.jsp"%>

<div class ="conatiner p-5">
    <div class="row p-5" >
        <div class="col-md-4  offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Add Books</h4>
                    <%--<c:if test="${not empty succMsg}">
                        <p class="text-cenetr text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>
                    <c:if test="${not empty failMsg}">
                        <p class="text-cenetr text-danger">${failMsg}</p>
                        <c:remove var="failMsg" scope="session"/>
                    </c:if>
                    --%>

                    <%
                        int id =Integer.parseInt(request.getParameter("id"));
                        BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
                        BookDtls b=dao.getBookById(id);
                    %>

                    <form action="../editbooks"  method="post">
                        <input type="hidden" name="id" value="<%=b.getBookId()%>"  >

                        <div class="form-group">
                            <label for="exampleBook">Book Name</label>
                            <input type="text" class="form-control" id="exampleBook" name="name" placeholder="Enter Book Name" value="<%=b.getBookName()%>">

                        </div>
                        <div class="form-group">
                            <label for="exampleAuthor">Author Name</label>
                            <input type="text" class="form-control" name="author" id="exampleAuthor" placeholder="Author" value="<%=b.getAuthor()%>">
                        </div>
                        <div class="form-group">
                            <label for="examplePrice">Price</label>
                            <input type="number" class="form-control" name="price" id="examplePrice" placeholder="Price" value="<%=b.getPrice()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleSelection2">Book Status</label>
                            <select class="form-control" id="exampleSelection2" name="status">
                                <%
                                    if("Active".equals(b.getStatus())){
                                        %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>

                                <%
                                    }else{
                                        %>
                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>

                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success">Update</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<div style="margin-top: 10px;">
    <%@ include file ="footer.jsp"%>
</div>
</body>
</html>
