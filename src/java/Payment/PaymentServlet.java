package Payment;

import da.PaymentDA;
import domain.Payment;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(maxFileSize = 5 * 1024 * 1024) // Max 5MB for TNG screenshot
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");
        String amountPaidStr = request.getParameter("amountPaid");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        Part tngScreenshot = request.getPart("tngScreenshot");

        PaymentDA paymentDA = new PaymentDA();
        Payment payment = new Payment();

        try {
            // Validation
            double amountPaid = Double.parseDouble(amountPaidStr);
            if (amountPaid <= 0) throw new IllegalArgumentException("Amount must be more than 0.");
            payment.setTotalPrice(amountPaid);

            switch (paymentMethod) {
                case "creditCard":
                    if (cardNumber == null || !cardNumber.replaceAll("\\s", "").matches("\\d{16}"))
                        throw new IllegalArgumentException("Invalid credit card number.");

                    if (expiryDate == null || !expiryDate.matches("\\d{2}/\\d{2}"))
                        throw new IllegalArgumentException("Invalid expiry date format.");

                    String[] parts = expiryDate.split("/");
                    int month = Integer.parseInt(parts[0]);
                    int year = Integer.parseInt("20" + parts[1]);
                    if (month < 1 || month > 12) throw new IllegalArgumentException("Invalid month.");
                    Date today = new Date();
                    if (year < today.getYear() + 1900 ||
                       (year == today.getYear() + 1900 && month <= today.getMonth() + 1))
                        throw new IllegalArgumentException("Card expired.");

                    if (cvv == null || !cvv.matches("\\d{3}"))
                        throw new IllegalArgumentException("Invalid CVV.");

                    payment.setPaymentMethod("Credit Card");
                    break;

                case "tng":
                    if (tngScreenshot == null || tngScreenshot.getSize() == 0)
                        throw new IllegalArgumentException("TNG screenshot is required.");
                    // Optionally, save the file if needed
                    payment.setPaymentMethod("TNG");
                    break;

                case "cash":
                    payment.setPaymentMethod("Cash");
                    break;

                default:
                    throw new IllegalArgumentException("Invalid payment method.");
            }

            // Other fields
            String paymentID = "P" + UUID.randomUUID().toString().substring(0, 4).toUpperCase();
            payment.setPaymentID(paymentID);

            // Example: Replace with actual user session or logic
            payment.setUserID("U001");

            payment.setPaymentStatus("Paid");

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
            payment.setPaymentDate(sdf.format(new Date()));

            // Store in database
            paymentDA.createRecord(payment);

            // Forward to confirmation page
            request.setAttribute("payment", payment);
            RequestDispatcher dispatcher = request.getRequestDispatcher("paymentConfirmation.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Payment failed: " + e.getMessage());
            request.getRequestDispatcher("paymentForm.jsp").forward(request, response);
        }
    }
}
