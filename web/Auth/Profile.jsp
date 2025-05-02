<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styles.css" />
    </head>
    <body>
        <div id="navbar">
            <div>
            </div>

            <div class="search-container"><form action="searchItemPublicServlet" method="get" style="text-align:center; margin-bottom:20px;">
                    <input type="text" name="search" placeholder="Search item by name" required />
                    <input type="submit" value="Search" />
                </form>
            </div>

            <div>
                <a class="login-btn" href="Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="../home.jsp"><img src="../Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="../home.jsp">Home</a>
            <a href="../products.jsp">Products</a>
            <a href="../events">Events</a>
            <a href="../cart.jsp">Cart</a>
            <a href="../checkout/checkout.jsp">Checkout</a>
            <a href="../DisplayComment.jsp">Comments</a>
        </div>
        <div class="content">
            <table>
                <tr>
                    <td>
                        <p>Name : ${userName}</p>
                        <p>ID &nbsp; &nbsp; &nbsp; : ${userId}</p>
                    </td>
                </tr>
                <!-- Admin Features -->
                <%
                    Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
                    Boolean isStaff = (Boolean) request.getAttribute("isStaff");

                    if (isAdmin) {
                %>
                <tr>
                    <td colspan="5"><h3>Admin Privilege</h3></td>     
                </tr>
                <tr>
                    <th>User Management</th>
                    <td><a class="redirect" href="../user/viewUserServlet">Manage all user</a></td>
                </tr><tr>
                    <th>Report</th>
                    <td><a class="redirect" href="../report.jsp">Enter Report Page</td>
                </tr>
                <%  } %>
                <!-- Staff Features -->
                <%
                    if (isAdmin || isStaff) {
                %>
                <tr>
                    <td colspan="5"><h3>Staff Privilege</h3></td> 
                </tr>
                <tr>
                    <th>Item Management</th>
                    <td><a class="redirect" href="../addItem.jsp">Add item</a></td>
                    <td><a class="redirect" href="../viewItemServlet">View all item</a></td>
                    <td><a class="redirect" href="../editItem.jsp">Edit item</a></td>
                    <td><a class="redirect" href="../removeItem.html">Remove item</a></td>
                </tr>
                <% }%>
                <tr>
                    <td colspan="5"><h3>User Privilege</h3></td>     
                </tr>
                <tr>
                    <!-- Common User Features -->
                    <th>My Account</th>
                    <td><form action="viewPersonalServlet" method="get"><button type="submit" class="redirect">View Personal Info</button></form></td>
                    <td><form action="itemOrderServlet" method="POST"><button type="submit" class="redirect">Order</button></form></td>
                    <td><form action="viewPaymentServlet" method="get">
                            <input type="hidden" name="userID" value="${userId}" />
                            <input type="submit" value="View My Payments" />
                        </form></td>
                    <td><form action="SignoutServlet" method="POST"><button type="submit" class="redirect">Sign Out</button></form></td>
                </tr>
                <tr>
                    <td>
                        ${error} 
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>

