<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <h2>Profile</h2>

            <p>Name: ${userName}</p>
            <p>ID: ${userId}</p>

            <%
                Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
                Boolean isStaff = (Boolean) request.getAttribute("isStaff");

                if (isAdmin) {
            %>
                <h3>Admin Privilege</h3>
                <ul>
                    <li><a href="user/viewUserServlet">Manage all users</a></li>
                    <li><a href="report.jsp">Enter Report Page</a></li>
                </ul>
            <% } %>

            <%
                if (isAdmin || isStaff) {
            %>
                <h3>Staff Privilege</h3>
                <ul>
                    <li><a href="item/viewItemServlet">Manage all items</a></li>
                </ul>
            <% }%>

            <h3>User Privilege</h3>
            <form action="Auth/viewPersonalServlet" method="get">
                <button type="submit">View Personal Info</button>
            </form>
            <form action="item/itemOrderServlet" method="post">
                <button type="submit">Order</button>
            </form>
            <form action="Auth/SignoutServlet" method="post">
                <button type="submit">Sign Out</button>
            </form>
            <form action="user/viewPaymentServlet" method="get">
                <button type="submit">View My Payments</button>
            </form>

            <p style="color:red;">${error}</p>
        </div>
    </body>
</html>
