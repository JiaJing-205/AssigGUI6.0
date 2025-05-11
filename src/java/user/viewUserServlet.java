package user;

import da.UserDA;
import domain.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class viewUserServlet extends HttpServlet {

    private UserDA usDA;
    
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
            UserDA usDA = new UserDA(); // initialize DAO
            List<User> userList = usDA.getAllRecords(); // get all records
            request.setAttribute("userID", userId);
            request.setAttribute("allUsers", userList); // set attribute
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Unable to load user.");
        }

        // forward to JSP
        request.setAttribute("userRole", "User");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewUser.jsp");
        dispatcher.forward(request, response);

    }

}
