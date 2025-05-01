<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.User" %>
<%@ page import="da.UserDA" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<%
    // Get the user object from the request attribute
    User editUser = (User)request.getAttribute("editUser");
    if (editUser != null) {
%>
    <h3>Edit User</h3>
    <form action="editUserServlet" method="post">
        <p>ID: <input type="text" name="id" value="<%= editUser.getId() %>" readonly /></p>
        <p>Name: <input type="text" name="name" value="<%= editUser.getName() %>" /></p>
        <p>Email: <input type="email" name="email" value="<%= editUser.getEmail() %>" /></p>
        <p>Phone: <input type="text" name="phone" value="<%= editUser.getPhone() %>" /></p>
        <p>Birthday: <input type="date" name="hbd" value="<%= editUser.getHbd() %>" /></p>
        <p>Password: <input type="text" name="pwd" value="<%= editUser.getPwd() %>" /></p>
        <p>Permission:
            <input type="radio" id="User" name="permission" value="" <%= editUser.getPermission().equals("") ? "checked" : "" %> /> User
            <input type="radio" id="Staff" name="permission" value="Staff" <%= editUser.getPermission().equals("Staff") ? "checked" : "" %> /> Staff
            <input type="radio" id="Admin" name="permission" value="Admin" <%= editUser.getPermission().equals("Admin") ? "checked" : "" %> /> Admin
        </p>
        <input type="submit" value="Update">
    </form>
<%
    } else {
        out.println("<p>User not found!</p>");
    }
%>

<%
    // Show any error message if it exists
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <p style="color:red;"><%= error %></p>
<%
    }
%>

<a href="admin.html">Return</a><br>

</body>
</html>