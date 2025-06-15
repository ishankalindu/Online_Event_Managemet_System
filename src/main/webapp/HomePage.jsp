<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="event.Event.Event" %>
<%@ page import="event.Event.EventDBUtil" %>
<%@ page import="event.Notification.Notification" %>
<%@ page import="event.Notification.NotificationDBUtil" %>


<%

	NotificationDBUtil notificationDBUtil = new NotificationDBUtil();
    //Fetch the list of products from the database
    List<Event> eventList = EventDBUtil.getAllEvents();
	List<Notification> alartList = notificationDBUtil.getAllAlerts();
	List<Notification> uceList = notificationDBUtil.getAllUpcomingEvents();
%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<link rel="Stylesheet" href="resourse/css/Homepage.css">


<link rel="stylesheet" href="resourse/fonts/ionicons.min.css">
<link rel="stylesheet" href="resourse/css/Footer-Dark.css">
<link rel="stylesheet" href="resourse/css/Homestyles.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            background-image: url(images/1111.jpg);
            background-size: cover;
            background-repeat: no-repeat;
        }
        header .logo a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }
        header .logo a:hover {
            color: #00c853;
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
            color: #00c853; /* Green on hover */
        }

        main {
            padding: 20px;
        }
        
       

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 20px;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px;
            padding: 20px;
            text-align: center;
            width: calc(23.66% - 20px); /* Adjust width for 4 products per row */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            max-width: 100%;
            height: auto;
        }

        .price {
            color: #28a745; /* Green for the price */
            font-weight: bold;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px 0;
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

        /* Responsive styles */
        @media (max-width: 768px) {
            .product-card {
                width: calc(48% - 20px); /* Adjust width for 2 products per row on smaller screens */
            }
        }

        @media (max-width: 480px) {
            .product-card {
                width: calc(100% - 20px); /* Adjust width for 1 product per row on mobile */
            }
        }
         main h2 {
        font-size: 2rem; /* Title font size */
    color: #007bff; /* Title color */
    margin-bottom: 20px; /* Space below title */
    text-align: left; /* Center align */
    font-weight: bold;
    }
    	
    	/* Styles for Upcoming Events */

.upcoming-container {
    padding: 20px;
    margin: 10px 0;
    
}

.upcoming-title {
    font-size: 2rem; /* Title font size */
    color: #007bff; /* Title color */
    margin-bottom: 20px; /* Space below title */
    text-align: left; /* Center align */
    font-weight: bold;
}

.upcoming-card {
    background-color: #fff; /* White background */
    border-radius: 10px; /* Rounded corners */
    overflow: hidden; /* Ensure the image does not overflow */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Soft shadow */
    transition: transform 0.3s, box-shadow 0.3s; /* Smooth transition */
    position: relative; /* For positioning elements */
}

.upcoming-card:hover {
    transform: translateY(-5px); /* Lift effect */
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3); /* Stronger shadow on hover */
}

.upcoming-image {
    width: 100%; /* Full width */
    height: 180px; /* Fixed height */
    object-fit: cover; /* Cover the area without distortion */
}

.upcoming-description {
    padding: 15px; /* Inner padding */
    text-align: left; /* Center text */
}

.upcoming-btn {
    background-color: #28a745; /* Green background */
    color: white; /* White text */
    padding: 10px 20px; /* Inner padding */
    border: none; /* Remove border */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s; /* Smooth background change */
    text-decoration: none; /* No underline */
}

.upcoming-btn:hover {
    background-color: #218838; /* Darker green on hover */
}

/* Responsive Styles */
@media (max-width: 1500px) {
    .upcoming-card {
        width: calc(48% - 20px); /* Two cards per row */
        margin: 10px; /* Spacing */
    }
}
/*
@media (max-width: 480px) {
    .upcoming-card {
        width: calc(100% - 20px); /* One card per row */
    }
}

/* Styles for Alerts */

.alerts-container {
    padding: 20px;
    margin: 10px 0;
}

.alerts-title {
    font-size: 2rem; /* Title font size */
    color: #dc3545; /* Red color for alerts */
    margin-bottom: 20px; /* Space below title */
    text-align: left; /* Center align */
    font-weight: bold;
}

