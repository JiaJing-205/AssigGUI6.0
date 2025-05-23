<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="domain.*" %>
<%@ page import="da.*" %>
<%@ page import="item.*" %>

<%
    List<Item> itemList = (List<Item>) request.getAttribute("allItems");
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html> 
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>

    <head>
        <meta charset="UTF-8">
        <title>View Items</title>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <a class="button" href="ProfileServlet">Return</a>
            <h2 style="text-align:center;">All Items</h2>
            <a href="addItem.jsp">Add item</a><br>

            <% if (error != null) {%>
            <p class="error"><%= error%></p>
            <% } else if (itemList == null || itemList.isEmpty()) { %>
            <p style="text-align:center;">No items found.</p>
            <% } else { %>
            <table>
                <tr>
                    <th>Item ID</th>
                    <th>Item Name</th>
                    <th>Category</th>
                    <th>Price (RM)</th>
                    <th>Stock</th>
                    <th colspan="2">Options</th>
                </tr>
                <% for (Item item : itemList) {%>
                <tr>
                    <td><%= item.getID()%></td>
                    <td><%= item.getName()%></td>
                    <td><%= item.getCategory()%></td>
                    <td><%= String.format("%.2f", item.getPrice())%></td>
                    <td><%= item.getStock()%></td>
                    <td>
                        <form action="getItemServlet" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= item.getID()%>" />
                            <input type="submit" value="Edit" />
                        </form>
                    </td>
                    <td>
                        <form action="removeItemServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this item?');">
                            <input type="hidden" name="id" value="<%= item.getID()%>" />
                            <input type="submit" value="Delete" />
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
            <% }%>
            <a href="ProfileServlet">Return</a><br>

            </body>
            </html>