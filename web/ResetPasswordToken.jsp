<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <h3>Reset Password</h3>
            <form method="post" action="ResetPasswordTokenServlet">
                <div class="form-control">
                    <input type="text" id="lemail" name="email" value="${email}" disabled>
                    <label>Email</label>
                </div>
                <div class="form-control">
                    <input type="text" id="ltoken" name="token" required>
                    <label>Token</label>
                </div>
                <small style="color:red">${error}</small>
                <button type="submit" class="button-sendtoken">Verify Token</button>
            </form>
        </div>
    </body>
</html>
