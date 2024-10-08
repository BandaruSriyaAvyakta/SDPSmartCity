<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('<%= request.getContextPath() %>/static/userdash1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
        }
        h1 {
            font-family: 'Playfair Display', serif;
            color: white;
            font-size: 3em;
            text-align: center;
            margin-top: 20px;
        }
        p {
            color: white;
            text-align: center;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 30px;
            width: 350px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin: 40px auto; /* Add this to center the card horizontally */
        }
        .card h2 {
            font-family: 'Playfair Display', serif;
            color: darkblue;
            font-size: 2em;
            margin-bottom: 20px;
        }
        .card button {
            background-color: darkblue;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 15px 20px;
            font-size: 1.2em;
            margin: 10px 0;
            cursor: pointer;
            width: 100%;
        }
        .card button:hover {
            background-color: navy;
        }
    </style>
</head>
<body>
    <h1>Welcome to the User Dashboard</h1>
    <div class="card">
        <h2>User Actions</h2>
        <button onclick="window.location.href='viewCityInfo.jsp'">View City Info</button>
        <button onclick="window.location.href='reportIssue.jsp'">Report Issue</button>
        <button onclick="window.location.href='feedback.jsp'">Feedback</button>
    </div>
</body>
</html>