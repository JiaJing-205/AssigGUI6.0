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
                <p>Hey there! It seems like you do not have shipping information, let's add that!</p>
                <form action="addShippingServlet" method="post">
                    <div class="form-control">
                        <label for="userId">User ID <span style="color: red;">*</span>:</label>
                        <input type="text" id="userId" name="userId" maxlength="20" value="${userId}" readonly>
                    </div>

                    <div class="form-control">
                        <label for="address">Address <span style="color: red;">*</span>:</label>
                        <input type="text" id="address" name="address" maxlength="200" value="${address}" required>
                    </div>

                    <div class="form-control">
                        <label for="zipCode">Zip Code <span style="color: red;">*</span>:</label>
                        <input type="text" id="zipCode" name="zipCode" maxlength="10" value="${zipCode}" required>
                    </div>

                    <div class="form-control">
                        <label for="city">City <span style="color: red;">*</span>:</label>
                        <input type="text" id="city" name="city" maxlength="100" value="${city}" required>
                    </div>

                    <div class="form-control">
                        <label for="state">State <span style="color: red;">*</span></label>
                        <select id="state" name="state" required>
                            <option value="">Select State</option>
                            <option value="Perlis">Perlis</option>
                            <option value="Kedah">Kedah</option>
                            <option value="Penang">Penang</option>
                            <option value="Kelantan">Kelantan</option>
                            <option value="Terengganu">Terengganu</option>
                            <option value="Perak">Perak</option>
                            <option value="Negeri Sembilan">Negeri Sembilan</option>
                            <option value="Malacca">Malacca</option>
                            <option value="Johor">Johor</option>
                            <option value="Pahang">Pahang</option>
                            <option value="Sarawak">Sarawak</option>
                            <option value="Selangor">Selangor</option>
                            <option value="Labuan">Labuan</option>
                            <option value="Kuala Lumpur">Kuala Lumpur</option>
                            <option value="Putrajaya">Putrajaya</option>
                        </select>
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
