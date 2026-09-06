<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="org.example.utils.DBConnection" %>

<!DOCTYPE html>
<html>

<head>
    <title>Student Records</title>
</head>

<body>

<h2>Student Records</h2>

<table border="1" cellpadding="10">

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Branch</th>
    </tr>

<%

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {

        con = DBConnection.getConnection();

        stmt = con.createStatement();

        rs = stmt.executeQuery(
                "SELECT * FROM student"
        );

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
            if (stmt != null) stmt.close();
        } catch (Exception ignored) {}

        try {
            if (con != null) con.close();
        } catch (Exception ignored) {}
    }

%>

</table>

</body>

</html>