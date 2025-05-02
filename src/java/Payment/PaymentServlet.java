    package payment;

import da.PaymentDA;
import domain.Payment;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentType = request.getParameter("paymentType");
        String amountPaid = request.getParameter("amountPaid");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        
        PaymentDA paymentDA = new PaymentDA();
        Payment payment = new Payment();

        // Processing based on payment type
        if ("creditCard".equals(paymentType)) {
            payment.setPaymentMethod("Credit Card");
            // Credit card processing logic here
        } else if ("tng".equals(paymentType)) {
            payment.setPaymentMethod("TNG");
            // TNG QR Code processing
        } else if ("cash".equals(paymentType)) {
            payment.setPaymentMethod("Cash");
            // Cash processing logic here
        }
        
        // Set other payment details
        payment.setTotalPrice(Double.parseDouble(amountPaid));
        payment.setPaymentStatus("Paid"); // Assume paid for now
        // Insert payment details into the database
        paymentDA.createRecord(payment);
        
        // Forward to payment confirmation page
        request.setAttribute("payment", payment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentConfirmation.jsp");
        dispatcher.forward(request, response);
    }
}