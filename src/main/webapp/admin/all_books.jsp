<%@ page import="com.DAO.BookDAO" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: All Books</title>

    <%@ include file ="allCss.jsp"%>
</head>
<body>
<%@ include file ="navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<h1 class="text-center">Hello Admin: All Books Section</h1>

<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Image</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author Name</th>
        <th scope="col">Price</th>
        <th scope="col">Category</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>

        <%
        BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
        List<BookDtls> list =dao.getAllBooks();

        for (BookDtls b:list ) {
        %>
        <tr>
            <td ><%=b.getBookId() %></td>
            <td><img src="../book/<%=b.getPhotoName()%>" style="width:50px;height: 50px;" ></td>
            <td><%=b.getBookName()%></td>
            <td><%=b.getAuthor()%></td>
            <td><%=b.getPrice()%></td>
            <td><%=b.getBookcategory()%></td>
            <td><%=b.getStatus()%></td>
            <td>
                <a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square success"></i>Edit</a>
                <a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash warning"></i>Delete</a>

            </td>
        </tr>

        <%
        }
        %>
    </tbody>
</table>
<div style="margin-top: 120px;">
    <%@ include file ="footer.jsp"%>
</div>

</body>
</html>
