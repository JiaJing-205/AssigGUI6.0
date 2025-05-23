<%@page import="java.util.ArrayList"%>
<%@page import="item.ItemDA"%>
<%@page import="item.Item"%>
<%@page import="da.OrderDA"%>
<%@ page import="java.util.List" %>
<%@ page import="report.Report" %>
<%@ page import="report.reportDA" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ATIERSPORTS</title>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <p class="bar">Top Items Sold</p>
          <%
    List<Item> topItems = null;

    try {
        OrderDA oda = new OrderDA();  // Retrieves top 3 items with details
        topItems = oda.getTop3ItemsByQuantity(); // Get the list of items with all details
    } catch (Exception ex) {
        out.println("<p style='color:red; text-align:center;'>Error loading items: " + ex.getMessage() + "</p>");
    }
%>

<% if (topItems != null && !topItems.isEmpty()) { %>
    <h3 style="text-align: center;">Top 3 Best-Selling Items</h3>
    <table border="1" style="margin: auto; text-align: center;">
        <thead>
            <tr>
                <th>Name</th>
                <th>Category</th>
                <th>Price (RM)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // Traditional for loop to iterate through the topItems list
            for (int i = 0; i < topItems.size(); i++) {
                Item item = topItems.get(i); 
            %>
            <tr>
                <td><%= item.getName() %></td>
                <td><%= item.getCategory() %></td>
                <td>RM <%= String.format("%.2f", item.getPrice()) %></td>
                <td>
                    <form action="AddToCartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="itemId" value="<%= item.getID() %>" />
                        Quantity:
                        <input class="quantity" type="number" name="quantity" value="1" min="1" max="<%= item.getStock() %>" />
                        <input type="submit" value="Add to cart" />
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p style="text-align: center;">No top-selling items found.</p>
<% } %>
            <div class="info">
                <h2>About Our Company</h2>
                <p>
                    Welcome to ATIERSPORTS, your trusted source for quality sports equipment and gear.
                    Founded in 2023, we are committed to delivering the best products to athletes and enthusiasts of all levels.
                </p>
                <p>
                    We offer a wide range of equipment for sports such as football, basketball, tennis, and more. 
                    Our mission is to support your journey to greatness by equipping you with reliable and affordable gear.
                </p>
                <p>
                    Whether you're a professional or just getting started, we're here to help you play your best.
                    Thank you for choosing us!
                </p><h2>Our Location</h2>
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.0192347754735!2d-122.4194150846817!3d37.77492977975953!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8085808c2c5e9a29%3A0x3a979c3d8b7c7dd6!2sSan+Francisco%2C+CA!5e0!3m2!1sen!2sus!4v1610000000000!5m2!1sen!2sus"
                    width="600"
                    height="450"
                    style="border:0;"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"
                    ></iframe>
                <p>Email : Atiersports@gmail.com
                    Phone No : 0108788788</p>
            </div>
        </div>
    </body>
</html>
