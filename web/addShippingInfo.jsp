<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.UserShippingDetails" %>
<%@ page import="da.UserShippingDetailsDA" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Shipping Info</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>

        <div class="content">
            <a class="button-return" href="ProfileServlet">Return</a>
            <h2 class="info">Edit Shipping Info</h2>
            <section class="info">
                <form action="addShippingServlet" method="post">
                    <div class="form-control">
                        <label for="userId">User ID:</label>
                        <input type="text" id="userId" name="userId" maxlength="20" value="${userId}" readonly>
                    </div>

                    <div class="form-control">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" maxlength="200" value="${address}">
                    </div>

                    <div class="form-control">
                        <label for="zipCode">Zip Code:</label>
                        <input type="text" id="zipCode" name="zipCode" maxlength="10" value="${zipCode}">
                    </div>

                    <div class="form-control">
                        <label for="city">City:</label>
                        <input type="text" id="city" name="city" maxlength="100" value="${city}">
                    </div>

                    <div class="form-control">
                        <label for="state">State:</label>
                        <input type="text" id="state" name="state" maxlength="100" value="${state}">
                    </div>

                    <div class="form-control">
                        <button type="submit" class="button-update">Update Shipping Info</button>
                    </div>
                </form>

                <div class="form-control" style="color:red;">
                    ${error}
                </div>
            </section>
        </div>
    </body>
</html>
