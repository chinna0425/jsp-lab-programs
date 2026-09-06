<%@ page import="org.example.beans.User" %>

<!DOCTYPE html>
<html>

<head>
    <title>Home</title>
</head>

<body>

<%

    User user =
            (User) request.getAttribute("user");

%>

<h2>Login Successful</h2>

<p>
    Welcome,
    <%= user.getUsername() %>
</p>

</body>

</html>