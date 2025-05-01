package Auth;

import domain.User;
import da.UserDA;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("password1");
        String error = "";
        boolean hasError = false;

        // Validate password 
        if (password.length() < 8 || !password.matches(".*[0-9].*") || !password.matches(".*[A-Z].*") || !password.matches(".*[a-z].*")) {
            error += "Password is not secure.<br>";
            hasError = true;
            if (!password.matches(".*[A-Z].*")) {
                error += " - at least 9 characters.<br>";
            }
            if (!password.matches(".*[0-9].*")) {
                error += " - at least one number.<br>";
            }
            if (!password.matches(".*[A-Z].*")) {
                error += " - at least one uppercase letter (A-Z).<br>";
            }
            if (!password.matches(".*[a-z].*")) {
                error += " - at least one lowercase letter (a-z).<br>";
            }
        } else {
            // Validate password match
            if (!password.equals(confirmPassword)) {
                error += "Passwords do not match.<br>";
                hasError = true;
            }
        }
        if (hasError) {
            UserDA userDA = new UserDA();
            User user = userDA.retrieveRecordEmail(email);
            user.setBlock(false);
            user.setFailCount(0);
            user.setPwd(password);
            user.setToken("");
            user.setTokenDate("");
            userDA.updateProfileRecord(user);
            
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            request.setAttribute("password", password);
            request.setAttribute("password1", confirmPassword);
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }
}
