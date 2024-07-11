<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Account</title>
        <%@ page isELIgnored="false"%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container bg-light mx-auto my-5 py-3 w-75 rounded">
            <div class="row justify-content-md-center">Create Account</div>
            <div class="row justify-content-md-center">
                <c:if test="${create_acc_success != null}">
                    <p class="text-success row">${create_acc_success}</p>
                    <p class="text-danger row">${error_message}</p>
                    <button class="btn btn-link"><a href="/login">Login Account</a></button>
                </c:if>
            </div>
            <div class="row justify-content-md-center">
                
            </div>
            <form:form action="create_account" method="post" modelAttribute="user">
                <div class="row justify-content-md-center">
                    <form:input class="w-75 rounded border-0 p-3 my-3" type="text" id="userName" path="userName" placeholder="Enter your name:" required="true"/>
                </div>
                <div class="row justify-content-md-center">
                    <form:input class="w-75 rounded border-0 p-3 my-3" type="text" path="userEmail" placeholder="Enter your Email Account: " required="true"/>
                </div>
                <div class="row justify-content-md-center">
                    <form:input class="w-75 rounded border-0 p-3 my-3" type="text" path="userPassword" placeholder="Enter your Password: " required="true"/>
                </div>
                <div class="row justify-content-md-center">
                    <input class="w-75 rounded border-0 p-3 my-3 btn btn-primary" type="submit" value="Create Account"/>
                </div>
            </form:form>
            <div class="row justify-content-md-center">
                <c:if test = "${create_acc_success == null}">
                    <button class="btn btn-link"><a href="/login">Login</a></button>
                </c:if>
            </div>
        </div>
    </body>
</html>