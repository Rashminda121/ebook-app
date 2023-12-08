<%@ page import="com.servlet.Registersrv" %>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E book Register</title>

<%@include file="./all_component/allCss.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body style="background-color: #f0f1f2;">

	<%@include file="./all_component/navbar.jsp"%>

	<div class="container mt-4 p-2">

		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-3">Registration Page</h4>
						<c:if test="${not empty failed}">
							<h5 class="text-center text-danger">${failed}</h5>
							<c:remove var="failed" scope="session"/>

						</c:if>

						<c:if test="${not empty succMsg}">
							<%--<script>window.alert("${succMsg}")</script>--%>
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session"/>

						</c:if>

						<!--<form action="register" method="post">-->

						<input type="hidden" id="status" value="<%=request.getAttribute("status")  %>">

						<form action="registersrv" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name:</label> <input
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="full name"
									required="required" name="fname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="email"
									required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No: </label> <input
									type="text" class="form-control" id="phone"
									aria-describedby="emailHelp" placeholder="phone no"
									required="required" maxlength="10" name="phno">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>



							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" required="required" name="check"> <label
									class="form-check-label" for="exampleCheck1">Check me
									out</label>
							</div>
							<!--  <small id="emailHelp" class="form-text text-muted text-left">We'll
								never share data with anyone else.</small>-->
 
							<br>

							<div class="text-center">
								<button type="submit" class="btn btn-primary mb-2 pl-3 pr-3" >Submit</button>
								<br>
								<button style="border-style: none; background: none;"
									type="reset" class="mb-1 pl-3 pr-3">Clear form </button>
								<br> <a href="login.jsp">Already have an account? login</a>
							</div>


						</form>




					</div>
				</div>
			</div>

		</div>

	</div>


	<!-- footer -->
	<%@include file="all_component/footer.jsp"%>

</body>
</html>