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
                <input type="text" placeholder="Search..." />
                <button type="submit">Search</button>
            </div>

            <div>
                <a class="login-btn" href="./Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="home.jsp"><img src="../Images/logohorizon.png" height="90" width="230" alt="logo" style="padding:0;margin:0;" /></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="event.jsp">Events</a>
            <a href="checkout/cart.jsp">Cart</a>
            <a href="checkout.jsp">Checkout</a>
        </div>

        <div class="content">
            <div class="bar">Sign Up</div>
            <div class="innersec">
                <form method="post" action="SignupServlet">
                    <table>
                        <tr>
                            <td>
                                <div class="form-control">
                                    <label>ID :</label>
                                    <input type="text" id="lid" name="id" maxlength="20" value="${id}" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-control">
                                    <label>Name :</label>
                                    <input type="text" id="lname" name="name" maxlength="100" value="${name}" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-control">
                                    <label>Date of Birth :</label>
                                    <input type="date" id="lbd" name="bd" value="${bd}" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-control">
                                    <label>Email :</label>
                                    <input type="text" id="lemail" name="email" maxlength="100" value="${email}" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-control">
                                    <label>Phone Number :</label>
                                    <input type="text" id="lphone" name="phone" maxlength="20" value="${phone}" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-control">
                                    <label>Password :</label>
                                    <input type="password" id="lpwd1" name="password1" maxlength="30" value="${pwd1}" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-control">
                                    <label>Confirm Password :</label>
                                    <input type="password" id="lpwd2" name="password2" maxlength="30" value="${pwd2}" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <small style="color:red; font-size: 18px;">
                                    ${error}
                                </small>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <button type="submit">Sign Up</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
<div class="content">
    <div class="bar">Sign Up</div>
    <div class="innersec">
        <form method="post" action="SignupServlet">
            <div class="form-control">
                <label for="lid">ID :</label>
                <input type="text" id="lid" name="id" maxlength="20" value="${id}" required>
            </div>

            <div class="form-control">
                <label for="lname">Name :</label>
                <input type="text" id="lname" name="name" maxlength="100" value="${name}" required>
            </div>

            <div class="form-control">
                <label for="lbd">Date of Birth :</label>
                <input type="date" id="lbd" name="bd" value="${bd}" required>
            </div>

            <div class="form-control">
                <label for="lemail">Email :</label>
                <input type="email" id="lemail" name="email" maxlength="100" value="${email}" required>
            </div>

            <div class="form-control">
                <label for="lphone">Phone Number :</label>
                <input type="text" id="lphone" name="phone" maxlength="20" value="${phone}" required>
            </div>

            <div class="form-control">
                <label for="lpwd1">Password :</label>
                <input type="password" id="lpwd1" name="password1" maxlength="30" value="${pwd1}" required>
            </div>

            <div class="form-control">
                <label for="lpwd2">Confirm Password :</label>
                <input type="password" id="lpwd2" name="password2" maxlength="30" value="${pwd2}" required>
            </div>

            <small style="color:red; font-size: 18px;">${error}</small>

            <div style="margin-top: 20px;">
                <button type="submit" class="button-signup">Sign Up</button>
            </div>
        </form>
    </div>
</div>
