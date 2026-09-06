<%@ page import="org.example.beans.Student" %>

<!DOCTYPE html>
<html>

<head>
    <title>JavaBean Example</title>
</head>

<body>

<h2>Student Registration</h2>

<form method="post">

    <label>Student ID:</label>
    <input type="number" name="id">

    <br><br>

    <label>Student Name:</label>
    <input type="text" name="name">

    <br><br>

    <label>Branch:</label>
    <input type="text" name="branch">

    <br><br>

    <button type="submit">Submit</button>

</form>

<hr>

<jsp:useBean id="student"
             class="org.example.beans.Student"
             scope="request" />

<jsp:setProperty name="student"
                 property="*" />

<%

    String method = request.getMethod();

    if (method.equals("POST")) {

%>

        <h3>Student Details</h3>

        <p>
            ID:
            <jsp:getProperty name="student"
                             property="id" />
        </p>

        <p>
            Name:
            <jsp:getProperty name="student"
                             property="name" />
        </p>

        <p>
            Branch:
            <jsp:getProperty name="student"
                             property="branch" />
        </p>

<%

    }

%>

</body>

</html>