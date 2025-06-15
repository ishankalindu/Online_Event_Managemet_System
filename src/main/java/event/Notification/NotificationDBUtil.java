package event.Notification;

import event.DBConnect.DBConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationDBUtil {
    private Connection connection;

    public NotificationDBUtil() {
        connection = DBConnect.getConnection();
    }

    // Method to get all notifications
    public List<Notification> getNotifications() {
        List<Notification> notifications = new ArrayList<>();
        try {
            String query = "SELECT * FROM notification";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String type = rs.getString("type");
                String description = rs.getString("description");
                String imagePath = rs.getString("image_path");
                Notification notification = new Notification(id, type, description, imagePath);
                notifications.add(notification);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    // Method to get all alerts
    public List<Notification> getAllAlerts() {
        List<Notification> alerts = new ArrayList<>();
        try {
            String query = "SELECT * FROM notification WHERE type = 'Alert'";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String type = rs.getString("type");
                String description = rs.getString("description");
                String imagePath = rs.getString("image_path");
                Notification alert = new Notification(id, type, description, imagePath);
                alerts.add(alert);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alerts;
    }

    // Method to get all upcoming events
    public List<Notification> getAllUpcomingEvents() {
        List<Notification> upcomingEvents = new ArrayList<>();
        try {
            String query = "SELECT * FROM notification WHERE type = 'Upcoming Events'";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String type = rs.getString("type");
                String description = rs.getString("description");
                String imagePath = rs.getString("image_path");
                Notification event = new Notification(id, type, description, imagePath);
                upcomingEvents.add(event);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return upcomingEvents;
    }

    // Method to add a new notification
    public void addNotification(String type, String description, String imagePath) {
        try {
            String query = "INSERT INTO notification (type, description, image_path) VALUES (?, ?, ?)";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, type);
            pstmt.setString(2, description);
            pstmt.setString(3, imagePath);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to update a notification
    public void updateNotification(int id, String type, String description, String imagePath) {
        try {
            String query = "UPDATE notification SET type=?, description=?, image_path=? WHERE id=?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, type);
            pstmt.setString(2, description);
            pstmt.setString(3, imagePath);
            pstmt.setInt(4, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a notification
    public void deleteNotification(int id) {
        try {
            String query = "DELETE FROM notification WHERE id=?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
