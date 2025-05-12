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

        try {
            if (searchName != null && !searchName.isEmpty()) {
                List<Item> itemList = itDA.getRecordSearchNameList(searchName);
                request.setAttribute("itemList", itemList);
                request.getRequestDispatcher("products.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No items found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ShowAllItemServletGoBoom");
        }
    }
}
