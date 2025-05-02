<%@ page import="item.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item List</title>
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
            margin-top: 40px;
        }
        input.quantity {
            width: 50px;
            text-align: center;
        }
    </style>
</head>
<body>

<h2>Available Items</h2>

<%
    List<Item> itemList = (List<Item>) request.getAttribute("itemList");
    if (itemList == null || itemList.isEmpty()) {
%>
    <p style="text-align:center;">No items available.</p>
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
            for (Item item : itemList) {
                int maxStock = item.retrieveStockFromRecord(item.getID());
        %>
        <tr>
            <td><%= item.getName() %></td>
            <td><%= item.getCategory() %></td>
            <td><%= String.format("%.2f", item.getPrice()) %></td>
            <td>
                <form action="AddToCartServlet" method="post" style="display:inline;">
                    <input type="hidden" name="itemId" value="<%= item.getID() %>" />
                    <input class="quantity" type="number" name="quantity" value="1" min="1" max="<%= item.retrieveStockFromRecord(item.getID()) %>" />
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
