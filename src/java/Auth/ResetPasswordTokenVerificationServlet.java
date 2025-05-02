package Auth;

import domain.User;
import da.UserDA;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResetPasswordTokenVerificationServlet")
public class ResetPasswordTokenVerificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String token = request.getParameter("token");
        UserDA userDA = new UserDA();
        User user = userDA.retrieveRecordEmail(email);
        if (Timestamp.valueOf(user.getTokenDate()).before(new Timestamp(System.currentTimeMillis()))) {
            if (token.equals(user.getToken())) {
                request.setAttribute("email", email);
                request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
            } else {
                request.setAttribute("email", email);
                request.setAttribute("error", "Token Wrong.");
                request.getRequestDispatcher("ResetPasswordToken.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("email", email);
            request.setAttribute("error", "Token Expired, Send Token Again.");
            request.getRequestDispatcher("ResetPasswordRequest.jsp").forward(request, response);
        }
    }
}
