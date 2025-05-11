package Payment;

import da.PaymentDA;
import domain.Payment;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class GenerateReceiptServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentID = request.getParameter("paymentID");

        PaymentDA paymentDA = new PaymentDA();
        Payment payment = paymentDA.retrieveRecord(paymentID);

        request.setAttribute("payment", payment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("receipt.jsp");
        dispatcher.forward(request, response);
    }
}
