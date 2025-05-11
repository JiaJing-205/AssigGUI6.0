<%@page import="java.sql.ResultSet"%>
<%@page import="item.Item"%>
<%@page import="cart.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class = "content">
            <a href="products.jsp">Back</a>
            <h2 class="info">Shopping Cart</h2>
            <%!
                //Retrieve item details from cart database
                Cart cart = new Cart();
                Item item = new Item();
            %>

            <%
                cart = cart.generateCart();

                //Cart section header
                if (cart.getCartItems().size() == 0) {
                    out.println("<div class=\"info\">"
                            + "<h2>Cart is empty</h2>"
                            + "</div>");
                } else {
                    out.println("<table>"
                            + "<th>Item</th>"
                            + "<th>Quantity</th>"
                            + "<th>Unit Price (RM)</th>"
                            + "<th>Total Price (RM)</th>");
                }

                for (int i = 0; i < cart.getCartItems().size(); i++) {
                    out.println("<tr>"
                            + "<td>" + cart.getCartItems().get(i).getName() + "</td>"
                            + "<td>" + cart.getCartItems().get(i).getQuantity() + "</td>"
                            + "<td>" + String.format("%.2f", cart.getCartItems().get(i).getPrice()) + "</td>"
                            + "<td>" + String.format("%.2f", (cart.getCartItems().get(i).getPrice() * cart.getCartItems().get(i).getQuantity())) + "</td>"
                            + "<form action=\"EditCartItemQuantityServlet\" method=\"post\"/>"
                            + "<td class=\"hidden\"><input type=\"hidden\" name=\"itemId\" value=\"" + cart.getCartItems().get(i).getID() + "\"/></td>"
                            + "<td class=\"input-num\"><input type=\"number\" name=\"editQty\" value=\"1\" min=\"1\" max=\"" + item.retrieveStockFromRecord(cart.getCartItems().get(i).getID()) + "\"/></td>"
                            + "<td class=\"input-sub\"><input type=\"submit\" value=\"Change Quantity\"/></td>"
                            + "</form>"
                            + "<form action=\"DeleteCartItemServlet\" method=\"post\"/>"
                            + "<td class=\"hidden\"><input type=\"hidden\" name=\"itemId\" value=\"" + cart.getCartItems().get(i).getID() + "\"/></td>"
                            + "<td class=\"input-sub\"><input type=\"submit\" value=\"Delete\"/></td>"
                            + "</form>"
                            + "</tr>");
                }
            %>

            <footer>
                <div class="info">
                    <h3 style="margin-left: 10px; margin-right: 10px">Subtotal : 
                        <%
                            double subtotal = 0;
                            for (int i = 0; i < cart.getCartItems().size(); i++) {
                                subtotal += (cart.getCartItems().get(i).getPrice() * cart.getCartItems().get(i).getQuantity());
                            }
                            out.println("RM" + String.format("%.2f", subtotal));
                        %>
                    </h3>
                    <%
                        if (cart.getCartItems().size() != 0) {
                    %>
                    <a href="checkout.jsp" style="align-content: center">Checkout</a>
                    <%
                        }
                    %>
                </div>
            </footer>
        </div>
    </body>
</html>
