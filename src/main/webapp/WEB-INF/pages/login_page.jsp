<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <div class="container bg-light mx-auto my-5 py-3 w-75 rounded">
            <div class="row justify-content-center">
                <h2 class="text-center">Login Account</h2>
                <p class="text-success">${create_acc_success}</p>
                <c:if test="${error_msg != null}">
                    <h3 class="text-danger text-center">${error_msg}</h3>
                </c:if>
            </div>
            <form action="login" method="post">
                <div class="row justify-content-md-center">
                    <input class="w-75 rounded border-0 p-3 my-3" type="email" name="username" id="username" placeholder="Enter your Email Account">
                </div>
                <div class="row justify-content-md-center">
                    <input class="w-75 rounded border-0 p-3 mb-3" type="password" name="password" id="password" placeholder="Password">
                </div>
                <div class="row justify-content-md-center mb-2">
                    <input class="w-75 rounded border-0 p-3 btn btn-primary" type="submit" name="login" value="Log In">
                </div>
            </form>
            <div class="row">
                <button class="btn btn-link"><a href="/create_account">Create Account</a></button>
            </div>
        </div>
    </body>
</html>