package Payment;

import cart.Cart;
import cart.CartItem;
import da.PaymentDA;
import domain.Order;
import domain.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentServlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paymentType = "";
        String amountPaid = "";
        String paymentDate = "";
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        PaymentDA paymentDA = new PaymentDA();
        Payment payment = new Payment();

        amountPaid = request.getParameter("amountPaid");
        paymentType = request.getParameter("paymentType");
        paymentDate = LocalDate.now().toString();
        
        //Get userId
        Cookie[] userIdCookies = request.getCookies();
        String userId = "";
        if (userIdCookies != null) {
            for (Cookie cookie : userIdCookies) {
                if (cookie.getName().equals("userId")) {
                    userId = cookie.getValue();
                }
            }
        }

        //Create order
        Order order = new Order();
        List<Order> orderList = new ArrayList<Order>();
        CartItem cartItem = new CartItem();

        //Initialize payemnt
        payment = payment.initializePayment();

        Cart cart = new Cart();
        cart = cart.generateCart(userId);

        for (int i = 0; i < cart.getCartItems().size(); i++) {
            orderList.add(order.createOrder(cart.getCartItems().get(i), payment.getPaymentID()));
            cart.deleteCartItem(cart.getCartItems().get(i).getID(), userId);
        }
        
        payment.guestFinalizePayment(payment.getPaymentID(), orderList, userId, paymentType, paymentDate);
        
        
        // Processing based on payment type
        if (paymentType.equals("creditCard")) {
            payment.setPaymentMethod("Credit Card");
            // Credit card processing logic here
        } else if (paymentType.equals("tng")) {
            payment.setPaymentMethod("TNG");
            // TNG QR Code processing
        } else if (paymentType.equals("cash")) {
            payment.setPaymentMethod("Cash");
            // Cash processing logic here
        }
        
        if (userId == null || userId.equals("")) {
            payment.setUserID("Guest");
        }

        // Set other payment details
        payment.setTotalPrice(Double.parseDouble(amountPaid));
        payment.setPaymentStatus("Paid"); // Assume paid for now
        payment.setPaymentDate(paymentDate);

        // Forward to payment confirmation page
        request.setAttribute("payment", payment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentConfirmation.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
