<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Event Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            background-image: url(images/6666.jpg);
			background-size: cover; /* Cover the entire container */
			background-position: center;
			
        }

        header {
            background-color: #343a40;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header .logo h1 {
            margin: 0;
            font-size: 24px;
        }
        header .logo a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }
        header .logo a:hover {
            color: #00c853;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: #00c853;
        }
        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
            z-index: 1; /* Ensures footer stays on top */
        }

        footer ul {
            list-style-type: none;
            padding: 0;
        }

        footer ul li {
            display: inline;
            margin: 0 10px;
        }

        footer ul li a {
            color: white;
            text-decoration: none;
        }

        main {
            padding: 20px;
            max-width: 800px;
            margin: auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
            margin-bottom: 50px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .about-content {
            margin-bottom: 20px;
        }

        .about-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <a href = "HomePage.jsp"><h1>Event Management</h1></a>
        </div>
        <nav>
            <ul>
                <li><a href="Register.jsp">Sign Up</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="Contactus.jsp">Contact Us</a></li>
                <li><a href="Aboutus.jsp">About Us</a></li>
            </ul>
        </nav>
    </header>

    <main>
    <h2>About Us</h2>
    <div class="about-content">
        <img src="images/7777.jpg" alt="About Us" class="about-image"> <!-- Replace with an actual image path -->
        <p>Welcome to the Event Management System! We specialize in providing a comprehensive platform for planning, organizing, and managing events of all sizes.</p>
        <p>Our mission is to simplify event management and ensure every event runs smoothly, creating unforgettable experiences for attendees and organizers alike.</p>
        <p>With a team of passionate professionals, we are dedicated to delivering innovative event solutions and exceptional service tailored to meet the unique needs of each event.</p>
    </div>
</main>

    <footer>
        <p>&copy; 2024 Event Management System. All rights reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
    </footer>
</body>
</html>
