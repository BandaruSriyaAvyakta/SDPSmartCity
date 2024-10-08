<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Cities</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap">
    <style>
        body {
            background-image: url('<%= request.getContextPath() %>/static/citysmart.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif; /* Adjust as needed */
        }
        /* Add additional styles as needed */
        /* Same styles as before... */
        /* ... */
    </style>
</head>
<body>
    <header>
        <a href="adminDashboard.jsp" class="admin-dashboard-btn">Admin Dashboard</a>
        <a href="adminCitiesManagement.jsp" class="manage-cities-btn">Manage Cities</a>
    </header>
    
    <main>
        <h1>Manage Cities</h1>
        <p>Welcome to the Manage Cities page. Here you can add, edit, or delete city information.</p>

        <form action="CityServlet" method="post">
            <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>"/>
            <input type="text" name="cityName" placeholder="City Name" required>
            <input type="text" name="state" placeholder="State" required>
            <input type="text" name="country" placeholder="Country" required>
            <input type="number" name="population" placeholder="Population" required>
            <input type="text" name="area" placeholder="Area (sq km)" required>
            <input type="text" name="infrastructureStatus" placeholder="Infrastructure Status" required>
            <textarea name="description" placeholder="Description" required></textarea>
            <button type="submit" name="action" value="Add">Add City</button>
            <button type="submit" name="action" value="Update">Update City</button>
        </form>

        <h2>City List</h2>
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
                <th>Actions</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdpsmartcity", "username", "password");
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
                        out.println("<td><a href='managecities.jsp?id=" + rs.getInt("id") + "'>Edit</a> | <a href='CityServlet?action=Delete&id=" + rs.getInt("id") + "'>Delete</a></td>");
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
