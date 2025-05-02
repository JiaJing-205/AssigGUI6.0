<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styles.css" />
    </head>
    <body>
        <div id="navbar">
            <div>
            </div>

            <div class="search-container"><form action="searchItemPublicServlet" method="get" style="text-align:center; margin-bottom:20px;">
                    <input type="text" name="search" placeholder="Search item by name" required />
                    <input type="submit" value="Search" />
                </form>
            </div>

            <div>
                <a class="login-btn" href="Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="../home.jsp"><img src="../Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="../home.jsp">Home</a>
            <a href="../products.jsp">Products</a>
            <a href="../events">Events</a>
            <a href="../cart.jsp">Cart</a>
            <a href="../checkout/checkout.jsp">Checkout</a>
            <a href="../DisplayComment.jsp">Comments</a>
        </div>
        <div class="content">
            <div style="max-width: 600px; margin: 0 auto;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2 style="margin: 0;">Login</h2>
                    <form action="GotoSignupServlet" method="post">
                        <button type="submit" class="redirect-button">Sign Up</button>
                    </form>
                </div>

                <form method="post" action="LoginServlet" style="background-color: #f4f4f4; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
                    <div class="form-control">
                        <label>
                            ID
                        </label>
                        <input type="text" id="lid" name="id" maxlength="20" value="${id}" required>
                    </div>

                    <div class="form-control">
                        <label>
                            Password
                        </label>
                        <input type="password" id="lpwd" name="pwd" maxlength="100" value="${pwd}" required>
                    </div>

                    <div style="margin: 10px 0;">
                        <small style="color:red; font-size: 16px;">
                            ${error}
                        </small>
                    </div>

                    <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
                        <button type="submit" class="button-login">Login</button>
                        <a href="ResetPassword.jsp" class="resetpassword" style="font-size: 14px; text-decoration: underline; color: #04484f;">Reset Password</a>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>