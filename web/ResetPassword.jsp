<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Reset Password</title>
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <a href="Login.jsp">Return</a>
            <h2 class="info">Reset Password</h2>
            <section class="info">
                <form action="ResetPasswordServlet" method="post">

                    <div class="form-control">
                        <label for="lemail">Email *:</label>
                        <input type="text" id="lemail" name="email" value="${email}" required>
                    </div>

                    <div class="form-control">
                        <label for="lpwd1">New Password *:</label>
                        <input type="password" id="lpwd1" name="password1" value="${pwd1}" required>
                    </div>

                    <div class="form-control">
                        <label for="lpwd2">Confirm Password *:</label>
                        <input type="password" id="lpwd2" name="password2" value="${pwd2}" required>
                    </div>

                    <div class="form-control" style="color:red;">
                        ${error}
                    </div>

                    <div class="form-control" style="text-align: center;">
                        <button type="submit">Submit New Password</button>
                    </div>
                </form>
            </section>
        </div>

    </body>
</html>
