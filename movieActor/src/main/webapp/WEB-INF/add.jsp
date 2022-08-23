<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>Add New</title>
</head>
<body>
<div class="d-flex justify-content-start">
 	<div><a href="/movies" class="btn btn-success">Back to movies</a></div>
</div>
    <div class="d-flex justify-content-end" >
        <a href="/logout"  class="btn btn-dark">logout</a>
    </div>
    <nav class="navbar navbar-expand-sm bg-light justify-content-center">
	<h3 class="text-primary">Add to Your Movies</h3>
	</nav>
<div class="container">
	<form:form action="/movies/add" method="post" modelAttribute="newMM" class="form">
			<div class="form-row">
			 	
				<form:label for="name" path="name">Title:</form:label>
				<form:errors path="name" class="error"/>
				<form:input type="name" path="name" class="form-control"/>
				
			</div>
			
			<div class="form-row">
				<form:errors path="actor" class="error"/><br>
				<form:label for="actor" path="actor">Actor:</form:label>
				<form:input type="actor" path="actor" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="comment" class="error"/><br>
				<form:label for="comment" path="comment">My Thoughts:</form:label>
				<form:textarea path="comment" class="form-control"/>
			</div>
			<div>
				<form:errors path="dueDate" class="text-danger"/>
				<form:label for="dueDate" path="comment">date to watch</form:label>
				<form:input path="dueDate" type="date"/>
			</div>
			<div class="form-row">
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${sessionId}" class="form-control"/>
			</div>
			
			<div class="d-flex justify-content-center">
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
	</form:form>
</div>
</body>
</html>