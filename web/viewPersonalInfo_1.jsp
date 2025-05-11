<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.User" %>
<%@ page import="da.UserDA" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Keep your existing CSS styles here -->
        <style>
            /* Your full existing CSS remains unchanged */
        </style>
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <a class="button-return" href="ProfileServlet">Return</a>
            <h2 class="info">Edit Personal Info</h2>
                <section class="info">
                    <form action="editPersonalServlet" method="post">
                        <div class="form-control">
                            <label for="lid">ID:</label>
                            <input type="text" id="lid" name="id" maxlength="20" value="${id}" readonly>
                        </div>

                        <div class="form-control">
                            <label for="lname">Name:</label>
                            <input type="text" id="lname" name="name" maxlength="100" value="${name}" required>
                        </div>

                        <div class="form-control">
                            <label for="lbd">Birth Date:</label>
                            <input type="date" id="lbd" name="bd" value="${bd}" required>
                        </div>

                        <div class="form-control">
                            <label for="lemail">Email:</label>
                            <input type="text" id="lemail" name="email" maxlength="100" value="${email}" required>
                        </div>

                        <div class="form-control">
                            <label for="lphone">Phone Number:</label>
                            <input type="text" id="lphone" name="phone" maxlength="20" value="${phone}" required>
                        </div>

                        <div class="form-control">
                            <label for="lpwd1">Password:</label>
                            <input type="text" id="lpwd1" name="password1" maxlength="30" value="${pwd}" required>
                        </div>

                        <div class="form-control">
                            <label for="lpwd2">Confirm Password:</label>
                            <input type="text" id="lpwd2" name="password2" maxlength="30" value="">
                        </div>

                        <div class="form-control">
                            <button type="submit" class="button-update">Edit Profile</button>
                        </div>
                    </form>

                    <form action="deletePersonalServlet" method="post">
                        <button type="submit" class="button-update">Delete Profile</button>
                    </form>

                    <div class="form-control" style="color:red;">
                        ${error}
                    </div>
                </section>
        </div>
    </body>
</html>
