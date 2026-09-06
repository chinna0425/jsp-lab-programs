package org.example.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.beans.Student;
import org.example.utils.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/registerStudent")
public class StudentRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        String name =
                request.getParameter("name");

        String branch =
                request.getParameter("branch");


        // 2. Create Student Bean

        Student student = new Student();

        student.setName(name);
        student.setBranch(branch);


        // 3. Database connection

        try {

            Connection con =
                    DBConnection.getConnection();


            // 4. SQL query

            String sql =
                    "INSERT INTO student( name, branch) VALUES ( ?, ?)";


            // 5. PreparedStatement

            PreparedStatement ps =
                    con.prepareStatement(sql);


            // 6. Set values

            ps.setString(1, student.getName());

            ps.setString(2, student.getBranch());


            // 7. Execute INSERT

            int rows =
                    ps.executeUpdate();


            // 8. Close resources

            ps.close();

            con.close();


            // 9. Send result to JSP

            if (rows > 0) {

                request.setAttribute(
                        "message",
                        "Student registered successfully!"
                );

            } else {

                request.setAttribute(
                        "message",
                        "Student registration failed."
                );
            }


            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "student-list.jsp"
                    );

            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "message",
                    "Database error: " + e.getMessage()
            );

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "student-list.jsp"
                    );

            rd.forward(request, response);
        }
    }
}