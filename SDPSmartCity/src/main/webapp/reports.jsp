<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>City Reports</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/styles.css">
    <style>
        /* Add your styles here */
    </style>
</head>
<body>
    <header>
        <a href="adminDashboard.jsp">Admin Dashboard</a>
        <h1>City Reports</h1>
    </header>
    
    <main>
        <h2>City Information</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>City Name</th>
                <th>State</th>
                <th>Country</th>
                <th>Population</th>
                <th>Area (sq km)</th>
                <th>Infrastructure Status</th>
                <th>Description</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdpsmartcity", "root", "sriya123");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM cityinfo");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        out.println("<td>" + rs.getString("City_Name") + "</td>");
                        out.println("<td>" + rs.getString("State") + "</td>");
                        out.println("<td>" + rs.getString("Country") + "</td>");
                        out.println("<td>" + rs.getInt("Population") + "</td>");
                        out.println("<td>" + rs.getDouble("Area") + "</td>");
                        out.println("<td>" + rs.getString("Infrastructure_Status") + "</td>");
                        out.println("<td>" + rs.getString("Description") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
        </table>
    </main>

    <footer>
        <p>&copy; 2024 Smart City Project</p>
    </footer>
</body>
</html>
