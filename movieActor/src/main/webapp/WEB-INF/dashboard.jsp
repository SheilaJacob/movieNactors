<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>Dashboard</title>
</head>
<body style="background-color:Maroon;">
	
	<div class="d-flex justify-content-end" >
      	<a href="/logout" class="btn btn-dark">logout</a>
      	<a href="/movies/new" class="btn btn-dark">Add to my movie!</a>
    </div>
    <nav class="navbar navbar-expand-sm bg-dark justify-content-center">
		<h3 class="text-white">Welcome, <c:out value="${user.name }"></c:out>!</h3>
	</nav>
<div class="container">
	<h3>Movies from everyone's shelves:</h3>
	<table class="table table-dark table-striped">
		<thead>
			<tr>
				<th>ID</th>
				<th>Movie</th>
				<th>Actors</th>
				<th>Date</th>
				<th>Posted By</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ allmovies }" var="mov">
			<tr>
				<td>${ mov.id }</td>
				<td><a href="/movie/${ mov.id }">${ mov.name }</a></td>
				<td>${ mov.actor }</td>
				<td><fmt:formatDate value="${mov.dueDate}" pattern="MMMM dd"/> </td>
				<td>${ mov.user.name }</td>
				<td>
					<c:if test = "${mov.user.id==user.id}">
		       			<a href="/movies/edit/${mov.id}" class="btn btn-dark">Edit</a>
		       			
		    		</c:if>
				
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>