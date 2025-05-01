package item;

import domain.*;
import da.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.logging.Level;
import java.util.logging.Logger;

public class getItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");  // Get the item ID from the request
        ItemDA itemDA = new ItemDA();

        try {
            // Fetch user by ID from the database
            Item editItem = itemDA.getRecord(id);
            if (editItem != null) {
                request.setAttribute("editItem", editItem);  // Set the user object in the request
                RequestDispatcher dispatcher = request.getRequestDispatcher("/editItem.jsp");
                dispatcher.forward(request, response);  // Forward the request to the JSP page
            } else {
                request.setAttribute("error", "Item not found.");
                response.sendRedirect("viewItemServlet");  // Redirect if user not found
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching item data.");
            request.getRequestDispatcher("editItem.jsp").forward(request, response);
        }
    }
}