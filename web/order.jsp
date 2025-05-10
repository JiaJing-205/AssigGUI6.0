<%@ page import="java.util.List" %>
<%@ page import="item.Item" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Items</title>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <a class="button" href="ProfileServlet">Return</a>
            <h2 style="text-align:center;">Order Items</h2>

            <div class="item-container">
                <%
                    List<Item> itemList = (List<Item>) request.getAttribute("allItems");
                    if (itemList != null && !itemList.isEmpty()) {
                        for (Item it : itemList) {
                %>
                <div class="item-card">
                    <h3><%= it.getName()%></h3>
                    <p><strong>ID:</strong> <%= it.getID()%></p>
                    <p><strong>Category:</strong> <%= it.getCategory()%></p>
                    <p><strong>Price:</strong> RM <%= it.getPrice()%></p>
                    <p><strong>Stock:</strong> <%= it.getStock()%></p>

                    <form action="AddToCartServlet" method="post">
                        <label>Amount</label>
                        <input type="text" name="amt" size="1" required />
                        <input type="hidden" name="itemId" value="<%= it.getID()%>" />
                        <p>
                            <input type="submit" value="Add to cart" />
                            <input type="reset" value="Reset" />
                        </p>
                    </form>
                </div>
                <%
                    }
                } else {
                %>
                <p style="text-align:center;">No items found.</p>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
