package user;

import domain.User;
import da.UserDA;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.logging.Level;
import java.util.logging.Logger;

public class getUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");  // Get the user ID from the request
        UserDA userDA = new UserDA();

        try {
            // Fetch user by ID from the database
            User editUser = userDA.retrieveRecord(id);
            if (editUser != null) {
                request.setAttribute("editUser", editUser);  // Set the user object in the request
                RequestDispatcher dispatcher = request.getRequestDispatcher("/editUser.jsp");
                dispatcher.forward(request, response);  // Forward the request to the JSP page
            } else {
                request.setAttribute("error", "User not found.");
                response.sendRedirect("viewUserServlet");  // Redirect if user not found
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching user data.");
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        }
    }
}