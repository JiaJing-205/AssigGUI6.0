package item;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class searchItemPublicServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("search");
        ItemDA itDA = new ItemDA();
        Item foundItem = new Item();

        try {
            if (searchName != null && !searchName.trim().isEmpty()) {
                foundItem = itDA.getRecordSearchName(searchName);
            }
            if (foundItem == null) {
                request.setAttribute("error", "No items found.");
            } else {
                request.setAttribute("itemfound", foundItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error finding item");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewoneitem.jsp");
        dispatcher.forward(request, response);
    }
}
