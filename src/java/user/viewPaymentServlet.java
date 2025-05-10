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

                Cookie[] cookies = request.getCookies();
        String userId = null;
        String userPermission = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    userId = cookie.getValue();
                } else if ("userPermission".equals(cookie.getName())) {
                    userPermission = cookie.getValue();
                }
            }
        }

        if (userId == null) {
            request.setAttribute("error", "User not logged in.");
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
            return;
        }

        
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
