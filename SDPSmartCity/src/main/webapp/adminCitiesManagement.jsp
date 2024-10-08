<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add City Information</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap">
    <style>
        body {
            height: 100vh;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('<%= request.getContextPath() %>/static/citysmart.jpg');
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

        .form-box {
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

        .form-box h2 {
            margin-bottom: 20px;
            width: 100%;
            text-align: center;
            font-size: clamp(2rem, 5vw, 2.5rem);
            font-family: 'Playfair Display', serif;
            color: #00008B; /* Dark Blue Font Color */
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group textarea,
        .form-group select,
        .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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

        .scenic-images {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .scenic-images img {
            max-width: 300px;
            border-radius: 8px;
            display: none; /* Initially hide images */
        }

        .scenic-images img.display {
            display: block; /* Show images when updated */
        }
    </style>
</head>
<body>
    <header>
        <a href="adminDashboard.jsp" class="admin-dashboard-btn">Admin Dashboard</a>
        <nav>
            <ul>
                <!-- Add other navbar links here -->
            </ul>
        </nav>
    </header>
    
    <main>
        <div class="container">
            <div class="form-box">
                <h2>Manage City Information</h2>
                <form action="CityInfoServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="city-name">City Name:</label>
                        <input type="text" id="city-name" name="city_name" required>
                    </div>
                    <div class="form-group">
                        <label for="state">State:</label>
                        <input type="text" id="state" name="state" required>
                    </div>
                    <div class="form-group">
                        <label for="country">Country:</label>
                        <input type="text" id="country" name="country" required>
                    </div>
                    <div class="form-group">
                        <label for="population">Population:</label>
                        <input type="number" id="population" name="population" required>
                    </div>
                    <div class="form-group">
                        <label for="city-reports">City Reports:</label>
                        <textarea id="city-reports" name="city_reports" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="area-sq-km">Area (sq km):</label>
                        <input type="number" step="0.01" id="area-sq-km" name="area_sq_km" required>
                    </div>
                    <div class="form-group">
                        <label for="infrastructure-status">Infrastructure Status:</label>
                        <input type="text" id="infrastructure-status" name="infrastructure_status" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea id="description" name="description" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="scenic-image1">Scenic Spot Image 1:</label>
                        <input type="file" id="scenic-image1" name="scenic_image1" accept="image/*">
                    </div>
                    <div class="form-group">
                        <label for="scenic-image2">Scenic Spot Image 2:</label>
                        <input type="file" id="scenic-image2" name="scenic_image2" accept="image/*">
                    </div>
                    <div class="form-group">
                        <label for="scenic-image3">Scenic Spot Image 3:</label>
                        <input type="file" id="scenic-image3" name="scenic_image3" accept="image/*">
                    </div>
                    <div class="form-group">
                        <button type="submit">Submit</button>
                    </div>
                </form>

                <div class="scenic-images">
                    <img id="scenic-image1-display" class="display" src="#" alt="Scenic Spot 1">
                    <img id="scenic-image2-display" class="display" src="#" alt="Scenic Spot 2">
                    <img id="scenic-image3-display" class="display" src="#" alt="Scenic Spot 3">
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Smart City Project</p>
    </footer>

    <script>
        document.getElementById('scenic-image1').addEventListener('change', function(event) {
            if (event.target.files.length > 0) {
                const file = URL.createObjectURL(event.target.files[0]);
                document.getElementById('scenic-image1-display').src = file;
                document.getElementById('scenic-image1-display').style.display = 'block';
            }
        });
        document.getElementById('scenic-image2').addEventListener('change', function(event) {
            if (event.target.files.length > 0) {
                const file = URL.createObjectURL(event.target.files[0]);
                document.getElementById('scenic-image2-display').src = file;
                document.getElementById('scenic-image2-display').style.display = 'block';
            }
        });
        document.getElementById('scenic-image3').addEventListener('change', function(event) {
            if (event.target.files.length > 0) {
                const file = URL.createObjectURL(event.target.files[0]);
                document.getElementById('scenic-image3-display').src = file;
                document.getElementById('scenic-image3-display').style.display = 'block';
            }
        });
    </script>
</body>
</html>
