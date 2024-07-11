<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
    <head>
        <title>Account Search Page</title>
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
                  <a class="nav-link" href="/home">Home</span></a>
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
                  <a href="" class="nav-link">Account<span class="sr-only">(current)</span></a>
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
              <h1 class="text-center">Registered Accounts</h1>
            </div>
            <form class="row my-3" action="search_account" method="get">
              <div class="col">
                <input class="form-control mr-sm-2" type="Search" placeholder="Search Account" name="search_acc">
              </div>
              <div class="col">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </div>
            </form>
            <div class="row">
                <div class="col-md-6">
                    <table class="table">
                        <tr>
                            <th scope="col">Username</th>
                            <th scope="col">Email</th>
                            <th scope="col">Password</th>
                            <sec:authorize access="hasRole('ADMIN')">
                                <th scope="col">Delete</th>
                            </sec:authorize>
                        </tr>
                        <c:forEach var="user" items="${acc}">
                            <tr>
                                <td><span>${user.userName}</span></td>
                                <td><span>${user.userEmail}</span></td>
                                <td><span>${user.userPassword}</span></td>
                                <td><span>
                                    <sec:authorize access="hasRole('ADMIN')">
                                        <form:form action="delete_acc" method="get">
                                            <input type="hidden" name="carId" value="${user.userId}"/>
                                            <button class="btn btn-primary" type="submit">Delete</button>
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