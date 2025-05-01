<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sidebar Navigation</title>
        <link rel="stylesheet" href="styles.css" />
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
                <a class="login-btn" href="Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="event.jsp">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout.jsp">Checkout</a>
            <!-- This part is for if I am an admin or a staff 
            if Admin :
            <a href="Product Details">Order products</a>
            <a href="Staff">Checkout</a>
            if Staff :
            <a href="Product Details">Product Details</a>
            -->
        </div>

        <div class="content">
            <h1>Welcome!</h1>
            <p>This is your main page content.</p>
        </div>
    </body>
</html>
