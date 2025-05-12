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
                <form action="editShippingServlet" method="post">
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
                        <label for="state">State :</label>
                        <select id="state" name="state" required>
                            <option value="">Select State</option>
                            <option value="Perlis" <%= "Perlis".equals(request.getAttribute("state")) ? "selected" : ""%>>Perlis</option>
                            <option value="Kedah" <%= "Kedah".equals(request.getAttribute("state")) ? "selected" : ""%>>Kedah</option>
                            <option value="Penang" <%= "Penang".equals(request.getAttribute("state")) ? "selected" : ""%>>Penang</option>
                            <option value="Kelantan" <%= "Kelantan".equals(request.getAttribute("state")) ? "selected" : ""%>>Kelantan</option>
                            <option value="Terengganu" <%= "Terengganu".equals(request.getAttribute("state")) ? "selected" : ""%>>Terengganu</option>
                            <option value="Perak" <%= "Perak".equals(request.getAttribute("state")) ? "selected" : ""%>>Perak</option>
                            <option value="Negeri Sembilan" <%= "Negeri Sembilan".equals(request.getAttribute("state")) ? "selected" : ""%>>Negeri Sembilan</option>
                            <option value="Malacca" <%= "Malacca".equals(request.getAttribute("state")) ? "selected" : ""%>>Malacca</option>
                            <option value="Johor" <%= "Johor".equals(request.getAttribute("state")) ? "selected" : ""%>>Johor</option>
                            <option value="Pahang" <%= "Pahang".equals(request.getAttribute("state")) ? "selected" : ""%>>Pahang</option>
                            <option value="Sarawak" <%= "Sarawak".equals(request.getAttribute("state")) ? "selected" : ""%>>Sarawak</option>
                            <option value="Selangor" <%= "Selangor".equals(request.getAttribute("state")) ? "selected" : ""%>>Selangor</option>
                            <option value="Labuan" <%= "Labuan".equals(request.getAttribute("state")) ? "selected" : ""%>>Labuan</option>
                            <option value="Kuala Lumpur" <%= "Kuala Lumpur".equals(request.getAttribute("state")) ? "selected" : ""%>>Kuala Lumpur</option>
                            <option value="Putrajaya" <%= "Putrajaya".equals(request.getAttribute("state")) ? "selected" : ""%>>Putrajaya</option>
                        </select>

                    </div>


                    <div class="form-control">
                        <button type="submit" class="button-update">Update Shipping Info</button>
                    </div>
                </form>
                <form action="deleteShippingServlet" method="post">
                    <button type="submit" class="button-update">Delete Shipping Info</button>
                </form>


                <div class="form-control" style="color:red;">
                    ${error}
                </div>
            </section>
        </div>
    </body>
</html>
