<%@ page import="java.util.List" %>
<%@ page import="event.Event.Event" %>
<html>
<head>
    <title>Event Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            background-image: url(images/1111.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .event-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .event-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            padding: 20px;
        }
        .event-card img {
            max-width: 100%;
            height: auto;
            display: block;
        }
        .event-info {
            padding: 10px;
        }
        .event-info h3 {
            margin: 0 0 10px;
            font-size: 18px;
            color: #333;
        }
        .event-info p {
            font-size: 14px;
            color: #777;
        }
        .event-actions {
            margin-top: 10px;
        }
        .product-actions form {
            display: inline-block;
        }
        .event-actions input[type="text"] {
            width: 80px;
            margin: 5px 0;
        }
        .event-actions input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 5px;
        }
        .event-actions input[type="submit"]:hover {
            background-color: #45a049;
        }
        .event-actions form .delete-btn {
            background-color: #f44336;
        }
        .event-actions form .delete-btn:hover {
            background-color: #e41d1d;
        }
    </style>
    <script>
        function validateForm(form) {
            const name = form.name.value.trim();
            const description = form.description.value.trim();
            const location = form.location.value.trim();
            const price = form.price.value.trim();
            const image = form.image_path.value.trim();

            // Validate all required fields
            if (!name || !description || !location || !price || !image) {
                alert("All fields are required.");
                return false;
            }

            // Validate price (must be a positive number)
            if (isNaN(price) || price <= 0) {
                alert("Price must be a valid positive number.");
                return false;
            }

            // Validate image URL (basic check if it's a valid URL format)
           var urlPattern = /^(https?:\/\/[^\s$.?#].[^\s]*)$/i;
            if (!urlPattern.test(image)) {
                alert("Please enter a valid image URL.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h1>Event Management</h1>

    <!-- Event Form (for adding new event) -->
    <form action="Event" method="post" onsubmit="return validateForm(this)">
    <input type="hidden" name="action" value="create">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea>

    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required>

    <label for="price">Price:</label>
    <input type="text" id="price" name="price" required>

    <label for="image">Image URL:</label>
    <input type="text" id="image" name="image_path" required>

    <input type="submit" value="Add Event">
</form>


    <!-- Event List -->
    <h2>Event List</h2>
    <div class="event-list">
        <%
            List<Event> eventList = (List<Event>) request.getAttribute("eventList");
            if (eventList != null && !eventList.isEmpty()) {
                for (Event event : eventList) {
        %>
        <div class="event-card">
            <img src="<%= event.getImage() %>" alt="Event Image">
            <div class="event-info">
                <h3><%= event.getName() %></h3>
                <p><%= event.getDescription() %></p>
                <p>Location: <%= event.getLocation() %></p>
                <p>Price: Rs.<%= event.getPrice() %></p>
            </div>
            <div class="event-actions">
                <form action="Event" method="post" onsubmit="return validateForm(this)">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="eventID" value="<%= event.getId() %>">
    <input type="text" name="name" value="<%= event.getName() %>">
    <input type="text" name="description" value="<%= event.getDescription() %>">
    <input type="text" name="location" value="<%= event.getLocation() %>">
    <input type="text" name="price" value="<%= event.getPrice() %>">
    <input type="text" name="image_path" value="<%= event.getImage() %>">
    <input type="submit" value="Update">
</form>

                <form action="Event" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="eventID" value="<%= event.getId() %>">
                    <input type="submit" value="Delete" class="delete-btn">
                </form>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No events available.</p>
        <%
            }
        %>
    </div>
</body>
</html>
