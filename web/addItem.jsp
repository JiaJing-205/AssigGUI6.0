<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add New Item</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css" />
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
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width="230" alt="Logo" style="padding:0; margin:0;" /></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="events">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout/checkout.jsp">Checkout</a>
<<<<<<< Updated upstream
            <a href="DisplayComment.jsp">Comments</a>
        </div>
=======
<a href="DisplayComment.jsp">Comments</a>
        </div>
        <div class = "content">
            <a class="button" href="/Assignment_Login/Auth/ProfileServlet">Return</a>
            <h3>New Item Details</h3>
            <form method="post" action="addItemServlet">
                <p>ID: 
                    <input type="text" name="id" value="<%= request.getAttribute("id") != null ? request.getAttribute("id") : ""%>" />
                    <br>
                    <span style="color:red;">
                        <%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%>
                    </span>
                </p>
                <p>Name: <input type="text" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : ""%>" /></p>
                <p>Category: 
                    <select name="category">
                        <option value="Badminton" <%= "Badminton".equals(request.getAttribute("category")) ? "selected" : ""%>>Badminton</option>
                        <option value="Table Tennis" <%= "Table Tennis".equals(request.getAttribute("category")) ? "selected" : ""%>>Table Tennis</option>
                        <option value="General" <%= "General".equals(request.getAttribute("category")) ? "selected" : ""%>>General</option>
                    </select>
                </p>
                <p>Price: <input type="text" name="price" value="<%= request.getAttribute("price") != null ? request.getAttribute("price") : ""%>" /></p>
                <p>Stock: <input type="text" name="stock" value="<%= request.getAttribute("stock") != null ? request.getAttribute("stock") : ""%>" /></p>
                <input type="submit" value="Add Item">
            </form>
>>>>>>> Stashed changes

        <div class="content">
            <div class="container">
                <header class="checkout-header info">
                    <h1>Add New Item</h1>
                </header>

                <section class="form-section info" style="padding: 20px;">
                    <form method="post" action="addItemServlet">
                        <div class="form-control">
                            <label for="id">ID:</label>
                            <input type="text" name="id" id="id" value="<%= request.getAttribute("id") != null ? request.getAttribute("id") : "" %>" />
                            <span style="color:red;">
                                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                            </span>
                        </div>

                        <div class="form-control">
                            <label for="name">Name:</label>
                            <input type="text" name="name" id="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" />
                        </div>

                        <div class="form-control">
                            <label for="category">Category:</label>
                            <select name="category" id="category">
                                <option value="Badminton" <%= "Badminton".equals(request.getAttribute("category")) ? "selected" : "" %>>Badminton</option>
                                <option value="Table Tennis" <%= "Table Tennis".equals(request.getAttribute("category")) ? "selected" : "" %>>Table Tennis</option>
                                <option value="General" <%= "General".equals(request.getAttribute("category")) ? "selected" : "" %>>General</option>
                            </select>
                        </div>

                        <div class="form-control">
                            <label for="price">Price:</label>
                            <input type="text" name="price" id="price" value="<%= request.getAttribute("price") != null ? request.getAttribute("price") : "" %>" />
                        </div>

                        <div class="form-control">
                            <label for="stock">Stock:</label>
                            <input type="text" name="stock" id="stock" value="<%= request.getAttribute("stock") != null ? request.getAttribute("stock") : "" %>" />
                        </div>

                        <button type="submit" class="checkout-btn">Add Item</button>
                    </form>

                    <div style="margin-top: 15px;">
                        <a href="viewItem.jsp">Return to Item List</a>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>
