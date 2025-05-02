package item;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class searchItemServletPublic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("search");
        ItemDA itDA = new ItemDA();
        List<Item> itemList = null;

        try {
            if (searchName != null && !searchName.trim().isEmpty()) {
                itemList = itDA.getRecordSearchName(searchName.trim()); // Updated method
            }
            if (itemList == null || itemList.isEmpty()) {
                request.setAttribute("error", "No items found.");
            } else {
                request.setAttribute("itemList", itemList);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error searching for items.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewoneitem.jsp");
        dispatcher.forward(request, response);
    }
}
