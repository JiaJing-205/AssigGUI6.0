package Auth;

import da.UserShippingDetailsDA;
import domain.UserShippingDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

public class addShippingServlet extends HttpServlet {

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

        // Retrieve form data
        String address = request.getParameter("address");
        String zipCode = request.getParameter("zipCode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        try {
            // Create new shipping record
            UserShippingDetails shippingDetails = new UserShippingDetails();
            shippingDetails.setUserId(userId);
            shippingDetails.setAddress(address);
            shippingDetails.setZipCode(zipCode);
            shippingDetails.setCity(city);
            shippingDetails.setState(state);

            UserShippingDetailsDA shippingDA = new UserShippingDetailsDA();
            shippingDA.createShippingRecord(shippingDetails);

            System.out.println("Shipping details successfully added.");
            response.sendRedirect("viewShippingServlet");

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
        }
    }
}
