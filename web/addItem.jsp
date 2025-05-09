<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add New Item</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <a href="viewItem.jsp">Return</a>
            <div class="container">
                <header class="checkout-header info">
                    <h1>Add New Item</h1>
                </header>

                <section class="form-section info" style="padding: 20px;">
                    <form method="post" action="addItemServlet">
                        <div class="form-control">
                            <label for="id">ID *:</label>
                            <input type="text" name="id" id="id" value="<%= request.getAttribute("id") != null ? request.getAttribute("id") : ""%>" />
                            <span style="color:red;">
                                <%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%>
                            </span>
                        </div>

                        <div class="form-control">
                            <label for="name">Name *:</label>
                            <input type="text" name="name" id="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : ""%>" />
                        </div>

                        <div class="form-control">
                            <label for="category">Category *:</label>
                            <select name="category" id="category">
                                <option value="Badminton" <%= "Badminton".equals(request.getAttribute("category")) ? "selected" : ""%>>Badminton</option>
                                <option value="Table Tennis" <%= "Table Tennis".equals(request.getAttribute("category")) ? "selected" : ""%>>Table Tennis</option>
                                <option value="General" <%= "General".equals(request.getAttribute("category")) ? "selected" : ""%>>General</option>
                            </select>
                        </div>

                        <div class="form-control">
                            <label for="price">Price *:</label>
                            <input type="text" name="price" id="price" value="<%= request.getAttribute("price") != null ? request.getAttribute("price") : ""%>" />
                        </div>

                        <div class="form-control">
                            <label for="stock">Stock *:</label>
                            <input type="text" name="stock" id="stock" value="<%= request.getAttribute("stock") != null ? request.getAttribute("stock") : ""%>" />
                        </div>

                        <button type="submit" class="checkout-btn">Add Item</button>
                    </form>
                </section>
            </div>
        </div>
    </body>
</html>
