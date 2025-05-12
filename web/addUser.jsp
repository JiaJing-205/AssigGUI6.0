<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add User</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="z-styles.css">
    </head>
    <body>
        <jsp:include page="z-navbar.jsp" />
        <jsp:include page="z-sidebar.jsp" />

        <div class="content">
            <%
                String error = (String) session.getAttribute("error");
                String id = (String) session.getAttribute("id");
                String name = (String) session.getAttribute("name");
                String email = (String) session.getAttribute("email");
                String phone = (String) session.getAttribute("phone");
                String bd = (String) session.getAttribute("bd");
                String pwd1 = (String) session.getAttribute("pwd1");
                String pwd2 = (String) session.getAttribute("pwd2");
                String permission = (String) session.getAttribute("permission");

                session.removeAttribute("error");
                session.removeAttribute("id");
                session.removeAttribute("name");
                session.removeAttribute("email");
                session.removeAttribute("phone");
                session.removeAttribute("bd");
                session.removeAttribute("pwd1");
                session.removeAttribute("pwd2");
                session.removeAttribute("permission");
            %>

            <a class="button-return" href="viewUserServlet">Return</a>
            <h2 class="info">Add User</h2>

            <section class="info">
                <form action="addUserServlet" method="post">
                    <div class="form-control">
                        <label for="lid">ID <span style="color: red;">*</span></label>
                        <input type="text" id="lid" name="id" maxlength="20" value="<%= id != null ? id : ""%>" required>
                    </div>

                    <div class="form-control">
                        <label for="lname">Name <span style="color: red;">*</span></label>
                        <input type="text" id="lname" name="name" maxlength="100" value="<%= name != null ? name : ""%>" required>
                    </div>

                    <div class="form-control">
                        <label for="lbd">Birth Date <span style="color: red;">*</span></label>
                        <input type="date" id="lbd" name="bd" value="<%= bd != null ? bd : ""%>" required>
                    </div>

                    <div class="form-control">
                        <label for="lemail">Email <span style="color: red;">*</span></label>
                        <input type="text" id="lemail" name="email" maxlength="100" value="<%= email != null ? email : ""%>" required>
                    </div>

                    <div class="form-control">
                        <label for="lphone">Phone <span style="color: red;">*</span></label>
                        <input type="text" id="lphone" name="phone" maxlength="20" value="<%= phone != null ? phone : ""%>" required>
                    </div>

                    <div class="form-control">
                        <label>Permission <span style="color: red;">*</span></label>
                        <label><input type="radio" name="permission" value="User" <%= "User".equals(permission) ? "checked" : "" %>> User</label>
                        <label><input type="radio" name="permission" value="Staff" <%= "Staff".equals(permission) ? "checked" : "" %>> Staff</label>
                        <label><input type="radio" name="permission" value="Admin" <%= "Admin".equals(permission) ? "checked" : "" %>> Admin</label>
                    </div>

                    <div class="form-control">
                        <label for="lpwd1">Password <span style="color: red;">*</span></label>
                        <input type="password" id="lpwd1" name="password1" maxlength="30" value="<%= pwd1 != null ? pwd1 : ""%>" required>
                    </div>

                    <div class="form-control">
                        <label for="lpwd2">Confirm Password <span style="color: red;">*</span></label>
                        <input type="password" id="lpwd2" name="password2" maxlength="30" value="<%= pwd2 != null ? pwd2 : ""%>" required>
                    </div>

                    <div class="form-control" style="text-align: center;">
                        <button type="submit" class="button-update">Add User</button>
                    </div>
                </form>
            </section>

            <p class="error"><%= error != null ? error : "" %></p>
        </div>
    </body>
</html>
