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

            <div class="search-container">
                <input type="text" placeholder="Search..." />
                <button type="submit">Search</button>
            </div>

            <div>
                <a class="login-btn" href="./Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="home.jsp"><img src="../Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="event.jsp">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout.jsp">Checkout</a>
        </div>

        <div class="content">
            <div class="bar">Login</div>
            <div class="innersec">
                <form method="post" action="LoginServlet">
                    <table>
                        <tr>
                            <td>
                                <div class="form-control">
                                    <label>
                                        ID : 
                                    </label>
                                    <input type="text" id="lid" name="id" maxlength="20" value="${id}" required>
                                </div>
                            </td>
                            <td>
                                <div class="form-control">
                                    <label>PASSWORD :
                                    </label>
                                    <input type="password" id="lpwd" name="pwd" maxlength="100" value="${pwd}" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <small style="color:red; font-size: 18px;">
                                    ${error}
                                </small>
                            </td>
                        </tr>
                        <tr>
                            <td>          
                                <br>
                                <button type="submit">Login</button>
                                <a href="ResetPassword.jsp">Reset Password</a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>

