package org.example.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.beans.User;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create User Bean
        User user = new User();

        user.setUsername(username);
        user.setPassword(password);

        // Authentication
        if (user.getUsername().equals("admin")
                && user.getPassword().equals("admin123")) {

            request.setAttribute("user", user);

            RequestDispatcher rd =
                    request.getRequestDispatcher("home.jsp");

            rd.forward(request, response);

        } else {

            request.setAttribute(
                    "error",
                    "Invalid username or password"
            );

            RequestDispatcher rd =
                    request.getRequestDispatcher("login.jsp");

            rd.forward(request, response);
        }
    }
}