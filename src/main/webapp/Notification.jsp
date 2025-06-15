<%@ page import="event.Notification.Notification" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notification Management</title>
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
        input[type="text"], textarea, select {
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
        .notification-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .notification-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            padding: 20px;
        }
        .notification-card img {
            max-width: 100%;
            height: auto;
            display: block;
        }
        .notification-info {
            padding: 10px;
        }
        .notification-info h3 {
            margin: 0 0 10px;
            font-size: 18px;
            color: #333;
        }
        .notification-info p {
            font-size: 14px;
            color: #777;
        }
        .notification-card {
            margin-top: 10px;
        }
        .notification-card form {
            display: inline-block;
        }
        .notification-card input[type="text"] {
            width: 180px;
            margin: 5px 0;
        }
        .notification-card input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 5px;
        }
        .notification-card input[type="submit"]:hover {
            background-color: #45a049;
        }
        .notification-card form .delete-btn {
            background-color: #f44336;
        }
        .notification-card form .delete-btn:hover {
            background-color: #e41d1d;
        }
    
    </style>
    <script>
        function validateForm(form) {
            const type = form.type.value;
            const description = form.description.value.trim();
            const imagePath = form.image_path.value.trim();

            // Validate description (must be filled out)
            if (description === "") {
                alert("Description is required.");
                return false;
            }

            // If type is "Upcoming Events", image URL must be required
            if (type === "Upcoming Events" && imagePath === "") {
                alert("Image URL is required for Upcoming Events.");
                return false;
            }

            return true;  // Passes validation
        }

        function handleTypeChange(selectElement) {
            const imagePathField = document.getElementById("image_path");

            // Make image URL required if "Upcoming Events" is selected, otherwise not
            if (selectElement.value === "Upcoming Events") {
                imagePathField.required = true;
                imagePathField.disabled = false;
            } else {
                imagePathField.required = false;
                imagePathField.disabled = true;
            }
        }
    </script>
</head>
<body>

    <!-- Notification List -->
    <h1>Notification Management</h1>

    <!-- Create Notification Form with Validation -->
    <form action="Notification" method="post" onsubmit="return validateForm(this)">
        <input type="hidden" name="action" value="create">

        <label for="type">Type:</label>
        <select id="type" name="type" onchange="handleTypeChange(this)">
            <option value="Alert">Alert</option>
            <option value="Upcoming Events">Upcoming Events</option>
        </select>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>

        <label for="image_path">Image URL:</label>
        <input type="text" id="image_path" name="image_path" disabled>

        <input type="submit" value="Add Notification">
    </form>

    <!-- Notification List -->
    <h2>Notifications</h2>
    <div class="notification-list">
        <%
            List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
            if (notifications != null) {
                for (Notification notification : notifications) {
        %>
        <div class="notification-card">
            <img src="<%= notification.getImagePath() %>" alt="Alert">
            <div class="notification-info">
                <h3><%= notification.getType() %></h3>
                <p><%= notification.getDescription() %></p>
            </div>

            <!-- Update Notification Form -->
            <form action="Notification" method="post" onsubmit="return validateForm(this)">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= notification.getId() %>">

                <label for="type">Type:</label>
                <select name="type" onchange="handleTypeChange(this)">
                    <option value="Alert" <%= "Alert".equals(notification.getType()) ? "selected" : "" %>>Alert</option>
                    <option value="Upcoming Events" <%= "Upcoming Events".equals(notification.getType()) ? "selected" : "" %>>Upcoming Events</option>
                </select>

                <label for="description">Description:</label>
                <input type="text" name="description" value="<%= notification.getDescription() %>">

                <label for="image_path">Image URL:</label>
                <input type="text" name="image_path" id="image_path_<%= notification.getId() %>" value="<%= notification.getImagePath() %>">

                <input type="submit" value="Update">
            </form>

            <form action="Notification" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= notification.getId() %>">
                <input type="submit" value="Delete" class="delete-btn">
            </form>
        </div>
        <%
                }
            } else {
        %>
        <p>No notifications available.</p>
        <%
            }
        %>
    </div>
</body>
</html>
