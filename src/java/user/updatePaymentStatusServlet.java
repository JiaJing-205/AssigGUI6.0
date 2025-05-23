package user;

import item.*;
import da.*;
import domain.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.*;
import javax.servlet.http.*;

public class updatePaymentStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentID = request.getParameter("paymentID");
        String paymentMethod = request.getParameter("paymentMethod");
        String userID = request.getParameter("userID");
        String paymentDate = LocalDate.now().toString();

        PaymentDA paymentDA = new PaymentDA();
        try {
            boolean success = paymentDA.updatePaymentStatus(paymentID, paymentMethod, paymentDate);
            if (success) {
                request.setAttribute("paymentUpdated", true);
            }
        response.sendRedirect("viewPaymentServlet?userID=" + userID + "&updated=true");

        } catch (SQLException e) {
            throw new ServletException("Database error updating payment.", e);
        }
    }
}