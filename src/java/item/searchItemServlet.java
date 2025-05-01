package item;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class searchItemServlet extends HttpServlet {

    private ItemDA itDA;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
           ItemDA itDA = new ItemDA();
           List<Item> itemList = itDA.getRecordSearch(id);
           request.setAttribute("allItems", itemList); // You missed this line
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "An error occurred: " + ex.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewItem.jsp");
        dispatcher.forward(request, response);
    }
}

