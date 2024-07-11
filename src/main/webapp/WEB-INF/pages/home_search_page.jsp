<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
    <head>
        <title>Home Search Page</title>
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
                  <a class="nav-link" href="/home">Home<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/post_cars">Post Car</a>
                </li>
                <li class="nav-item">
                  <a href="/view_cars" class="nav-link">View Cars</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Bid a Car</a>
                </li>
                <li class="nav-item">
                  <a href="" class="nav-link">Account</a>
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
              <h1 class="text-center">List of Available Cars</h1>
            </div>
            <div class="row">
              <c:if test="${empty result}">
                <p class="text-danger">Car not found, Search again</p>
              </c:if>
            </div>
            <form class="row my-3" action="home_search" method="get">
              <div class="col-3">
                <input class="form-control mr-sm-2" type="Search" placeholder="Search Cars Name" name="keyword">
              </div>
              <div class="col-7">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </div>
            </form>
            <div class="row justify-content-md-center w-100">
              <c:forEach var="car" items="${result}">
                <div class="col d-flex flex-column align-items-center">
                  <p class="text-center">${car.carName}</p>
                  <img class="" src="/images/${car.carImage}" height="250" width="250" alt="Image of a car">
                  <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                        <form:form class="d-flex justify-content-center" action="check_cars" method="get">
                          <input type="hidden" name="carId" value="${car.carId}" />
                          <button class="btn btn-primary text-center" type="submit">Check</button>
                        </form:form>
                  </sec:authorize>
                </div>
              </c:forEach>
            </div>
          </div>
    </body>
</html>