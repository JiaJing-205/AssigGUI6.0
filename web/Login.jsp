<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <h2 class="info">Login</h2>

            <section class="info">
                <form method="post" action="LoginServlet">
                    <div class="form-control">
                        <label for="lid">ID <span style="color: red;">*</span></label>
                        <input type="text" id="lid" name="id" maxlength="20" value="${id}" required>
                    </div>

                    <div class="form-control">
                        <label for="lpwd">Password <span style="color: red;">*</span></label>
                        <input type="password" id="lpwd" name="pwd" maxlength="100" value="${pwd}" required>
                    </div>

                    <div class="form-control" style="color:red;">
                        ${error}
                    </div>

                    <div class="form-control">
                        <button type="submit">Login</button>
                    </div>
                </form>
            </section>
            <section class="info">
                <p>
                    Forgot your password?&nbsp;&nbsp;
                    <a href="ResetPassword.jsp">Reset Password</a>
                </p>
                <p>New Here?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                <form action="GotoSignupServlet" method="post">
                    <button type="submit">Sign Up</button>
                </form>
            </section>
        </div>
    </body>
</html>

