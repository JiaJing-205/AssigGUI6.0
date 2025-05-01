<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sidebar Navigation</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            #navbar {
                border-bottom: 5px solid #04484f;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px;
            }

            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #ffffff;
                border-right: 5px solid #04484f;
                padding-top: 10px;
                z-index: 1000;
            }

            .sidebar a {
                padding: 10px 20px;
                text-decoration: none;
                font-size: 20px;
                color: #04484f;
                display: block;
                transition: 0.125s;
            }

            .sidebar a:hover {
                border: 2px solid #04484f;
                border-radius: 5px;
            }

            .search-container {
                display: flex;
                align-items: center;
                border: 2px solid #333;
                border-radius: 25px;
                padding: 5px 15px;
                max-width: 400px;
                width: 100%;
            }

            .search-container input {
                border: none;
                outline: none;
                font-size: 16px;
                flex: 1;
                padding: 10px;
            }

            .search-container button {
                background-color: #333;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 20px;
                cursor: pointer;
                font-size: 16px;
            }

            .search-container button:hover {
                background-color: #555;
            }

            .content {
                margin-left: 250px;
                padding: 20px;
            }

            .content h1 {
                margin-top: 0;
            }

            .content p {
                font-size: 18px;
            }

            .login-btn {
                border: 5px solid #04484f;
                padding: 15px 25px;
                border-radius: 25px;
                text-decoration: none;
                color: #04484f;
                font-size: 16px;
            }

            .login-btn:hover {
                background-color: #04484f;
                color: white;
            }
        </style>
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
                <a class="login-btn" href="#">Login</a>
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
            <h1>${eventName}</h1>
    <p>${eventDescription}</p>
    <div class="countdown" id="countdown">Loading countdown...</div>

    <script>
        const eventTime = new Date("${eventTime}").getTime();

        function updateCountdown() {
            const now = new Date().getTime();
            const distance = eventTime - now;

            if (distance <= 0) {
                document.getElementById("countdown").innerHTML = "? The event has started!";
                clearInterval(interval);
                return;
            }

            const days = Math.floor(distance / (1000 * 60 * 60 * 24));
            const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((distance % (1000 * 60)) / 1000);

            document.getElementById("countdown").innerHTML =
                `${days}d ${hours}h ${minutes}m ${seconds}s`;
        }

        const interval = setInterval(updateCountdown, 1000);
        updateCountdown();
    </script>
        </div>
    </body>
</html>
