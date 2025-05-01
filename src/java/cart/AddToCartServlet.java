package cart;

import cart.CartItem;
import cart.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        //Create parameter
        String itemIdValue = request.getParameter("itemId");
        String quantityValue = request.getParameter("quantity");

        //Test getting cookies
        Cookie itemIdCookie = new Cookie("itemIdCookie", itemIdValue);
        itemIdCookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(itemIdCookie);

        //Get userId
        Cookie[] userIdCookies = request.getCookies();
        String userId = "";
        if (userIdCookies != null) {
            for (Cookie cookie : userIdCookies) {
                if (cookie.getName().equals("userId")) {
                    userId = cookie.getValue();
                }
            }
        }

        //Create cart item
        CartItem cartItem = new CartItem();
        cartItem = cartItem.generateCartItem(itemIdValue, Integer.parseInt(quantityValue), userId);

        //Add to cart database
        Cart cart = new Cart();
        cart.addToCart(cartItem);

        response.sendRedirect("products.jsp");
        out.close();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
