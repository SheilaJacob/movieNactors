<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Registration and Login</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-light justify-content-center">
	<h3 class="text-primary">Movie Club!</h3>
</nav>
  <nav class="navbar navbar-expand-sm bg-light justify-content-center">
		<h5 class="text-info">A place for friends to share thoughts on movies</h5>
   </nav>
<div class="d-flex justify-content-around">
	<form:form action="/register" method="POST" modelAttribute="newUser" class="col-4 p-4 bg-light text-dark">
		<h2 class="text-primary , text-center">Register</h2>
		<div class="form-group , text-center">
			<form:label path="name" class="text-primary">Name</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input class="input" path="name"/>
		</div>
		<div class="form-group , text-center">
			<form:label path="email" class="text-primary">Email</form:label>
			<form:errors path="email" class="text-danger"/>
			<form:input class="input" path="email"/>
		</div>	
		<div class="form-group , text-center">
			<form:label path="password" class="text-primary">password</form:label>
			<form:errors path="password" class="text-danger"/>
			<form:input type="password" path="password"/>
		</div>	
		<div class="form-group , text-center">
			<form:label path="confirm" class="text-primary">Confirm Password</form:label>
			<form:errors path="confirm" class="text-danger"/>
			<form:input type="password" path="confirm"/>
		</div>	
		<div class="text-center">
			<button class="btn btn-primary">Submit</button>
		</div>	
	</form:form>
	<form:form action="/login" method="POST" modelAttribute="newLogin" class="col-4 p-4 bg-light text-dark">
	<h2 class="text-success , text-center">Login</h2>
		<div class="form-group , text-center">
			<form:label path="email" class="text-success">Email</form:label>
			<form:errors path="email" class="text-danger"/>
			<form:input class="input" path="email"/>
		</div>
		<div class="form-group , text-center">
			<form:label path="password" class="text-success">Password</form:label>
			<form:errors path="password" class="text-danger"/>
			<form:input type="password" path="password"/>
		</div>
		<div class="text-center">
			<button class="btn btn-success">Submit</button>
		</div>
	</form:form>
</div>
</body>
</html>