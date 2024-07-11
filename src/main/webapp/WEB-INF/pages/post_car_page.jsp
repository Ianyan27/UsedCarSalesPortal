<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post Car</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
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
                  <a class="nav-link" href="/post_cars">Post Car <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a href="/view_cars" class="nav-link">View Cars</a>
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
                <h1>Post new Car</h1>
                <a href="/view_cars"><button class="btn btn-primary">View Cars</button></a>
            </div>
            <div class="row">
                <form:form action="post_new_cars" method="post" modelAttribute = "car" enctype="multipart/form-data">
                    <form:hidden path="carId"/>
                    <div class="form-group">
                        <label for="carName">Enter Car Name: </label>
                        <form:input path="carName" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Make: </label>
                        <form:input path="carMake" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Model: </label>
                        <form:input path="carModel" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Registration: </label>
                        <form:input path="carRegistration" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label for="carName">Enter Car Price: </label>
                        <form:input min="1000" max="1000000000" type="number" path="carPrice" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                      <label for="carImage">Enter Car Image</label>
                      <input class="form-control" type="file" name="file" required="true"/>
                    </div>
                    <input class="btn btn-primary mt-3" type="submit" value="Add Cars">
                </form:form>
            </div>
        </div>
    </body>
</html>