package event.Notification;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
    private NotificationDBUtil dbUtil;

    @Override
    public void init() throws ServletException {
        dbUtil = new NotificationDBUtil();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            String type = request.getParameter("type");
            String description = request.getParameter("description");
            String imagePath = request.getParameter("image_path");
            dbUtil.addNotification(type, description, imagePath);

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String type = request.getParameter("type");
            String description = request.getParameter("description");
            String imagePath = request.getParameter("image_path");
            dbUtil.updateNotification(id, type, description, imagePath);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dbUtil.deleteNotification(id);
        }

        // Redirect to the notification page
        response.sendRedirect("NotificationServlet");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Notification> notifications = dbUtil.getNotifications();
        request.setAttribute("notifications", notifications);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Notification.jsp");
        dispatcher.forward(request, response);
    }
}
