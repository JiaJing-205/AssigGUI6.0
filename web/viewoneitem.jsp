<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.*" %>
<%@ page import="item.*" %>

<%
    Item item = (Item) request.getAttribute("itemFound");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Item</title><link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <body>

                <h2 style="text-align:center;">Item Details</h2>

                <% if (error != null) {%>
                <p class="error"><%= error%></p>
                <% } else if (item == null) { %>
                <p style="text-align:center;">Item not found.</p>
                <% } else {%>
                <table>
                    <tr>
                        <th>Item Name</th>
                        <td><%= item.getName()%></td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td><%= item.getCategory()%></td>
                    </tr>
                    <tr>
                        <th>Price (RM)</th>
                        <td><%= String.format("%.2f", item.getPrice())%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <form action="addToCartServlet" method="post">
                                <input type="hidden" name="id" value="<%= item.getID()%>" />
                                <input type="submit" value="Add to Cart" />
                            </form>
                        </td>
                    </tr>
                </table>
                <% }%>
                <a href="products.jsp">Return</a><br>
        </div>
    </body>
</html>
