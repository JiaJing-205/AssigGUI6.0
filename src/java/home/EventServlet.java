package home;

import domain.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/events")
public class EventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> eventList = new ArrayList<>();

eventList.add(new Event(
    1,
    "Sport Festival",
    "2025-08-15",
    "A full-day festival featuring fun sports activities, food, and family games.",
    "Images/sport_festival.jpg"
));

eventList.add(new Event(
    2,
    "Champion Interview (Dato Lee Chong Wei)",
    "2025-09-01",
    "Exclusive live interview with Malaysian badminton legend Dato Lee Chong Wei.",
    "Images/lee_chong_wei.jpg"
));

eventList.add(new Event(
    3,
    "Malaysia Day Sale",
    "2025-09-16",
    "Celebrate Malaysia Day with up to 60% off on all sports gear and apparel.",
    "Images/malaysia_day.png"
));
//Add New Events here, id, title, date, descripltion, imgfilepath


        request.setAttribute("eventList", eventList);
        request.setAttribute("heymessage", "Welcome to the latest ATIERSPORTS events!");
        request.getRequestDispatcher("/event.jsp").forward(request, response);
    }
}
