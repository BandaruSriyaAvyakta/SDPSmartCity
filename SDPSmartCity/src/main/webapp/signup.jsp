<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Sign-Up</title>
    <style>
        body {
            height: 100vh;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('static/blue.jpg'); /* Path to your signup image */
            background-size: cover;
            background-position: center;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 80vh;
            padding: 20px;
        }

        .signup-box {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 50px;
        }

        .signup-box h2 {
            margin-bottom: 20px;
            width: 100%;
            text-align: center;
            font-size: clamp(2rem, 5vw, 2.5rem);
        }

        .form-group {
            margin-bottom: 20px;
            padding: 10px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group select {
            width: 75%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input[type="radio"] {
            margin-right: 10px;
        }

        .form-group button[type="submit"] {
            background-color: darkblue;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            width: 100%;
            font-size: 1rem;
        }

        .form-group button[type="submit"]:hover {
            background-color: navy;
        }

        .form-group .terms-checkbox {
            display: flex;
            align-items: center;
        }

        .form-group .terms-checkbox input[type="checkbox"] {
            margin-right: 10px;
        }

        @media (max-width: 800px) {
            .form-group {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="signup-box">
            <h2>Sign Up</h2>
            <form action="signupServlet" method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" placeholder="Name" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                </div>
      
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="text" name="age" id="age" placeholder="Age" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" name="address" id="address" placeholder="Address" required>
                </div>
                <div class="form-group">
    <label for="phone">Phone Number</label>
    <input type="tel" name="phone" id="phone" placeholder="Phone Number" required> <!-- Updated name to 'phone' -->
</div>
                
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <input type="radio" name="gender" id="female" value="female" required> Female
                    <input type="radio" name="gender" id="male" value="male" required> Male
                </div>
                <div class="form-group">
                    <label for="user-type">User Type</label>
                    <select name="user-type" id="user-type" required>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                </div>
                <div class="form-group terms-checkbox">
                    <input type="checkbox" name="terms" id="terms" required> I agree with terms and conditions
                </div>
                <div class="form-group">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
