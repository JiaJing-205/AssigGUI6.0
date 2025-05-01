<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.User" %>
<%@ page import="da.UserDA" %>

<%
    String userID = request.getParameter("userID");
    User user = null;
    String error = null;

    if (userID != null && !userID.isEmpty()) {
        try {
            UserDA userDA = new UserDA();
            user = userDA.retrieveRecord(userID);
            if (user == null) {
                error = "User not found.";
            }
        } catch (Exception e) {
            error = "Error retrieving user info.";
        }
    } else {
        error = "No user ID provided.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Personal Info</title>
</head>
<body>
    <h3>Personal Information</h3>

<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } else if (user != null) { %>
    <p><strong>ID:</strong> <%= user.getId() %></p>
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Password:</strong> <%= user.getPwd() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Phone:</strong> <%= user.getPhone() %></p>
    <p><strong>Birthday:</strong> <%= user.getHbd() %></p>
    <p><strong>Create Date:</strong> <%= user.getCreateDate() %></p>
<% } %>

<% if (user != null) {
       String permission = user.getPermission();
       String backPage = "user.html"; // default

       if ("Admin".equalsIgnoreCase(permission)) {
           backPage = "admin.html";
       } else if ("Staff".equalsIgnoreCase(permission)) {
           backPage = "staff.html";
       }
%>
    <a href="<%= backPage %>">Back</a>
<% } %>

</body>
</html>