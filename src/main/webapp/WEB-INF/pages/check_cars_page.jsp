<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Cars</title>
<%@ page isELIgnored="false"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">ABC Cars Pte Ltd</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		  <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
		  <ul class="navbar-nav">
			<li class="nav-item active">
			  <a class="nav-link" href="/home">Home</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" href="/post_cars">Post Car</a>
			</li>
			<li class="nav-item">
			  <a href="/view_cars" class="nav-link">View Cars<span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" href="#">Bid a Car</a>
			</li>
			<li class="nav-item">
			  <a href="/account" class="nav-link">Account</a>
			</li>
		  </ul>
		</div>
		<form class="form-inline" action="logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input class="btn btn-info" type="submit" value="Logout" name="logout">
		</form>
	  </nav>
	<div class="container">
		<div class="row">
			<div class="col">
				<a href="/home"><button class="btn btn-info">Home</button></a>
			</div>
			<div class="col">
				<a href="/bid_cars"><button class="btn btn-info">Bid Car</button></a>
			</div>
		</div>
		<div class="row">
			<h1>Check Cars</h1>
		</div>
		<div class="row">
            <div class="row">
                <form:form action="check_cars" method="post" modelAttribute = "checks">
                    <div class="form-group">
                        <label for="carName">Enter Car Name: </label>
                        <form:input path="carName" class="form-control" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Make: </label>
                        <form:input path="carMake" class="form-control" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Model: </label>
                        <form:input path="carModel" class="form-control" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Registration: </label>
                        <form:input path="carRegistration" class="form-control" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Price: </label>
                        <form:input min="1000" max="1000000000" type="number" path="carPrice" class="form-control" readonly="true"/>
                    </div>
                </form:form>
            </div>
		</div>
	</div>
</body>
</html>