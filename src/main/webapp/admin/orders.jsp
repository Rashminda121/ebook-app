<%--
  Created by IntelliJ IDEA.
  User: Rashminda
  Date: 11/15/2023
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: All Orders</title>

    <%@ include file ="allCss.jsp"%>
</head>
<body>
<%@ include file ="navbar.jsp"%>
<h1 class="text-center">Hello Admin</h1>

<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Phone No</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>Mark</td>
        <td>Otto</td>
        <td>@twitter</td>
        <td>Mark</td>
        <td>Otto</td>

    </tr>
    <tr>
        <th scope="row">2</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td><td>Mark</td>
        <td>Otto</td>
        <td>@twitter</td>
        <td>Mark</td>
        <td>Otto</td>


    </tr>
    <tr>
        <th scope="row">3</th>
        <td>Larry</td>
        <td>the Bird</td>
        <td>@twitter</td>
        <td>Mark</td>
        <td>Otto</td>
        <td>@twitter</td>
        <td>Mark</td>
        <td>Otto</td>

    </tr>
    </tbody>
</table>
<div style="margin-top: 120px;">
    <%@ include file ="footer.jsp"%>
</div>

</body>
</html>
