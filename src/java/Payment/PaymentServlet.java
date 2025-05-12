package Payment;

import da.PaymentDA;
import da.OrderDA;
import domain.Payment;
import domain.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userID = request.getParameter("userID");

        if (userID == null || userID.isEmpty()) {
            request.setAttribute("paymentList", null);
            request.setAttribute("userID", "Guest");
        } else {
            PaymentDA paymentDA = new PaymentDA();
            List<Payment> paymentList = paymentDA.getPaymentsByUserID(userID);

            for (Payment p : paymentList) {
                OrderDA orderDA = new OrderDA();
                List<Order> orders = orderDA.getOrdersByPaymentID(p.getPaymentID());
                p.setOrders(orders);
            }

            request.setAttribute("paymentList", paymentList);
            request.setAttribute("userID", userID);
        }

        RequestDispatcher rd = request.getRequestDispatcher("paymentForm.jsp");
        rd.forward(request, response);
    }
}
