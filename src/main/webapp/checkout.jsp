<%@ page import="com.DAO.CartDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Cart Page</title>

    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>

<c:if test="${not empty success}">
    <div class="alert alert-success" role="alert">${success}</div>
    <c:remove var="success" scope="session"/>
</c:if>
<c:if test="${not empty fail}">
    <div class="alert alert-danger" role="alert">${fail}</div>
    <c:remove var="fail" scope="session"/>
</c:if>




<div class="container ">

    <div class="row p-2">

        <div class="col-md-6">


            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Selected Items</h3>
                    <table class="table table-striped">
                        <thead>


                        <tr>
                            <th scope="col">Book Name</th>
                            <th scope="col">Author</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            User u=(User)session.getAttribute("userobj");
                            CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
                            List<Cart> cart=dao.getBookByUser(u.getId());
                            Double totalprice=0.0;
                            for(Cart c:cart){
                                totalprice=c.getTotalPrice();
                        %>
                        <tr>
                            <th scope="row"><%=c.getBookName()%></th>
                            <td><%=c.getAuthor()%></td>
                            <td><%=c.getPrice()%></td>
                            <td>
                                <a href="remove_book?bid=<%=c.getBid()%>& uid=<%=c.getUserID()%>" class="btn btn-sm btn-danger">Remove</a>
                            </td>
                        </tr>

                        <%
                            }

                        %>
                        <tr>
                            <td>Total Price</td>
                            <td></td>
                            <td></td>
                            <td><%=totalprice%></td>
                        </tr>


                        </tbody>
                    </table>
                </div>
            </div>

        </div>


        <div class="col-md-6">

            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center text-success">Details of Your Order</h3>
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="Name">Name</label>
                                <input type="text" class="form-control" id="Name" value="<%=u.getName()%>" readonly="readonly">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="mail">Email</label>
                                <input type="email" class="form-control" id="mail" value="<%=u.getEmail()%>" readonly="readonly">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="no">Phone No</label>
                                <input type="number" class="form-control" id="no" value="<%=u.getPhno()%>" readonly="readonly">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" value="">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="land">Landmark</label>
                                <input type="text" class="form-control" id="land"  >
                            </div>
                            <div class="form-group col-md-6">
                                <label for="city">City</label>
                                <input type="text" class="form-control" id="city" value="">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="state">State</label>
                                <input type="number" class="form-control" id="state" >
                            </div>
                            <div class="form-group col-md-6">
                                <label for="zip">Zip Code</label>
                                <input type="text" class="form-control" id="zip" value="">
                            </div>
                        </div>

                        <div class="form-group ">
                            <label>Payment Method</label>
                            <select class="form-control">
                                <option selected >-- select method --</option>
                                <option>Cash on Delivery</option>
                                <option>2</option>
                            </select>

                        </div>
                        <div class="text-center">
                            <button class="btn btn-warning">Order Now</button>
                            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        </div>



                    </form>

                </div>
            </div>


        </div>


    </div>
</div>


</body>
</html>
