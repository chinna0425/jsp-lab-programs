<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
</head>

<body>

<h2>Login</h2>

<%

    String error =
            (String) request.getAttribute("error");

    if (error != null) {

%>

        <p>
            <%= error %>
        </p>

<%

    }

%>

<form action="login" method="post">

    <label>Username:</label>

    <input type="text" name="username">

    <br><br>

    <label>Password:</label>

    <input type="password" name="password">

    <br><br>

    <button type="submit">Login</button>

</form>

</body>

</html>