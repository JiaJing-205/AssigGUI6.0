<%@page import="java.util.List"%>
<%@page import="domain.User"%>
<%@page import="da.UserDA"%>
<jsp:setProperty name="item" property="*"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User List</title>
        <style>
            table {
                border-collapse: collapse;
                width: 90%;
                margin: auto;
            }
            th, td {
                padding: 8px 12px;
                border: 1px solid #ccc;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .header-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                margin: 0 auto;
                padding: 10px 0;
            }
            .button-group {
                align-items: center;
                display: flex;
                gap: 10px;
            }
            .button-small,
            .button {
                display: flex;
                justify-content: center;
                gap: 10px;
                --bg-color: beige;
                --main-color: black;
                margin: auto 10px auto 10px;
                width: 180px;
                height: 40px;
                border-radius: 5px;
                border: 2px solid var(--main-color);
                background-color: var(--bg-color);
                box-shadow: 4px 4px var(--main-color);
                font-size: 17px;
                font-weight: 600;
                color: var(--font-color);
                cursor: pointer;
            }
            .button-small:active,
            .button:active {
                box-shadow: 0px 0px var(--main-color);
                transform: translate(3px, 3px);
            }
            a.button{
                text-decoration: none;
                text-align: center;
                line-height: 2.5;
            }
            .button-small{
                width: 60px;
                height: 40px;
                padding: 0 0 0 0;
            }
        </style><link rel="stylesheet" href="styles.css" />
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
                <a class="login-btn" href="/Auth/AuthCheckServlet">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="event.jsp">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout/checkout.jsp">Checkout</a>
            <a href="DisplayCmment.jsp">Comments</a>
        </div>

        <div class="content">
            <div class="header-container">
                <a class="button" href="/Assignment_Login/Auth/ProfileServlet">Return</a>
                <div class="button-group">
                    <form  action="/Assignment_Login/user/viewUserServlet">
                        <input class="button" type="submit" value="Display user" />
                    </form>
                    <form action="/Assignment_Login/staff/viewStaffServlet">
                        <input class="button" type="submit" value="Display staff" />
                    </form>
                    <form action="/Assignment_Login/admin/viewAdminServlet">
                        <input class="button" type="submit" value="Display admin" />
                    </form>
                </div>
            </div>

            <div class="content">
                <h2 style="text-align:center;">All <%= request.getAttribute("userRole") != null ? request.getAttribute("userRole") : "Users"%></h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Birthday</th>
                        <th>Password</th>
                        <th>Create Date</th>
                        <th colspan="2">Options</th>
                    </tr>
                    <%
                        List<User> userList = (List<User>) request.getAttribute("allUsers");
                        if (userList != null && !userList.isEmpty()) {
                            for (User u : userList) {
                    %>
                    <tr>
                        <td><%= u.getId()%></td>
                        <td><%= u.getName()%></td>
                        <td><%= u.getEmail()%></td>
                        <td><%= u.getPhone()%></td>
                        <td><%= u.getHbd()%></td>
                        <td><%= u.getPwd()%></td>
                        <td><%= u.getCreateDate()%></td>
                        <td style="padding: 1px 0 6px 0;">
                            <form action="../user/getUserServlet" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= u.getId()%>" />
                                <input type="submit" class="button-small" value="Edit" />
                            </form>
                        </td>
                        <td style="padding: 1px 0 6px 0;">
                            <%
                                Cookie[] cookies = request.getCookies();
                                String userId = null;

                                if (cookies != null) {
                                    for (Cookie cookie : cookies) {
                                        if ("userId".equals(cookie.getName())) {
                                            userId = cookie.getValue();
                                            break;
                                        }
                                    }
                                }
                                if (userId != null) {
                                    if (!userId.equals(u.getId())) {
                            %>
                            <form action="../user/deleteUserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                <input type="hidden" name="id" value="<%= u.getId()%>" />

                                <input type="submit" class="button-small" value="Delete" />
                            </form>
                            <%
                                    }
                                }
                            %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" style="color: red; text-align: center;">
                            No records
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <br>
                <form action="../addUser.jsp">
                    <input class="button" type="submit" value="Add" style="width: 100px"/>
                </form>
            </div>
        </div>
    </body>
</html>