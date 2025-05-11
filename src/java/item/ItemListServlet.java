package item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ItemListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ItemDA itemDA = new ItemDA();
            List<Item> allItems = itemDA.getAllRecord();
            request.setAttribute("allItems", allItems);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Unable to load items.");
            e.printStackTrace();
        }

        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
}
