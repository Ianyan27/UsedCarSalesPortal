<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Cars</title>
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
			  <a class="nav-link" href="/bid_cars">Bid a Car</a>
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
			<h1 class="text-center">Cars</h1>
		</div>
		<div class="row">
			<sec:authorize access="hasAnyRole('ADMIN', 'USERS')">
				<a href="post_cars"><button class="btn btn-primary">Add New Cars</button></a>
			</sec:authorize>
		</div>
		<form class="row my-3" action="search" method="get">
			<div class="col-2">
				<input class="form-control mr-sm-2" type="Search" placeholder="Search Cars" name="keyword">
			</div>
			<div class="col">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</div>
		</form>
		<div class="row">
			<div class="col-md-6">
				<table class="table">
					<tr>
						<th scope="col">Posted By</th>
						<th scope="col">Car Name</th>
						<th scope="col">Car Make</th>
						<th scope="col">Car Model</th>
                        <th scope="col">Car Registration</th>
                        <th scope="col">Car Price</th>
						<th scope="col">Car Image</th>
						<th scope="col">Car Bid</th>
						<sec:authorize access="hasAnyRole('USERS', 'ADMIN')">
							<th scope="col">Edit/Delete/Deactivate</th>
						</sec:authorize>
					</tr>
					<c:forEach var="car" items="${car}">
						<tr>
							<td><span>${car.userName}</span></td>
							<td><span>${car.carName}</span></td>
							<td><span>${car.carMake}</span></td>
							<td><span>${car.carModel}</span></td>
                            <td><span>${car.carRegistration}</span></td>
                            <td>$<span>${car.carPrice}</span></td>
							<td><span><img src="/images/${car.carImage}" width="250" height="250"></span></td>
							<td><span></span></td>
							<td><span>
								<sec:authorize access="hasAnyRole('USER', 'ADMIN')">
									<form:form class="d-flex justify-content-center" action="edit_cars" method="get">
										<input type="hidden" name="carId" value="${car.carId}" />
										<button class="btn btn-primary" type="submit">Edit</button>
									</form:form>
								</sec:authorize>
							</span></td>
							<td><span>
								<sec:authorize access="hasAnyRole('USER', 'ADMIN')">
									<form:form action="delete_cars" method="get">
										<input type="hidden" name="carId" value="${car.carId}"/>
										<button class="btn btn-primary" type="submit">Delete</button>
									</form:form>
								</sec:authorize>
							</span></td>
							<td><span>
								<sec:authorize access="hasAnyRole('USER', 'ADMIN')">
									<form:form action="#" method="get">
										<input type="hidden" name="carId" value="${car.carId}">
										<button class="btn btn-primary" type="submit">Deactivate</button>
									</form:form>
								</sec:authorize>
							</span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>