.alert-card {
    background-color: #fff; /* White background */
    border-radius: 10px; /* Rounded corners */
    overflow: hidden; /* Ensure the image does not overflow */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Soft shadow */
    transition: transform 0.3s, box-shadow 0.3s; /* Smooth transition */
    position: relative; /* For positioning elements */
}

.alert-card:hover {
    transform: translateY(-5px); /* Lift effect */
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3); /* Stronger shadow on hover */
}

.alert-image {
    width: 100%; /* Full width */
    height: 180px; /* Fixed height */
    object-fit: cover; /* Cover the area without distortion */
}

.alert-description {
    padding: 15px; /* Inner padding */
    text-align: left; /* Center text */
    font-size: 1.1rem; /* Slightly larger text for clarity */
}

.alert-description h4 {
    /* Title font size */
    color: #dc3545; /* Red color for alerts */
    margin-bottom: 0px; /* Space below title */
    text-align: left; /* Slightly larger text for clarity */
}


.alert-btn {
    background-color: #dc3545; /* Red background */
    color: white; /* White text */
    padding: 10px 20px; /* Inner padding */
    border: none; /* Remove border */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s; /* Smooth background change */
    text-decoration: none; /* No underline */
}

.alert-btn:hover {
    background-color: #c82333; /* Darker red on hover */
}

/* Responsive Styles */
@media (max-width: 3000px) {
    .alert-card {
        width: calc(100% - 20px); /* Two cards per row */
        margin: 10px; /* Spacing */
    }
}

@media (max-width: 480px) {
    .alert-card {
        width: calc(100% - 20px); /* One card per row */
    }
}

    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <a href = "HomePage.jsp"><h1>Event Managment</h1></a> <!-- Replace with your logo image if necessary -->
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
   
    	<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item "
					style="background-image: url(images/5555.webp)">
					<div class="carousel-caption d-none d-md-block">
						
						<h3 class="display-4">Bringing Your Events to Life with Seamless Precision!</h3>
						<p class="lead"></p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url(images/3333.jpg)">
					<div class="carousel-caption d-none d-md-block">
						
						<h3 class="display-4">Unforgettable Experiences Start with Effortless Planning!</h3>
						<p class="lead"></p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(images/4444.jpeg)">
					<div class="carousel-caption d-none d-md-block">
						
						<h3 class="display-4">Crafting Memorable Moments, One Event at a Time!</h3>
						<p class="lead"></p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
    

    <!-- Main Content -->
    
    <main>
        <h2>Available Events</h2>
        <div class="product-container">
            <%
                for (Event event : eventList) {
            %>
                <div class="product-card">
                    <img src="<%= event.getImage() %>" alt="<%= event.getName() %>" class="product-image">
                    <h3><%= event.getName() %></h3>
                    <p><%= event.getDescription() %></p>
                    <p class="price">Rs.<%= event.getPrice() %></p>
                    <a href="EventDetails.jsp?id=<%= event.getId() %>" class="btn">View Details</a>
                </div>
            <%
                }
            %>
        </div>
       <h2 class="upcoming-title">Upcoming Events</h2>
<div class="upcoming-container">
    <div class="product-container">
        <%
            for (Notification uce : uceList) {
        %>
            <div class="upcoming-card">
                <img src="<%= uce.getImagePath() %>" alt="<%= uce.getType() %>" class="upcoming-image">
                <div class="upcoming-description">
                    <p><%= uce.getDescription() %></p>
                    
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>

<h2 class="alerts-title">Event Alerts</h2>
<div class="alerts-container">
    <div class="product-container">
        <%
            for (Notification alert : alartList) {
        %>
            <div class="alert-card">
                
                <div class="alert-description">
                    <h4><%= alert.getType() %></h4>
                    
                </div>
                <div class="alert-description">
                    <p><%= alert.getDescription() %></p>
                    
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>

    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Event Management System. All rights reserved.</p>
        <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
    </footer>
    
    <script src="resourse/js/jquery.min.js"></script>
	<script src="resourse/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
