package item;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

public class addItemServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
            try {
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    double price = Double.parseDouble(request.getParameter("price"));
    int stock = Integer.parseInt(request.getParameter("stock"));

    ItemDA itemDA = new ItemDA();
    Item existingItem;
            existingItem = itemDA.getRecord(id);


    if (existingItem != null) {
        request.setAttribute("error", "Item ID already exists.");
        request.setAttribute("id", id);
        request.setAttribute("name", name);
        request.setAttribute("category", category);
        request.setAttribute("price", price);
        request.setAttribute("stock", stock);
        request.getRequestDispatcher("addItem.jsp").forward(request, response);
        return;
    }

    Item newItem = new Item(id, name, category, price, stock);
    itemDA.addRecord(newItem);
    response.sendRedirect("viewItemServlet");
            } catch (SQLException ex) {
            Logger.getLogger(addItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
}
}
