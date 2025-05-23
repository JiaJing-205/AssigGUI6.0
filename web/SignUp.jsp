<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <h2 class="info">Sign Up</h2>

            <section class="info">
                <form method="post" action="SignupServlet">
                    <div class="form-control">
                        <label for="id">ID <span style="color: red;">*</span></label>
                        <input type="text" id="id" name="id" maxlength="20" value="${id}" required />
                    </div>

                    <div class="form-control">
                        <label for="name">Name <span style="color: red;">*</span></label>
                        <input type="text" id="name" name="name" maxlength="100" value="${name}" required />
                    </div>

                    <div class="form-control">
                        <label for="bd">Birth Date <span style="color: red;">*</span></label>
                        <input type="date" id="bd" name="bd" value="${bd}" required />
                    </div>

                    <div class="form-control">
                        <label for="email">Email <span style="color: red;">*</span></label>
                        <input type="text" id="email" name="email" maxlength="100" value="${email}" required />
                    </div>

                    <div class="form-control">
                        <label for="phone">Phone Number <span style="color: red;">*</span> (+60XXXXXXXXX):</label>
                        <input type="text" id="phone" name="phone" maxlength="20" value="${phone}" required />
                    </div>

                    <div class="form-control">
                        <label for="pwd1">Password <span style="color: red;">*</span></label>
                        <input type="password" id="pwd1" name="password1" maxlength="30" value="${pwd1}" required />
                    </div>

                    <div class="form-control">
                        <label for="pwd2">Confirm Password <span style="color: red;">*</span></label>
                        <input type="password" id="pwd2" name="password2" maxlength="30" value="${pwd2}" required />
                    </div>

                    <div class="form-control" style="color:red;">
                        ${error}
                    </div>

                    <div class="form-control">
                        <button type="submit">Sign Up</button>
                    </div>
                </form>
            </section>

            <section class="info">
                <form action="GotoLoginServlet" method="post">
                    <div class="form-control">
                        <button type="submit">Back to Login</button>
                    </div>
                </form>
            </section>
        </div>
    </body>
</html>
