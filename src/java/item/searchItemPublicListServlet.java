package item;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class searchItemPublicListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("searchmore");
        ItemDA itDA = new ItemDA();
        List<Item> itemList = new ArrayList<>();

        try {
            if (searchName != null && !searchName.isEmpty()) {
            itemList = itDA.getRecordSearchNameList(searchName);
            }
            if (itemList == null) {
                request.setAttribute("error", "No items found.");
            } else {
                request.setAttribute("itemfound", itemList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error finding item");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewoneitem.jsp");
        dispatcher.forward(request, response);
    }
}
