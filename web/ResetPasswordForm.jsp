<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <meta charset="UTF-8">
    </head>
    <body>

        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <h2 class="info">Reset Password</h2>
            <section class="info">
                <form method="post" action="ResetPasswordRequestServlet">
                    <div class="form-control">
                        <label for="email">Email <span style="color: red;">*</span></label>
                        <input type="text" id="email" name="email" value="${email}" required />
                    </div>

                    <div class="form-control" style="color:red;">
                        ${error}
                    </div>

                    <div class="form-control">
                        <button type="submit">Send Token</button>
                    </div>
                </form>
            </section>
        </div>

    </body>
</html>
