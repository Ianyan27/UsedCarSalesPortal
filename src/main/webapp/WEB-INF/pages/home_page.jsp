<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
    <head>
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <%@ page isELIgnored="false"%>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/home">ABC Cars Pte Ltd</a>
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
                  <a class="nav-link" href="/bid_cars">Bid a Car</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/account">Account</a>
                </li>
                <sec:authorize access="hasRole('ADMIN')">
                  <li class="nav-item">
                    <a class="nav-link" href="/registered_accounts">Registered Account</a>
                  </li>
                </sec:authorize>
              </ul>
            </div>
            <form class="form-inline" action="logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input class="btn btn-info" type="submit" value="Logout" name="logout">
            </form>
          </nav>
          <div class="container">
            <div class="row justify-content-md-center">
              <div class="col-md-auto w-25">
                <h2>List of Available Cars</h2>
              </div>
              <form class="row my-5" action="home_search" method="get">
                <div class="col-2">
                  <input class="form-control mr-sm-2" type="search" placeholder="Search Cars" name="keyword">
                </div>
                <div class="col-1">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </div>
              </form>
              <div class="row justify-content-md-center w-100">
                <c:forEach var="car" items="${car}">
                  <div class="col d-flex flex-column align-items-center mx-3 my-2">
                    <p class="text-center my-3">${car.carName}</p>
                    <img src="/images/${car.carImage}" height="250" width="250" alt="Image of a car">
                    <p class="text-center my-3">Car posted by: ${car.userName}</p>
                    <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                          <form:form class="d-flex justify-content-center" action="check_cars" method="get">
                            <input type="hidden" name="carId" value="${car.carId}" />
                            <button class="btn btn-primary text-center mt-3 mb-2" type="submit">Check</button>
                          </form:form>
                    </sec:authorize>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>