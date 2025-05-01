package item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.logging.Level;
import java.util.logging.Logger;

public class editItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            float price = Float.parseFloat(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            ItemDA itDA = new ItemDA();

            // Check if item exists first
            Item existingItem = itDA.getRecord(id);
        
            // Create updated item object
            Item updatedItem = new Item(id, name, category, price, stock);

            // Update in database
            itDA.editRecord(updatedItem);
            out.println("<script type='text/javascript'>");
            out.println("alert('Item \"" + id + "\" has been edited successfully.');");
            out.println("window.location.href = 'viewItemServlet';");
            out.println("</script>");

            // Redirect or forward
            //response.sendRedirect("editItemServlet"); // back to view all

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println("Error updating item: " + ex.getMessage());
        }
        
    }

}
