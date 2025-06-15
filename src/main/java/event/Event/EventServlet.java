package event.Event;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String location = request.getParameter("location");
                double price = Double.parseDouble(request.getParameter("price"));
                String image = request.getParameter("image_path");

                EventDBUtil.addEvent(name, description, location, price, image);

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("eventID"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String location = request.getParameter("location");
                double price = Double.parseDouble(request.getParameter("price"));
                String image = request.getParameter("image_path");

                EventDBUtil.updateEvent(id, name, description, location, price, image);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("eventID"));
                EventDBUtil.deleteEvent(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("EventServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Event> eventList = EventDBUtil.getAllEvents();
            request.setAttribute("eventList", eventList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Event.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
