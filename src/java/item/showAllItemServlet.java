package item;

import item.Item;
import item.ItemDA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class showAllItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ItemDA itemDA = new ItemDA();
            List<Item> itemList = itemDA.getAllRecord();

            // Set the item list in request scope
            request.setAttribute("itemList", itemList);

            // Forward to JSP
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ShowAllItemServletGoBoom");
        }
    }
}
