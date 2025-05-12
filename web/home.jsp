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
                List<Report> reportList = null;
                try {
                    reportDA rda = new reportDA();
                    reportList = rda.getTop3Item();
                } catch (Exception ex) {
                    out.println("<p style='color:red; text-align:center;'>Error loading report: " + ex.getMessage() + "</p>");
                }
            %>

            <%
                if (reportList != null && !reportList.isEmpty()) {
                    Report sample = reportList.get(0);
            %>
            <table>
                <thead>
                    <tr>
                        <%
                            if (sample.getItemID() != null) {
                        %>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price (RM)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Report r : reportList) {%>
                    <tr>
                        <td><%= r.getItemName()%></td>
                        <td><%= r.getItemCategory()%></td>
                        <td>RM <%= String.format("%.2f", r.getItemPrice())%></td>
                        <td>
                            <form action="AddToCartServlet" method="post" style="display:inline;">
                                <input type="hidden" name="itemId" value="<%= r.getItemID()%>" />
                                Quantity :
                                <input class="quantity" type="number" name="quantity" value="1" min="1" />
                                <input type="submit" value="Add to cart" />
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <%
                }
            %>
            <%
            } else {
            %>
            <p style="text-align: center;">No records found</p>
            <%
                }
            %>

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
