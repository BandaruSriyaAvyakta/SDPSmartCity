package com.smartcity.controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.smartcity.service.UserService;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserService userService = new UserService();
        boolean isValidUser = userService.validateUser(username, password);

        if (isValidUser) {
            // Redirect to user dashboard
            response.sendRedirect("userDashboard.jsp");
        } else {
            // Redirect back to login page with error message
            response.sendRedirect("userLogin.jsp?error=Invalid%20credentials");
        }
    }
}
