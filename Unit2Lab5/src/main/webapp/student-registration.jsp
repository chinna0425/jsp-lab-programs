<!DOCTYPE html>
<html>

<head>
    <title>Student Registration</title>
</head>

<body>

<h2>Student Registration</h2>

<form action="registerStudent" method="post">


    <label>Student Name:</label>
    <input type="text" name="name" required>

    <br><br>

    <label>Branch:</label>
    <input type="text" name="branch" required>

    <br><br>

    <button type="submit">Register</button>

</form>

<br>

<a href="student-list.jsp">
    View Students
</a>

</body>

</html>