<%@page import="item.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, product.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Products</title>
    <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }

            #toggleBtn {
                font-size: 24px;
                cursor: pointer;
                height:45px;
                width:45px;
            }

            .sidebar {
                height: 100%;
                width: 0;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #333;
                overflow-x: hidden;
                transition: 0.3s;
                padding-top: 60px;
            }

            .sidebar a {
                padding: 10px 20px;
                text-decoration: none;
                font-size: 20px;
                color: #fff;
                display: block;
                transition: 0.3s;
            }

            .sidebar a:hover {
                background-color: #575757;
            }

            .closeBtn {
                position: absolute;
                top: 15px;
                right: 25px;
                font-size: 30px;
                color: white;
                text-decoration: none;
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
        </style>
</head>
<body>
<div id="navbar" style="border-bottom: 5px solid #04484f;">
            <div align="left" style="padding:0px;margin:0;float:left;">
                <button id="toggleBtn">&#9776;</button>
                <img src="Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/>
            </div>
            <div class="search-container">
                <input type="text" placeholder="Search...">
                <button type="submit">Search</button>
            </div>
            <div align="right"style="height:90px;">
                <a style="border: 5px solid #04484f;padding: 25px;border-radius: 25px;margin: 20px;text-decoration:none;color:#04484f;" href="">Login</a>
            </div>
        </div>
        <div style="clear:both;"></div>

        <div id="sidebar" class="sidebar">
            <a href="#" class="closeBtn" id="closeBtn">&times;</a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="#">Events</a>
            <a href="#">Cart</a>
            <a href="#">Checkout</a>
        </div>
<h1>Product Catalog</h1>
<form method="get" action="products.jsp">
    <label>Search :</label>
    <input type="text" id="category" name="productSearch" placeholder="e.g. Badminton Racket">
    <input type="submit" value="Search">
</form>
<hr>
<%--
    idk the product you guys use what attributes and name so that I can loop through it
    {
        for (Product product : productList) {
--%>
    <div style="width:33%;">
        <%--Name
        <h2><%= product.getProductName() %></h2>
        //Picture
        <img src="<%= product.getImageUrl() %>" width="150">
        //Price
        <p>Price: $<%= product.getPrice() %></p>
        //Category
        <p><%= product.getProdcutCategory() %></p>
        --%>
        <%!
            Item item = new Item();
        %>
        <!-- Change the max attribute according to the value for all buttons -->
       <form action="AddToCartServlet" method="post">
            <input type="hidden" name="itemId" value="I002"/>
            <span>Item 1</span>
            <input class="quantity" type="number" name="quantity" value="1" min="1" max="<%= item.retrieveStockFromRecord("I002") %>"/>
            <input type="submit" value="Add to cart"/>
        </form>
        <hr>
    </div>
<%--
        }
    } else {
--%>
    <p>No more products available</p>
<%--
    }
--%>


        <script>
            const sidebar = document.getElementById("sidebar");
            const toggleBtn = document.getElementById("toggleBtn");
            const closeBtn = document.getElementById("closeBtn");

            toggleBtn.onclick = function () {
                sidebar.style.width = "250px";
            };

            closeBtn.onclick = function () {
                sidebar.style.width = "0";
            };
            
            function itemPopOutMsg() {
                alert("Item added into cart.");
            }
        </script>
</body>
</html>
