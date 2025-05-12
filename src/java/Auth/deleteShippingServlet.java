package Auth;

import da.UserShippingDetailsDA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

public class deleteShippingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get userId from cookies
        Cookie[] cookies = request.getCookies();
        String userId = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    userId = cookie.getValue();
                }
            }
        }

        if (userId == null) {
            request.setAttribute("error", "User not logged in.");
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
            return;
        }

        try {
            UserShippingDetailsDA shippingDA = new UserShippingDetailsDA();
            shippingDA.deleteRecord(userId);
            System.out.println("Shipping details deleted.");
            response.sendRedirect("viewShippingServlet");
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
        }
    }
}
