package item;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class searchItemServletPublic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("search");
        ItemDA itDA = new ItemDA();
        Item item = null;

        try {
            if (searchName != null && !searchName.trim().isEmpty()) {
                item = (Item) itDA.getRecordSearchName(searchName.trim());
            }
            if (item == null) {
                request.setAttribute("error", "Item not found.");
            } else {
                request.setAttribute("item", item);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error searching for item.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewoneitem.jsp");
        dispatcher.forward(request, response);
    }
}
