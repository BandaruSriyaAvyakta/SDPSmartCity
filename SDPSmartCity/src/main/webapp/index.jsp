<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smart City Application</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap');
        
        body {
            background-image: url('<%= request.getContextPath() %>/static/main5.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        h1 {
            color: white;
            text-align: center;
            margin-top: 20px;
            font-size: 3em; /* Increased font size */
            font-family: 'Playfair Display', serif; /* Font changed to Playfair Display */
        }
        .description {
            text-align: center;
            margin: 30px auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            width: 60%;
            border-radius: 10px;
            font-size: 1.1em;
        }
        .button-container {
            text-align: center;
            margin-top: 30px;
        }
        .login-btn {
            background-color: #007BFF;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            margin: 20px;
            cursor: pointer;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Welcome to the Smart City Application</h1>
    
    <div class="description">
        <p>
            This is a <strong>Smart City Application</strong> that will manage and store essential city details. This platform will allow easy access to information on public services, infrastructure, and amenities.
            
            The app is designed to help users navigate city-related information easily
        </p>
        <ul>
            <li><strong>Admin:</strong>is used to Manage city information, update public services details, and monitor infrastructure data.</li>
            <li><strong>User:</strong>can Access and search city details, report issues with public services, and provide feedback on amenities.</li>
        </ul>
    </div>

    <div class="button-container">
        <button class="login-btn" onclick="location.href='userLogin.jsp'">User Login</button>
        <button class="login-btn" onclick="location.href='adminLogin.jsp'">Admin Login</button>
    </div>
</body>
</html>
