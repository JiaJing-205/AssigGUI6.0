package cart;

import domain.Order;
import domain.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        //Retrieve information for payment invoice
        String name = request.getParameter("name");
        String firstName = "";
        String lastName = "";
        String address = "";
        String city = "";
        String zip = "";
        String state = "";

        if (name == null) {
            firstName = request.getParameter("firstName");
            lastName = request.getParameter("lastName");
            address = request.getParameter("address");
            city = request.getParameter("city");
            zip = request.getParameter("zip");
            state = request.getParameter("state");

            //Combine first name and last name into a single string
            name = firstName + " " + lastName;
        } else {
            address = request.getParameter("address");
            city = request.getParameter("city");
            zip = request.getParameter("zip");
            state = request.getParameter("state");
        }

        //Create and store information in session
        HttpSession session = request.getSession();
        session.setAttribute("name", name);
        session.setAttribute("address", address);
        session.setAttribute("city", city);
        session.setAttribute("zip", zip);
        session.setAttribute("state", state);

        //Create order
        Order order = new Order();
        List<Order> orderList = new ArrayList<Order>();
        CartItem cartItem = new CartItem();
        Payment payment = new Payment();

        //Initialize payemnt
        payment = payment.initializePayment();

        Cart cart = new Cart();
        cart = cart.generateCart();

        for (int i = 0; i < cart.getCartItems().size(); i++) {
            orderList.add(order.createOrder(cart.getCartItems().get(i), payment.getPaymentID()));
        }
        
        //Delete all items in cart
        cart.deleteAllCartItem();

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
        payment.finalizePayment(payment.getPaymentID(), orderList, userId);

        //Redirect to payment page
        response.sendRedirect("viewPaymentServlet");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
