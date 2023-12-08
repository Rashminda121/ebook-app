<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook login</title>

<%@include file="./all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="./all_component/navbar.jsp"%>

	<div class="container mt-4 p-2">

		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-3">Login Page</h3>

						<c:if test="${not empty failed}">
							<h5 class="text-center text-danger">${failed}</h5>
							<c:remove var="failed" scope="session"/>

						</c:if>

						<c:if test="${not empty succMsg}">
							<%--<script>window.alert("${succMsg}")</script>--%>
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session"/>

						</c:if>


						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="email"
									required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>

							<br>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mb-3">Login</button>
								<br>
								<button style="border-style: none; background: none;"
									type="reset" class="mb-1 pl-3 pr-3">Clear form</button>
								<br> <a href="register.jsp">Don't have an account?
									register</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>