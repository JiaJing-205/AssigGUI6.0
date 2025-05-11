package Auth;

import da.UserShippingDetailsDA;
import domain.UserShippingDetails;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class viewShippingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        String userId = null;
        String userPermission = null;

        // Get userId and userPermission from cookies
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    userId = cookie.getValue();
                } else if ("userPermission".equals(cookie.getName())) {
                    userPermission = cookie.getValue();
                }
            }
        }

        // If userId is not found in cookies, show error
        if (userId == null) {
            request.setAttribute("error", "User not logged in.");
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
            return;
        }

        try {
            // Retrieve shipping details
            UserShippingDetailsDA shippingDA = new UserShippingDetailsDA();
            UserShippingDetails shippingDetails = shippingDA.retrieveRecord(userId);

            // If no shipping details found, show error
            if(!shippingDA.doesShippingRecordExist(userId)) {
            request.getRequestDispatcher("addShippingInfo.jsp").forward(request, response);
            System.out.println("Adding");
            return;
            } 
            // Pass the shipping details to the JSP for display
            request.setAttribute("userId", userId);
            request.setAttribute("address", shippingDetails.getAddress());
            request.setAttribute("zipCode", shippingDetails.getZipCode());
            request.setAttribute("city", shippingDetails.getCity());
            request.setAttribute("state", shippingDetails.getState());

            // Forward to the shipping details view page
            request.getRequestDispatcher("viewShippingInfo.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("ProfileServlet").forward(request, response);
        }
    }
}
