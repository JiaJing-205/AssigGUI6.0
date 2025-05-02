<%@page import="domain.User"%>
<%@page import="da.UserDA"%>
<%@page import="cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <link rel="stylesheet" href="checkout.css">
    </head>
    <%!
        Cart cart = new Cart();

        UserDA userDA = new UserDA();
        User user = new User();

        double subtotal = 0.0;
        double shippingFee = 5.0;
        double shippingFeeTax = shippingFee * 0.06;
    %>
    <body>
        <div class="container">
            <header class="checkout-header">
                <h1>Checkout</h1>
            </header>

            <div class="checkout-grid">
                <div class="left-column">
                    <section class="cart-items">
                        <h2>Your Items</h2>
                        <%
                            cart = cart.generateCart();

                            for (int i = 0; i < cart.getCartItems().size(); i++) {
                                out.println("<div class=\"cart-item\">"
                                        + "<div class=\"item-details\">"
                                        + "<h3 class=\"item-name\">" + cart.getCartItems().get(i).getName() + "</h3>"
                                        + "<div class=\"item-quantity\"> Quantity: " + cart.getCartItems().get(i).getQuantity() + "</div>"
                                        + "<div class=\"item-price\">$" + String.format("%.2f", (cart.getCartItems().get(i).getQuantity() * cart.getCartItems().get(i).getPrice())) + "</div>"
                                        + "</div>"
                                        + "</div>");
                            }
                        %>
                        <a href="../cart.jsp"><button class="checkout-btn">Edit Items</button></a>
                    </section>

                    <section class="customer-info">
                        <h2 class="section-title">Shipping Information</h2>
                        <form action="../CheckoutServlet" method="POST">
                            <div class="form-row">
                                <%
                                    //Get userId
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
                                        out.println("<div class=\"form-group\">"
                                        + "<label for=\"first-name\">First Name</label>"
                                        + "<input type=\"text\" id=\"first-name\" name=\"firstName\" required>"
                                        + "</div>"
                                        + "<div class=\"form-group\">"
                                        + "<label for=\"last-name\">Last Name</label>"
                                        + "<input type=\"text\" id=\"last-name\" name=\"lastName\" required>"
                                        + "</div>");
                                    } else {
                                        user = userDA.retrieveRecord(userId);
                                        out.println("<div class=\"form-group\">"
                                        + "<label for=\"first-name\">Name</label>"
                                        + "<input type=\"text\" id=\"name\" name=\"name\" value=\"" + user.getName() + "\" readonly=\"readonly\">"
                                        + "</div>");
                                    }

                                %>
                            </div>

                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" id="address" name="address" required>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required>
                                </div>
                                <div class="form-group">
                                    <label for="zip">ZIP Code</label>
                                    <input type="text" id="zip" name="zip" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="state">State</label>
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
                            
                            <button type="submit" class="checkout-btn">Confirm Order</button>
                    </section>
                </div>

                <div class="right-column">
                    <section class="checkout-summary">
                        <h2 class="summary-title">Order Summary</h2>

                        <div class="summary-row">
                            <%
                                subtotal = 0.0;
                                
                                for (int i = 0; i < cart.getCartItems().size(); i++) {
                                    subtotal += (cart.getCartItems().get(i).getPrice() * cart.getCartItems().get(i).getQuantity());
                                }

                                //If no item, set no shipping fee
                                if (subtotal <= 0.0) {
                                    shippingFee = 0.0;
                                    shippingFeeTax = shippingFee * 0.06;
                                }
                            %>
                            <span>Subtotal</span>
                            <span>RM<%= String.format("%.2f", subtotal)%></span>
                        </div>

                        <div class="summary-row">
                            <span>Shipping</span>
                            <span>RM<%= String.format("%.2f", shippingFee)%></span>
                        </div>

                        <div class="summary-row">
                            <span>Shipping Fee SST (6%)</span>
                            <span>RM<%= String.format("%.2f", shippingFeeTax)%></span>
                        </div>

                        <div class="summary-total summary-row">
                            <span>Total</span>
                            <span>RM<%= String.format("%.2f", (subtotal + shippingFee + shippingFeeTax))%></span>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
