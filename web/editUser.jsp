<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="z-styles.css" />
</head>
<body>
    <%@ include file="z-navbar.jsp" %>
    <%@ include file="z-sidebar.jsp" %>

    <div class="content">
        <a class="button-return" href="ProfileServlet">Return</a>

        <%
            User editUser = (User) request.getAttribute("editUser");
            if (editUser != null) {
        %>
        <h2>Edit User</h2>
        <form action="editUserServlet" method="post" class="user-form">
            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" value="<%= editUser.getId() %>" readonly>
            </div>

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="<%= editUser.getName() %>" required>
            </div>

            <div class="form-group">
                <label for="bd">Birth Date</label>
                <input type="date" id="bd" name="bd" value="<%= editUser.getHbd() %>" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" value="<%= editUser.getEmail() %>" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value="<%= editUser.getPhone() %>" required>
            </div>

            <div class="form-group">
                <label>Permission</label>
                <label><input type="radio" name="permission" value="User" <%= editUser.getPermission().equals("User") ? "checked" : "" %>> User</label>
                <label><input type="radio" name="permission" value="Staff" <%= editUser.getPermission().equals("Staff") ? "checked" : "" %>> Staff</label>
                <label><input type="radio" name="permission" value="Admin" <%= editUser.getPermission().equals("Admin") ? "checked" : "" %>> Admin</label>
            </div>

            <div class="form-group">
                <label for="password1">Password</label>
                <input type="password" id="password1" name="password1" value="<%= editUser.getPwd() %>" required>
            </div>

            <div class="form-group">
                <label for="password2">Confirm Password</label>
                <input type="password" id="password2" name="password2" value="${pwd2}">
            </div>

            <button type="submit" class="button-update">Update</button>
        </form>

        <% } else { %>
            <p>User not found!</p>
        <% } %>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <p style="color:red;"><%= error %></p>
        <% } %>
    </div>
</body>
</html>
