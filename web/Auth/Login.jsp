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
        <!-- Top Navbar -->
        <div id="navbar">
            <div></div>
            <div class="search-container">
                <input type="text" placeholder="Search..." />
                <button type="submit">Search</button>
            </div>
            <div>
                <a class="login-btn" href="#">Logout</a>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width="230" alt="logo" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="event.jsp">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout.jsp">Checkout</a>
        </div>

        <div class="content">
            <div class="bar">Login</div>
            <form method="post" action="LoginServlet">
                <table>
                    <tr>
                        <td>
                            <div class="form-control">
                                <input type="text" id="lid" name="id" maxlength="20" value="${id}" required>
                                <label>
                                    <span style="transition-delay:0ms">I</span>
                                    <span style="transition-delay:50ms">D</span>
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="form-control">
                                <input type="password" id="lpwd" name="pwd" maxlength="100" value="${pwd}" required>
                                <label>
                                    <span style="transition-delay:0ms">P</span> 
                                    <span style="transition-delay:50ms">a</span>
                                    <span style="transition-delay:100ms">s</span>
                                    <span style="transition-delay:150ms">s</span>
                                    <span style="transition-delay:200ms">w</span>
                                    <span style="transition-delay:250ms">o</span>
                                    <span style="transition-delay:300ms">r</span>
                                    <span style="transition-delay:350ms">d</span>
                                </label>
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
    </body>
</html>

