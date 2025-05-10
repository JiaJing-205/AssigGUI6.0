<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.*" %>
<%@ page import="da.*" %>
<%@ page import="item.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Item</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class = "content">
            <%
                // Get the item object from the request attribute
                Item i = (Item) request.getAttribute("editItem");
                if (i != null) {
            %>
            <h3>Edit Item</h3>
            <a class="button" href="/Assignment_Login/Auth/ProfileServlet">Return</a>
            <form method="post" action="editItemServlet">
                <p>ID: <input type="text" name="id" value="<%= i.getID()%>" readonly /></p>
                <p>Name: <input type="text" name="name" value="<%= i.getName()%>" /></p>
                <p>Category: <select name="category" value="<%= i.getCategory()%>">
                        <option value = "Badminton">Badminton</option>
                        <option value = "Table Tennis">Table Tennis</option>
                        <option value = "General">General</option>
                    </select></p>         
                <p>Price: <input type="text" name="price" value="<%= i.getPrice()%>" /></p>
                <p>Stock: <input type="text" name="stock" value="<%= i.getStock()%>" /></p>
                <input type="submit" value="Update">
            </form>
            <%
                } else {
                    out.println("<p>Item not found!</p>");
                }
            %>

            <%
                // Show any error message if it exists
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <p style="color:red;"><%= error%></p>
            <%
                }
            %>
            <a href="ProfileServlet">Return</a><br>
        </div>

    </body>
</html>
