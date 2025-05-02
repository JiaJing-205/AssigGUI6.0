<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styles.css" />
    </head>
    <body>
        <div id="navbar">
            <div></div>

            <div class="search-container">
                <form action="searchItemPublicServlet" method="get" style="text-align:center; margin-bottom:20px;">
                    <input type="text" name="search" placeholder="Search item by name" required />
                    <input type="submit" value="Search" />
                </form>
            </div>

            <div>
                <a class="login-btn" href="Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="../home.jsp"><img src="../Images/logohorizon.png" height="90" width="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="../home.jsp">Home</a>
            <a href="../products.jsp">Products</a>
            <a href="../events">Events</a>
            <a href="../cart.jsp">Cart</a>
            <a href="../checkout/checkout.jsp">Checkout</a>
            <a href="../DisplayComment.jsp">Comments</a>
        </div>

        <div class="content">
            <div style="max-width: 700px; margin: 0 auto;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2 style="margin: 0;">Sign Up</h2>
                    <form action="GotoLoginServlet" method="post">
                        <button type="submit" class="redirect-button">Login</button>
                    </form>
                </div>

                <form method="post" action="SignupServlet" style="background-color: #f4f4f4; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                        <div class="form-control">
                            <label>ID</label>
                            <input type="text" id="lid" name="id" maxlength="20" value="${id}" required />
                        </div>

                        <div class="form-control">
                            <label>Name</label>
                            <input type="text" id="lname" name="name" maxlength="100" value="${name}" required />
                        </div>

                        <div class="form-control">
                            <label>Birth Date</label>
                            <input type="date" id="lbd" name="bd" value="${bd}" required />
                        </div>

                        <div class="form-control">
                            <label>Email</label>
                            <input type="text" id="lemail" name="email" maxlength="100" value="${email}" required />
                        </div>

                        <div class="form-control">
                            <label>Phone Number</label>
                            <input type="text" id="lphone" name="phone" maxlength="20" value="${phone}" required />
                        </div>

                        <div class="form-control">
                            <label>Password</label>
                            <input type="password" id="lpwd1" name="password1" maxlength="30" value="${pwd1}" required />
                        </div>

                        <div class="form-control">
                            <label>Confirm Password</label>
                            <input type="password" id="lpwd2" name="password2" maxlength="30" value="${pwd2}" required />
                        </div>
                    </div>

                    <div style="margin-top: 10px;">
                        <small style="color: red; font-size: 16px;">${error}</small>
                    </div>

                    <div style="margin-top: 20px; display: flex; justify-content: flex-end;">
                        <button type="submit" class="button-signup">Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
