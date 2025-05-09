<%@ page import="domain.Event" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Upcoming Events</title>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <h2 style="text-align: center;">Upcoming Events</h2>
            <p class="bar"><%= request.getAttribute("heymessage")%></p>

            <%
                List<Event> events = (List<Event>) request.getAttribute("eventList");
                if (events == null || events.isEmpty()) {
            %>
            <p style="text-align:center;">No events available.</p>
            <%
            } else {
            %>
            <table>
                <tr>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>
                <%
                    for (Event event : events) {
                %>
                <tr>
                    <td><img src="<%= event.getImageFileName()%>" alt="Event Image" class="event-image" /></td>
                    <td><%= event.getTitle()%></td>
                    <td><%= event.getDate()%></td>
                    <td><%= event.getDescription()%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                }
            %>
        </div>
    </body>
</html>
