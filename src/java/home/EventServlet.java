package home;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class EventServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Example event details
        String eventName = "Spring Sale";
        String eventDescription = "50% off for all second purchases of the same equipment";
        LocalDateTime eventTime = LocalDateTime.of(2025, 5, 15, 18, 0); // 15 May 2025, 6 PM

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        String eventTimeString = eventTime.format(formatter); // for JS compatibility

        request.setAttribute("eventName", eventName);
        request.setAttribute("eventDescription", eventDescription);
        request.setAttribute("eventTime", eventTimeString);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/event.jsp");
        dispatcher.forward(request, response);
    }
}
