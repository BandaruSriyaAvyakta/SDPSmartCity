package com.smartcity.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String userType = request.getParameter("user-type");
        String agreeTerms = request.getParameter("terms");

        if (agreeTerms == null) {
            response.getWriter().println("You must agree to the terms and conditions.");
            return;
        }

        try {
            // Register the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/sdpsmartcity?useSSL=false&serverTimezone=UTC", "root", "sriya123");

            // Insert into the signup table (no confirm_password now)
            String signupSql = "INSERT INTO signup (name, username, password, age, address, phone_number, gender, user_type, terms_accepted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement signupPstmt = conn.prepareStatement(signupSql);
            signupPstmt.setString(1, name);
            signupPstmt.setString(2, username);
            signupPstmt.setString(3, password);  // Save plain text password
            signupPstmt.setString(4, age);
            signupPstmt.setString(5, address);
            signupPstmt.setString(6, phoneNumber);
            signupPstmt.setString(7, gender);
            signupPstmt.setString(8, userType);
            signupPstmt.setBoolean(9, true);  // Terms are agreed
            signupPstmt.executeUpdate();

            // Also insert the username and plain text password into the users table for login purposes
            String usersSql = "INSERT INTO users (username, password) VALUES (?, ?)";
            PreparedStatement usersPstmt = conn.prepareStatement(usersSql);
            usersPstmt.setString(1, username);
            usersPstmt.setString(2, password);  // Save plain text password
            usersPstmt.executeUpdate();

            conn.close();
            response.sendRedirect("userLogin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
