<%@page import="domain.User"%>
<%@page import="da.UserDA"%>
<%@page import="cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="z-styles.css" />
        <%!
            Cart cart = new Cart();

            UserDA userDA = new UserDA();
            User user = new User();

            double subtotal = 0.0;
            double shippingFee = 5.0;
            double shippingFeeTax = shippingFee * 0.06;
        %>
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <div class="container">

                <header class="checkout-header info">
                    <h1>Checkout</h1>
                </header>

                <div class="checkout-grid" style="display: flex; gap: 30px; padding: 20px;">
                    <!-- Left Column -->
                    <div class="left-column" style="flex: 2;">

                        <section class="cart-items info">
                            <h2>Your Items</h2>
                            <%
                                cart = cart.generateCart();
                                for (int i = 0; i < cart.getCartItems().size(); i++) {
                            %>
                            <div class="cart-item" style="margin-bottom: 10px;">
                                <div class="item-details">
                                    <h3 class="item-name"><%= cart.getCartItems().get(i).getName()%></h3>
                                    <div class="form-control">Quantity: <%= cart.getCartItems().get(i).getQuantity()%></div>
                                    <div class="form-control">Price: RM<%= String.format("%.2f", (cart.getCartItems().get(i).getQuantity() * cart.getCartItems().get(i).getPrice()))%></div>
                                </div>
                            </div>
                            <% } %>
                            <a href="cart.jsp">Edit Items</a>
                        </section>

                        <section class="customer-info info">
                            <h2>Shipping Information</h2>
                            <form action="CheckoutServlet" method="POST">
                                
                                <%
                                    Cookie[] userIdCookies = request.getCookies();
                                    String userId = "";
                                    if (userIdCookies != null) {
                                        for (Cookie cookie : userIdCookies) {
                                            if (cookie.getName().equals("userId")) {
                                                userId = cookie.getValue();
                                            }
                                        }
                                    } else {
                                        userId = null;
                                    }

                                    if (userId == null || userId.equals("")) {
                                %>
                                <div class="form-control">
                                    <label for="first-name">First Name*</label>
                                    <input type="text" id="first-name" name="firstName" required>
                                </div>
                                <div class="form-control">
                                    <label for="last-name">Last Name*</label>
                                    <input type="text" id="last-name" name="lastName" required>
                                </div>
                                <% } else {
                                    user = userDA.retrieveRecord(userId);
                                %>
                                <div class="form-control">
                                    <label for="name">Name</label>
                                    <input type="text" id="name" name="name" value="<%= user.getName()%>" readonly>
                                </div>
                                <% } %>

                                <div class="form-control">
                                    <label for="address">Address *</label>
                                    <input type="text" id="address" name="address" required>
                                </div>

                                <div class="form-control">
                                    <label for="city">City *</label>
                                    <input type="text" id="city" name="city" required>
                                </div>

                                <div class="form-control">
                                    <label for="zip">ZIP Code *</label>
                                    <input type="text" id="zip" name="zip" required>
                                </div>

                                <div class="form-control">
                                    <label for="state">State *</label>
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
                                    </select>
                                </div>

                                <button type="submit" class="checkout-btn">Confirm Order</button>
                            </form>
                        </section>
                    </div>

                    <!-- Right Column -->
                    <div class="right-column" style="flex: 1;">
                        <section class="checkout-summary info">
                            <h2 class="summary-title">Order Summary</h2>
                            <%
                                subtotal = 0.0;
                                for (int i = 0; i < cart.getCartItems().size(); i++) {
                                    subtotal += cart.getCartItems().get(i).getPrice() * cart.getCartItems().get(i).getQuantity();
                                }

                                if (subtotal <= 0.0) {
                                    shippingFee = 0.0;
                                    shippingFeeTax = shippingFee * 0.06;
                                }
                            %>

                            <div class="form-control">
                                <label>Subtotal:</label>
                                <span>RM<%= String.format("%.2f", subtotal)%></span>
                            </div>
                            <div class="form-control">
                                <label>Shipping:</label>
                                <span>RM<%= String.format("%.2f", shippingFee)%></span>
                            </div>
                            <div class="form-control">
                                <label>Shipping Fee SST (6%):</label>
                                <span>RM<%= String.format("%.2f", shippingFeeTax)%></span>
                            </div>
                            <div class="form-control" style="font-weight:bold;">
                                <label>Total:</label>
                                <span>RM<%= String.format("%.2f", (subtotal + shippingFee + shippingFeeTax))%></span>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
