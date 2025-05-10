<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.User" %>
<%@ page import="da.UserDA" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit User</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
        <a class="button-return" href="ProfileServlet">Return</a>
        <%
            // Get the user object from the request attribute
            User editUser = (User) request.getAttribute("editUser");
            if (editUser != null) {
        %>
        <h2>Edit User</h2>
        <form action="editUserServlet" method="post">
            <table>
                <tr>
                    <td>
                        <div class="form-control">
                            <input type="text" id="lid" name="id" maxlength="20" value="<%= editUser.getId()%>" readonly>
                            <label>
                                <span style="transition-delay:0ms">I</span>
                                <span style="transition-delay:50ms">D</span>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="form-control">
                            <input type="text" id="lname" name="name" maxlength="100" value="<%= editUser.getName()%>" required>
                            <label>
                                <span style="transition-delay:0ms">N</span> 
                                <span style="transition-delay:50ms">a</span>
                                <span style="transition-delay:100ms">m</span>
                                <span style="transition-delay:150ms">e</span>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="form-control">
                            <input type="date" id="lbd" name="bd"value="<%= editUser.getHbd()%>" required>
                            <label>
                                <span style="transition-delay:0ms">B</span> 
                                <span style="transition-delay:50ms">i</span>
                                <span style="transition-delay:100ms">r</span>
                                <span style="transition-delay:150ms">t</span>
                                <span style="transition-delay:200ms">h</span>
                                <span style="transition-delay:250ms"></span>
                                <span style="transition-delay:300ms">D</span>
                                <span style="transition-delay:350ms">a</span>
                                <span style="transition-delay:400ms">t</span>
                                <span style="transition-delay:450ms">e</span>
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-control">
                            <input type="text" id="lemail" name="email" maxlength="100" value="<%= editUser.getEmail()%>" required>
                            <label>
                                <span style="transition-delay:0ms">E</span> 
                                <span style="transition-delay:50ms">m</span>
                                <span style="transition-delay:100ms">a</span>
                                <span style="transition-delay:150ms">i</span>
                                <span style="transition-delay:150ms">l</span>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="form-control">
                            <input type="text" id="lphone" name="phone" maxlength="20" value="<%= editUser.getPhone()%>"required>
                            <label>
                                <span style="transition-delay:0ms">P</span> 
                                <span style="transition-delay:50ms">h</span>
                                <span style="transition-delay:100ms">o</span>
                                <span style="transition-delay:150ms">n</span>
                                <span style="transition-delay:200ms">e</span>
                                <span style="transition-delay:250ms"></span>
                                <span style="transition-delay:300ms">N</span>
                                <span style="transition-delay:350ms">u</span>
                                <span style="transition-delay:400ms">m</span>
                                <span style="transition-delay:450ms">b</span>
                                <span style="transition-delay:500ms">e</span>
                                <span style="transition-delay:550ms">r</span>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="radio-container">
                            <label style="border-bottom: 2px #000 solid;width: 100%; font-size: 18px;">Permission:</label><br><br>
                            <div class="radio-wrapper">
                                <label class="radio-button">
                                    <input id="User" name="permission" value="User" type="radio" <%= editUser.getPermission().equals("User") ? "checked" : ""%>>
                                    <span class="radio-checkmark"></span>
                                    <span class="radio-label">User</span>
                                </label>
                            </div>
                            <div class="radio-wrapper">
                                <label class="radio-button">
                                    <input id="Staff" name="permission" value="Staff" type="radio" <%= editUser.getPermission().equals("Staff") ? "checked" : ""%>>
                                    <span class="radio-checkmark"></span>
                                    <span class="radio-label">Staff</span>
                                </label>
                            </div>
                            <div class="radio-wrapper">
                                <label class="radio-button">
                                    <input id="Admin" name="permission" value="Admin" type="radio" <%= editUser.getPermission().equals("Admin") ? "checked" : ""%>>
                                    <span class="radio-checkmark"></span>
                                    <span class="radio-label">Admin</span>
                                </label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-control">
                            <input type="password" id="lpwd1" name="password1" maxlength="30" value="<%= editUser.getPwd()%>" required>
                            <label>
                                <span style="transition-delay:0ms">P</span> 
                                <span style="transition-delay:50ms">a</span>
                                <span style="transition-delay:100ms">s</span>
                                <span style="transition-delay:150ms">s</span>
                                <span style="transition-delay:200ms">w</span>
                                <span style="transition-delay:250ms">o</span>
                                <span style="transition-delay:300ms">r</span>
                                <span style="transition-delay:350ms">d</span>
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="form-control">
                            <input type="password" id="lpwd2" name="password2" maxlength="30" value="${pwd2}">
                            <label>
                                <span style="transition-delay:0ms">C</span> 
                                <span style="transition-delay:50ms">o</span>
                                <span style="transition-delay:100ms">n</span>
                                <span style="transition-delay:150ms">f</span>
                                <span style="transition-delay:200ms">i</span>
                                <span style="transition-delay:250ms">r</span>
                                <span style="transition-delay:300ms">m</span>
                                <span style="transition-delay:350ms"></span>
                                <span style="transition-delay:400ms">P</span>
                                <span style="transition-delay:450ms">a</span>
                                <span style="transition-delay:500ms">s</span>
                                <span style="transition-delay:550ms">s</span>
                                <span style="transition-delay:600ms">w</span>
                                <span style="transition-delay:650ms">o</span>
                                <span style="transition-delay:700ms">r</span>
                                <span style="transition-delay:750ms">d</span>
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                        <td>
                            <button type="submit" class="button-update">Update</button>
                        </td>
                    </tr>
            </table>
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
        <p style="color:red;"><%= error%></p>
        <%
            }
        %>
        </div>
    </body>
</html>