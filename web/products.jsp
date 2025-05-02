<%@ page import="item.Item" %>
<%@ page import="item.ItemDA" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="styles.css" />
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
            <th>Action</th>
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
            </td>
            <td>
                    <input type="submit" value="Add to Cart" />
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

</body>
</html>
