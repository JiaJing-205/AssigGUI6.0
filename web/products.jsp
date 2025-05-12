<%@ page import="item.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<%@ include file="z-navbar.jsp" %>
<%@ include file="z-sidebar.jsp" %>

<div class="content">
    <h2>Product Catalog</h2>

    <%
        List<Item> itemList = (List<Item>) request.getAttribute("itemList");
    %>

    <%
        if (itemList == null || itemList.isEmpty()) {
    %>
        <p style="text-align:center;">No items found.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Name</th>
                <th>Category</th>
                <th>Price (RM)</th>
                <th>Quantity</th>
                <th>View More</th>
            </tr>
            <%
                for (Item item : itemList) {
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
                            <input type="hidden" name="search" value="<%= item.getName() %>" />
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
