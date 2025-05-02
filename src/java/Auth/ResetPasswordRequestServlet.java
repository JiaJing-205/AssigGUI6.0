package Auth;

import domain.User;
import da.UserDA;
import java.sql.Timestamp;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ResetPasswordRequestServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDA userDA = new UserDA();
        User user = userDA.retrieveRecordEmail(email);
        if ("".equals(user.getId())) {
            request.setAttribute("error", "Email doesnt exist.");
            request.getRequestDispatcher("ResetPasswordForm.jsp").forward(request, response);
        } else {
            int randomNum = 100000 + (int)(Math.random() * 900000);
            user.setToken(String.valueOf(randomNum));
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            user.setTokenDate(String.valueOf(Timestamp.from(currentTimestamp.toInstant().plusSeconds(3600))));
            userDA.updateProfileRecord(user);
            
             String resetLink = "" + randomNum;
//            EmailService.sendResetEmail(user.getEmail(), resetLink);
            
            request.setAttribute("email", email);
            request.getRequestDispatcher("ResetPasswordToken.jsp").forward(request, response);
        }
    }
}
