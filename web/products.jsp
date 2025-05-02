<%@ page import="item.Item" %>
<%@ page import="item.ItemDA" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <style>
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            text-align: center;
        }
        input.quantity {
            width: 50px;
        }
    </style>
    <html>
    <head>
        <title>Remove Item</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="styles.css" />
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
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="events">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout/checkout.jsp">Checkout</a>
<a href="DisplayCmment.jsp">Comments</a>"
        </div>

        <div class="content">
</head>
<body>

<h2>Product Catalog</h2>

<%
    List<Item> allItems = null;
    try {
        ItemDA itDA = new ItemDA();
        allItems = itDA.getAllRecord();
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Unable to load items.</p>");
        e.printStackTrace();
    }
%>

<%
    if (allItems == null || allItems.isEmpty()) {
%>
    <p style="text-align:center;">No items found.</p>
<%
    } else {
%>
    <table>
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Price (RM)</th>
            <th>Quantity</th>
            <th>Buy</th>
            <th>View More</th>
        </tr>
        <%
            for (Item item : allItems) {
        %>
        <tr>
            <td><%= item.getName() %></td>
            <td><%= item.getCategory() %></td>
            <td><%= String.format("%.2f", item.getPrice()) %></td>
            <td>
                <form action="AddToCartServlet" method="post" style="display:inline;">
                    <input type="hidden" name="itemId" value="<%= item.getID() %>" />
                    <input class="quantity" type="number" name="quantity" value="1"
                           min="1" max="<%= item.getStock() %>" />
                    <input type="submit" value="Add to Cart" />
                </form>
            </td>
            <td>
                <form action="searchItemServletPublic" method="get" style="display:inline;">
                    <input type="text" name="search" value="<%= item.getName() %>"/>
                    <input type="submit" value="View Details" />
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
<%
    }
%>
    </div>
</body>
</html>
