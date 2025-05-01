<html>
    <head>
        <title>Add New Item</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h3>New Item Details</h3>
<form method="post" action="addItemServlet">
    <p>ID: 
        <input type="text" name="id" value="<%= request.getAttribute("id") != null ? request.getAttribute("id") : "" %>" />
        <br>
        <span style="color:red;">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </span>
    </p>
    <p>Name: <input type="text" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" /></p>
    <p>Category: 
        <select name="category">
            <option value="Badminton" <%= "Badminton".equals(request.getAttribute("category")) ? "selected" : "" %>>Badminton</option>
            <option value="Table Tennis" <%= "Table Tennis".equals(request.getAttribute("category")) ? "selected" : "" %>>Table Tennis</option>
            <option value="General" <%= "General".equals(request.getAttribute("category")) ? "selected" : "" %>>General</option>
        </select>
    </p>
    <p>Price: <input type="text" name="price" value="<%= request.getAttribute("price") != null ? request.getAttribute("price") : "" %>" /></p>
    <p>Stock: <input type="text" name="stock" value="<%= request.getAttribute("stock") != null ? request.getAttribute("stock") : "" %>" /></p>
    <input type="submit" value="Add Item">
</form>

         <a href="viewItemServlet">Return</a><br>

    </body>
</html>
