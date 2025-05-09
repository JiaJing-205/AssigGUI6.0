<%@page import="java.util.List"%>
<%@page import="domain.User"%>
<%@page import="da.UserDA"%>
<jsp:setProperty name="item" property="*"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User List</title>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <div class="header-container">
                <a class="button" href="ProfileServlet">Return</a>
                <div class="button-group">
                    <form  action="viewUserServlet">
                        <input class="button" type="submit" value="Display user" />
                    </form>
                    <form action="viewStaffServlet">
                        <input class="button" type="submit" value="Display staff" />
                    </form>
                    <form action="viewAdminServlet">
                        <input class="button" type="submit" value="Display admin" />
                    </form>
                </div>
            </div>

            <div class="content">
                <h2 style="text-align:center;">All ${userRole != null ? userRole : 'Users'}</h2>
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
                        String userId = null;
                        Cookie[] cookies = request.getCookies();
                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if ("userId".equals(cookie.getName())) {
                                    userId = cookie.getValue();
                                    break;
                                }
                            }
                        }

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
                        <td>
                            <form action="getUserServlet" method="get">
                                <input type="hidden" name="id" value="<%= u.getId()%>" />
                                <input type="submit" class="button-small" value="Edit" />
                            </form>
                        </td>
                        <td>
                            <%
                                if (userId != null && !userId.equals(u.getId())) {
                            %>
                            <form action="deleteUserServlet" method="post" onsubmit="return confirm('Are you sure?');">
                                <input type="hidden" name="id" value="<%= u.getId()%>" />
                                <input type="submit" class="button-small" value="Delete" />
                            </form>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" style="text-align:center; color:red;">No records</td>
                    </tr>
                    <% }%>
                </table>

            </div>
        </div>
    </body>
    >>>>>>> Stashed changes
</html>