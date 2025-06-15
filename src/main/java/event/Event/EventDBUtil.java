package event.Event;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import event.DBConnect.DBConnect;

public class EventDBUtil {

    public static List<Event> getAllEvents() throws SQLException {
        List<Event> events = new ArrayList<>();
        Connection conn = DBConnect.getConnection();
        String query = "SELECT * FROM events";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            Event event = new Event(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getString("location"),
                rs.getDouble("price"),
                rs.getString("image")
            );
            events.add(event);
        }
        return events;
    }

    public static boolean addEvent(String name, String description, String location, double price, String image) throws SQLException {
        Connection conn = DBConnect.getConnection();
        String query = "INSERT INTO events (name, description, location, price, image) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, name);
        stmt.setString(2, description);
        stmt.setString(3, location);
        stmt.setDouble(4, price);
        stmt.setString(5, image);
        return stmt.executeUpdate() > 0;
    }

    public static boolean updateEvent(int id, String name, String description, String location, double price, String image) throws SQLException {
        Connection conn = DBConnect.getConnection();
        String query = "UPDATE events SET name = ?, description = ?, location = ?, price = ?, image = ? WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, name);
        stmt.setString(2, description);
        stmt.setString(3, location);
        stmt.setDouble(4, price);
        stmt.setString(5, image);
        stmt.setInt(6, id);
        return stmt.executeUpdate() > 0;
    }

    public static boolean deleteEvent(int id) throws SQLException {
        Connection conn = DBConnect.getConnection();
        String query = "DELETE FROM events WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, id);
        return stmt.executeUpdate() > 0;
    }
    
    public static Event getEventById(int id) throws SQLException {
        Connection conn = DBConnect.getConnection();
        String query = "SELECT * FROM events WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        Event event = null;
        if (rs.next()) {
            event = new Event(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getString("location"),
                rs.getDouble("price"),
                rs.getString("image")
            );
        }
        return event;
    }
}
