<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.example.utils.DBConnection" %>

<!DOCTYPE html>
<html>

<head>
    <title>Student List</title>
</head>

<body>

<h2>Student Records</h2>

<%

    String message =
            (String) request.getAttribute("message");

    if (message != null) {

%>

        <p>
            <%= message %>
        </p>

<%

    }

%>

<table border="1" cellpadding="10">

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Branch</th>
    </tr>

<%

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        con = DBConnection.getConnection();

        String sql =
                "SELECT * FROM student";

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        while (rs.next()) {

%>

    <tr>

        <td>
            <%= rs.getInt("id") %>
        </td>

        <td>
            <%= rs.getString("name") %>
        </td>

        <td>
            <%= rs.getString("branch") %>
        </td>

    </tr>

<%

        }

    } catch (Exception e) {

        out.println(
                "<tr><td colspan='3'>"
                + e.getMessage()
                + "</td></tr>"
        );

    } finally {

        try {
            if (rs != null) rs.close();
        } catch (Exception ignored) {}

        try {
            if (ps != null) ps.close();
        } catch (Exception ignored) {}

        try {
            if (con != null) con.close();
        } catch (Exception ignored) {}
    }

%>

</table>

<br>

<a href="student-registration.jsp">
    Register Another Student
</a>

</body>

</html>