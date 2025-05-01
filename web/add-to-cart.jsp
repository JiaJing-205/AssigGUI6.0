<%@page import="item.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="resources/fix-number-input.css"/>
    </head>
    <body>
        <%!
            Item item = new Item();
        %>
        <h2>Products</h2>
        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="itemId" value="I002"/>
            <span>Item 1</span>
            <input class="quantity" type="number" name="quantity" value="1" min="1" max="<%= item.retrieveStockFromRecord("I002") %>"/>
            <input type="submit" value="Add to cart"/>
        </form>

        <form action="AddToCartServlet" method="post">
            <input type="hidden" name="itemId" value="I069"/>
            <span>Item 2</span>
            <input class="quantity" type="number" name="quantity" value="1" min="1" max="<%= item.retrieveStockFromRecord("I069") %>"/>
            <input type="submit" value="Add to cart"/>
        </form>

        <a href="cart.jsp"><button>Cart</button></a>
    </body>
</html>
