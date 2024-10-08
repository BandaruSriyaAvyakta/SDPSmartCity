<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap">
    <style>
        body {
            background-image: url('<%= request.getContextPath() %>/static/admin4.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            padding: 0;
            font-family: 'Playfair Display', serif;
        }
        .navbar {
            background-color: #102C57;
            overflow: hidden;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 20px; /* Increased font size */
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .content {
            padding: 80px 20px;
        }
        h1 {
            color: #00008B; /* Dark Blue Font Color */
            text-align: center;
            margin-top: 50px;
            font-size: 36px; /* Increased font size */
        }
        p {
            color: #00008B; /* Dark Blue Font Color */
            text-align: center;
            font-size: 20px; /* Increased font size */
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="adminDashboard.jsp">Home</a>
        <a href="managecities.jsp">Manage Cities</a>
        <a href="reports.jsp">Reports</a>
        <a href="adminLogin.jsp">Logout</a> <!-- Updated href to redirect to adminlogin.jsp -->
    </div>

    <!-- Content -->
    <div class="content">
        <h1>Welcome to the Admin Dashboard</h1>
    </div>
</body>
</html>
