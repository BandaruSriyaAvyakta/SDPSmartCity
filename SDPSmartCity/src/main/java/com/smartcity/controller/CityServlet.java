package com.smartcity.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CityServlet")
public class CityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        String cityName = request.getParameter("cityName");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        int population = Integer.parseInt(request.getParameter("population"));
        double area = Double.parseDouble(request.getParameter("area"));
        String infrastructureStatus = request.getParameter("infrastructureStatus");
        String description = request.getParameter("description");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdpsmartcity", "root", "sriya123");

            if ("Add".equals(action)) {
                pstmt = conn.prepareStatement("INSERT INTO cityinfo (City_Name, State, Country, Population, Area, Infrastructure_Status, Description) VALUES (?, ?, ?, ?, ?, ?, ?)");
                pstmt.setString(1, cityName);
                pstmt.setString(2, state);
                pstmt.setString(3, country);
                pstmt.setInt(4, population);
                pstmt.setDouble(5, area);
                pstmt.setString(6, infrastructureStatus);
                pstmt.setString(7, description);
                pstmt.executeUpdate();
            } else if ("Update".equals(action)) {
                pstmt = conn.prepareStatement("UPDATE cityinfo SET City_Name=?, State=?, Country=?, Population=?, Area=?, Infrastructure_Status=?, Description=? WHERE id=?");
                pstmt.setString(1, cityName);
                pstmt.setString(2, state);
                pstmt.setString(3, country);
                pstmt.setInt(4, population);
                pstmt.setDouble(5, area);
                pstmt.setString(6, infrastructureStatus);
                pstmt.setString(7, description);
                pstmt.setInt(8, Integer.parseInt(id));
                pstmt.executeUpdate();
            } else if ("Delete".equals(action)) {
                pstmt = conn.prepareStatement("DELETE FROM cityinfo WHERE id=?");
                pstmt.setInt(1, Integer.parseInt(id));
                pstmt.executeUpdate();
            }
            response.sendRedirect("managecities.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
}
