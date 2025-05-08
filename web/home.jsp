<%@ page import="java.util.List" %>
<%@ page import="report.Report" %>
<%@ page import="report.reportDA" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ATIERSPORTS</title>
        <link rel="stylesheet" href="styles.css" />
    </head>
    <body>
        <div id="navbar">
            <div></div>
            <div class="search-container">
                <form action="searchItemServletPublic" method="get" style="text-align:center; margin-bottom:20px;">
                    <input type="text" name="search" placeholder="Search item by name" required />
                    <input type="submit" value="Search" />
                </form>
            </div>
            <div>
                <a class="login-btn" href="Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="event.jsp">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout/checkout.jsp">Checkout</a>
<a href="DisplayComment.jsp">Comments</a>
        </div>

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
                </p>
            </div>
        </div>
    </body>
</html>
