<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
    <head>
        <title>Bid Cars</title>
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
                  <a class="nav-link" href="/post_cars">Post Car</a>
                </li>
                <li class="nav-item">
                  <a href="/view_cars" class="nav-link">View Cars</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Bid a Car<span class="sr-only">(current)</span></a>
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
              <h1 class="text-center">List of Available Cars to Bid</h1>
            </div>
            <div class="row">
              <c:if test="${not empty not_available}">
                <p class="text-danger">${not_available}</p>
              </c:if>
            </div>
            <form class="row my-3" action="home_search" method="get">
              <div class="col">
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
                    <th scope="col">Car Name</th>
                    <th scope="col">Car Image</th>
                    <th scope="col">Action</th>
                  </tr>
                  <c:forEach var="car" items="${bidCar}">
                    <tr>
                      <td><span>${car.carName}</span></td>
                      <td><span>
                        <img src="/images/${car.carImage}" height="250" width="350">
                      </span></td>
                      <td><span>
                        <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                          <form:form action="bid_car" method="get">
                            <input type="hidden" name="carId" value="${car.carId}" />
                            <button class="btn btn-primary" type="submit">Bid</button>
                          </form:form>
                        </sec:authorize>
                        </td></span>
                        <td><span>
                        <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                          <form:form action="check_cars" method="get">
                            <input type="hidden" name="carId" value="${car.carId}" />
                            <button class="btn btn-primary" type="submit">Check</button>
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