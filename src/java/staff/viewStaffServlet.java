package staff;

import da.UserDA;
import domain.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class viewStaffServlet extends HttpServlet {

    private UserDA adDA;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            UserDA adDA = new UserDA(); // initialize DAO
            List<User> staffList = adDA.getAllAdminRecord(); // get all records
            request.setAttribute("allUsers", staffList); // set attribute
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Unable to load staff.");
        }

        // forward to JSP
        request.setAttribute("userRole", "Staff");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewUser.jsp");
        dispatcher.forward(request, response);

    }

}
