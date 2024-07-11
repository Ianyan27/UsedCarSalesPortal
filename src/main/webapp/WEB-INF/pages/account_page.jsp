<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Account Page</title>
        <%@ page isELIgnored="false"%>
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
                  <a class="nav-link" href="/bid_cars">Bid a Car</a>
                </li>
                <li class="nav-item">
                  <a href="/account" class="nav-link">Account <span class="sr-only">(current)</span></a>
                </li>
              </ul>
            </div>
            <form class="form-inline" action="logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input class="btn btn-info" type="submit" value="Logout" name="logout">
            </form>
          </nav>
          <div class="container bg-secondary text-white rounded px-4 mt-5">
            <div class="row pt-3">
              <div class="col-2">
                <h3>Username: </h3>
              </div>
              <div class="col-2">
                <h3>${user}</h3>
              </div>
            </div>
            <div class="row pt-3">
              <div class="col-2">
                <h3>Email: </h3>
              </div>
              <div class="col-2">
                <h3>${email}</h3>
              </div>
            </div>
            <div class="row py-3">
              <div class="col-2">
                <h3>Password: </h3>
              </div>
              <div class="col-2">
                <h3>examplepassword</h3>
              </div>
            </div>
          </div>
    </body>
</html>