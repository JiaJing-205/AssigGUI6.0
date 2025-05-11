package Auth;

import da.UserShippingDetailsDA;
import domain.UserShippingDetails;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class editShippingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String address = request.getParameter("address");
        String zipCode = request.getParameter("zipCode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        String error = "";
        boolean hasError = false;

        // Validation
        if (address == null || address.trim().isEmpty()) {
            error += "Address is required.<br>";
            hasError = true;
        }

        if (zipCode == null || !zipCode.matches("^\\d{5}$")) {
            error += "Invalid zip code format. Should be 5 digits.<br>";
            hasError = true;
        }

        if (city == null || city.trim().isEmpty()) {
            error += "City is required.<br>";
            hasError = true;
        }

        if (state == null || state.trim().isEmpty()) {
            error += "State is required.<br>";
            hasError = true;
        }

        // If validation fails
        if (hasError) {
            UserShippingDetails shippingDetails = new UserShippingDetails(userId, address, city, zipCode, state);
            request.setAttribute("editShipping", shippingDetails);
            request.setAttribute("error", error);
            request.getRequestDispatcher("viewShippingInfo.jsp").forward(request, response);
            return;
        }

        // DAO and object prep
        UserShippingDetailsDA shippingDA = new UserShippingDetailsDA();
        UserShippingDetails existingRecord = shippingDA.retrieveRecord(userId);

        UserShippingDetails shippingDetails = new UserShippingDetails(userId, address, city, zipCode, state);

        if (existingRecord != null) {
            // Record exists — update
            shippingDA.updateShippingRecord(shippingDetails);
        } else {
            // Record doesn't exist — create
            shippingDA.createShippingRecord(shippingDetails);
        }

        response.sendRedirect("viewShippingServlet");
    }
}
