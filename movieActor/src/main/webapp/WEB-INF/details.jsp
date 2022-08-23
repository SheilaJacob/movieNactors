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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>details</title>
</head>
<body>
	<div class="d-flex justify-content-start">
 		<div><a href="/movies" class="btn btn-success">Back to Home</a></div>
	</div>
	<div class="d-flex justify-content-end" >
      	<a href="/logout" class="btn btn-dark">logout</a>
      	<a href="/movies/new" class="btn btn-dark">Add to my movies!</a>
    </div>
    <nav class="navbar navbar-expand-sm bg-dark justify-content-center">
		<h3 class="text-white"><c:out value="${mov.user.name }"></c:out> you watched ${mov.name}</h3>
	</nav>
		<div id="page_header__message">
				<c:out value="${message}"/>
		</div>
	<div class="container">
		<h2>Comments:</h2>
			<hr class="my-4">
		<p class="lead"><em>${ mov.comment }</em></p>
		<hr class="my-4">
		<c:choose>
			<c:when test="${ userId == mov.user.id }">
			<a href="/movies/edit/${mov.id}" class="btn btn-primary btn-md">Edit</a>
			<a href="/delete/<c:out value="${mov.id}"/>"class="btn btn-dark">delete</a>
			</c:when>
		</c:choose>
	</div>
</body>
</html>