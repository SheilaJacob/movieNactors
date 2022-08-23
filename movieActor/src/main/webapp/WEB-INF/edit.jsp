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
<title>Edit and Update</title>
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
		<h3 class="text-white"><c:out value="${mov.user.name }"></c:out> ,edit movie ${mov.name}</h3>
	</nav>
<div class="container">
	<form:form action="/movies/update/${ mov.id }" modelAttribute="mov" method="POST">
	<input type="hidden" name="_method" value="put"/>
		<div class="row mb-3">
			<form:errors path="name" class="text-danger"/>
			<form:label path="name" class="col-sm-3 col-form-label">Title:</form:label>
			<div class="col-sm-8">
				<form:input path="name" class="form-control"/>
			</div>
		</div>
		<div class="row mb-3">
			<form:errors path="actor" class="text-danger"/>
			<form:label path="actor" class="col-sm-3 col-form-label">Actor:</form:label>
			<div class="col-sm-8">
				<form:input path="actor" class="form-control"/>
			</div>
		</div>
		<div class="row mb-3">
			<form:errors path="comment" class="text-danger"/>
			<form:label path="comment" class="col-sm-3 col-form-label">Comment:</form:label>
			<div class="col-sm-8">
				<form:textarea path="comment" rows = "3" cols="6" class="form-control"/>
			</div>
		</div>
		<div class="row mb-6">
				<form:errors path="dueDate" class="text-danger"/>
				<form:label for="dueDate" path="comment">date to watch</form:label>
			<div class="col-sm- 8">
				<form:input path="dueDate" type="date" />
			</div>
		</div>	
		<form:hidden path="user" value="${ sessionId }"/>
		<div class="d-flex justify-content-center">
		<button class="btn btn-primary">Update</button>
		</div>
	</form:form>
</div>

</body>
</html>