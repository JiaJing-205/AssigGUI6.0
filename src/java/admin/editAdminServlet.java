/*
package admin;

import admin.Admin;
import admin.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.logging.Level;
import java.util.logging.Logger;

public class editAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            String role = request.getParameter("role");
            adminDA adDA = new adminDA();
        
            // Create updated item object
            Admin updatedItem = new Admin(id, name, pass, role);

            // Update in database
            adDA.editRecord(updatedItem);
            out.println("<script type='text/javascript'>");
            out.println("alert('Admin \"" + id + "\" has been edited successfully.');");
            out.println("window.location = 'editAdmin.html';");
            out.println("</script>");
            // Redirect or forward
            //response.sendRedirect("editItemServlet"); // back to view all

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println("Error updating admin: " + ex.getMessage());
        }
        
    }

}
*/