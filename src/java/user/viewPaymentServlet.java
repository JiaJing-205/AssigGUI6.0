package user;

import domain.*;
import da.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class viewPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String userId = request.getParameter("userId");

        try {
            PaymentDA paymentDA = new PaymentDA();
            List<Payment> paymentList = paymentDA.getUserPayment(userId);

            request.setAttribute("userID", userId);
            request.setAttribute("paymentList", paymentList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("viewUserPayment.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        request.setAttribute("error", "Unable to load payment records: " + e.getMessage());
        request.getRequestDispatcher("viewUserPayment.jsp").forward(request, response);
        }
    }
}
